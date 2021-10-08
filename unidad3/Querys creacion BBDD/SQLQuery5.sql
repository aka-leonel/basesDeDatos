/*5) Crear la base de datos BDEJEMPLO05 con las siguientes características:
Nombre de la Base de datos BDEJEMPLO05
Nombre del archivo lógico BDEJEMPLO05_dat
Nombre del archivo fisico BDEJEMPLO_05_data.mdf
Tamaño inicial 8 MB
Tamaño Maximo 20 MB
Porcentaje de incremento archivo 30%
Archivo de log 
Tamaño inicial 8 MB
Tamaño Maximo 20 MB
Porcentaje de incremento archivo 10%   */

USE MASTER 
GO
CREATE DATABASE BDEJEMPLO05
ON PRIMARY(
NAME = N'BDEJEMPLO05_DAT',
FILENAME = N'C:\DATOS\BDEJEMPLO_05_DATA.MDF',
SIZE = 8MB,
MAXSIZE = 20MB,
FILEGROWTH = 30%
)
LOG ON(
NAME = N'BDEJEMPLO_05_LOG',
FILENAME = N'C:\LOGS\BDEJEMPLO_05_LOG.LDF',
SIZE = 8MB,
MAXSIZE = 20MB,
FILEGROWTH = 10%
)