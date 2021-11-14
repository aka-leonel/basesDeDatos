/*2) Mostrar la cantidad de facturas que vendieron más de 20 unidades 
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, OrderQty*/

USE AdventureWorks2019
GO
DECLARE @CantidadRegistros INT=0
SELECT SalesOrderID, SUM(OrderQty) AS Cantidad
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(OrderQty)>20
ORDER BY 2
SELECT @CantidadRegistros = @@ROWCOUNT
SELECT @CantidadRegistros AS CantidadRegs
--31465 rows


--SELECT count(SalesOrderID) FROM SALES.SalesOrderDetail