/*Laboratorio BETWEEN

1) Mostrar todos los productos cuyo precio de lista esté entre 200 y 300. 
tablas:Production.Product	
campos: ListPrice*/
USE AdventureWorks2019
GO
SELECT *
FROM Production.Product
WHERE ListPrice BETWEEN 200 AND 300