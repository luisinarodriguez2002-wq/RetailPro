# RetailPro — Análisis Comercial y Modelado de Datos SQL

## Descripción del Proyecto
Este proyecto desarrolla un análisis comercial integral para **RetailPro** a partir de la base de datos `Ventas_Tech_DB`. 

El trabajo abarca desde la estructuración y modificación del modelo relacional hasta la creación de consultas SQL analíticas para la toma de decisiones comerciales. Se aplican criterios de optimización, legibilidad y buenas prácticas de modelado relacional preparando la arquitectura de datos para su posterior consumo en **Power BI**.

El objetivo principal es extraer métricas de negocio clave evaluando el desempeño comercial a través de variables como clientes, productos, territorios, categorías, canales de distribución y temporalidad.

---

## Objetivos del Proyecto
* **Evolución Comercial:** Analizar la tendencia de ventas y facturación periódica.
* **Segmentación de Clientes:** Identificar clientes recurrentes y cuentas de mayor valor (*VIP/Whale*).
* **Rendimiento de Catálogo:** Clasificar productos según rotación en unidades e ingresos generados.
* **Análisis Comparativo:** Evaluar la facturación mensual frente al promedio histórico.
* **Enriquecimiento del Modelo:** Incorporar variables de segmento, territorio y canal de venta.
* **Buenas Prácticas:** Aplicar estándares de código SQL (aliasing, estandarización de JOINs, formateo y creación de índices).

---

## Herramientas y Tecnologías
* **SQL Server:** Motor de base de datos relacional y gestión del modelo.
* **SQL (T-SQL):** Consultas avanzadas (`INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING`, `CASE`, `CTE` y funciones de agregación).
* **Power BI:** Modelado multidimensional, DAX y visualización de dashboards.
* **Power Query / Lenguaje M:** ETL, limpieza y transformación de datos.
* **Excel:** Validación inicial y origen de datos estructurados.
* **Git & GitHub:** Control de versiones y documentación técnica.

---

## Modelo de Datos Relacional

La base de datos central es **`Ventas_Tech_DB`**. Para enriquecer el análisis se ampliaron las entidades originales incorporando atributos clave de negocio:

* **`clientes`**: Se añadió el campo `segmento` y la clave foránea `id_territorio`.
* **`ventas`**: Se incorporó el atributo `canal` (Online / Presencial).
* **`territorios`**: Nueva tabla dimensional con regiones (`Centro`, `Norte`, `Sur`).

### Diagrama Entidad-Relación (Estructura Lógica)

```text
territorios (1) ───< (N) clientes (1) ───< (N) ventas (N) >─── (1) productos (N) >─── (1) categorias
