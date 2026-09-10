USE MadeUp_FPA;
GO

-- Validate Dimension Tables
SELECT *
FROM DimProduct;
GO

SELECT *
FROM DimRegion;
GO

SELECT *
FROM DimDepartment;
GO

SELECT *
FROM DimExpenseCategory;
GO

SELECT *
FROM DimDate
ORDER BY MonthStart;
GO

-- Validate Fact Tables
SELECT *
FROM FactRevenueActual
ORDER BY MonthStart, ProductID, RegionID;
GO

SELECT *
FROM FactHeadcountActual
ORDER BY MonthStart, DepartmentID;
GO

SELECT *
FROM FactOpexActual
ORDER BY MonthStart, DepartmentID, ExpenseCategoryID;
GO