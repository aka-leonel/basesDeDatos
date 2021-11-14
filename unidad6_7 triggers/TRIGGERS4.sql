
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
--CREO TRIGGER
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
SELECT * FROM #HistoricoPrecios
/*3) Adaptar el trigger del punto anterior donde valide que el precio no pueda ser negativo.
*/
--ALTER TRIGGER

ALTER TRIGGER dbo.TR_ActualizaPrecios ON dbo.Productos
FOR INSERT, UPDATE
AS BEGIN
   IF  ((SELECT COUNT(*) FROM inserted WHERE ListPrice < 0)>0)
   BEGIN
      RAISERROR('No se admite precio negativo', 16, -1);
      ROLLBACK;
      RETURN
   END
   BEGIN
	INSERT INTO #HistoricoPrecios
	SELECT ProductID, ListPrice, GETDATE() FROM inserted
END
END



-------
INSERT INTO dbo.Productos VALUES (2.1)
INSERT INTO dbo.Productos VALUES (-19.50)
SELECT * FROM Productos
SELECT * FROM #HistoricoPrecios
