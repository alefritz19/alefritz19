-- ============================================================================
-- SNOWFLAKE DATA ENGINEERING PORTFOLIO-PROJEKT 1:
-- EUROLOGISTIK DACH — MEDALLION CLOUD DWH & SEMI-STRUCTURED JSON PIPELINE
-- Architektur: BRONZE (Raw ERP & JSON) -> SILVER (Clean & Flatten) -> GOLD (Star Schema)
-- ============================================================================

USE ROLE ACCOUNTADMIN;

-- 1. INFRASTRUKTUR: DEDIZIERTES VIRTUAL WAREHOUSE & MEDALLION-DATENBANK
CREATE OR REPLACE WAREHOUSE DE_PORTFOLIO_WH
    WITH WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = FALSE
    COMMENT = 'Dedicated Compute Cluster fuer Data Engineering Portfolio-Pipelines';

USE WAREHOUSE DE_PORTFOLIO_WH;

CREATE OR REPLACE DATABASE EUROLOGISTIK_DWH_DB
    COMMENT = 'DACH B2B Logistik & Supply-Chain Cloud Data Warehouse';

CREATE OR REPLACE SCHEMA EUROLOGISTIK_DWH_DB.BRONZE_RAW
    COMMENT = 'Schicht 1 (Bronze): Unveraenderte ERP-Stammdaten & halbstrukturierte IoT/JSON-Sendungsevents';
CREATE OR REPLACE SCHEMA EUROLOGISTIK_DWH_DB.SILVER_CLEAN
    COMMENT = 'Schicht 2 (Silver): Bereinigte, deduplizierte & typisierte Entitaeten';
CREATE OR REPLACE SCHEMA EUROLOGISTIK_DWH_DB.GOLD_DWH
    COMMENT = 'Schicht 3 (Gold): Kimball Star Schema (Dimensionen & Fakten) fuer BI & Analytics';

USE DATABASE EUROLOGISTIK_DWH_DB;
USE SCHEMA BRONZE_RAW;

