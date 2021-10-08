/*6)  Crear la base de datos BDEJEMPLO06, que especifique los 
archivos de registro de datos y de transacciones con los 
siguientes características:
Nombre del archivo lógico BDEJEMPL0_06_DAT
Nombre del archivo fisico BDEJEMPL0_06_DAT.MDF
Tamaño inicial 10 MB
Tamaño Maximo 30 MB
Porcentaje de incremento archivo 25%
Archivo de log 
Tamaño inicial 10 MB
Tamaño Maximo 30 MB
Porcentaje de incremento archivo 25% */
USE MASTER
GO
CREATE DATABASE BDEJEMPLO06
ON PRIMARY(
NAME = N'BDEJEMPLO_06_DAT',
FILENAME = N'C:\DATOS\BDEJEMPLO_O6_DAT.MDF',
SIZE = 10MB,
MAXSIZE = 30MB,
FILEGROWTH = 25%
)
LOG ON(
NAME = N'BDEJEMPLO_06_LOG',
FILENAME = N'C:\LOGS\BDEJEMPLO_06_LOG.LDF',
SIZE = 10MB,
MAXSIZE = 30MB,
FILEGROWTH = 25%
)
