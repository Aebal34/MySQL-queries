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
SELECT producto.* FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo';
-- Tienda queries - 27
SELECT producto.* FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;
-- Tienda queries - 28
SELECT producto.* FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE (fabricante.nombre = 'Asus' OR fabricante.nombre = 'Seagate' OR fabricante.nombre = 'Hewlett-Packard');
-- Tienda queries - 29
SELECT producto.* FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre IN ('Asus', 'Seagate', 'Hewlett-Packard');
-- Tienda queries - 30
SELECT producto.nombre, producto.precio FROM PRODUCTO LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%e';
-- Tienda queries - 31
SELECT p.nombre, p.precio FROM producto AS p LEFT JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%w%';
-- Tienda queries - 32
SELECT p.nombre, p.precio, f.nombre AS fabricante_nombre FROM producto AS p LEFT JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE p.precio > 180 ORDER BY p.precio DESC, p.nombre ASC;
-- Tienda queries - 33
SELECT DISTINCT fabricante.* FROM fabricante RIGHT JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
-- Tienda queries - 34
SELECT * FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
-- Tienda queries - 35
SELECT fabricante.* FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE producto.codigo_fabricante IS NULL;
-- Tienda queries - 36
SELECT producto.* FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Lenovo';
-- Tienda queries - 37
SELECT producto.* FROM producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante AND producto.precio =  (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
-- Tienda queries - 38
SELECT nombre FROM producto  WHERE precio = (SELECT MAX(precio) FROM producto  JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo');
-- Tienda queries - 39
SELECT nombre FROM producto WHERE precio = (SELECT MIN(precio) FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Hewlett-Packard');
-- Tienda queries - 40
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto  JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo');
-- Tienda queries - 41
SELECT * FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus' AND precio > (SELECT AVG(precio) FROM producto RIGHT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus');