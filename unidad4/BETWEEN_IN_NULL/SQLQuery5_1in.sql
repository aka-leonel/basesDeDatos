/*Laboratorio IN 
1) Mostrar los códigos de venta y producto,
cantidad de venta y precio unitario de los artículos 750, 753 y 770. 
tablas: Sales.SalesOrderDetail
campos: SalesOrderID, ProductID, OrderQty, UnitPrice
*/
USE AdventureWorks2019
GO
SELECT SalesOrderID,
	   ProductID, 
	   OrderQty, 
	   UnitPrice
FROM 
	Sales.SalesOrderDetail
WHERE
	ProductID IN (750,753,770)
ORDER BY ProductID
