/*7) Modificar la base de datos BDEJEMPLO06, 
para agregar el archivo de datos
Archivo de Datos con nombre BDEJEMPLO_06_SEC
Tamaño inicial 8 MB
Tamaño Maximo 10 MB
incremento archivo 2 MB
*/
USE MASTER
GO
ALTER DATABASE BDEJEMPLO06
ADD FILE(
NAME = N'BDEJEMPLO_06_SEC',
FILENAME = N'C:\DATOS\BDEJEMPLO_06_SEC.NDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 2MB
)