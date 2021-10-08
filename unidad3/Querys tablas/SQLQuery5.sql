/*5) Crear la tabla Facturas dentro de la base de datos 
con el siguiente detalle:
	Letra char y PK
	Numero integer y PK
	Fecha date
	Monto decimal

PK significa Primary Key observar que se está
declarando una clave primaria compuesta es decir (letra, código)
Cada campo por sí solo no es clave, ni tampoco 
identifica al registro pero la suma de los dos forman la clave
*/

USE BDEJEMPLO01
CREATE TABLE FACTURAS(
LETRA CHAR(1),
NUMERO INT,
FECHA DATE,
MONTO DECIMAL(13,2),
CONSTRAINT PK_FACTURAS PRIMARY KEY(LETRA, NUMERO)
)