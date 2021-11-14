/*4) Mostrar el promedio del listado de precios de productos
Tablas: Production.Product
Campos: ListPrice*/
USE AdventureWorks2019
GO
SELECT AVG(LISTPRICE) AS PRECIOPROMEDIO
FROM Production.Product
