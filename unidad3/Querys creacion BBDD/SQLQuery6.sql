/*6)  Crear la base de datos BDEJEMPLO06, que especifique los 
archivos de registro de datos y de transacciones con los 
siguientes caracter�sticas:
Nombre del archivo l�gico BDEJEMPL0_06_DAT
Nombre del archivo fisico BDEJEMPL0_06_DAT.MDF
Tama�o inicial 10 MB
Tama�o Maximo 30 MB
Porcentaje de incremento archivo 25%
Archivo de log 
Tama�o inicial 10 MB
Tama�o Maximo 30 MB
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
