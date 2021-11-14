/*UNION 
    2) Mostrar todos los productos vendidos y ordenados
Tablas: Sales.SalesOrderDetail, Production.WorkOrder
Campos: ProductID*/
--INCOMPLETO

USE AdventureWorks2019 
GO
SELECT	ProductId
FROM Sales.SalesOrderDetail
UNION ALL
SELECT 	ProductId
FROM Production.WorkOrder

/*
SELECT ProductID
FROM Production.WorkOrder*/
