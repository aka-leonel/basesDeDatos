/*Laboratorio Like

1) Mostrar el nombre, precio y color de los accesorios para asientos (Seat) de las bicicletas cuyo precio sea  mayor a 100 pesos.
tablas: Production.Product
campos: Name, ListPrice, Color*/
use AdventureWorks2019

Select name,ListPrice,Color from production.product
where product.Name like '%seat%' AND Product.ListPrice>100