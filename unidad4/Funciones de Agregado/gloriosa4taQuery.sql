/*4) Mostrar el promedio vendido por factura.
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, LineTotal*/
USE AdventureWorks2019
GO

DECLARE @Cantidad as INT = 0
SELECT @Cantidad=COUNT(DISTINCT SalesOrderID)
FROM Sales.SalesOrderDetail
SELECT SUM(LINETOTAL)/@Cantidad
FROM Sales.SalesOrderDetail


