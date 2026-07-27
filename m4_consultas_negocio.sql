-- Ventas_Tech_DB- Consultas de Negocio
-- Alumna: Luisina Rodriguez
-- Fecha: 27/07/2026
-------------------------------------------------

-- Consulta 1: Resumen ejecutivo mensual

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

---------------------------------------------
-- Consulta 2: Ranking de productos
-- Top 5 por facturación

SELECT TOP 5
           id_producto,
           SUM(cantidad) AS unidades_vendidas,
           SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;

---------------------------------------------
-- Consulta 3: Clientes recurrentes
SELECT
          id_cliente,
          COUNT(*) AS cantidad_pedidos,
          SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) >1
ORDER BY total_gastado DESC;

-----------------------------------------------
-- Consulta 4: Meses por encima o por debajo
-- del promedio mensual

WITH ventas_mensuales AS (
SELECT
      MONTH(fecha_venta) AS mes,
      SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY MONTH(fecha_venta)
)

SELECT 
       mes,
       total_facturado,
       CASE
       WHEN total_facturado > 
           (SELECT AVG(total_facturado) FROM ventas_mensuales)
      THEN 'por encima'
      ELSE 'por debajo'
      END AS comparación_promedio
FROM ventas_mensuales
ORDER BY mes;

--1. El cliente con id_cliente = 1 fue el que registró el mayor gasto total en el período analizado.
-- 2. El mes de marzo presentó la mayor facturación del trimestre.
-- 3. El producto con id_producto = 5 fue el que registró la mayor cantidad de unidades vendidas.
