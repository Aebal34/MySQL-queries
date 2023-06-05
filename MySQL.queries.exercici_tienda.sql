-- Tienda queries - 1
SELECT nombre FROM producto;
-- Tienda queries - 2
SELECT nombre, precio FROM producto;
-- Tienda queries - 3
SELECT * FROM producto;
-- Tienda queries - 4
SELECT nombre, CONCAT(FORMAT(precio, 2), '€') AS precio_€, CONCAT('$', FORMAT(precio, 2)) AS precio_$ FROM producto;
-- Tienda queries - 5
SELECT nombre, CONCAT(FORMAT(precio, 2), '€') AS euros, CONCAT('$', FORMAT(precio, 2)) AS dólares FROM producto;
-- Tienda queries - 6
SELECT UPPER(nombre), precio FROM producto;
-- Tienda queries - 7
SELECT LOWER(nombre), precio FROM producto;
-- Tienda queries - 8
SELECT nombre, UPPER(LEFT(nombre, 2)) AS acronym FROM fabricante;
-- Tienda queries - 9
SELECT nombre, ROUND(precio) AS precio FROM producto;
-- Tienda queries - 10
SELECT nombre, FLOOR(precio) AS precio FROM producto;
-- Tienda queries - 11
SELECT fabricante.codigo FROM fabricante, producto WHERE fabricante.codigo = producto.codigo_fabricante;
-- Tienda queries - 12
SELECT DISTINCT fabricante.codigo FROM fabricante, producto WHERE fabricante.codigo = producto.codigo_fabricante;
-- Tienda queries - 13
SELECT nombre FROM fabricante ORDER BY nombre ASC;
-- Tienda queries - 14
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- Tienda queries - 15
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
-- Tienda queries - 16
SELECT * FROM fabricante LIMIT 5;
-- Tienda queries - 17
SELECT * FROM fabricante LIMIT 3, 2;
-- Tienda queries - 18
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
-- Tienda queries - 19
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
-- Tienda queries - 20
SELECT producto.nombre FROM producto RIGHT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.codigo = 2;
-- Tienda queries - 21
SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto, fabricante;
-- Tienda queries - 22
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto AS p, fabricante AS f ORDER BY f.nombre ASC;
-- Tienda queries - 23
SELECT p.codigo AS codigo_producto, p.nombre AS nombre_producto, f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante FROM producto AS p, fabricante AS f;
-- Tienda queries - 24
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MIN(precio) FROM producto);
-- Tienda queries - 25
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MAX(precio) FROM producto);
-- Tienda queries - 26




