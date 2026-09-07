-- Consultas con JOINs para el proyecto
-- Alumna: Luisina Rodriguez
-- Fecha: 4/8/2026}
--------------------------------------------
-------------------------------------------
USE Ventas_Tech_DB
--COMO FALTAN DATOS DE TERRITORIO, CANAL Y SEGMENTO VAMOS A AÑADIRLOS

ALTER TABLE clientes
ADD segmento VARCHAR(50);

UPDATE clientes
SET segmento = 'Premium'
WHERE id_cliente = 1;

UPDATE clientes
SET segmento = 'Regular'
WHERE id_cliente = 2;

UPDATE clientes
SET segmento = 'Premium'
WHERE id_cliente = 3;

UPDATE clientes
SET segmento = 'Regular'
WHERE id_cliente = 4;

UPDATE clientes
SET segmento = 'Premium'
WHERE id_cliente = 5;

CREATE TABLE territorios(
    id_territorio INT PRIMARY KEY,
    region VARCHAR(50)
    );

INSERT INTO territorios VALUES (1,'Centro');
INSERT INTO territorios VALUES (2,'Norte');
INSERT INTO territorios VALUES (3,'Sur');

ALTER TABLE clientes
ADD id_territorio INT;

UPDATE clientes SET id_territorio=1 WHERE id_cliente=1;
UPDATE clientes SET id_territorio=2 WHERE id_cliente=2;
UPDATE clientes SET id_territorio=1 WHERE id_cliente=3;
UPDATE clientes SET id_territorio=3 WHERE id_cliente=4;
UPDATE clientes SET id_territorio=2 WHERE id_cliente=5;

ALTER TABLE clientes
ADD CONSTRAINT FK_clientes_territorios
FOREIGN KEY(id_territorio)
REFERENCES territorios(id_territorio);

ALTER TABLE ventas
ADD canal VARCHAR(20);

UPDATE ventas
SET canal='Online'
WHERE id_venta IN (1,3,5,7,9);

UPDATE ventas
SET canal='Presencial'
WHERE id_venta IN (2,4,6,8,10);

-- Consulta 1: Vista base del proyecto (INNER JOIN) 
SELECT 
v.fecha_venta,
c.nombre,
c.segmento,
t.region,
p.nombre_producto,
cat.nombre_categoria,
v.cantidad,
v.precio_unitario,
(v.cantidad * v.precio_unitario) AS total_venta,
v.canal
FROM ventas v
INNER JOIN clientes c
ON v.id_cliente= c.id_cliente
INNER JOIN territorios t
ON c.id_territorio = t.id_territorio
INNER JOIN productos p
ON v.id_producto= p.id_producto
INNER JOIN categorias cat
ON p.id_categoria= cat.id_categoria;

-- Consulta 2: Clientes sin ventas (LEFT JOIN) 
SELECT 
c.nombre, 
c.email,
c.fecha_registro
FROM clientes c
LEFT JOIN ventas v
ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL;

-- Consulta 3: Productos sin ventas (LEFT JOIN)
SELECT 
p.nombre_producto,
cat.nombre_categoria, 
p.precio
FROM productos p
LEFT JOIN ventas v
ON p.id_producto = v.id_producto
INNER JOIN categorias cat
ON p.id_categoria= cat.id_categoria
WHERE v.id_producto IS NULL;


-- Consulta 4: Consolidado por canal (UNION ALL) 
SELECT
canal,
SUM(cantidad * precio_unitario) AS total_facturado
FROM 
(
SELECT 
canal, 
cantidad, 
precio_unitario
FROM ventas
WHERE canal= 'Online'

UNION ALL

SELECT 
canal,
cantidad,
precio_unitario
FROM ventas
WHERE canal= 'Presencial'
) AS ventas_totales
GROUP BY canal;

