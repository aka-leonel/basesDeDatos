/*1) Mostrar la fecha más reciente de venta 
Tablas: Sales.SalesOrderHeader
Campos: OrderDate
*/
USE AdventureWorks2019
SELECT MAX(OrderDate) FROM SALES.SalesOrderHeader

--ALTERNATIVA
SELECT TOP 1 ORDERDATE FROM
SALES.SalesOrderHeader ORDER BY OrderDate DESC

