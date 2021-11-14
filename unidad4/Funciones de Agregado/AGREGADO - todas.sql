/*Laboratorio Funciones de Agregado
1) Mostrar la fecha m�s reciente de venta 
Tablas: Sales.SalesOrderHeader
Campos: OrderDate*/

USE AdventureWorks2019
GO
SELECT MIN(OrderDate)
FROM Sales.SalesOrderHeader




/*2) Mostrar el precio m�s barato de todas las bicicletas 
Tablas: Production.Product
Campos: ListPrice, Name*/
--EN REALIDAD MUESTRA TODO PRODUCTO CON PALABRA BIKE  COMO 'BIKE LIGHTS'
SELECT MIN(ListPrice) AS PrecioMinimo
FROM Production.Product
WHERE NAME LIKE '%BIKE%'


/*3) Mostrar la fecha de nacimiento del empleado m�s joven 
Tablas: HumanResources.Employee
Campos: BirthDate*/

SELECT MAX(BirthDate) AS FechaDeNacMasJoven
FROM HumanResources.Employee



/*4) Mostrar el promedio del listado de precios de productos
Tablas: Production.Product
Campos: ListPrice*/

SELECT CAST( AVG(ListPrice) AS DECIMAL(10,2)) AS PrecioPrOmedio
FROM Production.Product



/*5) Mostrar la cantidad y el total vendido por productos 
Tablas: Sales.SalesOrderDetail
Campos: LineTotal, OrderQty*/

SELECT ProductID, SUM(OrderQty) AS TotalVendido
FROM Sales.SalesOrderDetail
GROUP BY ProductID


/*AGRUPAMIENTO
1) Mostrar el c�digo de subcategor�a y el precio del producto m�s barato de cada una de ellas 
Tablas: Production.Product
Campos: ProductSubcategoryID, ListPrice*/

SELECT ProductSubcategoryID, MIN(ListPrice) AS PrecioMinimoDeCategoria
FROM Production.Product
GROUP BY ProductSubcategoryID


/*2) Mostrar los productos y la cantidad total vendida de cada uno de ellos
Tablas: Sales.SalesOrderDetail
Campos: ProductID, OrderQty*/
SELECT ProductID, SUM(OrderQty) AS UnidadesVendidasEnTotal
FROM Sales.SalesOrderDetail
GROUP BY ProductID





/*3)Mostrar los productos y el  total vendido de cada uno de ellos,
ordenarlos por el total vendido
Tablas: Sales.SalesOrderDetail
Campos: ProductID, LineTotal*/
SELECT ProductID, CAST(SUM(LineTotal) AS DECIMAL(10,2)) AS TotalVendido
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY 2





/*4) Mostrar el promedio vendido por factura. 
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, LineTotal*/
 SELECT SalesOrderID, SUM(LineTotal) AS TotalFactura
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID




SELECT SalesOrderID, AVG(LineTotal) AS PromedioDeCadaLinea
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID

SELECT * FROM Sales.SalesOrderDetail--121K
--SELECT * FROM Sales.SalesOrderDetail
SELECT SalesOrderID FROM Sales.SalesOrderDetail--121K
SELECT DISTINCT SalesOrderID FROM Sales.SalesOrderDetail--31K
/*HAVING
1) Mostrar todas las facturas realizadas y el total facturado de cada una de ellas ordenado por n�mero de factura pero s�lo de aquellas �rdenes superen un total de $10.000 
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, LineTotal

2) Mostrar la cantidad de facturas que vendieron m�s de 20 unidades 
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, OrderQty

3) Mostrar las subcategor�as de los productos que tienen dos o m�s productos que cuestan menos de $150 
Tablas: Production.Product
Campos: ProductSubcategoryID, ListPrice

4) Mostrar todos los c�digos de categor�as existentes junto con la cantidad de productos y el precio de lista promedio por cada uno de aquellos productos que cuestan m�s de $ 70 y el precio promedio es mayor a $ 300.
Tablas: Production.Product
Campos: ProductSubcategoryID, ListPrice*/