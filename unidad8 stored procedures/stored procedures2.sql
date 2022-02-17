/*LABORATORIO PROCEDIMIENTOS ALMACENADOS 
1)Crear un procedimiento almacenado en el esquema HumanResources que dada una determinada inicial,devuelva codigo, nombre, apellido y dirección de correo de los empleados cuyo nombre coincida con la inicial ingresada
Vistas: HumanResources.vEmployee
Campos: BusinessEntityID, FirstName, LastName, EmailAddress*/
USE AdventureWorks2019
GO
DROP PROCEDURE IF EXISTS HumanResources.inicial_empleado
GO

CREATE OR ALTER PROCEDURE HumanResources.inicial_empleado
@inicial char
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM HumanResources.vEmployee
	WHERE FirstName LIKE (@inicial+'%')
END

EXEC HumanResources.inicial_empleado 'S'
SELECT * FROM HumanResources.vEmployee
/*2)Crear un procedimiento almacenado llamado ProductoVendido que permita ingresar un producto como parámetro,  si el producto ha sido vendido imprimir el mensaje “El PRODUCTO HA SIDO VENDIDO” de lo contrario imprimir “El PRODUCTO NO HA SIDO VENDIDO” 
Tablas: Sales.SalesOrderDetail
Campos: ProductID*/

DROP PROCEDURE IF EXISTS Sales.ProductoVendido
GO
 CREATE OR ALTER PROCEDURE Sales.ProductoVendido
@parametroID int
AS
BEGIN
	IF EXISTS(SELECT *
				FROM Sales.SalesOrderDetail
				WHERE ProductID =@parametroID
				)
		PRINT 'El PRODUCTO HA SIDO VENDIDO'
	ELSE PRINT 'El PRODUCTO NO HA SIDO VENDIDO'
END
GO

EXEC Sales.ProductoVendido 780

/*3)Crear un procedimiento almacenado en el esquema dbo llamado ActualizaPrecio  recibiendo como parámetros el producto y el precio 
Tablas: Production.Product
Campos: ProductID, Name, ListPrice*/
DROP PROCEDURE IF EXISTS Production.ActualizaPrecio
GO
CREATE OR ALTER PROCEDURE Production.ActualizaPrecio(@id INT, @precio MONEY)
AS
BEGIN
	SET NOCOUNT ON
	UPDATE Production.Product
	SET ListPrice = @precio
	WHERE ProductID= @id

	IF (@@ROWCOUNT = 0)
	BEGIN
		PRINT 'NO SE HAYO ID'
	END
END

EXEC Production.ActualizaPrecio 780, 234.12
SELECT ListPrice, * FROM Production.Product WHERE ProductID=780;

/*4)Crear un procedimiento almacenado llamado ProveedorProducto  que devuelva los proveedores que proporcionan el producto especificado por parámetro. 
Tablas: Purchasing.Vendor, Purchasing.ProductVendor, Production.Product
Campos: Name*/

DROP PROCEDURE IF EXISTS dbo.ProductoVendido 
GO
CREATE OR ALTER PROCEDURE dbo.ProductoVendido @nombreProducto VARCHAR(50)
AS
BEGIN
	SELECT PP.ProductID,
			PP.Name,
			PV.BusinessEntityID,
			VV.BusinessEntityID
	FROM Production.Product PP
	INNER JOIN Purchasing.ProductVendor PV
	ON PP.ProductID = PV.ProductID
	INNER JOIN Purchasing.Vendor VV
	ON PV.BusinessEntityID = VV.BusinessEntityID
	WHERE PP.Name LIKE '%'+@nombreProducto+'%'
END
GO
EXEC dbo.ProductoVendido 'bike'
/*5)Crear un procedimiento almacenado  llamado EmpleadoSector que devuelva nombre, apellido y sector del empleado que le pasemos como argumento.
No es necesario apellido exacto al procedimiento.
Vistas: HumanResources.vEmployeeDepartmentHistory
Campos: FirstName, LastName, Department*/

DROP PROCEDURE IF EXISTS dbo.EmpleadoSector
GO
CREATE PROCEDURE dbo.EmpleadoSector @nombreRecibido varchar(50)
AS
BEGIN
	SELECT FirstName, LastName, Department
	FROM HumanResources.vEmployeeDepartmentHistory
	WHERE FirstName LIKE ('%'+@nombreRecibido+'%')
