/*6) Mostrar el código, fecha de ingreso y horas 
de vacaciones de los empleados ingresaron a partir del año 2000. 
tablas: HumanResources.Employee
campos: BusinessEntityID, HireDate, VacationHours
*/

USE AdventureWorks2019
GO
SELECT BusinessEntityID, HireDate, VacationHours
FROM HumanResources.Employee
WHERE YEAR(HireDate) > 1999
ORDER BY HireDate
