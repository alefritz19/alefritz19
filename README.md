<div align="center">

# 👋 Hi, I'm Alexander Fritzler!
### ⚙️ Cloud Data Engineer & Analytics Engineer (Microsoft Fabric · Snowflake · SQL Server · PySpark)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/alexander-fritzler-214628356/)
[![Snowflake Certified](https://img.shields.io/badge/Snowflake-Data_Warehousing_Verified-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)](https://achieve.snowflake.com/39919e7c-4de3-46d3-80a5-de041ca1ffc5)
[![Email](https://img.shields.io/badge/Email-Contact_Me-red?style=for-the-badge&logo=gmail)](mailto:alefritz19@gmail.com)
[![Location](https://img.shields.io/badge/Location-Germany-lightgrey?style=for-the-badge&logo=googlemaps)](https://maps.google.com)

<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=20&duration=3000&pause=1000&color=00B4D8&center=true&vCenter=true&width=620&lines=Cloud+Data+Engineering+(MS+Fabric+%26+Snowflake);Medallion+Lakehouse+%26+DWH+Architecture;T-SQL+%2C+PySpark+%26+Automated+ELT+Pipelines;Semantic+Gold+Layer+%26+DWH+Reconciliation" alt="Typing SVG" />
</p>

</div>

---

## 🏗️ Data Engineering & Cloud Architecture Portfolio

Mein Schwerpunkt liegt auf dem Aufbau robuster, skalierbarer **End-to-End Datenplattformen** — von der Rohdaten-Ingestion und Bereinigung über die **Medallion-Architektur (Bronze ➔ Silver ➔ Gold)** bis hin zur Bereitstellung im analytischen **Gold- & Semantic-Layer**:

```text
[OLTP / ERP / Cloud Stages] ──▶ [Ingestion & CDC (Fabric / Snowflake)] ──▶ [Gold DWH & Star Schema (SQL / PySpark)] ──▶ [Semantic Serving Layer]
```

---

### 1. ⚙️ [Medallion Lakehouse Data Platform on Microsoft Fabric](https://github.com/alefritz19/Supermarkt-Medallion-Lakehouse-Fabric)
> **Cloud Data Engineering & Lakehouse-Architektur (Bronze ➔ Silver ➔ Gold ➔ Direct Lake / DP-700 Standard)**

* **Architekturfokus:** Migration und Skalierung operativer Transaktionsdaten (~755.000 Positionen) in eine moderne SaaS-Lakehouse-Infrastruktur auf Microsoft Fabric.
* **Data Engineering Kernbestandteile:**
  * ⚡ **Bronze ➔ Silver (PySpark ETL Pipelines):** Automatisierte Schemavalidierung, Datentyp-Konvertierung, Bereinigung und Delta-Lake-Speicheroptimierung via `Z-ORDER BY (BonDatum, ProduktID)`.
  * 🏛️ **Gold Layer (Fabric Data Warehouse):** Cross-Database `CTAS`-Aggregationen, dimensionale Views und Stored Procedures für performante Abfragen.
  * 🚀 **Zero-Copy Serving (Direct Lake):** Direkte Anbindung des semantischen Modells an Delta-Parquet-Dateien im OneLake ohne Datenkopien oder Import-Latenzen.
* 🔗 **Repository:** [alefritz19/Supermarkt-Medallion-Lakehouse-Fabric ➔](https://github.com/alefritz19/Supermarkt-Medallion-Lakehouse-Fabric)

---

### 2. 🏛️ [NexusTech B2B ERP Data Platform & SQL Server DWH](https://github.com/alefritz19/NexusTech-B2B-ERP-DataPlatform)
> **End-to-End DWH Engineering: Von 3NF OLTP-Rohdaten zum validierten Kimball-Sternschema**

* **Architekturfokus:** Entwurf und Implementierung einer zentralen Data-Warehouse-Schicht (`dwh`-Schema) auf Microsoft SQL Server für 40.000 B2B-Aufträge (363,82 Mio. € realisierter Nettoumsatz).
* **Data Engineering Kernbestandteile:**
  * 🛠️ **ELT & Daten-Reconciliation:** Zusammenführung normalisierter Belegkopf- und Positionsdaten (`1:n`), Referenzintegritätsprüfung und exakte Festkomma-Typisierung (`DECIMAL(18,2)`).
  * 🛡️ **Status-Flag-Engineering (`IstUmsatzrelevant`):** Technische Isolierung stornierter Aufträge (26,46 Mio. € Abweichungsprävention) ohne Verlust historischer Prozessdaten für Stornoquoten-Analysen.
  * 🔄 **Automatisierte Bereitstellung & Audit:** Rekursive CTE-Kalendergenerierung, kapselnde DWH-Views (`vw_fct_bestellungen`, `vw_dim_produkte`, `vw_dim_kunden`, `vw_dim_vertrieb`), PowerShell-Export-Pipelines sowie 100 % Cent-genaue Abstimmung mittels DAX Studio.
* 🔗 **Repository:** [alefritz19/NexusTech-B2B-ERP-DataPlatform ➔](https://github.com/alefritz19/NexusTech-B2B-ERP-DataPlatform)

---

### 3. 🗄️ [SQL Data Engineering & Production Toolkit](https://github.com/alefritz19/sql-analyst-toolkit)
> **Praxisorientierte T-SQL Referenzarchitektur für Data Cleansing, Deduplizierung & Pipeline-Auditing**

* **Architekturfokus:** Standardisierte SQL-Patterns zur Transformation und Qualitätsprüfung unstrukturierter Rohdaten vor der Übernahme in den Gold-Layer.
* **Data Engineering Kernbestandteile:**
  * 🧹 **Data Cleaning & Deduplication (`DATA_CLEANING_MASTER.sql`):** In-Flight-Bereinigung von String-Artefakten, fehlertolerante Typkonvertierung (`TRY_CONVERT`) und Dubletten-Bereinigung via `ROW_NUMBER() OVER (PARTITION BY ...)`.
  * 📈 **Analytical Window Pipelines (`WINDOW_FUNCTIONS_MASTER.sql`):** Zeitreihen-Offsets via `LAG()`/`LEAD()`, Partition-Rankings (`DENSE_RANK()`) und gleitende Fensteraggregationen (`ROWS BETWEEN 6 PRECEDING`).
  * 🔍 **Segmentierungs- & Kohorten-Logik (`ADVANCED_ANALYTICS_MASTER.sql`):** Skalierbare CTE-Pipelines für mehrstufige Datenklassifizierung (`NTILE`) und Retention-Matrizen.
* 🔗 **Repository:** [alefritz19/sql-analyst-toolkit ➔](https://github.com/alefritz19/sql-analyst-toolkit)

---

### 4. 📊 [Gold-Layer Serving & Kimball Star Schema Architecture](https://github.com/alefritz19/PowerBI-Supermarkt-Analytics)
> **Dimensional Modeling & Semantic Layer Bereitstellung (6 Dimensionen · 2 Faktentabellen)**

* **Architekturfokus:** Bereitstellung einer hochperformanten Gold-Layer-Datenarchitektur nach Ralph Kimball als Schnittstelle zwischen Data Warehouse und Fachbereich.
* **Kernbestandteile:**
  * ⭐ **Strikte Sternschema-Modellierung:** Saubere Trennung von Fakten (`fct_verkaeufe`, `fct_abschreibungen`) und Dimensionen (`dim_produkt`, `dim_kunde`, `dim_filiale`, `dim_datum`, `dim_mitarbeiter`, `dim_aktionen`) mit `1:n`-Kardinalität.
  * ⚡ **Power Query (M) & VertiPaq-Optimierung:** Vorgelagerte Transformationen und speichereffiziente Spaltenmodellierung für schnelle Abfragezeiten auf ~755.000 Transaktionszeilen.
* 🔗 **Repository:** [alefritz19/PowerBI-Supermarkt-Analytics ➔](https://github.com/alefritz19/PowerBI-Supermarkt-Analytics)

---

## 🏅 Offizielle Cloud-Zertifizierungen & Verified Badges

<table>
  <tr>
    <td align="center" width="140">
      <a href="https://achieve.snowflake.com/39919e7c-4de3-46d3-80a5-de041ca1ffc5">
        <img src="./assets/snowflake_badge_1_dww.png" width="100" height="100" alt="Snowflake Hands-On Essentials: Data Warehousing" />
      </a>
    </td>
    <td>
      <b>❄️ Snowflake Hands-On Essentials: Data Warehousing Workshop</b><br/>
      <i>Ausgestellt von Snowflake Inc. (Offiziell verifiziert über Accredible / DORA)</i><br/>
      <ul>
        <li><b>Schwerpunkte:</b> Multi-Cluster Shared Data Architecture, Virtual Warehouses, Stages (Internal & AWS S3 External), File Formats (CSV, TSV, JSON, XML), Semi-Structured Data Parsing (<code>VARIANT</code>, <code>LATERAL FLATTEN</code>), 3NF & Dimensional Modeling.</li>
        <li>🔗 <b>Offizieller Zertifikatsnachweis:</b> <a href="https://achieve.snowflake.com/39919e7c-4de3-46d3-80a5-de041ca1ffc5">achieve.snowflake.com/39919e7c-4de3-46d3-80a5-de041ca1ffc5 ➔</a></li>
      </ul>
    </td>
  </tr>
</table>

---

## 🛠️ Tech Stack & Data Engineering Kompetenzen

<table>
  <tr>
    <td align="center" width="96">
      <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/azure/azure-original.svg" width="48" height="48" alt="Microsoft Fabric" />
      <br><b>MS Fabric</b>
    </td>
    <td align="center" width="96">
      <img src="https://www.vectorlogo.zone/logos/snowflake/snowflake-icon.svg" width="48" height="48" alt="Snowflake" />
      <br><b>Snowflake</b>
    </td>
    <td align="center" width="96">
      <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/microsoftsqlserver/microsoftsqlserver-plain-wordmark.svg" width="48" height="48" alt="MSSQL" />
      <br><b>SQL Server</b>
    </td>
    <td align="center" width="96">
      <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/apache/apache-original.svg" width="48" height="48" alt="PySpark" />
      <br><b>PySpark</b>
    </td>
    <td align="center" width="96">
      <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" width="48" height="48" alt="Python" />
      <br><b>Python</b>
    </td>
    <td align="center" width="96">
      <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/git/git-original.svg" width="48" height="48" alt="Git" />
      <br><b>Git CLI</b>
    </td>
    <td align="center" width="96">
      <img src="https://upload.wikimedia.org/wikipedia/commons/c/cf/New_Power_BI_Logo.svg" width="48" height="48" alt="Semantic Layer" />
      <br><b>Gold Layer</b>
    </td>
  </tr>
</table>

* **☁️ Cloud Data Platforms & Lakehouse:** Microsoft Fabric (OneLake, Lakehouse, Data Warehouse, PySpark Notebooks, Direct Lake, DP-700) · **Snowflake Data Cloud** (Virtual Warehouses, Stages, Snowpipe, Streams/CDC, Tasks, Dynamic Tables, Time Travel, Zero-Copy Cloning) · Delta Lake & Parquet
* **🏛️ Data Warehousing & SQL Engineering:** Microsoft SQL Server · Kimball Dimensional Modeling (Star Schema) · Medallion-Architektur (Bronze / Silver / Gold) · T-SQL & Snowflake SQL · CTE-Pipelines · Window Functions · Referenzintegrität & Reconciliation
* **⚙️ ETL/ELT Automation & Tooling:** Python · PySpark · PowerShell Data Pipelines · Git & GitHub CLI · VS Code
* **📊 Semantic Serving Layer (Zusatzkompetenz):** Bereitstellung und Validierung von Gold-Layer-Modellen via DAX Studio & Power BI (Star Schema Relationships, VertiPaq Performance Auditing)

---

<div align="center">
  <i>"Robuste Datenarchitekturen und saubere Pipelines sind das Fundament jeder datengetriebenen Entscheidung."</i>
</div>