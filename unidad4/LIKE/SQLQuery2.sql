/*2) Mostrar los nombre de los productos que tengan
cualquier combinaci�n de 'mountain bike'.
tablas: Production.Product
campos: Name
*/
USE AdventureWorks2019
GO
SELECT NAME
FROM Production.Product
WHERE Product.NAME LIKE '%mountain bike%'