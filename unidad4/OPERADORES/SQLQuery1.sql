/*Laboratorio OPERADORES
1) Mostrar los empleados que tienen más de 90 horas de vacaciones. 
tablas: HumanResources.Employee
campos: VacationHours*/
USE AdventureWorks2019
GO
SELECT *
FROM HumanResources.Employee
WHERE VacationHours > 90
