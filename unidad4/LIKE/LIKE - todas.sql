/*Laboratorio Like

1) Mostrar el nombre, precio y color de los
accesorios para asientos (Seat) de las bicicletas
cuyo precio sea  mayor a 100 pesos.
tablas: Production.Product
campos: Name, ListPrice, Color*/
USE AdventureWorks2019
GO
SELECT Name, ListPrice, Color
FROM Production.Product
WHERE NAME LIKE '%SEAT%' AND ListPrice > 100


/*2) Mostrar los nombre de los productos que
tengan cualquier combinación de 'mountain bike'.
tablas: Production.Product
campos: Name*/
SELECT Name
FROM Production.Product
WHERE Name LIKE '%mountain bike%'

/*3) Mostrar las personas que su nombre empiece con la letra 'y'. 
tablas:Person.Person
campos: FirstName*/
SELECT FirstName
FROM Person.Person
WHERE FirstName LIKE 'y%'

/*4) Mostrar las personas que la segunda letra de su apellido es una s. 
tablas:Person.Person
campos: LastName*/

SELECT LastName
FROM Person.Person
WHERE LastName LIKE '_s%'



/*5) Mostrar el nombre concatenado con el apellido
de las personas cuyo apellido tengan terminación española (ez).
tablas: Person.Person
campos: FirstName,LastName*/

SELECT CONCAT( FirstName,' ', LastName)
FROM Person.Person
WHERE LastName LIKE '%ez'


	
/*6) Mostrar los nombres de los productos que terminen en un número. 
tablas: Production.Product
campos: Name*/

SELECT Name
FROM Production.Product
WHERE Name LIKE '%[0-9]'



/*7) Mostrar las personas cuyo  nombre
tenga una C o c como primer carácter, 
cualquier otro como segundo carácter,
ni d ni e ni f ni g como tercer carácter,
cualquiera entre j y r o entre s y w como cuarto carácter y el resto sin restricciones. 
tablas:Person.Person
campos: FirstName*/

SELECT FirstName
FROM Person.Person
WHERE FirstName LIKE 'C_[^dfg][j-rs-w]%'