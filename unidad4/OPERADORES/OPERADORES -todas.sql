/*Laboratorio OPERADORES
1) Mostrar los empleados que tienen más de 90 horas de vacaciones. 
tablas: HumanResources.Employee
campos: VacationHours*/

USE AdventureWorks2019
GO
SELECT *
FROM HumanResources.Employee
WHERE VacationHours >90



/*2) Mostrar el nombre, precio 
y precio con iva de los productos con precio distinto de cero.
tablas:Production.Product
campos: Name, ListPrice*/
SELECT Name, ListPrice, CAST(ListPrice*1.21 AS DECIMAL(10,2) ) AS PrecioConIVA
FROM Production.Product
WHERE ListPrice !=0
ORDER BY ListPrice




/*3) Mostrar precio y nombre de los productos 776, 777, 778.
tablas:Production.Product
campos: ProductID, Name, ListPrice*/
SELECT ProductID, Name, ListPrice
FROM Production.Product
WHERE ProductID >= 776 AND ProductID <=778



/*4) Mostrar el nombre concatenado con el apellido
de las personas cuyo apellido sea johnson.
tablas:Person.Person
campos: FirstName, LastName*/

SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Person.Person
WHERE LastName LIKE 'JOHNSON'


/*5) Mostrar todos los productos 
cuyo precio sea inferior a 150$ de color rojo
o 
cuyo precio sea mayor a 500$ de color negro.
tablas:Production.Product
campos: ListPrice, Color*/
SELECT Name, ListPrice, Color
FROM Production.Product
WHERE ListPrice < 125 AND Color = 'RED' OR ListPrice > 500 AND COLOR = 'BLACK'

/*6) Mostrar el código, 
fecha de ingreso 
y horas de vacaciones de los empleados ingresaron a partir del año 2000. 
tablas: HumanResources.Employee
campos: BusinessEntityID, HireDate, VacationHours*/
SELECT BusinessEntityID, HireDate, VacationHours
FROM HumanResources.Employee
WHERE YEAR(HireDate) >= 2000
ORDER BY HireDate


/*7) Mostrar el nombre, 
número de producto, 
precio de lista 
y el precio de lista incrementado en un 10% 
de los productos cuya fecha de fin de venta sea anterior al día de hoy.
tablas:Production.Product
campos: Name, ProductNumber, ListPrice, SellStartDate
campos: Weight*/
SELECT Name,
		ProductNumber,
		ListPrice,
		 ListPrice*1.1 AS PrecioConAumento,
		 SellEndDate
FROM Production.Product
WHERE YEAR(SellEndDate) < GETDATE()
ORDER BY SellEndDate


SELECT Name,
		ProductNumber,
		ListPrice,
		 CAST((ListPrice*1.1) AS decimal(12,2)) AS PrecioConAumento,
		 SellEndDate
FROM Production.Product
WHERE YEAR(SellEndDate) < GETDATE()
ORDER BY SellEndDate

USE AdventureWorks2019 
GO 
SELECT NAME, 
		ProductNumber, 
		ListPrice,
		SellEndDate,
		ListPrice,
		CASE 
			WHEN (SellEndDate<GETDATE()) THEN (ListPrice*1.10)
			WHEN (SellEndDate IS NULL) THEN NULL 
			ELSE ListPrice 
			END PrecioIncrementado
FROM Production.Product
WHERE YEAR(SellEndDate) < GETDATE()