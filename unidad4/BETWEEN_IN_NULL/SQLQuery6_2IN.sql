/*2) Mostrar todos los productos cuyo 
color no sea verde, blanco y azul. 
tablas: Production.Product
campos: Color
*/
USE AdventureWorks2019
GO
SELECT *
FROM Production.Product
WHERE Color NOT IN ('Green','White','Blue')