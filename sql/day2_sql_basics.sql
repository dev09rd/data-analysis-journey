-- Day 2: SQL Basics
-- Author: dev09rd
-- Topics: COUNT(), SUM(), AVG(), GROUP BY

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
(5, 'Maria', 'Mesa', 'Hogar', 300, 1),
(6, 'Luis', 'Monitor', 'Tecnologia', 400, 1);

-- Cuenta cuantas ventas se realizaron en total (Output: 6)
SELECT COUNT(*) AS total_ventas
FROM ventas;

-- Cuenta cuantas ventas se realizaron por categoria (Output: Hogar = 2 y Tecnologia = 4)
SELECT categoria, COUNT(*) AS total_ventas
FROM ventas
GROUP BY categoria;

-- Muestra los ingresos totales de las ventas por categoria (Output: Hogar = 450 y Tecnologia = 1730)
SELECT categoria, SUM(precio * cantidad) AS ingresos_totales
FROM ventas
GROUP BY categoria;

-- Muestra el precio promedio por categoria (Output: Hogar = 225 y Tecnologia = 426.25)
SELECT categoria, AVG(precio) AS precio_promedio
FROM ventas
GROUP BY categoria;

-- Muesta cuanto gasto cada cliente por separado (Output: Ana = 1280, Carlos = 150, Luis = 450, Maria = 300)
SELECT cliente, SUM(precio * cantidad) AS gasto_total
FROM ventas
GROUP BY cliente;

-- Muestra cuantas ventas se realizaron en la categoria Tecnologia (Output: 4)
SELECT categoria, COUNT(*) AS total_ventas
FROM ventas
WHERE categoria = 'Tecnologia'
GROUP BY categoria;

-- Muestra que categoria gasto mas de mayor a menor (Output: Tecnologia = 1730 Hogar = 450)
SELECT categoria, SUM(precio * cantidad) AS ventas_totales
FROM ventas
GROUP by categoria
ORDER BY ventas_totales DESC;

-- Muestra que Cliente gasto mas de mayor a menor 
SELECT cliente, SUM(precio * cantidad) AS gastos_totales
FROM ventas
GROUP BY cliente
ORDER BY gastos_totales DESC;

-- DAY 2 REFLECTION
-- 1. Para que sirve GROUP BY: Sirve para agrupar filas que comparten un mismo valor y aplicar funciones agregadas sobre cada grupo.
-- 2. Diferencia entre COUNT(*) y SUM(): COUNT(*) cuenta el número de filas en un grupo (incluye valores NULL) y SUM(Columna) suma los valores numéricos de una columna o mas columnas.
-- 3. Que tipo de preguntas puedo responder ahora que antes no podia: ¿Cuales son las ventas totales? ¿Cuanto gasto cada cliente? ¿Cuanto gastaron por categoria en promedio? ¿Cuales fueron los clientes con mayor gasto? ¿Cual fue el numero total de transacciones?