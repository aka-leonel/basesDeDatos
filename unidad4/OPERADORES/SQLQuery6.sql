/*6) Mostrar el c�digo, fecha de ingreso y horas 
de vacaciones de los empleados ingresaron a partir del a�o 2000. 
tablas: HumanResources.Employee
campos: BusinessEntityID, HireDate, VacationHours
*/

USE AdventureWorks2019
GO
SELECT BusinessEntityID, HireDate, VacationHours
FROM HumanResources.Employee
WHERE YEAR(HireDate) > 1999
ORDER BY HireDate
