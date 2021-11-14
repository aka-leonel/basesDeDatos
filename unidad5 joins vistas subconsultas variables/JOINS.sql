/*Laboratorio JOINS

1) Mostrar  los empleados que también son vendedores 
tablas: HumanResources.Employee, Sales.SalesPerson
campos: BusinessEntityID*/
USE AdventureWorks2019
GO
SELECT *
FROM Sales.SalesPerson SP
INNER JOIN HumanResources.Employee HE
ON SP.BusinessEntityID = HE.BusinessEntityID



/*2) Mostrar  los empleados ordenados alfabéticamente por apellido y por nombre
tablas: HumanResources.Employee, Person.Person
campos: BusinessEntityID, LastName, FirstName*/
SELECT A.BusinessEntityID, B.LastName, B.FirstName
FROM HumanResources.Employee A
INNER JOIN Person.Person B
ON A.BusinessEntityID = B.BusinessEntityID
ORDER BY LastName, FirstName



/*3)Mostrar el código de logueo, número de territorio y sueldo básico de los vendedores
tablas: HumanResources.Employee, Sales.SalesPerson
campos: LoginID, TerritoryID, Bonus, BusinessEntityID*/

SELECT A.LoginID, B.TerritoryID, B.Bonus, B.BusinessEntityID
FROM HumanResources.Employee A
RIGHT JOIN Sales.SalesPerson B
ON A.BusinessEntityID = B.BusinessEntityID;



/*4)Mostrar los productos que sean ruedas
tablas: Production.Product, Production.ProductSubcategory
campos: Name, ProductSubcategoryID*/
SELECT A.Name, A.ProductSubcategoryID
FROM Production.Product A
INNER JOIN Production.ProductSubcategory B
ON A.ProductSubcategoryID = B.ProductSubcategoryID
WHERE B.Name LIKE '%WHEELS%'


/*5)Mostrar los nombres de los productos que no son bicicletas
tablas:Production.Product, Production.ProductSubcategory
campos: Name, ProductSubcategoryID*/

USE AdventureWorks2019
GO

SELECT 
	  a.Name, 
	  b.ProductSubcategoryID
FROM
	  Production.Product a LEFT JOIN Production.ProductSubcategory b
	  ON a.ProductSubcategoryID=b.ProductSubcategoryID
WHERE
      a.ProductSubcategoryID >3 OR a.ProductSubcategoryID IS NULL
ORDER BY
	  ProductSubcategoryID,Name

--REVISAAAAAR
USE AdventureWorks2019
SELECT A.Name AS NombreProducto,
		B.Name AS Subcategoria
FROM Production.Product A
LEFT JOIN Production.ProductSubcategory B
ON A.ProductSubcategoryID = B.ProductSubcategoryID
--WHERE B.ProductSubcategoryID IN (1,3)
WHERE B.Name NOT LIKE'%BIKE'

SELECT ProductSubcategoryID, * FROM Production.Product WHERE ProductSubcategoryID NOT IN (1,3)
SELECT * FROM Production.ProductSubcategory
WHERE NAME  LIKE '%BIKE%'
SELECT * FROM Production.Product
WHERE ProductSubcategoryID IN (1,3)

SELECT PS.Name, PS.ProductSubcategoryID
FROM Production.Product PP
LEFT JOIN Production.ProductSubcategory PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
WHERE PS.Name LIKE '%BIKE%'--99ROWS
ORDER BY 1


/*6)Mostrar los precios de venta de aquellos productos donde el precio de venta sea inferior al precio de lista recomendado para ese producto ordenados por nombre de producto
tablas: Sales.SalesOrderDetail, Production.Product
campos: ProductID, Name, ListPrice, UnitPrice*/

SELECT A.ProductID, B.Name, B.ListPrice, A.UnitPrice 
FROM Sales.SalesOrderDetail A
LEFT JOIN Production.Product B
ON A.ProductID = B.ProductID
WHERE A.UnitPrice < B.ListPrice
ORDER BY
	  b.Name


/*7)Mostrar el nombre de los productos y de los proveedores cuya subcategoría es 13 ordenados por nombre de proveedor
tablas: Production.Product, Purchasing.ProductVendor, Purchasing.Vendor
campos: Name ,ProductID,  BusinessEntityID, ProductSubcategoryID*/
SELECT A.ProductID,
		A.NAME AS Producto,
		C.Name AS Proveedor,
		A.ProductSubcategoryID
FROM Production.Product A
LEFT JOIN Purchasing.ProductVendor B
ON A.ProductID = B.ProductID
INNER JOIN Purchasing.Vendor C
ON B.BusinessEntityID = C.BusinessEntityID
WHERE A.ProductSubcategoryID = 13



/*8)Mostrar todas las personas (nombre y apellido) y en el caso que sean empleados mostrar también el login id, sino mostrar null
tablas: Person.Person, HumanResources.Employee
campos: FirstName, LastName, LoginID, BusinessEntityID
*/
SELECT P.FirstName, P.LastName, P.BusinessEntityID, E.LoginID
FROM Person.Person P
LEFT JOIN HumanResources.Employee E
ON P.BusinessEntityID = E.BusinessEntityID



/*
Laboratorio Tablas Temporales

1)Clonar estructura y datos de los campos nombre, color y precio de lista de la
tabla production.product en una tabla llamada #Productos
tablas:Production.Product
campos: Name, ListPrice, Color*/

DROP TABLE IF EXISTS #Productos
SELECT Name, ListPrice, Color
INTO #Productos
FROM Production.Product
SELECT * FROM #Productos

/*2)Clonar solo estructura de los campos identificador, nombre y apellido de la tabla person.person en una tabla llamada #Personas
tablas: Person.Person
campos: BusinessEntityID, FirstName, LastName*/
--revisar clausula where
--u otra forma de clonar SOLO estructura

DROP TABLE IF EXISTS #PERSONAS
SELECT BusinessEntityID,
		FirstName,
		LastName
INTO #PERSONAS
FROM Person.Person
WHERE 1=2
SELECT * FROM #PERSONAS
--TRUNCATE TABLE #PERSONAS



/*3)Eliminar si existe la tabla Productos
tablas: Productos
*/
DROP TABLE IF EXISTS #Productos