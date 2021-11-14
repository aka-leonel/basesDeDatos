/*7) Mostrar las personas cuyo  nombre tenga una C o c
como primer carácter, c
cualquier otro como segundo carácter, _
ni d ni e ni f ni g como tercer carácter, [^DEFG]
cualquiera entre j y r o entre s y w como cuarto carácter [J-R,S-W]
y el resto sin restricciones.  %
tablas:Person.Person
campos: FirstName*/
USE AdventureWorks2019
GO
SELECT FirstName
FROM Person.Person
WHERE FirstName LIKE 'c_[^D-G][J-R,S-W]%'