/*2) Mostrar el peso de todos los artículos.
si el peso no estuviese definido, reemplazar por cero.
tablas: Production.Product
campos: Weight*/
USE AdventureWorks2019
GO
SELECT Name,
		ISNULL(WEIGHT, 0) AS WEIGHT
FROM Production.Product
ORDER BY Product.Weight