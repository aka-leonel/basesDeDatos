/*2) Mostrar todos los empleados que nacieron entre 1970 y 1985. 
tablas: HumanResources.Employee
campos: BirthDate*/

USE AdventureWorks2019
GO
SELECT * 
FROM
	HumanResources.Employee
WHERE
	YEAR(BirthDate) BETWEEN 1970 AND 1985
ORDER BY 
	BirthDate;
/*USE AdventureWorks2019
GO
SELECT *
FROM HumanResources.Employee
WHERE BirthDate >'1969-12-31' AND BirthDate < '1986-01-01'*/