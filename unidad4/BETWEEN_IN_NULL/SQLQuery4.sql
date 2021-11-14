/*4) Mostrar todos los productos cuyo precio
de lista  no esté entre 50 y 70.
tablas:Production.Product	
campos: ListPrice*/

USE AdventureWorks2019
GO

SELECT *
FROM 
	Production.Product
WHERE
	ListPrice NOT BETWEEN 50 AND 70
ORDER BY ListPrice
