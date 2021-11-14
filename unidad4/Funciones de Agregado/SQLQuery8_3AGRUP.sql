/*3)Mostrar los productos y el  total vendido 
de cada uno de ellos, ordenarlos por el total vendido
Tablas: Sales.SalesOrderDetail
Campos: ProductID, LineTotal*/
USE AdventureWorks2019
GO
SELECT ProductID, SUM(LineTotal) AS TOTALVENDIDO
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TOTALVENDIDO
