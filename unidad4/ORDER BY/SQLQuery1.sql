/*Laboratorio ORDER BY
1) Mostrar las personas ordenadas primero por su apellido y luego por su nombre
Tablas:Person.Person
Campos: Firstname, Lastname 
*/

USE AdventureWorks2019
GO
SELECT LastName,
		FirstName
FROM Person.Person
ORDER BY LastName, FirstName
