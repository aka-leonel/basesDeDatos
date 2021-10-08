/*6) 	Crear la tabla Artículos dentro de la base 
de datos con el siguiente detalle:
codigo int y PK auto incrementeal que comience en 1 
Nombre varchar(50)
Precio decimal
Stock integer*/
USE BDEJEMPLO01
GO

CREATE TABLE ARTICULOS(
CODIGO INT PRIMARY KEY IDENTITY(1,1),
NOMBRE VARCHAR(50) NOT NULL,
PRECIO DECIMAL(13,2) NOT NULL,
STOCK INT NOT NULL
)