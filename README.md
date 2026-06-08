# 🛒 E-Commerce Sales Performance & Customer Retention Analysis

**Stack:** SQL (PostgreSQL) + Python (Pandas, Plotly, Scikit-learn)

---

## 📌 Project Overview

Análisis integral de **50,000 transacciones e-commerce** combinando SQL y Python para extraer insights de ventas, retención de clientes y comportamiento de compra.

## 🔬 Methodology

### SQL (PostgreSQL)
El archivo [`retention_analysis.sql`](retention_analysis.sql) implementa:
- **Common Table Expressions (CTEs)** para modularizar el análisis
- **Window Functions** (`LAG`) para identificar compras consecutivas
- **Date Truncation** (`DATE_TRUNC`) para agrupar por períodos
- **Cohort Retention** cálculo de tasa de retención por trimestre

### Python (Pandas + Plotly)
El notebook [`ecommerce_analysis.ipynb`](ecommerce_analysis.ipynb) replica y extiende el análisis SQL:
- **EDA completo:** distribución, nulos, estadísticas descriptivas
- **Revenue por categoría y país** con visualizaciones interactivas
- **Segmentación etaria:** 4 grupos etarios con gasto promedio
- **Análisis temporal:** ingresos trimestrales con tendencias

---

## 📊 Key Findings

| Métrica | Resultado |
|---|---|
| Transacciones analizadas | **50,000** |
| Período | 2023–2025 (2 años) |
| Países | 10 |
| Categorías de producto | 8 |
| Ingresos totales | **$25.16M** |
| Ticket promedio | **$503.16** |
| Usuarios únicos | 100 |

### Top Categorías por Ingresos

| Categoría | Ingresos |
|---|---|
| Sports | $3.20M |
| Toys | $3.19M |
| Books | $3.18M |
| Clothing | $3.17M |
| Electronics | $3.13M |
| Home & Kitchen | $3.11M |
| Beauty | $3.06M |

### Métodos de Pago (distribución balanceada)

- UPI: 17.0%
- Cash on Delivery: 16.9%
- Debit Card: 16.7%
- Credit Card: 16.6%
- PayPal: 16.5%
- Net Banking: 16.3%

### Retention Insight

**~96%** de usuarios activos registran compras en meses consecutivos, indicando una base de clientes altamente leal. La retención es mayor en segmentos de edad 36+.

---

## 🛠️ Tech Stack

| Herramienta | Uso |
|---|---|
| **PostgreSQL** | CTEs, Window Functions, Cohort Analysis |
| **Pandas** | ETL, agrupaciones, segmentación |
| **Plotly** | Visualizaciones interactivas (barras, líneas, pie) |
| **Scikit-learn** | Preparación de datos para segmentación |

## 📁 Files

- `ecommerce_transactions.csv` — Dataset raw (50K records)
- `retention_analysis.sql` — SQL query con CTEs y window functions
- `ecommerce_analysis.ipynb` — Notebook Python con análisis completo
- `analysis_summary.txt` — Resumen ejecutivo de resultados