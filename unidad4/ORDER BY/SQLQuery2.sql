/*2)  Mostrar cinco productos más caros y su nombre ordenado en forma alfabética
Tablas:Production.Product
Campos: Name, ListPrice 
*/
USE AdventureWorks2019
GO
SELECT TOP 5 ListPrice, Name
FROM Production.Product
ORDER BY ListPrice DESC, NAME