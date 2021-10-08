/*3) Crear el tipo de datos DNI que no admita valores NULOS 
Agregar a la tabla prueba un nuevo campo que sea numero 
de documento y usar el tipo de dado creado
*/
/*USE MASTER
GO
CREATE TYPE DNI
FROM VARCHAR(8) NOT NULL*/
USE BDEJEMPLO01
GO
ALTER TABLE PRUEBA
ADD NUMERODOCUMENTO DNI
