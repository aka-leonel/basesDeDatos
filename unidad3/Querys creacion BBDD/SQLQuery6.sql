CREATE DATABASE BDEJEMPLO06
ON PRIMARY(
NAME = N'BDEJEMPLO_06_DAT',
FILENAME = N'C:\DATOS\BDEJEMPLO_06_DAT.MDF',
SIZE = 10MB,
MAXSIZE = 30MB,
FILEGROWTH = 25%
)
LOG ON(
NAME = N'BDEJEMPLO_06_LOG',
FILENAME = N'C:\LOGS\BDEJEMPLO_06_LOG.LDF',
SIZE = 10MB,
MAXSIZE = 30MB,
FILEGROWTH = 25%
)