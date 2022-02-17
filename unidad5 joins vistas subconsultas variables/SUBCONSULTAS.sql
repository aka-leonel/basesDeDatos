/*Laboratorio SUBCONSULTA
1) Listar todos los productos cuyo precio sea inferior al precio promedio de todos los productos
tablas:Production.Product
campos: Name, ListPrice*/

USE AdventureWorks2019
SELECT Name, 
		ListPrice
FROM Production.Product
WHERE ListPrice < (SELECT AVG(ListPrice) FROM Production.Product)
ORDER BY 2 DESC

/*2) Listar el nombre, precio de lista, precio promedio y diferencia de precios entre cada producto y el valor promedio general
tablas:Production.Product
campos: Name, ListPrice*/
SELECT Name,
		ListPrice,
		(SELECT AVG(ListPrice) FROM Production.Product) AS PrecioPromedio,
		ListPrice -(SELECT AVG(ListPrice) FROM Production.Product) AS DiferenciaPrecio
FROM Production.Product


/*3) Mostrar el o los códigos del producto mas caro
tablas:Production.Product
campos: ProductID,ListPrice*/

SELECT ProductID
FROM Production.Product
WHERE ListPrice = (SELECT MAX(ListPrice) FROM Production.Product)


/*4) Mostrar el producto más barato de cada subcategoría. mostrar subcategoría, código de producto y el precio de lista más barato ordenado por subcategoría
tablas:Production.Product
campos: ProductSubcategoryID, ProductID, ListPrice*/
SELECT ProductID, P1.Name, P1.ProductSubcategoryID, P1.ListPrice
FROM Production.Product P1
WHERE ListPrice = (
					SELECT MIN(ListPrice)
					FROM Production.Product P2
					WHERE P2.ProductSubcategoryID = P1.ProductSubcategoryID
					)
ORDER BY 3




/*Laboratorio SUBCONSULTA con EXISTS – NOT EXISTS
    1) Mostrar los nombres de todos los productos presentes en la subcategoría de ruedas 
tablas:Production.Product, Production.ProductSubcategory
campos: ProductSubcategoryID, Name*/

--MAL:no usé el exists
SELECT PP.Name, PS.ProductSubcategoryID, PS.Name
FROM Production.Product PP
INNER JOIN Production.ProductSubcategory PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
WHERE PS.Name LIKE '%WHEELS%'
--usando exists, dolió pero salió
SELECT ProductID, PP.Name
FROM Production.Product PP
WHERE EXISTS 
		(
		SELECT *
		FROM  Production.ProductSubcategory PS
		WHERE PP.ProductSubcategoryID = PS.ProductSubcategoryID
		AND PS.Name LIKE '%WHEEL%'		
		)

    /*2) Mostrar todos los productos que no fueron vendidos
tablas:Production.Product, Sales.SalesOrderDetail
campos: Name, ProductID*/

SELECT *
FROM Production.Product PP
WHERE NOT EXISTS(
				SELECT *
				FROM Sales.SalesOrderDetail SD
				WHERE PP.ProductID = SD.ProductID
				)
ORDER BY ProductID

--HACEN LO MISMO, LA DE ARRIBA RESPONDE LA CONSIGNA

SELECT *
FROM Production.Product PP
LEFT JOIN Sales.SalesOrderDetail SD
ON PP.ProductID = SD.ProductID
WHERE SD.ProductID IS NULL 
ORDER BY PP.ProductID


/*3) Mostrar la cantidad de personas que no son vendedores 
tablas: Person.Person, Sales.SalesPerson
campos: BusinessEntityID */
--19995 ROWS

SELECT
	COUNT(*) AS 'Cantidad No Vendedores' 
FROM
	Person.Person p
WHERE NOT EXISTS(
				SELECT
					BusinessEntityID
				FROM
					Sales.SalesPerson s
				WHERE
					p.BusinessEntityID=s.BusinessEntityID
			)

SELECT COUNT(*)
FROM Person.Person PP
WHERE NOT EXISTS (
				SELECT *
				FROM Sales.SalesPerson SP
				WHERE SP.BusinessEntityID = PP.BusinessEntityID					
					)

SELECT COUNT(*)
FROM Person.Person PP
LEFT JOIN Sales.SalesPerson SP
ON PP.BusinessEntityID = SP.BusinessEntityID
WHERE SP.BusinessEntityID IS NULL


    /*4) Mostrar todos los vendedores (nombre y apellido) que no tengan asignado un territorio de ventas 
tablas: Person.Person, Sales.SalesPerson
campos: BusinessEntityID, TerritoryID, LastName, FirstName*/
--primer intento
SELECT *
FROM Sales.SalesPerson SP
WHERE EXISTS (
				SELECT *
				FROM Sales.SalesPerson
				WHERE SP.TerritoryID IS NULL
			)
--IDs whith null territoryid 274, 285 & 287

--2do intento: SALIÓ

