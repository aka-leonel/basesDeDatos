/*9) Agregar el campo idCliente a la tabla 
de facturas y crear una restriccion FK
*/

--AGREGO NUEVO CAMPO
/*USE BDEJEMPLO01
GO
ALTER TABLE FACTURAS
ADD IDCLIENTE INT NOT NULL*/

--CREO RESTRICCION FK
/*USE BDEJEMPLO01
GO
ALTER TABLE FACTURAS
ADD CONSTRAINT FK_FACTURAS_IDCLIENTE
FOREIGN KEY (IDCLIENTE)
REFERENCES CLIENTES(IDCLIENTE)*/