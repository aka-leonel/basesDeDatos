/*2) Mostrar el precio más barato de todas las bicicletas 
Tablas: Production.Product
Campos: ListPrice, Name
*/
--MUESTRA NOMBRE Y PRECIO


USE AdventureWorks2019
GO
SELECT NAME, 
		LISTPRICE
		FROM Production.Product
		WHERE ListPrice = 
			(SELECT MIN(LISTPRICE) FROM Production.Product
			WHERE NAME LIKE '%BIKE%')
			AND NAME LIKE '%BIKE%'

--SOLO MUESTRA PRECIO
/*USE AdventureWorks2019
SELECT MIN(LISTPRICE)
FROM Production.Product
WHERE NAME LIKE '%bike%'
*/