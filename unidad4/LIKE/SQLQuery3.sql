/*3) Mostrar las persona
s que su nombre empie
ce con la letra 'y'. 
tablas:Person.Person
campos: FirstName
*/
USE AdventureWorks2019
GO
SELECT *
FROM Person.Person
WHERE FirstName LIKE 'y%'