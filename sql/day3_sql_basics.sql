-- Day 3: SQL Basics
-- Author: dev09rd
-- Topics: HAVING()

CREATE TABLE ventas (
    id INTEGER,
    cliente TEXT,
    producto TEXT,
    categoria TEXT,
    precio REAL,
    cantidad INTEGER
);

INSERT INTO ventas VALUES
(1, 'Ana', 'Laptop', 'Tecnologia', 1200, 1),
(2, 'Luis', 'Mouse', 'Tecnologia', 25, 2),
(3, 'Carlos', 'Silla', 'Hogar', 150, 1),
(4, 'Ana', 'Teclado', 'Tecnologia', 80, 1),
(5, 'Maria', 'Mesa', 'Hogar', 300, 3),
(6, 'Luis', 'Monitor', 'Tecnologia', 400, 2);

-- ¿Qué productos vendieron más de 3 unidades en total?
SELECT producto, SUM(cantidad) AS unidades_totales
FROM ventas
GROUP BY producto
HAVING SUM(cantidad) > 2
ORDER BY unidades_totales DESC;

-- ¿Qué clientes gastaron más de $500 en total?
SELECT cliente, SUM(precio * cantidad) AS gasto_total
FROM ventas
GROUP BY cliente
HAVING SUM(precio * cantidad) > 500
ORDER BY gasto_total DESC;

-- En la categoría Tecnología, ¿qué productos generaron más de $300?
SELECT producto, SUM(precio * cantidad) AS ventas_totales
FROM ventas
WHERE categoria = 'Tecnologia'
GROUP BY producto
HAVING SUM(precio * cantidad) > 300
ORDER BY ventas_totales DESC;

-- ¿Que categorias generaron más de $1000?
SELECT categoria, SUM(precio * cantidad) AS ingresos_totales
FROM ventas
GROUP BY categoria
HAVING SUM(precio * cantidad) > 1000
ORDER BY ingresos_totales DESC;




