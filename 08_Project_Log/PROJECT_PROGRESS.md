# MadeUP FP&A Project Progress

## Current Status
Phase: Completed (100% - Fully Integrated Model, Excel, SQL, and Power BI Dashboard Reconciled)

## Completed
### Phase 0: Repository & Structure Setup
- Created GitHub repository structure and project folders (`01_Business_Requirements`, `02_Data`, `04_Excel`, `05_PowerBI`, `08_Project_Log`).
- Established base documentation and project metadata.

### Phase 1: Business Requirements & Architecture
- Defined MadeUP's business units (Devices, Cloud & Software, Digital Services), 4 geographic regions, 8 departments, and expense categories.
- Established baseline assumptions for volume growth, pricing, Opex, and headcount.

### Phase 2: Database & SQL Pipeline
- Loaded raw actual revenue, Opex, and headcount datasets into relational tables.
- Built foundational SQL queries to aggregate actuals and verify base data integrity.

### Phase 3: Excel Financial Model (`MadeUp FPA Model.xlsx`)
- Built a 12-sheet dynamic financial model covering Assumptions, Actuals, Budget, Forecasts, P&L, Scenarios, and Management Summary.
- Implemented robust model checks (`11_Checks`) guaranteeing zero variance across financial statements (`MODEL PASS`).

### Phase 4: Power BI Dashboard & Visuals (`MadeUP — Integrated FP&A Analytics Project.pbix`)
- Developed a star-schema data model linking actuals, budgets, and dimensions.
- Created DAX financial measures and executive dashboards tracking revenue performance, EBIT margins, and departmental spend.

## What I Learned
- How to architect an end-to-end corporate FP&A workflow from raw data ingestion to executive-ready reporting.
- The mechanics of connecting SQL backend logic, multi-sheet Excel financial models, and Power BI semantic layers.
- Translating variance analyses and scenario toggles into strategic management recommendations.

## What I Built
- `MadeUp FP&A Model.xlsx`: A fully integrated 12-sheet financial model with automated validation checks.
- `MadeUP FP&A Dashboard.pbix`: An executive-grade interactive Power BI dashboard.
- Relational database schema and query scripts.

## Skills Demonstrated
- Financial Planning & Analysis (FP&A)
- Advanced Excel Financial Modeling & Scenario Analysis
- Business Intelligence & DAX Data Modeling
- Relational Database Management & SQL Queries
- Executive Storytelling & Variance Reporting

## Problems Encountered
- Reconciling multi-region seasonality curves with top-line budget growth targets.
- Ensuring strict consistency across multi-platform tools (SQL, Excel, and Power BI).

## How I Solved Them
- Established automated validation sheets (`11_Checks`) in Excel to cross-verify statement rollups.
- Applied clean dimensional modeling and star-schema relationships in Power BI.

## Interview Notes
- **Core Narrative:** This project proves the ability to bridge accounting actuals with strategic financial planning and forecasting.
- **Key Metrics to Quote:** \$37.48B Budget Revenue, 25.17% EBIT Margin, 45.51% Gross Margin baseline, and \$396.00M monthly Opex baseline control.

## Next Step
- Finalize portfolio presentation and rehearse technical interview walkthroughs.