/*9) Cambiar el tama�o de la base de datos BDEJEMPLO06 
aument�ndole el tama�o al archivo de datos de la siguiente manera:
Nombre del Archivo BDEJEMPLO06FG_DATA
Aumentar tama�o 3 MB

Luego de aumentarlo reducirlo nuevamente mediante 
la instrucci�n DBCC SHRINKFILE, 
quedanto de 5 MB
*/
--PRIMER PARTE
/*ALTER DATABASE BDEJEMPLO06
MODIFY FILE(
NAME = N'BDEJEMPLO06FG_DATA',
SIZE = 11MB
)*/

--SEGUNDA PARTE
/*USE BDEJEMPLO06
GO
DBCC SHRINKFILE(N'BDEJEMPLO06FG_DATA',5)*/