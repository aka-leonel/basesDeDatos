/*
Laboratorio de Vistas
Una empresa almacena la información de sus empleados en dos tablas llamadas "empleados" y "secciones". Eliminamos las tablas, si existen:*/

DROP DATABASE IF EXISTS PRUEBA
CREATE DATABASE PRUEBA
GO
USE PRUEBA
GO

IF OBJECT_ID('empleados') IS NOT NULL
DROP TABLE empleados 

IF OBJECT_ID('secciones') IS NOT NULL
DROP TABLE secciones;

Creamos las tablas
CREATE TABLE secciones (
	codigo TINYINT IDENTITY,
	nombre VARCHAR(20),
	sueldo DECIMAL(5,2) CONSTRAINT CK_secciones_sueldo CHECK (sueldo>=0),
	CONSTRAINT PK_secciones PRIMARY KEY (codigo)
 )

CREATE TABLE empleados(
	legajo INT IDENTITY,
	documento CHAR(8)CONSTRAINT CK_empleados_documento CHECK (documento LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	sexo CHAR(1) CONSTRAINT CK_empleados_sexo CHECK (sexo in ('f','m')),
	apellido VARCHAR(20),
	nombre VARCHAR(20),
	domicilio VARCHAR(30),
	seccion TINYINT NOT NULL,
	cantidadhijos TINYINT CONSTRAINT CK_empleados_hijos CHECK (cantidadhijos>=0),
	estadocivil CHAR(10) CONSTRAINT CK_empleados_estadocivil CHECK (estadocivil in ('casado','divorciado','soltero','viudo')),
	fechaingreso DATETIME,
	CONSTRAINT PK_empleados PRIMARY KEY (legajo),
	sueldo DECIMAL(6,2),
	CONSTRAINT FK_empleados_seccion
	FOREIGN KEY (seccion)
	REFERENCES secciones(codigo),
    CONSTRAINT UQ_empleados_documento UNIQUE(documento)
);

Insertarmos registros en la tabla secciones
 insert into secciones values('Administracion',300);
 insert into secciones values('Contaduría',400);
 insert into secciones values('Sistemas',500);

Insertamos registros en la tabla empleados
 insert into empleados values('22222222','f','Lopez','Ana','Colon 123',1,2,'casado','1990-10-10',600);
 insert into empleados values('23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','1990-02-10',650);
 insert into empleados values('24444444', 'm', 'Garcia', 'Marcos', 'Sarmiento 1234', 2, 3, 'divorciado', '1998-07-12',800);
 insert into empleados values('25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','1998-10-09',900);
 insert into empleados values('26666666','f','Perez','Laura','Peru 1254',3,3,'casado','2000-05-09',700);

1) Eliminar la vista "vista_empleados" si existe
DROP VIEW IF EXISTS [vista_empleados]


/*2) Crear la vista "vista_empleados", que es resultado de una combinación en la cual se muestran 4 campos:
	APELLIDO Y NOMBRE contatenado
	sexo
	seccion
	cantidad de hijos
	*/
CREATE VIEW vista_empleados
AS
	SELECT CONCAT(E.apellido, ' ', E.nombre) AS NombreCompleto,
			E.sexo,
			S.nombre AS Seccion,
			E.cantidadhijos
	FROM empleados E, secciones S
	WHERE E.seccion = S.codigo
GO

SELECT * FROM vista_empleados

3) Consular la información contenida en la vista

SELECT * FROM vista_empleados


4) Eliminamos la vista "vista_empleados2" si existe
DROP VIEW IF EXISTS vista_empleados2


5) Crear otra vista de "empleados" denominada "vista_empleados2" que consulta solamente la tabla "empleados" 

CREATE VIEW vista_empleados2
AS
	SELECT *
	FROM empleados
GO

6) Consultar la informacion de la vista empleados2

SELECT *
FROM vista_empleados2


7) Ingresamos un registro en la vista "vista_empleados" (se puede hacer, que pasa)
--este primer insert en vista_empleados2 me funcionó
INSERT INTO vista_empleados2 VALUES( 18948845, 'f', 'Pinzón','Beatriz','Bogotá 1234', 1,1, 'casado', '2001-10-24', 999)

--este segundo insert en vista_empleados no me funciono
--ERROR: Update or insert of view or function 'vista_empleados' failed because it contains a derived or constant field.
INSERT INTO vista_empleados VALUES(20123321, 'f', 'Pinzón', 'Beatriz', 'Perú 345', 2,1, 'casado', '1997', 750)

SELECT * FROM empleados
SELECT * FROM vista_empleados
SELECT * FROM vista_empleados2



8) Actualizar el nombre de un registro de la vista "vista_empleados2", Verifique que se actualizó la tabla

UPDATE vista_empleados2
SET apellido = 'Pinzón Solano'
WHERE legajo = 6
SELECT * FROM vista_empleados2

9) Eliminar un registro de la vista "vista_empleados2" y uno de la vista "vista_empleados1". Que ocurre?
--PRIMERO MIRO COMO ESTA TODO
SELECT * FROM empleados
SELECT * FROM vista_empleados
SELECT * FROM vista_empleados2
--
DELETE FROM vista_empleados2
WHERE legajo = 3


--esta no funciona
DELETE FROM vista_empleados
WHERE legajo = 2
--ERROR:View or function 'vista_empleados' is not updatable because the modification affects multiple base tables

