ALTER DATABASE BDEJEMPLO06
ADD FILEGROUP BD_EJEMPLO06FG

ALTER DATABASE BDEJEMPLO06
ADD FILE(
NAME = N'BDEJEMPLO06FG_DATA',
FILENAME = N'C:\DATOS\BDEJEMPLO06FG_DAT.NDF',
SIZE = 8MB,
MAXSIZE = 10MB,
FILEGROWTH = 5MB
) TO FILEGROUP BD_EJEMPLO06FG