USE MadeUp_FPA;
GO

-- Row Counts for Dimensions & Date Range
SELECT COUNT(*) AS ProductCount
FROM DimProduct;
GO

SELECT COUNT(*) AS RegionCount
FROM DimRegion;
GO

SELECT COUNT(*) AS DepartmentCount
FROM DimDepartment;
GO

SELECT  MIN(MonthStart) AS FirstMonth,
        MAX(MonthStart) AS LastMonth,
        COUNT(*) AS MonthCount
FROM DimDate;
GO

-- Revenue by Calendar Year
SELECT
    YEAR(MonthStart) AS CalendarYear,
    SUM(Revenue) AS Revenue
FROM FactRevenueActual
GROUP BY YEAR(MonthStart)
ORDER BY CalendarYear;
GO

-- Revenue Trend by Month
SELECT
    MonthStart,
    SUM(Revenue) AS Revenue
FROM FactRevenueActual
GROUP BY MonthStart
ORDER BY MonthStart;
GO

-- Revenue by Business Unit
SELECT
    p.BusinessUnit,
    SUM(f.Revenue) AS Revenue
FROM FactRevenueActual f
JOIN DimProduct p
    ON f.ProductID = p.ProductID
GROUP BY p.BusinessUnit
ORDER BY Revenue DESC;
GO

-- Revenue by Region
SELECT
    r.RegionName,
    SUM(f.Revenue) AS Revenue
FROM FactRevenueActual f
JOIN DimRegion r
    ON f.RegionID = r.RegionID
GROUP BY r.RegionName
ORDER BY Revenue DESC;
GO

-- Revenue by Product Name
SELECT
    p.ProductName,
    SUM(f.Revenue) AS Revenue
FROM FactRevenueActual f
JOIN DimProduct p
    ON f.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC;
GO

-- Overall P&L Gross Margin Summary
SELECT
    SUM(Revenue) AS Revenue,
    SUM(COGS) AS COGS,
    SUM(Revenue - COGS) AS GrossProfit,
    SUM(Revenue - COGS) / NULLIF(SUM(Revenue),0) AS GrossMargin
FROM FactRevenueActual;
GO

-- Operating Expenses by Department
SELECT
    d.DepartmentName,
    SUM(o.Amount) AS Opex
FROM FactOpexActual o
JOIN DimDepartment d
    ON o.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY Opex DESC;
GO

-- Operating Expenses by Expense Category
SELECT
    e.ExpenseCategoryName,
    SUM(o.Amount) AS Opex
FROM FactOpexActual o
JOIN DimExpenseCategory e
    ON o.ExpenseCategoryID = e.ExpenseCategoryID
GROUP BY e.ExpenseCategoryName
ORDER BY Opex DESC;
GO