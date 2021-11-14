/*7) Mostrar el nombre, número de producto,
precio de lista 
y el precio de lista incrementado en un 10% de los productos
cuya fecha de fin de venta sea anterior al día de hoy.
tablas:Production.Product
campos: Name, ProductNumber, ListPrice, SellStartDate
campos: Weight*/
USE AdventureWorks2019
GO
SELECT  NAME, 
		ProductNumber, 
		ListPrice, 
		SellEndDate,
		ListPrice, 
CASE 
	WHEN (YEAR(SellEndDate)<2013) THEN (ListPrice*1.10)
	WHEN (SellEndDate IS NULL) THEN NULL
ELSE ListPrice
END PrecioIncrementado
FROM Production.Product
ORDER BY SellEndDate
--WHERE SellEndDate< GETDATE()
