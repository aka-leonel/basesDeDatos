/*5) Mostrar la cantidad y el total vendido por productos 
Tablas: Sales.SalesOrderDetail
Campos: LineTotal, OrderQty*/

USE AdventureWorks2019
GO
SELECT SalesOrderID,
		SUM(ORDERQTY) as 'SUMA_OORDERQTY', 
		SUM(LINETOTAL)  as 'SUMA_LINETOTAL'			
FROM SALES.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY SalesOrderID
