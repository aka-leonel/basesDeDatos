/*7) 	A la tabla Facturas 
7.1) agregar un campo Observacion c(100) null
7.2) modificar el tipo de dato a c(200) not null
7.3) cambiar el nombre Observacion por descripcion
7.4) eliminar el campo descripción*/
/*-----------------------------*/

--7.1) agregar un campo Observacion c(100) null
/*USE BDEJEMPLO01
GO
ALTER TABLE FACTURAS
ADD OBSERVACION VARCHAR(100) NULL*/


--7.2) modificar el tipo de dato a c(200) not null
/*USE BDEJEMPLO01
GO
ALTER TABLE FACTURAS
ALTER COLUMN OBSERVACION VARCHAR(200) NOT NULL
*/

--7.3) cambiar el nombre Observacion por descripcion
/*USE BDEJEMPLO01
GO
EXEC SP_RENAME 'FACTURAS.OBSERVACION', 'DESCRIPCION', 'COLUMN'*/

--7.4) eliminar el campo descripción
/*USE BDEJEMPLO01
ALTER TABLE FACTURAS
DROP COLUMN DESCRIPCION*/