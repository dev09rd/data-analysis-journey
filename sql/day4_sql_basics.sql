-- Day 4: SQL Basics
-- Author: dev09rd
-- Topics: JOIN

CREATE TABLE ventas (
    venta_id INTEGER,
    cliente_id INTEGER,
    producto TEXT,
    precio REAL,
    cantidad INTEGER
);

INSERT INTO ventas VALUES
(1, 1, 'Mesa', 300, 1),
(2, 2, 'Laptop', 900, 1),
(3, 1, 'Silla', 150, 2);

CREATE TABLE clientes (
  cliente_id INTEGER PRIMARY KEY,
  nombre TEXT,
  ciudad TEXT
);

INSERT INTO clientes (cliente_id, nombre, ciudad) VALUES
(1, 'Maria', 'Madrid'),
(2, 'Juan', 'Bogota'),
(3, 'Ana', 'CDMX');

-- Ver cada venta con el nombre del cliente
SELECT v.producto, v.precio, v.cantidad, c.nombre
FROM ventas v
INNER JOIN clientes c
  ON v.cliente_id = c.cliente_id;

-- ¿Cuánto gasto cada cliente (con el nombre)?
SELECT c.nombre, SUM(v.precio * v.cantidad) AS gasto_total
FROM ventas v
INNER JOIN clientes c
  ON v.cliente_id = c.cliente_id
GROUP BY c.nombre
ORDER BY gasto_total DESC;

-- Ver los ingresos por ciudad
SELECT c.ciudad, SUM(v.precio * v.cantidad) AS ingresos
FROM ventas v
INNER JOIN clientes c
  ON v.cliente_id = c.cliente_id
GROUP BY c.ciudad
HAVING ingresos > 500
ORDER BY ingresos DESC;

-- ¿Cuántas compras realizó cada cliente (con el nombre)?
SELECT c.nombre, COUNT(*) as ventas_totales
FROM ventas v
INNER JOIN clientes c
    ON v.cliente_id = c.cliente_id
GROUP BY c.nombre
ORDER BY ventas_totales DESC;