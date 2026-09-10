# MadeUP — FP&A Planning Assumptions & Drivers

## 1. Overview
This document outlines the core financial planning assumptions, driver-based growth rates, operational factors, and scenario parameters utilized within the MadeUP Integrated FP&A Analytics Model. These parameters govern the structural transition from historical actuals (2025) to the 2026 Annual Budget and Forecast periods.

---

## 2. Product Master & Revenue Models
Revenue planning is strictly driver-based, utilizing volume and price drivers rather than top-line flat-rate percentage growths.

| Product ID | Product Name | Business Unit | Revenue Model | Base Price (USD) | Approx. COGS % |
| :--- | :--- | :--- | :--- | :---: | :---: |
| **P001** | MadeUP Phone | Devices | Unit Sales | $699[cite: 7] | 62.00%[cite: 7] |
| **P002** | MadeUP Phone Pro | Devices | Unit Sales | $999[cite: 7] | 58.00%[cite: 7] |
| **P003** | MadeUP Pad | Devices | Unit Sales | $549[cite: 7] | 60.00%[cite: 7] |
| **P004** | MadeUP Book | Devices | Unit Sales | $1,199[cite: 7] | 55.00%[cite: 7] |
| **P005** | MadeUP Watch | Devices | Unit Sales | $299[cite: 7] | 50.00%[cite: 7] |
| **P006** | MadeUP Cloud | Cloud & Software | Subscription | $39[cite: 7] | 25.00%[cite: 7] |
| **P007** | MadeUP Workspace | Cloud & Software | Subscription | $24[cite: 7] | 20.00%[cite: 7] |
| **P008** | MadeUP Music | Digital Services | Subscription | $12[cite: 7] | 30.00%[cite: 7] |
| **P009** | MadeUP Video | Digital Services | Subscription | $15[cite: 7] | 35.00%[cite: 7] |
| **P010** | MadeUP Store | Digital Services | Transaction | $8[cite: 7] | 15.00%[cite: 7] |

---

## 3. Geographic Modeling Factors
Geographic scaling factors are applied to model varying regional market sizes and revenue scales across four operational territories[cite: 8].

| Region ID | Region Name | Modeling Factor |
| :--- | :--- | :---: |
| **R01** | North America[cite: 8] | 1.00[cite: 8] |
| **R02** | Europe[cite: 8] | 0.85[cite: 8] |
| **R03** | Asia Pacific[cite: 8] | 0.95[cite: 8] |
| **R04** | Latin America[cite: 8] | 0.55[cite: 8] |

---

## 4. Seasonality Curves
Monthly seasonality factors are applied to reflect stronger commercial activity and peak demand during the fourth quarter (Q4).

| Month | Seasonality Factor |
| :--- | :---: |
| **January** | 0.92 |
| **February** | 0.90 |
| **March** | 0.96 |
| **April** | 0.95 |
| **May** | 1.00 |
| **June** | 1.02 |
| **July** | 1.03 |
| **August** | 1.02 |
| **September** | 1.00 |
| **October** | 1.05 |
| **November** | 1.12 |
| **December** | 1.18 |

---

## 5. 2026 Budget Growth Assumptions (Driver-Based)

### A. Revenue Growth Drivers
* **Devices:** Volume Growth +6.0% | Price Growth +2.0%
* **Cloud & Software:** Volume Growth +10.0% | Price Growth +3.0%
* **Digital Services:** Volume Growth +8.0% | Price Growth +2.0%

### B. Operating Expense (Opex) Budget Growth by Department
* **Sales (D01):** +6.0%
* **Marketing (D02):** +7.0%
* **Research & Development (D03):** +9.0%
* **General & Administrative (D04):** +5.0%
* **Information Technology (D05):** +8.0%
* **Customer Operations (D06):** +6.0%
* **Human Resources (D07):** +5.0%
* **Facilities (D08):** +5.0%

### C. Headcount Growth Assumptions by Department
* **Sales (D01):** +5.0%
* **Marketing (D02):** +6.0%
* **Research & Development (D03):** +8.0%
* **General & Administrative (D04):** +3.0%
* **Information Technology (D05):** +7.0%
* **Customer Operations (D06):** +5.0%
* **Human Resources (D07):** +4.0%
* **Facilities (D08):** +2.0%

---

## 6. Materiality Thresholds
For variance analysis and financial reporting controls, a variance is deemed **Material** if it satisfies either of the following criteria:
* Absolute percentage variance $\ge$ **5.0%**
* Absolute dollar variance $\ge$ **$5,000,000**

---

## 7. Scenario Analysis Parameters
Sensitivity adjustments applied to top-line revenue growth across dynamic model scenarios:
* **Downside Scenario:** Revenue growth assumptions reduced by **-3.0 percentage points**.
* **Base Scenario:** Standard baseline assumptions (**0.0 deviation**).
* **Upside Scenario:** Revenue growth assumptions increased by **+3.0 percentage points**.