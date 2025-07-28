-- 1. Muestra todos los nombres y apellidos de los clientes registrados.
SELECT CONCAT(e.nombre, ' ',e.apellido) AS Empleado		
FROM empleados e;

-- 2. Lista todos los productos con un precio mayor a 50.
SELECT *
FROM productos p
WHERE p.Precio > 50;

-- 3. Muestra el nombre de los empleados cuyo departamento es 'Ventas'.
SELECT *
FROM empleados e
WHERE e.DepartamentoID = '1';
			
-- 4. Obtén todos los pedidos realizados en el año 2023.
SELECT *
FROM ordenes o
WHERE YEAR(o.Fecha) = 2023;

-- 5. Muestra los nombre de clientes que empiezan con la letra 'J'.
SELECT *
FROM clientes c
WHERE c.Nombre LIKE 'J%';

-- 6. Lista los nombres de los clientes que viven en Uruguay.
SELECT *
FROM clientes c
WHERE c.Pais = 'Uruguay';

-- 7. Muestra el nombre de los productos que comienzan con la letra 'T'.
SELECT p.Nombre AS producto
FROM productos p
WHERE p.Nombre LIKE 'T%';

-- 8. Lista todos los clientes ordenados alfabéticamente por apellido.
SELECT *
FROM clientes c
ORDER BY c.Apellido;

-- 9. Muestra los productos cuyo precio está entre 100 y 300.
SELECT *
FROM productos p
WHERE p.Precio BETWEEN 100 AND 300;

-- 10. Lista las ordenes cuyo total sea mayor a 500.
SELECT *
FROM ordenes o
WHERE o.Total > 500;