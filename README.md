<div align="center">

# 👋 Hi, I'm Alexander Fritzler!
### 📊 BI & Data Analyst | ⚙️ Analytics Engineer (Power BI · SQL · Microsoft Fabric)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/alexander-fritzler-214628356/)
[![Email](https://img.shields.io/badge/Email-Contact_Me-red?style=for-the-badge&logo=gmail)](mailto:alefritz19@gmail.com)
[![Location](https://img.shields.io/badge/Location-Germany-lightgrey?style=for-the-badge&logo=googlemaps)](https://maps.google.com)

<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=20&duration=3000&pause=1000&color=00B4D8&center=true&vCenter=true&width=560&lines=Power+BI+%26+Advanced+DAX+Architect;Business+Analytics+%26+Retail+KPIs;T-SQL+Analytics+%26+Data+Auditing;Microsoft+Fabric+(DP-600+%2F+DP-700)" alt="Typing SVG" />
</p>

</div>

---

## 🌟 Ausgewählte Portfolio-Projekte (Featured Projects)

Alle drei Hauptprojekte basieren auf einer gemeinsamen, realistischen Einzelhandelsarchitektur (**FrischMarkt GmbH**, 5 Filialen, 120 Artikel, 3.000 Kundenkarten, ~755.000 Transaktionspositionen) und decken den gesamten Weg von der Rohdatenbereinigung bis zum Vorstandsdashboard ab:

```text
[SQL Server / ERP] ──▶ [T-SQL Cleaning & RFM] ──▶ [Power BI DAX & Star Schema] ──▶ [Fabric Lakehouse]
```

---

### 1. 📊 [Power BI Supermarkt Retail Analytics (Enterprise Solution)](https://github.com/alefritz19/PowerBI-Supermarkt-Analytics)
> **End-to-End Business Intelligence & Reporting (PL-300 Standard · Sternschema nach Kimball · 60+ DAX-Measures)**

* **Geschäftskontext:** Ganzheitliche Steuerung eines Filialunternehmens (2,51 Mio. € Umsatz, 768.980 € Rohertrag).
* **Kernbestandteile:**
  * 🏛️ **Kimball-Sternschema:** 6 Dimensionstabellen (`dim_produkt`, `dim_kunde`, `dim_filiale`, `dim_datum`, `dim_mitarbeiter`, `dim_aktionen`) und 2 Faktentabellen (`fct_verkaeufe`, `fct_abschreibungen`) mit strikten 1:n Beziehungen und einfacher Filterrichtung.
  * 🧮 **DAX-Measures-Bibliothek:** Time Intelligence (YoY, MoM, YTD, 12M MAT), Filterkontext-Steuerung via `CALCULATE`/`ALL`/`KEEPFILTERS`, dynamische ABC-Pareto-Sortimentsanalyse nach Umsatz & Ertrag sowie Warenkorb-Penetration.
  * 💡 **Konkrete Business Insights:** Aufdeckung von 36.658 € MHD-Abschreibungen bei Frischeware, Margenanalyse (Molkerei 24,4 % vs. Backwaren 51,7 %) und Frequenz-Benchmarking nach Standorten.
* 🔗 **Repository:** [alefritz19/PowerBI-Supermarkt-Analytics ➔](https://github.com/alefritz19/PowerBI-Supermarkt-Analytics)

---

### 2. 🗄️ [SQL Analyst Toolkit & Production Hub](https://github.com/alefritz19/sql-analyst-toolkit)
> **Praxisorientierte T-SQL Referenzarchitektur für Datenbereinigung, Kohortenanalyse & Kundenwert (RFM)**

* **Geschäftskontext:** Vorbereitung und Auditierung unstrukturierter operativer Rohdaten für Reporting und Analytics.
* **Kernbestandteile:**
  * 🧹 **Data Cleaning & Auditing (`DATA_CLEANING_MASTER.sql`):** In-Flight-Bereinigung von Whitespace, sichere Datumskonvertierung (`TRY_CONVERT`) und Duplikats-Deduplizierung via `ROW_NUMBER()`.
  * 📈 **Advanced Window Functions (`WINDOW_FUNCTIONS_MASTER.sql`):** MoM-Wachstum via `LAG()`, Top-Seller-Ranking je Kategorie via `DENSE_RANK()` und gleitender 7-Tage-Durchschnitt (`ROWS BETWEEN 6 PRECEDING`) zur Glättung von Wochenende-Peaks.
  * 👥 **Customer Analytics (`ADVANCED_ANALYTICS_MASTER.sql`):** Vollständige RFM-Segmentierung (Recency, Frequency, Monetary mit `NTILE(5)`) sowie monatliche Kohorten-Retention-Matrix (M0 bis M6).
* 🔗 **Repository:** [alefritz19/sql-analyst-toolkit ➔](https://github.com/alefritz19/sql-analyst-toolkit)

---

### 3. ⚙️ [Supermarkt Medallion Data Platform on Microsoft Fabric](https://github.com/alefritz19/Supermarkt-Medallion-Lakehouse-Fabric)
> **Cloud Lakehouse Architektur (Bronze ➔ Silver ➔ Gold ➔ Direct Lake / DP-700 & DP-600)**

* **Geschäftskontext:** Skalierung der operativen SQL-Datenbank in eine moderne SaaS-Lakehouse-Infrastruktur.
* **Kernbestandteile:**
  * ⚡ **Bronze ➔ Silver (PySpark ETL):** Schemavalidierung, Typ-Casting, Delta-Lake-Optimierung via `Z-ORDER BY (BonDatum, ProduktID)`.
  * 🏛️ **Serving Layer (Fabric Warehouse):** Cross-Database CTAS-Aggregationen und Stored Procedures für Vorstandsberichte.
  * 📊 **Zero-Copy Direct Lake:** Power BI Semantikmodell liest direkt aus Parquet-Dateien im OneLake ohne Import-Duplikate.
* 🔗 **Repository:** [alefritz19/Supermarkt-Medallion-Lakehouse-Fabric ➔](https://github.com/alefritz19/Supermarkt-Medallion-Lakehouse-Fabric)

---

## 🛠️ Tech Stack & Kompetenzen

<table>
  <tr>
    <td align="center" width="96">
      <img src="https://upload.wikimedia.org/wikipedia/commons/c/cf/New_Power_BI_Logo.svg" width="48" height="48" alt="Power BI" />
      <br><b>Power BI</b>
    </td>
    <td align="center" width="96">
      <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/microsoftsqlserver/microsoftsqlserver-plain-wordmark.svg" width="48" height="48" alt="MSSQL" />
      <br><b>SQL Server</b>
    </td>
    <td align="center" width="96">
      <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/azure/azure-original.svg" width="48" height="48" alt="Fabric" />
      <br><b>MS Fabric</b>
    </td>
    <td align="center" width="96">
      <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" width="48" height="48" alt="Python" />
      <br><b>Python</b>
    </td>
    <td align="center" width="96">
      <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/apache/apache-original.svg" width="48" height="48" alt="PySpark" />
      <br><b>PySpark</b>
    </td>
    <td align="center" width="96">
      <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/git/git-original.svg" width="48" height="48" alt="Git" />
      <br><b>Git</b>
    </td>
  </tr>
</table>

* **Business Intelligence & Reporting:** Power BI Desktop/Service · DAX (Time Intelligence, Filter Context, All/Keepfilters, Pareto) · Power Query (M) · Kimball Sternschema · IBCS Design Standards
* **Datenbanken & T-SQL Engineering:** Microsoft SQL Server 2022 · DWH-Modellierung · CTEs & Unterabfragen · Fensterfunktionen (Row_Number, Lag, Lead, Dense_Rank) · Data Cleansing · Index-Optimierung
* **Cloud & Modern Analytics Stack:** Microsoft Fabric (OneLake, Lakehouse, Warehouse, Direct Lake) · Delta Parquet · PySpark · Git CI/CD

---

<div align="center">
  <i>"Daten sind erst dann wertvoll, wenn sie konkrete unternehmerische Entscheidungen herbeiführen."</i>
</div>