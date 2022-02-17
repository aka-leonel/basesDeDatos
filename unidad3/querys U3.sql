/*Laboratorio creación de Bases de datos
CREAR EN EL DISCO C UN DIRECTORIO LLAMADO DATOS 

1) Crear una base de datos llamada BDEJEMPLO01 dentro de la carpeta DATOS con un tamaño inicial de 8 MB y un Maximo de 10 MB y un incremento de crecimiento del archivo de 1 MB . El archivo de Log tiene que tener un tamaño inicial de 5 MB y un Maximo de 10 MB y un incremento de crecimiento del archivo de 10%*/

CREATE DATABASE [BDEJEMPLO01]
ON PRIMARY(
NAME = N'BDEJEMPLO01_DAT',
FILENAME = N'D:\DATA\BDEJEMPLO01.MDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 1MB
)
LOG ON(
NAME = N'BDEJEMPLO01_LOG',
FILENAME = N'D:\LOGS\BDEJEMPLO01.LDF',
SIZE = 5MB,
MAXSIZE= 10MB,
FILEGROWTH = 10%
)

/*2) Crear una base de datos llamada BDEJEMPLO02, con un tamaño inicial de 8 MB y un Maximo de 10 MB y un incremento de crecimiento del archivo de 2 MB. El archivo de Log tiene que tener un tamaño inicial de 8 MB y un Maximo de 10 MB y un incremento de crecimiento del archivo de 2MB.*/

CREATE DATABASE "BDEJEMPLO02"
ON PRIMARY(
NAME = N'BDEJEMPLO02_DATA',
FILENAME = N'D:\DATA\BDEJEMPLO02.MDF',
SIZE = 8MB,
MAXSIZE =10MB,
FILEGROWTH = 2MB
)
LOG ON(
NAME = N'BDEJEMPLO02_LOG',
FILENAME = N'D:\LOGS\BDEJEMPLO02.LDF',
SIZE = 8 MB,
MAXSIZE = 10MB,
FILEGROWTH = 2MB
)

/*3)  Crear la base de datos BDEJEMPLO03, con un tamaño inicial de 8 MB y un Maximo de 80 MB y un incremento de crecimiento del archivo de 10 MB ademas mediante la especificación de multiples archivos de registro de datos y de transacciones, que contenga 2 archivos de datos(NDF) de 8MB inicial y un maximo de 10 MB y un incremento de crecimiento del archivo de 10 MB y 2 archivos de transacciones(LOG) de 8MB inicial y un maximo de 10 MB y un incremento de crecimiento del archivo de 10 MB.
Dentro de la carpeta DATOS*/
USE master
GO
CREATE DATABASE BDEJEMPLO03
ON PRIMARY(
NAME = N'BDEJEMPLO03_DATA',
FILENAME = N'D:\DATA\BDEJEMPLO03.MDF',
SIZE = 8MB,
MAXSIZE = 80MB,
FILEGROWTH = 10MB
),
(NAME = N'BDEJEMPLO03_DATA2',
FILENAME = N'D:\DATA\BDEJEMPLO03_DATA2.NDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 1MB
),
(NAME = N'BDEJEMPLO03_DATA3',
FILENAME = N'D:\DATA\BDEJEMPLO03_DATA3.NDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 1MB
)

LOG ON(
NAME = N'BDEJEMPLO03_LOG1',
FILENAME = N'D:\LOGS\BDEJEMPLO03_LOG1.LDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 1 MB
),(
NAME = N'BDEJEMPLO03_LOG2',
FILENAME = N'D:\LOGS\BDEJEMPLO03_LOG2.LDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 1 MB
)



/*4)Crear la base de datos BDEJEMPLO04,siendo un único archivo con un tamaño inicial de 10 MB y un Maximo de 15 MB y un incremento de crecimiento del archivo de 10 MB */

