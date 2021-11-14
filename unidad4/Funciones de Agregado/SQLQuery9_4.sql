/*4) Mostrar el promedio vendido por factura. 
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, LineTotal*/
USE AdventureWorks2019
GO
SELECT SalesOrderID, AVG(LINETOTAL) AS PROMEDIOVENTAS
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID

/*
para castear
DECLARE @numero DECIMAL(12,5) = 123456.12345
--SELECT @numero = ROUND(@numero,2)

SELECT CAST(@numero AS DECIMAL(12,1))
SELECT @numero

*/