END
--ejecuto
EXEC dbo.EmpleadoSector 'JOHN'


/*
------------------------------------------------------
--	FUNCIONES ESCALARES
-- ---------------------------------------------------
1)Crear una función que devuelva el promedio de los productos.
Tablas: Production.Product
Campos: ListPrice*/


CREATE OR ALTER FUNCTION dbo.devolverPromedio()
RETURNS FLOAT
AS
BEGIN
	DECLARE @RETORNO FLOAT;
	SELECT @RETORNO=AVG(ListPrice)
	FROM Production.Product
	RETURN @RETORNO
END

SELECT dbo.devolverPromedio() AS Promedio

/*2)Crear una función que dado un código de producto devuelva el total de ventas para dicho producto luego,mediante una  consulta, traer código y total de ventas.
Tablas: Sales.SalesOrderDetail
Campos: ProductID, LineTotal*/
IF OBJECT_ID('Sales.devolverTotalVentas', N'F') IS NOT NULL
DROP FUNCTION Sales.devolverTotalVentas;
GO

CREATE OR ALTER FUNCTION Sales.devolverTotalVentas (@ProductID INT)
RETURNS FLOAT
AS
BEGIN
	DECLARE @ACUMULADOR FLOAT
	SELECT @ACUMULADOR = SUM(LineTotal)
	FROM  Sales.SalesOrderDetail
	WHERE ProductID = @ProductID
	RETURN ISNULL(@ACUMULADOR,0)
END
GO

SELECT Sales.devolverTotalVentas(2) as TotalVendido$;


/*3) Crear una función que dado un código devuelva la cantidad de productos vendidos o cero si no se ha vendido.
Tablas: Sales.SalesOrderDetail
Campos: ProductID, OrderQty*/
CREATE OR ALTER FUNCTION dbo.cantidadProductosVendidos(@idParametro INT)
RETURNS INT
AS
BEGIN
	DECLARE @ret INT
	SELECT @ret= SUM(OrderQty)
	FROM Sales.SalesOrderDetail
	WHERE ProductID = @idParametro
	RETURN @ret
END

SELECT dbo.cantidadProductosVendidos(712) as Producto

/*
4)Crear una función que devuelva el promedio de venta luego obtner los productos cuyo precio sea inferior al promedio.
Tablas: Sales.SalesOrderDetail, Production.Product
Campos: ProductID, ListPrice*/


--revisar
SELECT *
FROM Production.Product PP
JOIN Sales.SalesOrderDetail SS
ON PP.ProductID = SS.ProductID

SELECT AVG(LISTPRICE) AS PrecioPromedioDeLosProductosConListPriceMenorAlAverageListPrice
FROM Production.Product PP
WHERE ListPrice < (SELECT AVG(ListPrice) FROM Production.Product)
GO

/*FUNCIONES DE TABLA EN LÍNEA
-- --------------------------------------------------------------------------------------
5) Crear una función que dado un año, devuelva nombre y  apellido de los empleados que ingresaron ese año 
Tablas: Person.Person, HumanResources.Employee
Campos: FirstName, LastName,HireDate, BusinessEntityID*/

CREATE OR ALTER FUNCTION dbo.buscarEmpleadoAnio
(@anioIngreso INT)
RETURNS TABLE
AS
RETURN
(
	SELECT PP.BusinessEntityID
	FROM Person.Person PP
	JOIN HumanResources.Employee HR
	ON PP.BusinessEntityID = HR.BusinessEntityID
	WHERE YEAR(HR.HireDate) = @anioIngreso
)
GO
SELECT dbo.buscarEmpleadoAnio(2013)






/*6) Crear una función que reciba un parámetro correspondiente a un precio y nos retorna una tabla con  código,nombre, color y precio de todos los productos cuyo precio sea inferior al parámetro  ingresado
Tablas: Production.Product
Campos: ProductID, Name, Color, ListPrice
------------------------------------------------------------------
--	FUNCIONES DE MULTI SENTENCIA 
-- ---------------------------------------------------------------
7)Realizar el mismo pedido que en el punto anterior pero utilizando este  tipo de función
Tablas: Production.Product
Campos: ProductID, Name, Color, ListPrice*/