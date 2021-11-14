/*3) Mostrar la fecha de nacimiento del empleado más joven 
Tablas: HumanResources.Employee
Campos: BirthDate*/
USE AdventureWorks2019
GO
SELECT MAX(BIRTHDATE)
FROM HumanResources.Employee
