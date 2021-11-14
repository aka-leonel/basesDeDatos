/*Laboratorio	TRIGGER
1)Clonar estructura (ProductID, ListPrice) y datos de la tabla Production.Product en una tabla llamada Productos.*/

USE AdventureWorks2019
GO
IF OBJECT_ID(N'Productos', N'U') IS NOT NULL
	DROP TABLE dbo.Productos
	
SELECT ProductID,
		ListPrice
INTO dbo.Productos
FROM Production.Product



/*2)Crear un trigger sobre la tabla Productos llamado TR_ActualizaPrecios dónde actualice la tabla  #HistoricoPrecios con  los cambios de precio.
Tablas: Productos 
Campos: ProductID, ListPrice*/

IF OBJECT_ID(N'#HistoricoPrecios', N'U') IS NOT NULL
	DROP TABLE #HistoricoPrecios
CREATE TABLE #HistoricoPrecios(ProductID INT NOT NULL,
								ListPrice MONEY NOT NULL,
								FechaModificacion DATETIME)

--DROPEAR TRIGGER
IF OBJECT_ID(N'dbo.TR_ActualizaPrecios', N'TR') IS NOT NULL
	DROP TRIGGER dbo.TR_ActualizaPrecios

CREATE TRIGGER dbo.TR_ActualizaPrecios ON dbo.Productos
AFTER UPDATE AS
BEGIN
	INSERT INTO #HistoricoPrecios
	SELECT  ListPrice, ProductID, FechaModificacion FROM dbo.Productos
END

CREATE TRIGGER dbo.TR_ActualizaPrecios ON dbo.Productos 
AFTER UPDATE AS
BEGIN
	INSERT INTO #HistoricoPrecios VALUES
	(ProductID, ListPrice, '2020-12-31')
END
--dropeo si existe ya ese trigger
IF OBJECT_ID(N'dbo.TR_ActualizarPrecios', N'TR') IS NOT NULL
	DROP TRIGGER dbo.TR_ActualizarPrecios
GO
--declaro nuevo trigger
CREATE TRIGGER dbo.TR_ActualizarPrecios ON dbo.Productos
AFTER UPDATE AS
BEGIN
	INSERT INTO #HistoricoPrecios
	SELECT ListPrice, ProductID, ModifiedDate FROM inserted
END

SELECT * FROM #HistoricoPrecios--0 ROWS
--UPDATEO
UPDATE dbo.Productos
SET ListPrice = 11.1
WHERE ProductID = 406
--1 ROW AFFECTED

/*3) Adaptar el trigger del punto anterior donde valide que el precio no pueda ser negativo.
*/

--INCOMPLETO
ALTER TRIGGER dbo.TR_ActualizarPrecios ON dbo.Productos
AFTER UPDATE AS
BEGIN
	INSERT INTO #HistoricoPrecios
	SELECT ListPrice, ProductID, ModifiedDate 
	FROM inserted
END

ALTER TRIGGER dbo.TR_ActualizarPrecios ON dbo.Productos
AFTER UPDATE AS
BEGIN
	INSERT INTO #HistoricoPrecios
	SELECT ListPrice CHECK ListPrice>0, ProductID, ModifiedDate 
	FROM inserted
END
