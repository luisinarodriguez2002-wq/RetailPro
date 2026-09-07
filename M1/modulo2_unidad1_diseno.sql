--CREATE BASE DE DATOS
CREATE DATABASE modulo2_unidad1_diseno;

--CLAUSULA USE 
USE modulo2_unidad1_diseno;

--CREAR TABLA CLIENTES
CREATE TABLE Clientes (
--INT porque el identificador es un numero entero
ID_cliente INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
--varchar(100) porque el nombre es texto hasta 100 caracteres
Nombre varchar(100) NOT NULL,
--varchar(MAX) porque permite almacenar textos largos como biografias o notas
Perfil_bio varchar(MAX) NOT NULL,
--date porque solo necesitamos almacenar la fecha, sin hora
Fecha_registro date NOT NULL,
);

--CREAR TABLA PRODUCTOS
CREATE TABLE Productos(
--INT porque el identificador es un numero entero
ID_producto INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
--varchar(255) porque la descripcion puede contener hasta 255 caracteres
Descripcion varchar(255) NOT NULL,
--DECIMAL(10,2) porque permite almacenar valores monetarios con 2 decimales
Precio DECIMAL(10,2) NOT NULL,
--BIT porque representa dos estados: 1 para activos y 0 para inactivos
Esta_activo BIT NOT NULL,
);

