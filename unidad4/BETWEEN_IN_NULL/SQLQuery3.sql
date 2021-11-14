/*3) Mostrar la fecha, numero de version y
subtotal de las ventas efectuadas en los años 2005 y 2006. 
tablas: Sales.SalesOrderHeader
campos: OrderDate, AccountNumber, SubTotal*/
--Q: ES AccountNumber== numero de version?
USE ADVENTUREWORKS2019
GO
SELECT 
	OrderDate,
	AccountNumber AS N_VERSION, 
	SubTotal
FROM
	Sales.SalesOrderHeader
WHERE
	year(OrderDate) BETWEEN 2005 AND 2006
ORDER BY 
	OrderDate;

--Resultado: 0 rows.
--No hay registros anteriores al 2011

