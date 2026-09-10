USE MadeUp_FPA;
GO

-- Load DimProduct
INSERT INTO DimProduct
(ProductID, ProductName, BusinessUnit, RevenueModel, BasePrice, COGSRate)
VALUES
('P001','MadeUp Phone','Devices','Unit Sales',699,0.62),
('P002','MadeUp Phone Pro','Devices','Unit Sales',999,0.58),
('P003','MadeUp Pad','Devices','Unit Sales',549,0.60),
('P004','MadeUp Book','Devices','Unit Sales',1199,0.55),
('P005','MadeUp Watch','Devices','Unit Sales',299,0.50),
('P006','MadeUp Cloud','Cloud & Software','Subscription',39,0.25),
('P007','Madeup Workspace','Cloud & Software','Subscription',24,0.20),
('P008','MadeUp Music','Digital Services','Subscription',12,0.30),
('P009','MadeUp Video','Digital Services','Subcription',15,0.35),
('P010','MadeUp Store','Digital Services','Transaction',8,0.15);
GO

-- Load DimRegion
INSERT INTO DimRegion
(RegionID, RegionName, RegionFactor)
VALUES
('R01','North America',1.00),
('R02','Europe',0.85),
('R03','Asia Pacific',0.95),
('R04','Latin America',0.55);
GO

-- Load DimDepartment
INSERT INTO DimDepartment
(DepartmentID, DepartmentName, BaseHeadcount, BaseMonthlySalary, BaseNonPayrollOpex)
VALUES
('D01','Sales',700,70000,8000000),
('D02','Marketing',450,75000,30000000),
('D03','Research & Development',1100,95000,20000000),
('D04','General & Administrative',400,85000,8000000),
('D05','Information Technology',350,90000,12000000),
('D06','Customer Operations',700,65000,10000000),
('D07','Human Resources',150,70000,3000000),
('D08','Facilities',200,55000,8000000);
GO

-- Load DimExpenseCategory
INSERT INTO DimExpenseCategory
(ExpenseCategoryID, ExpenseCategoryName)
VALUES
('A01','Payroll'),
('A02','Operating Programs'),
('A03','Technology & Software'),
('A04','Facilities & Travel');
GO

-- Load DimDate
WITH Months AS (
	SELECT CAST('2025-01-01' AS DATE) AS MonthStart

	UNION ALL

	SELECT DATEADD(MONTH,1,MonthStart)
	FROM Months
	WHERE MonthStart < '2026-06-01'
)
INSERT INTO DimDate
(MonthStart, CalendarYear, MonthNumber, MonthName, QuarterName)
SELECT
	MonthStart,
	YEAR(MonthStart),
	MONTH(MonthStart),
	DATENAME(MONTH,MonthStart),
	CONCAT('Q',DATEPART(QUARTER,MonthStart))
FROM Months
OPTION (MAXRECURSION 100);
GO

