-- Day 1: SQL Basics
-- Author: dev09rd
-- Topics: SELECT, WHERE, ORDER BY, OR, AND

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

-- Se pueden visualizar todas las ventas 
SELECT *
FROM ventas;

-- Solo se visualiza la columna cliente y producto
SELECT cliente, producto
FROM ventas;

-- Solo se visualiza las ventas que entran dentro de la categoria 'Tecnologia'
SELECT *
FROM ventas
WHERE categoria = 'Tecnologia';

-- Solo se visualiza ventas que el precio es mayor a 100
SELECT *
FROM ventas
WHERE precio > 100;

-- Solo se visualiza ventas realizas a Ana
SELECT *
FROM ventas
WHERE cliente = 'Ana';

-- Se ordena las ventas por el precio (De menor a mayor, en orden ascendente)
SELECT *
FROM ventas
ORDER BY precio;

-- Se ordena las ventas por cantidad (De mayor a menor, en orden descendente)
SELECT *
FROM ventas
ORDER BY cantidad DESC;

-- Solo se visualiza las ventas que entran en la categoria 'Tecnologia' y las ordena por el precio (De mayor a menor)
SELECT *
FROM ventas
WHERE categoria = 'Tecnologia'
ORDER BY precio DESC;

-- Solo visualiza ventas que el precio se encuentra entre el rango 50-500
SELECT *
FROM ventas
WHERE precio BETWEEN 50 AND 500;

-- Se visualizan todas las ventas que no pertenezcan a la categoria 'Tecnologia'
SELECT *
FROM ventas
WHERE categoria != 'Tecnologia';

-- Solo se visualizan las ventas que entran en la categoria 'Hogar' y que su precio es mayor a 200
SELECT *
FROM ventas
where categoria = 'Hogar'
    and precio > 200;

-- WHERE sirve para filtrar filas
-- ORDER BY sirve para ordenar resultados
-- SELECT * no siempre es buena idea porque muestra columnas innecesarias
-- Utiliza AND o OR para cuando quieras agregar mas de 1 filtro









