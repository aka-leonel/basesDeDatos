/*4)Crear la base de datos BDEJEMPLO04,siendo un único 
archivo con un tamaño inicial de 10 MB y un Maximo de 
15 MB y un incremento de crecimiento del archivo de 10 MB */

USE MASTER
GO

CREATE DATABASE BDEJEMPLO04
ON PRIMARY(
NAME = N'BDEJEMPLO04',
FILENAME = N'C:\DATOS\BDEJEMPLO04_DATA.MDF',
SIZE = 10MB,
MAXSIZE = 15MB,
FILEGROWTH = 10MB
)