SELECT BusinessEntityID, LastName, FirstName, 'NULO' AS TerritoryID
FROM Person.Person PP
WHERE EXISTS (
				SELECT *
				FROM Sales.SalesPerson SP
				WHERE SP.TerritoryID IS NULL AND PP.BusinessEntityID=SP.BusinessEntityID
			)

---
SELECT LastName,
	FirstName
FROM Person.Person p
WHERE EXISTS(SELECT BusinessEntityID
			FROM Sales.SalesPerson s
			WHERE p.BusinessEntityID=s.BusinessEntityID AND TerritoryID IS NULL
			)

/*Laboratorio SUBCONSULTA con IN Y NOT IN
    1) Mostrar las órdenes de venta que se hayan facturado en territorio de estado unidos únicamente 'us' 
tablas: Sales.SalesOrderHeader, Sales.SalesTerritory
campos: CountryRegionCode, TerritoryID*/
--SELECT * FROM Sales.SalesOrderHeader --31k rows
--SELECT * FROM Sales.SalesTerritory --10 rows

SELECT *
FROM Sales.SalesOrderHeader
WHERE TerritoryID IN (SELECT
					TerritoryID
					FROM Sales.SalesTerritory
					WHERE CountryRegionCode = 'US')


/*
SELECT *FROM Sales.SalesOrderHeader
WHERE TerritoryID IN (1,2,3,4,5) ORDER BY TerritoryID

SELECT *FROM Sales.SalesOrderHeader
WHERE TerritoryID <6 ORDER BY TerritoryID
SELECT DISTINCT(TerritoryID) FROM Sales.SalesOrderHeader ORDER BY 1*/
/*
    2) Al ejercicio anterior agregar ordenes de Francia e Inglaterra 
tablas: Sales.SalesOrderHeader, Sales.SalesTerritory
campos: CountryRegionCode, TerritoryID*/

SELECT *
FROM Sales.SalesOrderHeader
WHERE TerritoryID IN (SELECT
					TerritoryID
					FROM Sales.SalesTerritory
					WHERE CountryRegionCode IN ('US', 'FR', 'GB'))


/*3) Mostrar los nombres de los diez productos más caros 
tablas:Production.Product
campos: ListPrice*/
--intuitiva
SELECT TOP 10 ListPrice, NAME
FROM Production.Product
ORDER BY 1 DESC
--rebuscada, usando el IN
SELECT ListPrice, NAME
FROM Production.Product
WHERE ProductID IN (
					SELECT TOP 10 ProductID
					FROM Production.Product
					ORDER BY ListPrice DESC
					)

/*4) Mostrar aquellos productos cuya cantidad de pedidos de venta sea igual o superior a 20 
tablas:Production.Product, Sales.SalesOrderDetail
campos: Name, ProductID , OrderQty*/
--una manera
SELECT *
FROM Production.Product
WHERE ProductID IN(
					SELECT ProductID
					FROM Sales.SalesOrderDetail
					GROUP BY ProductID
					HAVING SUM(OrderQty)>=20
					)

--otra
SELECT ProductID, SUM(OrderQty) AS 'SUM U.PEDIDAS', COUNT(OrderQty) AS 'COUNT FILAS'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(OrderQty) >=20



/*Laboratorio INSERT, UPDATE Y DELETE
1) Clonar estructura y datos de los campos id, nombre, color y precio de lista de la tabla production.product en una tabla llamada Produccion 
tablas: Production.Product
campos: Name, Color, ListPrice*/
DROP TABLE IF EXISTS Produccion

SELECT ProductID, Name, Color, ListPrice
	INTO Produccion
FROM Production.Product
SELECT * FROM Produccion

/*
2) Aumentar un 20% el precio de lista de todos los productos  
tablas: Produccion //OR Productos
campos: ListPrice
*/


UPDATE Produccion
SET ListPrice = ListPrice*1.2
SELECT * FROM Produccion

/*
3) Aumentar un 20% el precio de lista de los productos del proveedor 1540 
tablas:Produccion, Purchasing.ProductVendor
campos: ProductID, ListPrice, BusinessEntityID*/

/*antes de la actualizacion veo el precio original de los prods del
proveedor 1540*/
SELECT P.ProductID, P.ListPrice, V.BusinessEntityID
FROM Produccion P
INNER JOIN Purchasing.ProductVendor V
ON P.ProductID = V.ProductID
WHERE V.BusinessEntityID = 1542
ORDER BY P.ListPrice DESC
/*y todos valen cero!
seria inutil aumentarles un 20%, asi que solo para probar
la query le sumaré $23 a cada uno
*/

UPDATE Produccion
SET ListPrice = ListPrice+23
WHERE ProductID IN (
					SELECT V.ProductID
					FROM Purchasing.ProductVendor V
					WHERE V.BusinessEntityID = 1540)
--ejecutar la primer consulta para ver la actualizacion de precio

/*4) Eliminar los productos cuyo precio es igual a cero
tablas: Produccion
campos: ListPrice*/
--hecho un vistazo
SELECT *
FROM Produccion
WHERE ListPrice = 0
--y elimino
DELETE
FROM Produccion
WHERE ListPrice =0;

