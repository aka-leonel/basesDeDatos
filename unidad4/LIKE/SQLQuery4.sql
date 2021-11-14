/*4) Mostrar las personas que la 
segunda letra de su apellido es una s. 
tablas:Person.Person
campos: LastName
*/
USE AdventureWorks2019
GO
SELECT LASTNAME
FROM Person.Person
WHERE LastName LIKE '_S%'