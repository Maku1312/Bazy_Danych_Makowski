--1. Wykorzystując wyrażenie CTE zbuduj zapytanie, które znajdzie informacje na temat stawki pracownika oraz jego danych,
--a następnie zapisze je do tabeli tymczasowej TempEmployeeInfo. Rozwiąż w oparciu o AdventureWorks.

--Używam bazy AdventureWorks
USE AdventureWorks2017
GO
--Sprawdzam czy tymczasowa tabela istnieje, jeśli tak to ją usuwam
IF EXISTS(SELECT [name] FROM tempdb.sys.tables WHERE [name] like '#TempEmployeeInfo%') 
BEGIN
   DROP TABLE #TempEmployeeInfo;
END;
--Tworzę tymczasową tabelę
WITH EmployeeDataBonus_CTE(BusinessEntityID,PersonType,Title,FirstName,MiddleName,LastName,Bonus)
AS (
SELECT per.BusinessEntityID, per.PersonType, per.Title, per.FirstName, per.MiddleName, per.LastName, sal.Bonus
AS pensja
FROM Person.Person per
JOIN Sales.SalesPerson sal ON sal.BusinessEntityID = per.BusinessEntityID
)
SELECT * INTO #TempEmployeeInfo FROM EmployeeDataBonus_CTE				
SELECT* FROM #TempEmployeeInfo


--2. Uzyskaj informacje na temat przychodów ze sprzedaży według firmy i kontaktu (za pomocą CTE i bazy AdventureWorksL).

--Używam bazy AdventureWorksLT
USE AdventureWorksLT2017
GO
--Tworzę CTE
WITH CompanyRevenue_CTE(CompanyContact, Revenue)
AS (
SELECT cus.CompanyName + ' (' + cus.FirstName + ' ' + cus.LastName + ') '
AS CompanyContact, soh.TotalDue AS Revenue
FROM SalesLT.Customer cus
JOIN SalesLT.SalesOrderHeader soh ON cus.CustomerID = soh.CustomerID
)
--Wyświetlam CTE
SELECT * FROM CompanyRevenue_CTE ORDER BY CompanyContact


--3. Napisz zapytanie, które zwróci wartość sprzedaży dla poszczególnych kategorii produktów. Wykorzystaj CTE i bazę AdventureWorksLT.

--Tworzę CTE
WITH CTE_three(Category,SalesValue)
AS (
SELECT cat.Name AS Category, SUM(UnitPrice * OrderQty)
AS SalesValue
FROM SalesLT.ProductCategory cat
JOIN SalesLT.Product pro ON cat.ProductCategoryID = pro.ProductCategoryID
JOIN SalesLT.SalesOrderDetail det ON det.ProductID = pro.ProductID
GROUP BY cat.Name
)
--Wyświetlam CTE
SELECT Category, SalesValue FROM CTE_three ORDER BY Category