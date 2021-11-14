/*Laboratorio NULL

1) Mostrar los representantes de ventas (vendedores)
que no tienen definido el número de territorio.
tablas: Sales.SalesPerson
campos: BusinessEntityID, TerritoryID*/
USE AdventureWorks2019
GO
SELECT BusinessEntityID,
	   TerritoryID
FROM Sales.SalesPerson
WHERE TerritoryID IS NULL
