--BODEGATECH- Script de Inventario
--Autora: Luisina Rodriguez

--SECCIÓN DDL--

DROP TABLE IF EXISTS Inventario;

CREATE TABLE Inventario (
--INT porque el identificador es un número entero único
ID_producto INT PRIMARY KEY,
--VARCHAR(100) porque almacena texto de hasta 100 caracteres
Nombre_producto VARCHAR(100) NOT NULL,
--VARCHAR(50) porque la categoría es un texto corto
Categoria VARCHAR(50) NOT NULL,
--DECIMAL(10,2) porque permite almacenar valores monetarios con precisión
Precio_unitario DECIMAL (10,2) NOT NULL,
--INT porque representa una cantidad de unidades
Stock_anual INT NOT NULL,
--INT porque representa el stock mínimo permitido
Stock_minimo INT NOT NULL,
--DATE porque solo se necesita almacenar la fecha
Fecha_ingreso DATE NOT NULL,
--BIT porque representa dos estados: activo (1) o inactivo (0)
Activo BIT NOT NULL,
);

--SECCIÓN DML--

INSERT INTO Inventario
(ID_producto, Nombre_producto, Categoria, Precio_unitario, Stock_anual, Stock_minimo, Fecha_ingreso, Activo)
VALUES
(1, 'Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
(2, 'Mouse Inalambrico', 'Accesorios', 28.00, 80, 10,'2024-01-10', 1),
(3, 'Monitor 4K 27"', 'Computación', 450.00, 12, 2,	'2024-01-15', 1),
(4, 'Teclado Mecánico',	'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
(5, 'Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
(6,'Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
(7, 'Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10,	'2024-02-10', 1),
(8, 'Webcam HD 1080p', 'Accesorios', 85.00,	25,	5,	'2024-02-10', 1),
(9, 'SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3,	'2024-03-01', 1),
(10, 'Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);


UPDATE Inventario
SET Stock_anual= stock_anual - 3
WHERE ID_producto = 1;

UPDATE Inventario
SET Stock_anual= Stock_anual - 12
WHERE ID_producto= 2;

UPDATE Inventario
SET Stock_anual= Stock_anual - 5
WHERE ID_producto= 6;


--La Webcam HD 1080p fue descontinuada

UPDATE Inventario
SET Activo= 0
WHERE ID_producto= 8;

SELECT * FROM Inventario;

