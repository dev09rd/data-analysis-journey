-- Day 5: SQL Basics
-- Author: dev09rd
-- Topics: Compare, filter and reason data

CREATE TABLE ventas_detalladas (
    venta_id INTEGER PRIMARY KEY,
    cliente TEXT,
    producto TEXT,
    categoria TEXT,
    precio INTEGER,
    cantidad INTEGER,
    fecha TEXT
);


INSERT INTO ventas_detalladas VALUES
(1, 'Ana', 'Laptop', 'Tecnologia', 1200, 1, '2024-01-05'),
(2, 'Ana', 'Mouse', 'Tecnologia', 50, 2, '2024-01-06'),
(3, 'Ana', 'Silla', 'Hogar', 300, 1, '2024-01-07'),

(4, 'Juan', 'Laptop', 'Tecnologia', 1200, 1, '2024-01-05'),
(5, 'Juan', 'Teclado', 'Tecnologia', 100, 1, '2024-01-06'),
(6, 'Juan', 'Monitor', 'Tecnologia', 400, 1, '2024-01-08'),

(7, 'Maria', 'Mesa', 'Hogar', 500, 1, '2024-01-09'),
(8, 'Maria', 'Silla', 'Hogar', 300, 2, '2024-01-10'),

(9, 'Carlos', 'Audifonos', 'Tecnologia', 200, 2, '2024-01-11'),
(10, 'Carlos', 'Mouse', 'Tecnologia', 50, 1, '2024-01-12'),

(11, 'Laura', 'Libro', 'Educacion', 40, 3, '2024-01-13'),
(12, 'Laura', 'Curso Online', 'Educacion', 150, 1, '2024-01-14');


-- ¿Qué clientes gastaron más que el gasto promedio de todos?
SELECT cliente,
       SUM(precio * cantidad) AS total_gastado
FROM ventas_detalladas
GROUP BY cliente
HAVING total_gastado > (
    SELECT AVG(precio * cantidad)
    FROM ventas_detalladas
);


-- ¿Qué categorías generan más ingresos que el promedio?
SELECT categoria,
       SUM(precio * cantidad) AS ingresos
FROM ventas_detalladas
GROUP BY categoria
HAVING ingresos > (
    SELECT AVG(precio * cantidad)
    FROM ventas_detalladas
);

-- ¿Qué productos generan más ingresos totales que el ingreso promedio de todos los productos?
SELECT producto,
       SUM(precio * cantidad) AS ingreso_total
FROM ventas_detalladas
GROUP BY producto
HAVING SUM(precio * cantidad) > (
    SELECT AVG(ingreso_producto)
    FROM (
        SELECT SUM(precio * cantidad) AS ingreso_producto
        FROM ventas_detalladas
        GROUP BY producto
    )
);

-- Filtrar las ventas de laptops durante el año 2024
SELECT *
FROM ventas_detalladas
WHERE producto = 'Laptop'
  AND fecha BETWEEN '2024-01-01' AND '2024-12-31';

-- ¿Qué categorías tienen más de 5 ventas?
SELECT categoria,
       COUNT(*) AS total_ventas
FROM ventas_detalladas
GROUP BY categoria
HAVING COUNT(*) > 5; -- NO SE PUEDE USAR WHERE COUNT(*)!!

-- Clientes cuyo gasto total es mayor al promedio de gasto por cliente
SELECT cliente
FROM ventas_detalladas v
GROUP BY cliente
HAVING SUM(precio * cantidad) > (
    SELECT AVG(gasto_cliente)
    FROM (
        SELECT SUM(precio * cantidad) AS gasto_cliente
        FROM ventas_detalladas
        GROUP BY cliente
    )
);





