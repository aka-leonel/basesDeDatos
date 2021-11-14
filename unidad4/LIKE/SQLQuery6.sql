/*6) Mostrar los nombres de los productos que terminen en un número. 
tablas: Production.Product
campos: Name
*/
USE AdventureWorks2019
GO
SELECT *
FROM Production.Product
WHERE Name LIKE '%[0-9]'