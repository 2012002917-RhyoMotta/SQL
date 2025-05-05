use tienda;

/*Consultas multitabla (Composición interna) 
Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.*/

/*Devuelve una lista con el nombre del producto, precio y nombre de
fabricante de todos los productos de la base de datos*/

SELECT
	producto.nombre as Producto,
	producto.precio,
	fabricante.nombre as Fabricante
FROM 
	producto
JOIN
	fabricante on producto.id_Fabricante = fabricante.id;

/*Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos 
los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por 
orden alfabético.*/

SELECT
	producto.nombre as Producto,
	producto.precio as Precio,
	fabricante.nombre as Fabricante
FROM 
	producto
JOIN
	fabricante on producto.id_Fabricante = fabricante.id
ORDER BY
	fabricante.nombre ASC;

/*Devuelve una lista con el identificador del producto, nombre del producto, identificador 
del fabricante y nombre del fabricante, de todos los productos de la base de datos.*/

SELECT
	producto.nombre as Producto,
	producto.id,
	fabricante.id,
	fabricante.nombre as Fabricante
FROM
	producto
JOIN 
	fabricante on producto.id_fabricante = fabricante.id

/*Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto m s barato.*/
SELECT 
    producto.nombre as Producto,
    producto.precio,
    fabricante.nombre as Fabricante
FROM 
    producto
JOIN 
    fabricante on producto.id_fabricante = fabricante.id
WHERE 
    producto.precio = (SELECT MIN(precio) FROM producto);

/*Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto m s caro.*/
SELECT 
    producto.nombre as Producto,
    producto.precio,
    fabricante.nombre as Fabricante
FROM 
    producto
JOIN 
    fabricante on producto.id_fabricante = fabricante.id
WHERE 
    producto.precio = (SELECT MAX(precio) FROM producto);

/*Devuelve una lista de todos los productos del fabricante Lenovo.*/
SELECT 
    producto.nombre as Producto,
    producto.precio,
    fabricante.nombre as Fabricante
FROM 
    producto
JOIN 
    fabricante on producto.id_fabricante = fabricante.id
WHERE 
    fabricante.nombre = 'Lenovo';

/*Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200 .*/
SELECT 
    producto.nombre as Producto,
    producto.precio,
    fabricante.nombre as Fabricante
FROM 
    producto
JOIN 
    fabricante on producto.id_fabricante = fabricante.id
WHERE 
    fabricante.nombre = 'Crucial'
    AND producto.precio > 200;

/*Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.*/
SELECT 
    producto.nombre as Producto,
    producto.precio,
    fabricante.nombre as Fabricante
FROM 
    producto
JOIN 
    fabricante on producto.id_fabricante = fabricante.id
WHERE 
    fabricante.nombre = 'Asus'
    OR fabricante.nombre = 'Hewlett-Packard'
    OR fabricante.nombre = 'Seagate';

/*Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.*/
SELECT 
    producto.nombre as Producto,
    producto.precio,
    fabricante.nombre as Fabricante
FROM 
    producto
JOIN 
    fabricante on producto.id_fabricante = fabricante.id
WHERE 
    fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

/*Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.*/
SELECT 
    producto.nombre as Producto,
    producto.precio, fabricante.nombre as Fabricante
FROM 
    producto
JOIN 
    fabricante on producto.id_fabricante = fabricante.id
WHERE 
    fabricante.nombre LIKE '%e';

/*Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el car cter w en su nombre.*/
SELECT 
    producto.nombre as producto,
    producto.precio, fabricante.nombre as fabricante
FROM 
    producto
JOIN 
    fabricante on producto.id_fabricante = fabricante.id
WHERE 
    fabricante.nombre LIKE '%w%';

/*Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan 
un precio mayor o igual a 180 . Ordene el resultado en primer lugar por el precio (en orden descendente) 
y en segundo lugar por el nombre (en orden ascendente)*/
SELECT 
    producto.nombre as producto,
    producto.precio,
    fabricante.nombre as fabricante
FROM 
    producto
JOIN 
    fabricante on producto.id_fabricante = fabricante.id
WHERE 
    producto.precio >= 180
ORDER BY 
    producto.precio DESC,
    producto.nombre ASC;

/*Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos 
asociados en la base de datos.*/
SELECT 
    fabricante.id,
    fabricante.nombre
FROM 
    fabricante
WHERE 
    EXISTS (SELECT 1
			FROM producto
			WHERE producto.id_fabricante = fabricante.id);


/*Consultas multitabla (Composición externa) 
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.*/

/*Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los 
productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos 
fabricantes que no tienen productos asociados.*/
SELECT 
    fabricante.id as Codigo,
    fabricante.nombre as Fabricante,
	producto.nombre as Producto,
	producto.precio as Precio
FROM 
    fabricante
LEFT JOIN 
	producto on fabricante.id = producto.id_fabricante;

/*Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún 
producto asociado.*/
SELECT 
    fabricante.id as Codigo,
    fabricante.nombre as Fabricante,
	producto.nombre as Producto,
	producto.precio as Precio
FROM 
    fabricante
LEFT JOIN 
	producto on fabricante.id = producto.id_fabricante
WHERE producto.id_fabricante IS NULL;