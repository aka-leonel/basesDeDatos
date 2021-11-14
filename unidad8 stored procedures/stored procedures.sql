/*LABORATORIO PROCEDIMIENTOS ALMACENADOS 
1)Crear un procedimiento almacenado en el esquema HumanResources que dada una determinada inicial,devuelva codigo, nombre, apellido y dirección de correo de los empleados cuyo nombre coincida con la inicial ingresada
Vistas: HumanResources.vEmployee
Campos: BusinessEntityID, FirstName, LastName, EmailAddress*/

USE AdventureWorks2019

if object_id ('dbo.inicial_empleado', 'p') is not null
	drop procedure dbo.inicial_empleado
go

create or alter procedure dbo.inicial_empleado
@inicial varchar(1)
as
begin
	set nocount on
	select BusinessEntityID, FirstName, LastName, EmailAddress
		from HumanResources.vEmployee
		where FirstName like @inicial+'%'
end
go
exec dbo.inicial_empleado 'j'


/*
2)Crear un procedimiento almacenado llamado ProductoVendido que permita ingresar un producto como parámetro,  si el producto ha sido vendido imprimir el mensaje “El PRODUCTO HA SIDO VENDIDO” de lo contrario imprimir “El PRODUCTO NO HA SIDO VENDIDO” 
Tablas: Sales.SalesOrderDetail
Campos: ProductID*/
IF OBJECT_ID(N'dbo.ProductoVendido', 'P') IS NOT NULL DROP PROCEDURE dbo.ProductoVendido
go
CREATE PROCEDURE ProductoVendido @productoV varchar(10)
AS
BEGIN
	IF NOT EXISTS(
			SELECT ProductID
			FROM Sales.SalesOrderDetail
			WHERE ProductID = @productoV)
			PRINT 'EL PRODUCTO NO EXISTE'
	ELSE PRINT 'EL PRODUCTO EXISTE'
END
GO

exec dbo.ProductoVendido '712'

/*
3)Crear un procedimiento almacenado en el esquema dbo llamado ActualizaPrecio
recibiendo como parámetros el producto y el precio 
Tablas: Production.Product
Campos: ProductID, Name, ListPrice*/
IF OBJECT_ID('dbo.ActualizaPrecio', 'P') IS NOT NULL DROP PROCEDURE dbo.ActualizaPrecio
GO
CREATE PROCEDURE ActualizaPrecio @name varchar(30), @precioRecibido money
AS
BEGIN
	UPDATE Production.Product
	SET ListPrice = @precioRecibido
	WHERE  NAME LIKE '%'+@name+'%' --LIKE '%BIKE%'
END
EXEC ActualizaPrecio 'justable', 10

SELECT * FROM Production.Product


/*4)Crear un procedimiento almacenado llamado ProveedorProducto  que devuelva los proveedores que proporcionan el producto especificado por parámetro. 
Tablas: Purchasing.Vendor, Purchasing.ProductVendor, Production.Product
Campos: Name*/
--si existe, dropeo
IF OBJECT_ID('dbo.ProveedorProducto', 'P') IS NOT NULL DROP PROCEDURE dbo.ProveedorProducto
GO
--creo procedimientos
CREATE PROCEDURE dbo.ProveedorProducto @nombre VARCHAR(50)
AS
BEGIN	
	SELECT PP.NAME, PV.Name, PPV.ProductID, PV.BusinessEntityID
	FROM Production.Product PP
	INNER JOIN Purchasing.ProductVendor PPV
	ON PP.ProductID = PPV.ProductID
	JOIN Purchasing.Vendor PV
	ON PPV.BusinessEntityID = PV.BusinessEntityID
	WHERE PV.NAME LIKE ('%'+@nombre+'%')
END
--ejecuto: mostrame los productos del proveedor @nombre
EXEC dbo.ProveedorProducto 'aLLEN'

/*5)Crear un procedimiento almacenado  llamado EmpleadoSector que devuelva nombre, apellido y sector del empleado que le pasemos como argumento.
No es necesario apellido exacto al procedimiento.
Vistas: HumanResources.vEmployeeDepartmentHistory
Campos: FirstName, LastName, Department*/
IF OBJECT_ID('dbo.EmpleadoSector', N'P') IS NOT NULL
DROP PROCEDURE dbo.EmpleadoSector
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

/*-------FUNCIONES  ESCALARES--------------
1)Crear una función que devuelva el promedio de los productos.
Tablas: Production.Product
Campos: ListPrice*/
IF OBJECT_ID('dbo.devolverPromedio', N'F') IS NOT NULL
DROP FUNCTION dbo.devolverPromedio;

CREATE FUNCTION dbo.devolverPromedio()
RETURNS FLOAT
AS
BEGIN
	DECLARE @RET FLOAT;
	SELECT @RET=AVG(ListPrice)
	FROM Production.Product
	RETURN @RET;
END
GO

SELECT dbo.devolverPromedio();

/*2)Crear una función que dado un código de producto devuelva el total de ventas para dicho producto luego,mediante una  consulta, traer código y total de ventas.
Tablas: Sales.SalesOrderDetail
Campos: ProductID, LineTotal*/

DROP FUNCTION IF EXISTS dbo.contarVentasProducto
go
CREATE FUNCTION dbo.contarVentasProducto (@codigoRecibido INT)
RETURNS INT
AS
BEGIN
	DECLARE @ret INT
	SELECT @ret= SUM(OrderQty)
	FROM Sales.SalesOrderDetail SD
	WHERE SD.ProductID = @codigoRecibido
	RETURN @ret
END


DECLARE @idProductoBuscado INT;
set @idProductoBuscado = 707;
SELECT @idProductoBuscado AS ProductID,  dbo.contarVentasProducto(@idProductoBuscado) AS UnidadesVendidas

--PARA CHEQUEAR
SELECT ProductID, SUM(OrderQty)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY ProductID ASC
/*3) Crear una función que dado un código devuelva la cantidad de productos vendidos o cero si no se ha vendido.
Tablas: Sales.SalesOrderDetail
Campos: ProductID, OrderQty*/
DROP FUNCTION IF EXISTS dbo.c





/*
4)Crear una función que devuelva el promedio de venta luego obtner los productos cuyo precio sea inferior al promedio.
Tablas: Sales.SalesOrderDetail, Production.Product
Campos: ProductID, ListPrice

-----------------------------------------------------------------------------------------
--	FUNCIONES DE TABLA EN LÍNEA
-- --------------------------------------------------------------------------------------
5) Crear una función que dado un año, devuelva nombre y  apellido de los empleados que ingresaron ese año 
Tablas: Person.Person, HumanResources.Employee
Campos: FirstName, LastName,HireDate, BusinessEntityID

6) Crear una función que reciba un parámetro correspondiente a un precio y nos retorna una tabla con  código,nombre, color y precio de todos los productos cuyo precio sea inferior al parámetro  ingresado
Tablas: Production.Product
Campos: ProductID, Name, Color, ListPrice
------------------------------------------------------------------
--	FUNCIONES DE MULTI SENTENCIA 
-- ---------------------------------------------------------------
7)Realizar el mismo pedido que en el punto anterior pero utilizando este  tipo de función
Tablas: Production.Product
Campos: ProductID, Name, Color, ListPrice*/