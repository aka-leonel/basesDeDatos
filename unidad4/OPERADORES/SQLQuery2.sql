/*2) Mostrar el nombre, precio y precio con 
iva de los productos con precio distinto de cero.
tablas:Production.Product
campos: Name, ListPrice
*/

USE AdventureWorks2019
GO
SELECT NAME, ListPrice, (ListPrice*1.21) AS 'PrecioConIVA'
FROM Production.Product
WHERE ListPrice != 0

--ESTA VERSION REDONDEA A DOS DECIMALES
/*
SELECT  NAME, 
		ListPrice, 
		CAST( (ListPrice * 1.21) AS decimal(18,2) ) AS 'PrecioConIVA'
FROM Production.Product
WHERE ListPrice != 0
ORDER BY ListPrice
*/