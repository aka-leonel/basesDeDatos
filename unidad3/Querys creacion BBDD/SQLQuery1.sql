/*1) Crear una base de datos llamada BDEJEMPLO01 dentro
de la carpeta DATOS con un tamaño inicial de 8 MB y un Maximo
de 10 MB y un incremento de crecimiento del archivo de 1 MB 
. El archivo de Log tiene que tener un tamaño inicial de 5 MB
y un Maximo de 10 MB y un incremento de crecimiento del archivo de 10%
*/
USE master
GO
CREATE DATABASE BDEJEMPLO01
ON PRIMARY(
NAME = N'BDEJEMPLO01_DATA',
FILENAME = N'C:\DATOS\BDEJEMPLO01_DATA.MDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 1MB
)
LOG ON(
NAME = N'BDJEMPLO01_LOG',
FILENAME = N'C:\LOGS\BDEJEMPLO01_LOG.LDF',
SIZE = 5MB,
MAXSIZE = 10MB,
FILEGROWTH = 10%
)