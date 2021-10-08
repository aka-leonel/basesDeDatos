/*3)  Crear la base de datos BDEJEMPLO03, con un tamaño inicial
de 8 MB y un Maximo de 80 MB y un incremento de crecimiento del
archivo de 10 MB ademas mediante la especificación de multiples
archivos de registro de datos y de transacciones, que contenga 
2 archivos de datos de 8MB inicial y un maximo de 10 MB y un 
incremento de crecimiento del archivo de 10 MB y 2 archivos de 
transacciones de 8MB inicial y un maximo de 10 MB y un incremento
de crecimiento del archivo de 10 MB.
Dentro de la carpeta DATOS
*/
USE MASTER
GO
CREATE DATABASE BDEJEMPLO03
ON PRIMARY(
NAME = N'BDEJEMPLO03_DATA1',
FILENAME = N'C:\DATOS\BDEJEMPLO01_DATA1.MDF',
SIZE = 8MB,
MAXSIZE = 80MB,
FILEGROWTH = 10
),
FILEGROUP FG_BDEJ06_DATA(
NAME = N'BDEJEMPLO03_DATA2',
FILENAME = N'C:\DATOS\BDEJEMPLO03_DATA2.NDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 2MB
),(
NAME = N'BDEJEMPLO03_DATA3',
FILENAME = N'C:\DATOS\BDEJEMPLO03_DATA3.NDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 2MB
)
