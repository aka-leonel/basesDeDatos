/*Laboratorio BETWEEN

1) Mostrar todos los productos cuyo precio de 
lista esté entre 200 y 300. 
tablas:Production.Product	
campos: ListPrice*/
/*
USE AdventureWorks2019
GO
SELECT *
FROM Production.Product
WHERE ListPrice BETWEEN 200 AND 300
ORDER BY ListPrice
*/


/*
2) Mostrar todos los empleados que nacieron
entre 1970 y 1985. 
tablas: HumanResources.Employee
campos: BirthDate*/
/*
SELECT *
FROM HumanResources.Employee
WHERE YEAR(BIRTHDATE) BETWEEN 1970 AND 1985
*/

/*
3) Mostrar el la fecha,numero de version 
y subtotal de las ventas efectuadas 
en los años 2005 y 2006. 
tablas: Sales.SalesOrderHeader
campos: OrderDate, AccountNumber, SubTotal*/
/*SELECT OrderDate, AccountNumber, SubTotal
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) BETWEEN 2005 AND 2006
*/


/*
4) Mostrar todos los productos cuyo precio 
de lista  no esté entre 50 y 70.
tablas:Production.Product	
campos: ListPrice*/
/*
SELECT *
FROM Production.Product
WHERE ListPrice NOT BETWEEN 50 AND 70
ORDER BY ListPrice
*/


/*Laboratorio IN 
1) Mostrar los códigos de venta y producto,
cantidad de venta y precio unitario de los artículos 750, 753 y 770. 
tablas: Sales.SalesOrderDetail
campos: SalesOrderID, ProductID, OrderQty, UnitPrice*/

USE AdventureWorks2019
GO
SELECT SalesOrderID,
	   ProductID, 
	   OrderQty, 
	   UnitPrice
FROM Sales.SalesOrderDetail
WHERE ProductID IN (750, 753, 770)
ORDER BY ProductID

/*
2) Mostrar todos los productos cuyo color no sea verde, blanco y azul. 
tablas: Production.Product
campos: Color*/
SELECT Color
FROM Production.Product
WHERE Color NOT IN('GREEN','WHITE','BLUE')

/*Laboratorio NULL
1) Mostrar los representantes de ventas (vendedores) que
no tienen definido el número de territorio.
tablas: Sales.SalesPerson
campos: BusinessEntityID, TerritoryID
*/
SELECT *
FROM Sales.SalesPerson
WHERE TerritoryID IS NULL


/*
2) Mostrar el peso de todos los artículos. si el peso
no estuviese definido, reemplazar por cero.
tablas: Production.Product
campos: Weight*/
SELECT NAME,
		ISNULL(WEIGHT, 0) AS WEIGHT
FROM Production.Product
ORDER BY Product.Weight