-- Load FactRevenueActual
INSERT INTO FactRevenueActual (MonthStart, ProductID, RegionID, Units, ASP, Revenue, COGS)
SELECT
    DimDate.MonthStart,
    DimProduct.ProductID,
    DimRegion.RegionID,

    ROUND(
        (CASE DimProduct.ProductName
            WHEN 'MadeUp Phone' THEN 250000
            WHEN 'MadeUp Phone Pro' THEN 120000
            WHEN 'MadeUp Pad' THEN 140000
            WHEN 'MadeUp Book' THEN 70000
            WHEN 'MadeUp Watch' THEN 180000
            WHEN 'MadeUp Cloud' THEN 600000
            WHEN 'Madeup Workspace' THEN 400000
            WHEN 'MadeUp Music' THEN 1200000
            WHEN 'MadeUp Video' THEN 800000
            WHEN 'MadeUp Store' THEN 900000
            ELSE 0
        END)
        * 
        (CASE DimDate.MonthNumber
            WHEN 1 THEN 0.92
            WHEN 2 THEN 0.90
            WHEN 3 THEN 0.96
            WHEN 4 THEN 0.95
            WHEN 5 THEN 1.00
            WHEN 6 THEN 1.02
            WHEN 7 THEN 1.03
            WHEN 8 THEN 1.02
            WHEN 9 THEN 1.00
            WHEN 10 THEN 1.05
            WHEN 11 THEN 1.12
            WHEN 12 THEN 1.18
            ELSE 1.00
        END)
        * DimRegion.RegionFactor
    , 2) AS Units,

    DimProduct.BasePrice AS ASP,

    ROUND(
        (
            (CASE DimProduct.ProductName
                WHEN 'MadeUp Phone' THEN 250000
                WHEN 'MadeUp Phone Pro' THEN 120000
                WHEN 'MadeUp Pad' THEN 140000
                WHEN 'MadeUp Book' THEN 70000
                WHEN 'MadeUp Watch' THEN 180000
                WHEN 'MadeUp Cloud' THEN 600000
                WHEN 'Madeup Workspace' THEN 400000
                WHEN 'MadeUp Music' THEN 1200000
                WHEN 'MadeUp Video' THEN 800000
                WHEN 'MadeUp Store' THEN 900000
                ELSE 0
            END)
            * 
            (CASE DimDate.MonthNumber
                WHEN 1 THEN 0.92
                WHEN 2 THEN 0.90
                WHEN 3 THEN 0.96
                WHEN 4 THEN 0.95
                WHEN 5 THEN 1.00
                WHEN 6 THEN 1.02
                WHEN 7 THEN 1.03
                WHEN 8 THEN 1.02
                WHEN 9 THEN 1.00
                WHEN 10 THEN 1.05
                WHEN 11 THEN 1.12
                WHEN 12 THEN 1.18
                ELSE 1.00
            END)
            * DimRegion.RegionFactor
        ) * DimProduct.BasePrice
    , 2) AS Revenue,

    ROUND(
        (
            (
                (CASE DimProduct.ProductName
                    WHEN 'MadeUp Phone' THEN 250000
                    WHEN 'MadeUp Phone Pro' THEN 120000
                    WHEN 'MadeUp Pad' THEN 140000
                    WHEN 'MadeUp Book' THEN 70000
                    WHEN 'MadeUp Watch' THEN 180000
                    WHEN 'MadeUp Cloud' THEN 600000
                    WHEN 'Madeup Workspace' THEN 400000
                    WHEN 'MadeUp Music' THEN 1200000
                    WHEN 'MadeUp Video' THEN 800000
                    WHEN 'MadeUp Store' THEN 900000
                    ELSE 0
                END)
                * 
                (CASE DimDate.MonthNumber
                    WHEN 1 THEN 0.92
                    WHEN 2 THEN 0.90
                    WHEN 3 THEN 0.96
                    WHEN 4 THEN 0.95
                    WHEN 5 THEN 1.00
                    WHEN 6 THEN 1.02
                    WHEN 7 THEN 1.03
                    WHEN 8 THEN 1.02
                    WHEN 9 THEN 1.00
                    WHEN 10 THEN 1.05
                    WHEN 11 THEN 1.12
                    WHEN 12 THEN 1.18
                    ELSE 1.00
                END)
                * DimRegion.RegionFactor
            ) * DimProduct.BasePrice
        ) * DimProduct.COGSRate
    , 2) AS COGS

FROM DimDate
CROSS JOIN DimProduct
CROSS JOIN DimRegion;
GO

-- Load FactHeadcountActual
INSERT INTO FactHeadcountActual
(MonthStart, DepartmentID, Headcount, AverageMonthlySalary)
SELECT
    DimDate.MonthStart,
    DimDepartment.DepartmentID,
    DimDepartment.BaseHeadcount,
    DimDepartment.BaseMonthlySalary
FROM DimDate
CROSS JOIN DimDepartment;
GO

-- Load FactOpexActual
INSERT INTO FactOpexActual
(MonthStart, DepartmentID, ExpenseCategoryID, Amount)
SELECT
    DimDate.MonthStart,
    DimDepartment.DepartmentID,
    DimExpenseCategory.ExpenseCategoryID,
    DimDepartment.BaseNonPayrollOpex
FROM DimDate
CROSS JOIN DimDepartment
CROSS JOIN DimExpenseCategory;
GO