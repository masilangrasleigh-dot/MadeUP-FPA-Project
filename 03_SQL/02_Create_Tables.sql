USE MadeUp_FPA;
GO

-- Create Dimension Tables
CREATE TABLE DimProduct (
	ProductID VARCHAR(10) PRIMARY KEY,
	ProductName VARCHAR(75) NOT NULL,
	BusinessUnit VARCHAR(50) NOT NULL,
	RevenueModel VARCHAR(25) NOT NULL,
	BasePrice DECIMAL(12,2) NOT NULL,
	COGSRate DECIMAL(5,4) NOT NULL
);
GO

CREATE TABLE DimRegion (
	RegionID VARCHAR(10) PRIMARY KEY,
	RegionName VARCHAR(50) NOT NULL,
	RegionFactor DECIMAL(8,4) NOT NULL
);
GO

CREATE TABLE DimDepartment (
	DepartmentID VARCHAR(10) PRIMARY KEY,
	DepartmentName VARCHAR(75) NOT NULL,
	BaseHeadcount INT NOT NULL,
	BaseMonthlySalary DECIMAL(12,2) NOT NULL,
	BaseNonPayrollOpex DECIMAL(14,2) NOT NULL
);
GO

CREATE TABLE DimExpenseCategory (
	ExpenseCategoryID VARCHAR(10) PRIMARY KEY,
	ExpenseCategoryName VARCHAR(75) NOT NULL
);
GO

CREATE TABLE DimDate (
	MonthStart DATE PRIMARY KEY,
	CalendarYear INT NOT NULL,
	MonthNumber INT NOT NULL,
	MonthName VARCHAR(10) NOT NULL,
	QuarterName VARCHAR(2) NOT NULL
);
GO

-- Create Fact Tables
CREATE TABLE FactRevenueActual (
	MonthStart Date NOT NULL,
	ProductID VARCHAR(10) NOT NULL,
	RegionID VARCHAR(10) NOT NULL,
	Units DECIMAL (18,2) NOT NULL,
	ASP DECIMAL(12,2) NOT NULL,
	Revenue DECIMAL(18,2) NOT NULL,
	COGS DECIMAL(18,2) NOT NULL,

	CONSTRAINT PK_FactRevenueActual
		PRIMARY KEY (MonthStart, ProductID, RegionID),
	
	CONSTRAINT FK_Revenue_Product
		FOREIGN KEY (ProductID)
		REFERENCES DimProduct(ProductID),

	CONSTRAINT FK_Revenue_Region
		FOREIGN KEY (RegionID)
		REFERENCES DimRegion(RegionID),

	CONSTRAINT FK_Revenue_Date
		FOREIGN KEY (MonthStart)
		REFERENCES DimDate(MonthStart)
);
GO

CREATE TABLE FactHeadcountActual (
    MonthStart Date NOT NULL,
    DepartmentID VARCHAR(10) NOT NULL,
    Headcount DECIMAL(12,2) NOT NULL,
    AverageMonthlySalary DECIMAL(12,2) NOT NULL,

    CONSTRAINT PK_FactHeadcountActual
        PRIMARY KEY (MonthStart, DepartmentID),

    CONSTRAINT FK_Headcount_Date
        FOREIGN KEY (MonthStart)
        REFERENCES DimDate(MonthStart),

    CONSTRAINT FK_Headcount_Department
        FOREIGN KEY (DepartmentID)
        REFERENCES DimDepartment(DepartmentID)
);
GO

CREATE TABLE FactOpexActual (
    MonthStart DATE NOT NULL,
    DepartmentID VARCHAR(10) NOT NULL,
    ExpenseCategoryID VARCHAR(10) NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,

    CONSTRAINT PK_FactOpexActual
        PRIMARY KEY (MonthStart, DepartmentID, ExpenseCategoryID),
    
    CONSTRAINT FK_Opex_Date
        FOREIGN KEY (MonthStart)
        REFERENCES DimDate(MonthStart),

    CONSTRAINT FK_Opex_Department
        FOREIGN KEY (DepartmentID)
        REFERENCES DimDepartment(DepartmentID),

    CONSTRAINT FK_Opex_Category
        FOREIGN KEY (ExpenseCategoryID)
        REFERENCES DimExpenseCategory(ExpenseCategoryID)
);
GO