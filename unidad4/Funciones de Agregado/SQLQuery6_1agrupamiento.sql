/*AGRUPAMIENTO
1) Mostrar el c�digo de subcategor�a y el precio del
producto m�s barato de cada una de ellas 
Tablas: Production.Product
Campos: ProductSubcategoryID, ListPrice*/
USE AdventureWorks2019
GO
SELECT DISTINCT ProductSubcategoryID, ListPrice 
FROM Production.Product PP 
WHERE ListPrice=( SELECT MIN(ListPrice) ListPrice FROM Production.Product PP1 
WHERE PP.ProductSubcategoryID=PP1.ProductSubcategoryID ) 
ORDER BY ProductSubcategoryID
/*
SELECT ProductSubcategoryID, min(ListPrice) 
FROM Production.Product PP 
WHERE ProductSubcategoryID IS NOT NULL 
GROUP BY ProductSubcategoryID 
ORDER BY ProductSubcategoryID*/