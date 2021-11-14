
/*Laboratorio	TRIGGER
1)Clonar estructura (ProductID, ListPrice) y datos de la tabla Production.Product en una tabla llamada Productos.*/
USE AdventureWorks2019
IF OBJECT_ID(N'dbo.Productos', N'U') IS NOT NULL
	DROP TABLE dbo.Productos
SELECT ProductID,
		ListPrice
INTO dbo.Productos
FROM Production.Product
SELECT * FROM Productos
/*2)Crear un trigger sobre la tabla Productos llamado TR_ActualizaPrecios dónde actualice la tabla  #HistoricoPrecios con  los cambios de precio.
Tablas: Productos 
Campos: ProductID, ListPrice*/

--dropeo/creo mi tabla temporal
DROP TABLE IF EXISTS #HistoricoPrecios 
CREATE TABLE #HistoricoPrecios
(	
	ProductID INT,
	Precio DECIMAL(10,2),
	Fecha DATE DEFAULT GETDATE()
)

--dropeo/creo mi trigger
IF OBJECT_ID(N'dbo.TR_ActualizaPrecios', N'TR') IS NOT NULL
	DROP TRIGGER dbo.TR_ActualizaPrecios;
go
CREATE TRIGGER dbo.TR_ActualizaPrecios ON dbo.Productos
AFTER UPDATE AS
BEGIN
	INSERT INTO #HistoricoPrecios
	SELECT ProductID, ListPrice, GETDATE() FROM inserted
END


--actualizo el precio de algun producto y veo si esa actualizacion se agrego a la tabla temporal
UPDATE dbo.Productos
SET ListPrice = 23.32
WHERE ProductID=777;
SELECT * FROM #HistoricoPrecios WHERE ProductID=777
select * from Productos where ProductID=777
/*3) Adaptar el trigger del punto anterior donde valide que el precio no pueda ser negativo.
*/
INCOMPLETO

IF OBJECT_ID(N'dbo.TR_ActualizaPrecios', N'TR') IS NOT NULL
	DROP TRIGGER dbo.TR_ActualizaPrecios;

CREATE TRIGGER dbo.TR_ActualizaPrecios ON dbo.Productos
AFTER UPDATE AS
BEGIN
	INSERT INTO #HistoricoPrecios
	SELECT ProductID, ListPrice CHECK(ListPrice>0), GETDATE() FROM inserted
END