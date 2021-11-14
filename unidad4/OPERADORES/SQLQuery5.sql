/*5) Mostrar todos los productos cuyo precio sea inferior
a 150$ de color rojo o cuyo precio sea mayor a 500$ de color negro.
tablas:Production.Product
campos: ListPrice, Color
*/
USE AdventureWorks2019
GO
SELECT *
FROM Production.Product
WHERE ListPrice < 150 AND COLOR = 'RED' OR ListPrice>500 AND COLOR = 'BLACK'