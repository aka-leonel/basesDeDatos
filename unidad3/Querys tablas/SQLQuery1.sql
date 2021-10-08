/*
Crear una base de datos llamada BDEJEMPLO01 dentro de la carpeta DATOS 
con un tamaño inicial de 8 MB y un Maximo de 10 MB y un 
incremento de crecimiento del archivo de 1 MB .
El archivo de Log tiene que tener un tamaño inicial 
de 5 MB y un Maximo de 10 MB y un incremento
de crecimiento del archivo de 10%

/*USE MASTER
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
NAME = N'BDEJEMPLO01_LOG',
FILENAME = N'C:\LOGS\BDEJEMPLO01_LOG.LDF',
SIZE = 5MB,
MAXSIZE = 10MB,
FILEGROWTH = 10%
)
*/

1) Crear la tabla llamada prueba, dentro de la Base de datos BDEJEMPLO01
Campos
IdCodido caracter de longitud fija 4 que no admite nulos
Nombre caracter de longitud variable 30 que no admite nulos
Precio numero con dos decimales que no admite nulos.
Edad que no adminte nulos.*/
USE BDEJEMPLO01
GO
CREATE TABLE PRUEBA(
IDCODIGO CHAR(4) NOT NULL,
NOMBRE VARCHAR(30) NOT NULL,
PRECIO DECIMAL(13,3) NOT NULL,
EDAD TINYINT NOT NULL
)
--DROP TABLE PRUEBA
