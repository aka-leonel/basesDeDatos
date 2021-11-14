/*3) Mostrar precio y nombre de los productos 776, 777, 778.
tablas:Production.Product
campos: ProductID, Name, ListPrice*/
USE AdventureWorks2019
GO
SELECT *
FROM Production.Product
WHERE ProductID >= 776 AND ProductID <= 778
--ProductID BETWEEN 776 AND 778