-- 2. BRONZE LAYER: ROHDATEN-TABELLEN (ERP & JSON VARIANT)
CREATE OR REPLACE TABLE BRONZE_RAW.RAW_ERP_KUNDEN (
    KUNDE_ID VARCHAR(20),
    FIRMENNAME VARCHAR(100),
    BRANCHE VARCHAR(50),
    LAND VARCHAR(10),
    STADT VARCHAR(50),
    KUNDENSEGMENT VARCHAR(30),
    LADEDATUM TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

INSERT INTO BRONZE_RAW.RAW_ERP_KUNDEN (KUNDE_ID, FIRMENNAME, BRANCHE, LAND, STADT, KUNDENSEGMENT) VALUES
('K-1001', 'AlpenTech Maschinenbau GmbH', 'Maschinenbau', 'DE', 'München', 'Enterprise'),
('K-1002', 'RheinPharma Logistics AG', 'Pharma & Healthcare', 'DE', 'Frankfurt am Main', 'Enterprise'),
('K-1003', 'NordSee Handel KG', 'Einzelhandel', 'DE', 'Hamburg', 'Mid-Market'),
('K-1004', 'Danube MedTech GmbH', 'Medizintechnik', 'AT', 'Wien', 'Enterprise'),
('K-1005', 'Helvetia Precision SA', 'Elektronik & Sensorik', 'CH', 'Zürich', 'Enterprise'),
('K-1006', 'Westfalen Stahlwerke GmbH', 'Industrie', 'DE', 'Dortmund', 'Mid-Market'),
('K-1007', 'Bavaria AutoParts SE', 'Automobilzulieferer', 'DE', 'Stuttgart', 'Enterprise'),
('K-1008', 'Elbe SolarTech GmbH', 'Erneuerbare Energien', 'DE', 'Dresden', 'SMB');

CREATE OR REPLACE TABLE BRONZE_RAW.RAW_LOGISTIK_HUBS (
    HUB_ID VARCHAR(10),
    HUB_NAME VARCHAR(100),
    REGION VARCHAR(50),
    LAND VARCHAR(10),
    KAPAZITAET_PALETTEN INT
);

INSERT INTO BRONZE_RAW.RAW_LOGISTIK_HUBS VALUES
('HUB-FRA', 'Zentrallager Frankfurt-Süd', 'Hessen / Rhein-Main', 'DE', 25000),
('HUB-MUC', 'Logistikzentrum München-Ost', 'Bayern / Süd', 'DE', 18000),
('HUB-HAM', 'Hafen-Hub Hamburg-Nord', 'Norddeutschland', 'DE', 22000),
('HUB-VIE', 'Osteuropa-Drehkreuz Wien', 'Österreich', 'AT', 14000),
('HUB-ZRH', 'Alpen-Hub Zürich-Kloten', 'Schweiz', 'CH', 12000);

CREATE OR REPLACE TABLE BRONZE_RAW.RAW_IOT_SENDUNGEN_JSON (
    INGESTION_ID INT AUTOINCREMENT,
    INGESTED_AT TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    PAYLOAD VARIANT
);

INSERT INTO BRONZE_RAW.RAW_IOT_SENDUNGEN_JSON (PAYLOAD)
SELECT PARSE_JSON(column1) FROM VALUES
('{"shipment_id":"SHP-90001","customer_id":"K-1001","origin_hub":"HUB-MUC","ship_date":"2026-10-01","delivery_date":"2026-10-02","sla_days":2,"status":"DELIVERED","freight_eur":1450.00,"customs_eur":0.00,"iot_telemetry":{"temp_celsius":18.4,"shock_g":0.2,"carrier":"DHL Freight"},"items":[{"sku":"M-501","qty":4,"weight_kg":320},{"sku":"M-509","qty":2,"weight_kg":85}]}'),
('{"shipment_id":"SHP-90001","customer_id":"K-1001","origin_hub":"HUB-MUC","ship_date":"2026-10-01","delivery_date":"2026-10-02","sla_days":2,"status":"DELIVERED","freight_eur":1450.00,"customs_eur":0.00,"iot_telemetry":{"temp_celsius":18.4,"shock_g":0.2,"carrier":"DHL Freight"},"items":[{"sku":"M-501","qty":4,"weight_kg":320},{"sku":"M-509","qty":2,"weight_kg":85}]}'),
('{"shipment_id":"SHP-90002","customer_id":"K-1002","origin_hub":"HUB-FRA","ship_date":"2026-10-03","delivery_date":"2026-10-04","sla_days":1,"status":"DELIVERED","freight_eur":2890.50,"customs_eur":0.00,"iot_telemetry":{"temp_celsius":4.2,"shock_g":0.1,"carrier":"Kuehne+Nagel Pharma"},"items":[{"sku":"P-101","qty":20,"weight_kg":140},{"sku":"P-104","qty":15,"weight_kg":95}]}'),
('{"shipment_id":"SHP-90003","customer_id":"K-1005","origin_hub":"HUB-ZRH","ship_date":"2026-10-04","delivery_date":"2026-10-08","sla_days":2,"status":"DELAYED_DELIVERED","freight_eur":3400.00,"customs_eur":420.00,"iot_telemetry":{"temp_celsius":19.1,"shock_g":0.8,"carrier":"SwissCargo Express"},"items":[{"sku":"S-880","qty":10,"weight_kg":210}]}'),
('{"shipment_id":"SHP-90004","customer_id":"K-1003","origin_hub":"HUB-HAM","ship_date":"2026-10-05","delivery_date":"2026-10-07","sla_days":2,"status":"DELIVERED","freight_eur":980.00,"customs_eur":0.00,"iot_telemetry":{"temp_celsius":16.0,"shock_g":0.3,"carrier":"Schenker DE"},"items":[{"sku":"R-201","qty":50,"weight_kg":500},{"sku":"R-205","qty":30,"weight_kg":240}]}'),
('{"shipment_id":"SHP-90005","customer_id":"K-1004","origin_hub":"HUB-VIE","ship_date":"2026-10-06","delivery_date":"2026-10-07","sla_days":2,"status":"DELIVERED","freight_eur":2150.00,"customs_eur":0.00,"iot_telemetry":{"temp_celsius":5.1,"shock_g":0.1,"carrier":"CargoPartner AT"},"items":[{"sku":"MD-300","qty":8,"weight_kg":160}]}'),
('{"shipment_id":"SHP-90006","customer_id":"K-1007","origin_hub":"HUB-MUC","ship_date":"2026-10-08","delivery_date":"2026-10-12","sla_days":2,"status":"DELAYED_DELIVERED","freight_eur":4120.00,"customs_eur":0.00,"iot_telemetry":{"temp_celsius":21.0,"shock_g":1.4,"carrier":"DACHSER Automotive"},"items":[{"sku":"AU-901","qty":12,"weight_kg":960},{"sku":"AU-902","qty":6,"weight_kg":480}]}'),
('{"shipment_id":"SHP-90007","customer_id":"K-1006","origin_hub":"HUB-FRA","ship_date":"2026-10-09","delivery_date":null,"sla_days":3,"status":"CANCELLED","freight_eur":1750.00,"customs_eur":0.00,"iot_telemetry":{"temp_celsius":17.5,"shock_g":0.0,"carrier":"DHL Freight"},"items":[{"sku":"ST-400","qty":5,"weight_kg":1250}]}'),
('{"shipment_id":"SHP-90008","customer_id":"K-1008","origin_hub":"HUB-HAM","ship_date":"2026-10-10","delivery_date":"2026-10-11","sla_days":2,"status":"DELIVERED","freight_eur":1640.00,"customs_eur":0.00,"iot_telemetry":{"temp_celsius":15.8,"shock_g":0.2,"carrier":"Schenker DE"},"items":[{"sku":"SL-700","qty":25,"weight_kg":625}]}'),
('{"shipment_id":"SHP-90009","customer_id":"K-1002","origin_hub":"HUB-FRA","ship_date":"2026-10-11","delivery_date":"2026-10-12","sla_days":1,"status":"DELIVERED","freight_eur":3190.00,"customs_eur":0.00,"iot_telemetry":{"temp_celsius":3.9,"shock_g":0.1,"carrier":"Kuehne+Nagel Pharma"},"items":[{"sku":"P-109","qty":40,"weight_kg":280}]}');

-- 3. SILVER LAYER: JSON-ENTPACKUNG, TYPISIERUNG & DEDUPLIZIERUNG (QUALIFY)
CREATE OR REPLACE TABLE SILVER_CLEAN.CLN_SENDUNGEN AS
SELECT
    PAYLOAD:shipment_id::VARCHAR(20)                AS SENDUNG_ID,
    PAYLOAD:customer_id::VARCHAR(20)                AS KUNDE_ID,
    PAYLOAD:origin_hub::VARCHAR(10)                 AS HUB_ID,
    PAYLOAD:ship_date::DATE                         AS VERSANDDATUM,
    PAYLOAD:delivery_date::DATE                     AS LIEFERDATUM,
    PAYLOAD:sla_days::INT                           AS SLA_SOLL_TAGE,
    PAYLOAD:status::VARCHAR(30)                     AS SENDUNGSSTATUS,
    PAYLOAD:freight_eur::NUMBER(12,2)               AS FRACHTKOSTEN_EUR,
    PAYLOAD:customs_eur::NUMBER(12,2)               AS ZOLLKOSTEN_EUR,
    PAYLOAD:iot_telemetry.carrier::VARCHAR(50)      AS SPEDITEUR,
    PAYLOAD:iot_telemetry.temp_celsius::NUMBER(5,1) AS IOT_TEMPERATUR_C,
    PAYLOAD:iot_telemetry.shock_g::NUMBER(4,2)      AS IOT_ERSCHUETTERUNG_G,
    INGESTED_AT                                     AS BRONZE_LADEDATUM
FROM BRONZE_RAW.RAW_IOT_SENDUNGEN_JSON
QUALIFY ROW_NUMBER() OVER (
    PARTITION BY PAYLOAD:shipment_id::VARCHAR 
    ORDER BY INGESTION_ID ASC
) = 1;

-- Verschachtelte JSON-Arrays entpacken mit LATERAL FLATTEN
CREATE OR REPLACE TABLE SILVER_CLEAN.CLN_SENDUNGSPOSITIONEN AS
SELECT
    s.PAYLOAD:shipment_id::VARCHAR(20) AS SENDUNG_ID,
    f.value:sku::VARCHAR(20)           AS ARTIKEL_SKU,
    f.value:qty::INT                   AS MENGE_STUECK,
    f.value:weight_kg::NUMBER(10,2)    AS GEWICHT_KG
FROM (
    SELECT PAYLOAD
    FROM BRONZE_RAW.RAW_IOT_SENDUNGEN_JSON
    QUALIFY ROW_NUMBER() OVER (PARTITION BY PAYLOAD:shipment_id::VARCHAR ORDER BY INGESTION_ID ASC) = 1
) s,
LATERAL FLATTEN(input => s.PAYLOAD:items) f;

-- 4. GOLD LAYER: KIMBALL STAR SCHEMA (DIMENSIONEN & FAKTEN)
CREATE OR REPLACE TABLE GOLD_DWH.DIM_KUNDEN AS
SELECT
    ROW_NUMBER() OVER (ORDER BY KUNDE_ID) AS KUNDE_KEY,
    KUNDE_ID,
    FIRMENNAME,
    BRANCHE,
    LAND,
    STADT,
    KUNDENSEGMENT
FROM BRONZE_RAW.RAW_ERP_KUNDEN;

CREATE OR REPLACE TABLE GOLD_DWH.DIM_LOGISTIKZENTREN AS
SELECT
    ROW_NUMBER() OVER (ORDER BY HUB_ID) AS HUB_KEY,
    HUB_ID,
    HUB_NAME,
    REGION,
    LAND,
    KAPAZITAET_PALETTEN
FROM BRONZE_RAW.RAW_LOGISTIK_HUBS;

CREATE OR REPLACE TABLE GOLD_DWH.FCT_LIEFERUNGEN AS
WITH pos_agg AS (
    SELECT 
        SENDUNG_ID,
        COUNT(ARTIKEL_SKU)  AS ANZAHL_POSITIONEN,
        SUM(MENGE_STUECK)   AS GESAMTMENGE_STUECK,
        SUM(GEWICHT_KG)     AS GESAMTGEWICHT_KG
    FROM SILVER_CLEAN.CLN_SENDUNGSPOSITIONEN
    GROUP BY SENDUNG_ID
)
SELECT
    s.SENDUNG_ID,
    k.KUNDE_KEY,
    h.HUB_KEY,
    s.KUNDE_ID,
    k.FIRMENNAME,
    k.LAND                                                          AS ZIEL_LAND,
    h.HUB_NAME                                                      AS START_HUB,
    s.SPEDITEUR,
    s.VERSANDDATUM,
    s.LIEFERDATUM,
    DATEDIFF('day', s.VERSANDDATUM, s.LIEFERDATUM)                  AS IST_LAUFZEIT_TAGE,
    s.SLA_SOLL_TAGE,
    CASE 
        WHEN s.SENDUNGSSTATUS = 'CANCELLED' THEN 'STORNIERT'
        WHEN DATEDIFF('day', s.VERSANDDATUM, s.LIEFERDATUM) <= s.SLA_SOLL_TAGE THEN 'SLA_EINGEHALTEN'
        ELSE 'SLA_UEBERSCHRITTEN'
    END                                                             AS SLA_BEWERTUNG,
    IFF(s.SENDUNGSSTATUS = 'CANCELLED', 0, 1)                       AS IST_UMSATZRELEVANT,
    p.ANZAHL_POSITIONEN,
    p.GESAMTMENGE_STUECK,
    p.GESAMTGEWICHT_KG,
    s.FRACHTKOSTEN_EUR,
    s.ZOLLKOSTEN_EUR,
    (s.FRACHTKOSTEN_EUR + s.ZOLLKOSTEN_EUR)                         AS GESAMTKOSTEN_EUR,
    s.IOT_TEMPERATUR_C,
    s.IOT_ERSCHUETTERUNG_G
FROM SILVER_CLEAN.CLN_SENDUNGEN s
JOIN GOLD_DWH.DIM_KUNDEN k          ON s.KUNDE_ID = k.KUNDE_ID
JOIN GOLD_DWH.DIM_LOGISTIKZENTREN h ON s.HUB_ID   = h.HUB_ID
LEFT JOIN pos_agg p                 ON s.SENDUNG_ID = p.SENDUNG_ID;

-- 5. ENTERPRISE FEATURES: ZERO-COPY CLONING & TIME TRAVEL
CREATE OR REPLACE DATABASE EUROLOGISTIK_DEV_CLONE CLONE EUROLOGISTIK_DWH_DB;
DROP TABLE GOLD_DWH.FCT_LIEFERUNGEN;
UNDROP TABLE GOLD_DWH.FCT_LIEFERUNGEN;

-- 6. MANAGEMENT KPI-REPORTING (ERGEBNISVALIDIERUNG)
SELECT 
    ZIEL_LAND,
    COUNT(SENDUNG_ID)                                               AS SENDUNGEN_GESAMT,
    SUM(IST_UMSATZRELEVANT)                                         AS AKTIVE_SENDUNGEN,
    SUM(IFF(SLA_BEWERTUNG = 'SLA_EINGEHALTEN', 1, 0))               AS SLA_PUENKTLICH,
    SUM(IFF(SLA_BEWERTUNG = 'SLA_UEBERSCHRITTEN', 1, 0))            AS SLA_VERSPAETET,
    SUM(IFF(IST_UMSATZRELEVANT = 1, GESAMTGEWICHT_KG, 0))           AS TONNAGE_KG,       -- ohne stornierte Sendungen
    SUM(IFF(IST_UMSATZRELEVANT = 1, GESAMTKOSTEN_EUR, 0))           AS REALISIERTER_UMSATZ_EUR
FROM EUROLOGISTIK_DWH_DB.GOLD_DWH.FCT_LIEFERUNGEN
GROUP BY ZIEL_LAND
ORDER BY REALISIERTER_UMSATZ_EUR DESC;
