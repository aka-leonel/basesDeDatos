/*2)  Mostrar cinco productos m�s caros y su nombre ordenado en forma alfab�tica
Tablas:Production.Product
Campos: Name, ListPrice 
*/
USE AdventureWorks2019
GO
SELECT TOP 5 ListPrice, Name
FROM Production.Product
ORDER BY ListPrice DESC, NAME