/*4) Crear una tabla llamado OPERADOR que contenga los siguientes campos
CODIGO C(10),NOMBRES C(40),FECHAINGRESO, EDAD, MONTOTOTAL N(13,2).
Luego de creada a�adir una columna llamada tel�fono c(20) sin restricci�n
*/
/*USE BDEJEMPLO01
CREATE TABLE OPERADOR(
CODIGO VARCHAR(10) NOT NULL,
NOMBRE VARCHAR(40) NOT NULL,
FECHAINGRESO DATE  NOT NULL,
EDAD TINYINT,
MONTOTOTAL DECIMAL(13,2)  NOT NULL
)*/
USE BDEJEMPLO01
ALTER TABLE OPERADOR
ADD TELEFONO VARCHAR(20)