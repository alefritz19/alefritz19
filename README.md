<div align="center">

# 👋 Hi, I'm Alexander Fritzler!
### 📊 Data Analyst & ⚙️ Microsoft Fabric Data Engineer

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/alexander-fritzler-214628356/)
[![Email](https://img.shields.io/badge/Email-Contact_Me-red?style=for-the-badge&logo=gmail)](mailto:alefritz19@gmail.com)
[![Location](https://img.shields.io/badge/Location-Germany-lightgrey?style=for-the-badge&logo=googlemaps)](https://maps.google.com)

<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=20&duration=3000&pause=1000&color=00B4D8&center=true&vCenter=true&width=520&lines=Power+BI+%26+DAX+Specialist;Microsoft+Fabric+(DP-700);T-SQL+%26+SQL+Server+Engineering;Lakehouse+%26+PySpark+Pipelines" alt="Typing SVG" />
</p>

</div>

---

## 🌟 Featured Engineering Projects

### 🛒 [Supermarkt Medallion Data Platform & Power BI Direct Lake](https://github.com/alefritz19/Supermarkt-Medallion-Lakehouse-Fabric)
> **End-to-End Enterprise Lakehouse Architecture on Microsoft Fabric (DP-700 & PL-300)**

```
[SQL Server / ERP] ➔ [OneLake Bronze (Raw)] ➔ [PySpark Silver (Delta Lake & Z-Order)] ➔ [Gold Shortcuts & DW CTAS] ➔ [Power BI Direct Lake]
```

- **Domain & Scope:** Einzelhandel & FMCG (Supermarkt-Transaktionsdaten, Filialumsätze, Bons, Kunden- & Produktanalysen).
- **Core Engineering:**
  - ⚡ **Bronze ➔ Silver (PySpark ETL):** Schema-Casting, String-Cleansing, Star-Schema Denormalisierung (`dim_produkte`, `fct_verkaeufe`), `OPTIMIZE ZORDER BY (EinkaufDatum, ProduktID)`.
  - 🏛️ **Serving (Fabric Warehouse):** Cross-Database T-SQL CTAS Aggregationen und idempotente Stored Procedures (`dbo.usp_Refresh_Kategorie_Summary`).
  - 📊 **Business Intelligence (Direct Lake):** Zero-Copy Direct Lake Semantikmodell auf Delta Parquet mit expliziten Time-Intelligence DAX Measures (YoY, YTD, Durchschn.-Bon).
- 🔗 **Repository & Code:** [alefritz19/Supermarkt-Medallion-Lakehouse-Fabric ➔](https://github.com/alefritz19/Supermarkt-Medallion-Lakehouse-Fabric)
  - 📄 [`PySpark Transformation Notebook`](https://github.com/alefritz19/Supermarkt-Medallion-Lakehouse-Fabric/blob/main/notebooks/nb_bronze_to_silver_supermarkt.py)
  - 📄 [`Warehouse Analytics & Stored Procedure T-SQL`](https://github.com/alefritz19/Supermarkt-Medallion-Lakehouse-Fabric/blob/main/sql_warehouse/warehouse_analytics_ctas_sp.sql)
  - 📄 [`Explizite DAX Measures`](https://github.com/alefritz19/Supermarkt-Medallion-Lakehouse-Fabric/blob/main/power_bi/dax_measures_supermarkt.dax)

---

### 📚 [Data Engineering Knowledge Base & Production Hub](https://github.com/alefritz19/Data-Engineering-KnowledgeBase)
> **Zentrale Engineering-Bibliothek: Vorlagen, Performance Tuning & Best Practices**

- 🗄️ **Microsoft SQL Server:** DQL (Window Functions, CTEs), DMV Index Tuning, Stored Procedures.
- 📊 **Power BI & Analytics:** Power Query M Automatisierung, Star Schema Richtlinien, DAX Time Intelligence.
- ⚙️ **Microsoft Fabric & Spark:** Ingestion Patterns, Medallion Architekturen, Git CI/CD Workflows.
- 🔗 **Repository:** [alefritz19/Data-Engineering-KnowledgeBase ➔](https://github.com/alefritz19/Data-Engineering-KnowledgeBase)

---

## 🚀 About Me

- 💼 **Focus Areas**: End-to-end Business Intelligence, Cloud Data Engineering & Lakehouse Architectures.
- 🎯 **Target Roles**: Data Analyst, Microsoft Fabric Data Engineer, Analytics Engineer.
- 🏗️ **Core Philosophy**: Saubere Datenmodelle (Star Schema), versionskontrollierte Pipelines (Git CI/CD) und skalierbare Lakehouse-Architekturen ohne redundante Datenkopien.

---

## 🛠️ Tech Stack & Tooling

<table>
  <tr>
    <td align="center" width="96">
      <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/microsoftsqlserver/microsoftsqlserver-plain-wordmark.svg" width="48" height="48" alt="MSSQL" />
      <br><b>SQL Server</b>
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
      <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/azure/azure-original.svg" width="48" height="48" alt="Fabric" />
      <br><b>MS Fabric</b>
    </td>
    <td align="center" width="96">
      <img src="https://upload.wikimedia.org/wikipedia/commons/c/cf/New_Power_BI_Logo.svg" width="48" height="48" alt="Power BI" />
      <br><b>Power BI</b>
    </td>
    <td align="center" width="96">
      <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/git/git-original.svg" width="48" height="48" alt="Git" />
      <br><b>Git</b>
    </td>
  </tr>
</table>

#### 🔹 Cloud & Data Engineering
Microsoft Fabric • Delta Lake • Medallion Architecture • Data Factory Pipelines • OneLake • Synapse Warehouse

#### 🔹 Analytics & Business Intelligence
Power BI Desktop • DAX (Explicit Measures, Time Intelligence) • Power Query (M) • Star Schema • Direct Lake Mode

#### 🔹 Database & SQL Engineering
T-SQL • Stored Procedures • CTAS • Window Functions • Execution Plans & Index Tuning • CTEs

---

## 📈 GitHub Analytics

<div align="center">
  <img src="https://github-readme-stats.vercel.app/api?username=alefritz19&show_icons=true&theme=radical&hide_border=true&count_private=true" width="48%" alt="GitHub Stats" />
  <img src="https://github-readme-stats.vercel.app/api/top-langs/?username=alefritz19&layout=compact&theme=radical&hide_border=true" width="44%" alt="Top Languages" />
</div>

---

<div align="center">
  <i>"Transforming complex raw data into robust, automated enterprise insights."</i>
</div>