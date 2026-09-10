# Phase 1.1 — Define KPIs

**Document:** MadeUP FP&A Analytics Project — Key Performance Indicators (KPI) Definitions  
**Path:** `01_Business_Requirements/KPI_Definitions.md`  
**Scope:** Standardized mathematical formulas and strategic purposes for all core financial and operational metrics tracked across the FP&A model and management reports.

---

## KPI Definitions Table

| KPI | Formula | Purpose |
| :--- | :--- | :--- |
| **Revenue** | Product/Service Revenue | Top-line performance |
| **Revenue Growth %** | Current / Prior - 1 | Growth |
| **COGS** | Cost of goods sold | Direct cost |
| **Gross Profit** | Revenue - COGS | Profit after direct costs |
| **Gross Margin %** | Gross Profit / Revenue | Margin quality |
| **Operating Expense** | Sum of Opex | Operating cost |
| **EBIT** | Gross Profit - Opex | Operating profitability |
| **EBIT Margin %** | EBIT / Revenue | Profitability |
| **Budget Variance** | Actual - Budget | Performance |
| **Variance %** | Variance / Budget | Relative performance |
| **Forecast** | Actual YTD + Forecast Remaining | Latest outlook |
| **Headcount** | Active employees | Workforce scale |

---

## Usage Guidelines

1. **Consistency**: All formulas above must be used consistently across SQL views, Excel financial models (`MadeUP_FPA_Model.xlsx`), and Power BI semantic measures.
2. **Materiality Thresholds**: Budget and forecast variances are evaluated against materiality rules ($\ge 5\%$ relative variance OR $\ge \$5	ext{M}$ absolute variance).