USE master
GO
GO 
GO
CREATE DATABASE BDEJEMPLO04
ON PRIMARY(
NAME = N'BDEJEMPLO04',
FILENAME = N'D:\DATA\BDEJEMPLO04.MDF',
SIZE = 10MB,
MAXSIZE = 15MB,
FILEGROWTH = 1MB
)
GO
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
Porcentaje de incremento archivo 10%*/
USE master
GO
CREATE DATABASE BDEJEMPLO05
ON PRIMARY(
NAME = N'BDEJEMPLO05_dat',
FILENAME = N'D:\DATA\BDEJEMPLO_05_data.mdf',
SIZE = 8MB,
MAXSIZE = 20MB,
FILEGROWTH = 30%
)
LOG ON(
NAME = N'BDEJEMPLO05_log',
FILENAME = N'D:\LOGS\BDEJEMPLO_05_log.ldf',
SIZE = 8MB,
MAXSIZE = 20MB,
FILEGROWTH = 10%
)

/*6)  Crear la base de datos BDEJEMPLO06, que especifique los archivos de registro de datos y de transacciones con los siguientes características:
Nombre del archivo lógico BDEJEMPL0_06_DAT
Nombre del archivo fisico BDEJEMPL0_06_DAT.MDF
Tamaño inicial 10 MB
Tamaño Maximo 30 MB
Porcentaje de incremento archivo 25%
Archivo de log 
Tamaño inicial 10 MB
Tamaño Maximo 30 MB
Porcentaje de incremento archivo 25%*/
USE master
GO
CREATE DATABASE BDEJEMPLO06
ON PRIMARY(
NAME = N'BDEJEMPLO_06_DAT',
FILENAME = N'D:\DATA\BDEJEMPLO_06_DAT.MDF',
SIZE = 10MB,
MAXSIZE = 30MB,
FILEGROWTH = 25%
)
LOG ON(
NAME = N'BDEJEMPLO_06_LOG',
FILENAME = N'D:\LOGS\BDEJEMPLO_06_LOG.LDF',
SIZE = 10MB,
MAXSIZE = 30MB,
FILEGROWTH = 25%
)
	
	
/*7) Modificar la base de datos BDEJEMPLO06, para agregar el archivo de datos
	Archivo de Datos con nombre BDEJEMPLO_06_SEC
	Tamaño inicial 8 MB
	Tamaño Maximo 10 MB
	incremento archivo 2 MB*/
USE master
GO
ALTER DATABASE BDEJEMPLO06
ADD FILE(
NAME = N'BDEJEMPLO_06_SEC',
FILENAME = N'D:\DATA\BDEJEMPLO_06_SEC.NDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 2MB
)


/*8) Agregar un grupo de archivo con nombre BD_EJEMPLO06FG a la base de datos BDEJEMPLO06 posteriormente debemos agregar un archivo secundario con nombre BDEJEMPLO06FG_DATA y asignarlo al grupo de archivo
	tamaño inicial 8 MB
	tamaño maximo 10 MB
	crecimiento 5 MB*/

USE master
GO
ALTER DATABASE BDEJEMPLO06
ADD FILEGROUP BD_EJEMPLO06FG
GO
ALTER DATABASE BDEJEMPLO06
ADD FILE(
NAME = N'BDEJEMPLO06FG_DATA',
FILENAME = N'D:\DATA\BDEJEMPLO06FG_DATA.NDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 2MB
)TO FILEGROUP BD_EJEMPLO06FG


/*9) Cambiar el tamaño de la base de datos BDEJEMPLO06 aumentándole el tamaño al archivo de datos de la siguiente manera:
Nombre del Archivo BDEJEMPLO06FG_DATA
Aumentar tamaño 3 MB
Luego de aumentarlo reducirlo nuevamente mediante la instrucción DBCC SHRINKFILE, 
quedanto de 5 MB*/

USE master
GO
ALTER DATABASE BDEJEMPLO06
MODIFY FILE
(
NAME = N'BDEJEMPLO06FG_DATA',
SIZE = 11MB
)

USE BDEJEMPLO06
GO
DBCC SHRINKFILE(BDEJEMPLO06FG_DATA, 5)
/*10) Eliminar todas las bases de datos creadas*/

USE master
GO
DROP DATABASE BDEJEMPLO01, BDEJEMPLO02, BDEJEMPLO03, BDEJEMPLO04, BDEJEMPLO05, BDEJEMPLO06
GO