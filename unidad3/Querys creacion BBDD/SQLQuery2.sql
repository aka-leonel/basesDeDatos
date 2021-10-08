/*2) Crear una base de datos llamada BDEJEMPLO02, 
con un tamaño inicial de 8 MB y un Maximo de 10 MB y
un incremento de crecimiento del archivo de 2 MB. El archivo de 
Log tiene que tener un tamaño inicial de 8 MB y un Maximo de 10
MB y un incremento de crecimiento del archivo de 2MB.
*/
USE MASTER
GO

CREATE DATABASE BDEJEMPLO02
ON PRIMARY(
NAME = N'BDEJEMPLO02_DATA',
FILENAME = N'C:\DATOS\BDEJEMPLO02_DATA.MDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 2MB
)
LOG ON(
NAME = N'BDEJEMPLO02_LOG',
FILENAME = N'C:\LOGS\BDEJEMPLO02_LOG.LDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 2MB
)