/*5) Insertar un producto dentro de la tabla productos.
tener en cuenta los siguientes datos. 
el color de producto debe ser rojo, el nombre debe ser "bicicleta mountain bike" 
y el precio de lista debe ser de 4000 pesos.
tablas:productos
campos: Color,Name, ListPrice*/

SELECT * FROM Produccion
--HAY 329 rregistros

--insertare uno NAME,COLOR,LISTPRICE
INSERT INTO Produccion
VALUES('bicicleta mountain bike', 'RED', 4000 )
--HAY 330 rregistros


/*6) Aumentar en un 15% el precio de los pedales de bicicleta
tablas: productos
campos: Name, ListPrice*/
SELECT * FROM Produccion
WHERE NAME LIKE '%PEDAL%'

UPDATE Produccion
SET ListPrice = ListPrice * 1.15
WHERE NAME LIKE '%PEDAL%'

/*7) Eliminar de las productos cuyo nombre empiece con la letra m
tablas: productos
campos: Name*/
--son 83rows
SELECT * FROM Produccion WHERE NAME LIKE 'M%'

DELETE FROM Produccion
WHERE NAME LIKE 'M%'
--eliminados 83 registros


/*8) Borrar todo el contenido de la tabla personas sin utilizar la instrucción delete.
tablas: productos*/

SELECT * FROM Produccion
TRUNCATE TABLE Produccion


/*
9) Eliminar tabla productos
tablas: productos*/

DROP TABLE Produccion

/*Laboratorio Variables
    1) Obtener el total de ventas del año 2014 y guardarlo en una variable llamada @TotalVentas, luego imprimir el resultado.
Tablas: Sales.SalesOrderDetail
Campos: LineTotal*/

DECLARE @TotalVentas NUMERIC(20,4)=0
SET @TotalVentas = (
				SELECT SUM(LineTotal) FROM Sales.SalesOrderDetail
				WHERE YEAR(ModifiedDate) = 2014--37K rows
				)
SELECT @TotalVentas AS TotalVentas

/*2) Obtener el promedio de ventas y guardarlo en una variable llamada  @Promedio 
luego hacer un reporte de todos los productos cuyo precio de venta sea menor al Promedio.
Tablas: Production.Product
Campos: ListPrice, ProductID*/

--declaro variable y asigno valor
DECLARE @Promedio FLOAT
SET @Promedio = (
				SELECT AVG(ListPrice)
				FROM Production.Product
				)
SELECT @Promedio AS PrecioPromedio

--hago una query utilizando la variable
SELECT COUNT(*) AS ProductosConPrecioInferiorAlPromedio
FROM Production.Product
WHERE ListPrice < @Promedio

/*3)Utilizando la variable @Promedio incrementar en un 10% el valor de los productos 
sean inferior al promedio.
Tablas: Production.Product
Campos: ListPrice*/
DECLARE @Promedio2 MONEY
SET @Promedio2 = (
				SELECT AVG(ListPrice)
				FROM Production.Product
				)
UPDATE Production.Product
SET ListPrice = ListPrice * 1.1
WHERE ListPrice<@Promedio2

/*4)Crear un variable de tipo tabla con las categorías y subcategoría de productos 
 y reportar el resultado.
Tablas: Production.ProductSubcategory, Production.ProductCategory
Campos: Name*/
--una query para calentar
SELECT S.ProductSubcategoryID, 
		S.ProductCategoryID,
		S.Name AS Subcategory,
		C.Name AS Category
FROM Production.ProductSubcategory S
JOIN Production.ProductCategory C
ON S.ProductCategoryID = C.ProductCategoryID

--declaro y asigno
--solo pude lograrlo previamente declarando campo y tipo en la variable tipo tabla
--hubiera preferido que se clonaran solas las columnas
DECLARE @MiVariableTabla TABLE(ProductSubcategoryID INT,
								ProductCategoryID INT,
								SubcategoryName VARCHAR(50),
								Category VARCHAR(50)
								)

INSERT INTO @MiVariableTabla 
			SELECT S.ProductSubcategoryID,
					C.ProductCategoryID,
					S.Name,
					C.Name
			FROM Production.ProductSubcategory S
			JOIN Production.ProductCategory C
			ON S.ProductCategoryID = C.ProductCategoryID

SELECT * FROM @MiVariableTabla

/*5)Analizar el promedio de la lista de precios de productos, si su valor es menor 500 
imprimir el mensaje el PROMEDIO BAJO de lo contrario imprimir el mensaje PROMEDIO ALTO
*/
DECLARE @PrecioPromedio FLOAT =(SELECT AVG(ListPrice) 
								FROM Production.Product)
IF @PrecioPromedio < 500 
BEGIN
	PRINT 'PROMEDIO BAJO'
END	ELSE
	BEGIN PRINT 'PROMEDIO ALTO'
END
