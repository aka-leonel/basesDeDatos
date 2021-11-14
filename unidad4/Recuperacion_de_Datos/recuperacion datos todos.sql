/*Laboratorio DISTINCT, UNION, CASE

    1) Mostrar los diferentes productos vendidos
Tablas: Sales.SalesOrderDetail
Campos: ProductID*/
USE AdventureWorks2019
GO
SELECT DISTINCT ProductID
FROM Sales.SalesOrderDetail


/*UNION 
    2) Mostrar todos los productos vendidos y ordenados
Tablas: Sales.SalesOrderDetail, Production.WorkOrder
Campos: ProductID*/
USE AdventureWorks2019 
GO
SELECT ProductID
FROM Sales.SalesOrderDetail
UNION
SELECT ProductID
FROM Production.WorkOrder
ORDER BY 1

--las sentecnia UNION ALL traeria valores repetidos
--se usó UNION a secas


/*3) Mostrar los diferentes productos vendidos y ordenados
Tablas: Sales.SalesOrderDetail, Production.WorkOrder
Campos: ProductID*/

SELECT	ProductId
FROM Sales.SalesOrderDetail
UNION 
SELECT 	ProductId
FROM Production.WorkOrder
ORDER BY ProductID



/* CASE 
    4) Obtener el id y una columna denominada sexo cuyo valores disponibles sean “Masculino” y ”Femenino”
Tablas: HumanResources.Employee
Campos: BusinessEntityID, Gender*/

SELECT BusinessEntityID,
		Sexo = CASE Gender
					WHEN 'F' THEN 'Femenino'
					WHEN 'M' THEN 'Masculino'
				END
FROM HumanResources.Employee

/*5) Mostrar el id de los empleados si tiene salario deberá mostrarse descendente de lo contrario ascendente
Tablas:HumanResources.Employee
Campos: BusinessEntityID, SalariedFlag	*/


SELECT 
	BusinessEntityID,
	SalariedFlag,
	CASE SalariedFlag WHEN 0 then 'sin salario'
	                  WHEN 1 then 'con salario'
	END
FROM
	HumanResources.Employee

ORDER BY  
    CASE  SalariedFlag WHEN 0 then BusinessEntityID END ASC,
	CASE  SalariedFlag WHEN 1 then BusinessEntityID END DESC 	