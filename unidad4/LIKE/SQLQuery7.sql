/*7) Mostrar las personas cuyo  nombre tenga una C o c
como primer car�cter, c
cualquier otro como segundo car�cter, _
ni d ni e ni f ni g como tercer car�cter, [^DEFG]
cualquiera entre j y r o entre s y w como cuarto car�cter [J-R,S-W]
y el resto sin restricciones.  %
tablas:Person.Person
campos: FirstName*/
USE AdventureWorks2019
GO
SELECT FirstName
FROM Person.Person
WHERE FirstName LIKE 'c_[^D-G][J-R,S-W]%'