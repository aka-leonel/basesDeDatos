/*Laboratorio	TRIGGER
1)Clonar estructura (ProductID, ListPrice) y datos de la tabla Production.Product en una tabla llamada Productos.*/

DROP TABLE IF EXISTS Productos
IF OBJECT_ID(N'Productos', N'U') IS NOT NULL DROP TABLE Productos
SELECT TOP 0 ProductID, ListPrice 
		INTO Productos 
FROM Production.Product
SELECT * FROM Productos


--item 2 incompleto
/*2)Crear un trigger sobre la tabla Productos llamado TR_ActualizaPrecios dónde actualice la tabla  #HistoricoPrecios con  los cambios de precio.
Tablas: Productos 
Campos: ProductID, ListPrice*/

DROP TABLE IF EXISTS #HistoricoPrecios
CREATE TABLE #HistoricoPrecios (ProductID INT NULL,ListPrice MONEY NULL,fechaModificacion DATETIME NULL)

SELECT * FROM #HistoricoPrecios
SELECT * FROM Productos
--si existe el trigger lo dropeo
IF OBJECT_ID(N'dbo.TR_ActualizaPrecios', N'TR') IS NOT NULL DROP TRIGGER dbo.TR_ActualizaPrecios
GO
--creo trigger
CREATE TRIGGER dbo.TR_ActualizaPrecios ON dbo.Productos
AFTER UPDATE AS
BEGIN
	INSERT INTO #HistoricoPrecios
	SELECT ProductID, ListPrice, GETDATE() FROM inserted
END
GO
--
INSERT INTO Productos VALUES (102.3)
SELECT * FROM Productos
SELECT * FROM #HistoricoPrecios
UPDATE dbo.Productos
	SET ListPrice=600
WHERE ProductID=1;
SELECT * FROM Productos


SELECT *
FROM #HistoricoPrecios
WHERE ProductID =1

--crear un trigger que se dispara ante un evento UPDATE
IF OBJECT_ID(N'dbo.TR_Prueba', N'TR') IS NOT NULL DROP TRIGGER dbo.TR_Prueba
GO

CREATE TRIGGER dbo.TR_Prueba ON dbo.Prueba
AFTER UPDATE AS
BEGIN
	UPDATE p
		SET Nombre=i.Nombre
		FROM
			dbo.CopiaPrueba p INNER JOIN inserted i
			ON p.Codigo=i.Codigo;
END
GO

/*
3) Adaptar el trigger del punto anterior donde valide que el precio no pueda ser negativo.

*/