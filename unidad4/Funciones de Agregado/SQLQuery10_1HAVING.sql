/*HAVING
1) Mostrar todas las facturas realizadas y el total
facturado de cada una de ellas ordenado por número 
de factura pero sólo de aquellas órdenes superen un total de $10.000 
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, LineTotal*/
USE AdventureWorks2019
GO
SELECT SalesOrderID, SUM(LINETOTAL) AS TOTALFACTURADO
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal)>10000
ORDER BY SalesOrderID

/*DECLARE @numero DECIMAL(12,5) = 123456.12345
--SELECT @numero = ROUND(@numero,2)

SELECT CAST(@numero AS DECIMAL(12,1))
SELECT @numero
*/