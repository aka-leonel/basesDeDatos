/*5) Mostrar el nombre concatenado con el apellido 
de las personas cuyo apellido tengan terminaci�n espa�ola (ez).
tablas: Person.Person
campos: FirstName,LastName
*/
USE AdventureWorks2019
GO
SELECT CONCAT(FirstName, ' ', LastName) AS FULLNAME
FROM Person.Person
WHERE LastName LIKE '%EZ'
