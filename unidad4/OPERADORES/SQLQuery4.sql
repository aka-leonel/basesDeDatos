/*4) Mostrar el nombre concatenado con el apellido 
de las personas cuyo apellido sea johnson.
tablas:Person.Person
campos: FirstName, LastName*/
USE AdventureWorks2019
GO
SELECT  CONCAT(FIRSTNAME,' ',LastName) AS NOMBRECOMPLETO
FROM Person.Person
WHERE LastName = 'JOHNSON'
