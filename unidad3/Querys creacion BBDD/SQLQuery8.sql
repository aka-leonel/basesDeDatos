/*8) Agregar un grupo de archivo con nombre BD_EJEMPLO06FG 
a la base de datos BDEJEMPLO06 posteriormente debemos agregar
un archivo secundario con nombre BDEJEMPLO06FG_DATA y 
asignarlo al grupo de archivo
tamaño inicial 8 MB
tamaño maximo 10 MB
crecimiento 5 MB
*/
USE MASTER
GO

ALTER DATABASE BDEJEMPLO06
ADD FILEGROUP BD_EJEMPLO06FG

ALTER DATABASE BDEJEMPLO06
ADD FILE(
NAME = N'BDEJEMPLO06FG_DATA',
FILENAME = N'C:\DATOS\BDEJEMPLO06FG_DATA.NDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 5MB
) TO FILEGROUP BD_EJEMPLO06FG