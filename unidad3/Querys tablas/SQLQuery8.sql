/*8) Dada las tabla cliente
CREATE TABLE CLIENTES (
IDCLIENTE INT NOT NULL,
NOMBRE VARCHAR(100) NOT NULL,
APELLIDO VARCHAR(100) NOT NULL,
NRODOCUMENTO VARCHAR(11) NOT NULL,
FECHACREACION DATETIME NOT NULL, 
EDAD TINYINT NOT NULL
)
8.1) Crear una restriccion de clave primaria para el campo idCliente
8.2) Crear una restriccion unique al campo nroDocumento
8.3) Crear una restriccion check para que la edad no sea negativa
8.4) Crear una restriccion default para el campo fechaCreacion que sea la fecha del servidor (GETDATE())
8.5) Deshabilitar las restricciones creadas para edad
-------------------------*/
--8.1) Crear una restriccion de clave primaria para el campo idCliente
/*USE BDEJEMPLO01
GO
ALTER TABLE CLIENTES
ADD CONSTRAINT PK_IDCLIENTE PRIMARY KEY (IDCLIENTE)*/


--8.2) Crear una restriccion unique al campo nroDocumento
/*USE BDEJEMPLO01
GO
ALTER TABLE CLIENTES
ADD CONSTRAINT UNICO_NRODOCUMENTO UNIQUE (NRODOCUMENTO)*/

--8.3) Crear una restriccion check para que la edad no sea negativa
/*USE BDEJEMPLO01
GO
ALTER TABLE CLIENTES
ADD CONSTRAINT CHECK_EDAD CHECK (EDAD>0 AND EDAD<120)*/


/*8.4) Crear una restriccion default para el campo
fechaCreacion que sea la fecha del servidor (GETDATE())*/
/*USE BDEJEMPLO01
GO
ALTER TABLE CLIENTES
ADD CONSTRAINT DEFAULT_FECHACREACION DEFAULT GETDATE() FOR FECHACREACION
*/

--8.5) Deshabilitar las restricciones creadas para edad
/*USE BDEJEMPLO01
GO
ALTER TABLE CLIENTES
DROP CONSTRAINT CHECK_EDAD
GO*/