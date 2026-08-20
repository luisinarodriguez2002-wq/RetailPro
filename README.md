# README
# Pipeline ETL – TechStore

## Objetivo
El objetivo de este pipeline fue conectar Power BI al dataset de ventas y preparar los datos para su posterior modelado, eliminando inconsistencias y asegurando la calidad de la información.

---

## Criterio de limpieza de datos
### Tabla Dim_Clientes
- Se eliminó un registro duplicado utilizando **id_cliente** como clave única, ya que una dimensión debe contener un único registro por cliente.
- Los valores nulos de **email** se reemplazaron por `sin_email@techstore.com` para conservar el registro del cliente.
- Los valores nulos de **ciudad** se reemplazaron por **"Sin datos"**, evitando perder información útil por un campo faltante.

### Tabla Dim_Productos
- Se eliminó el producto duplicado mediante **id_producto**.
- El registro con **precio nulo** fue eliminado porque un producto sin precio impide calcular ingresos y afecta la calidad del análisis.
- La **categoría nula** se reemplazó por **"Sin categoría"** para mantener el producto dentro del catálogo sin asignarle una categoría incorrecta.

---

## Transformaciones realizadas
1. Importación de las tablas desde Excel.
2. Eliminación de duplicados por clave primaria.
3. Tratamiento de valores nulos según el criterio de negocio.
4. Corrección de tipos de datos (fechas, números y texto).
5. Renombrado de consultas con la nomenclatura `Dim_` y `Fact_`.
6. Merge entre `Fact_Ventas` y `Dim_Productos` para incorporar `nombre_producto` y `categoria`.

---

## Resultado final
- **Dim_Clientes:** 11 registros.
- **Dim_Productos:** 11 registros.
- **Fact_Ventas:** 50 registros.
- **Dim_Categorias:** 4 registros.

El modelo quedó preparado para la etapa de modelado y creación de medidas en Power BI.
