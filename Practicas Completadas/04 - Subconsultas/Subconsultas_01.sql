-- 1. Muestra los empleados que ganan más que el salario promedio.
SELECT *                                       
FROM empleados e                                       
WHERE e.Salario > (SELECT AVG(salario) FROM empleados);  
                                                       
-- 2. Encuentra los productos cuyo precio es mayor que el promedio.
SELECT *
FROM productos p
WHERE p.Precio > (SELECT AVG(Precio) FROM productos);

-- 3. Lista los clientes que hicieron al menos una orden.
SELECT *
FROM clientes c
WHERE c.ID IN (SELECT ClienteID FROM ordenes);

-- 4. Muestra los empleados que trabajan en el mismo departamento que ‘Carlos’.
SELECT *
FROM empleados e
WHERE e.DepartamentoID = (SELECT DepartamentoID FROM empleados WHERE Nombre = 'Carlos');
			
-- 5. Muestra los productos cuya categoría es 'Electrónica'.
SELECT *
FROM productos p
WHERE p.CategoriaID = (SELECT ID FROM categorias WHERE Nombre = 'Electrónica');

-- 6. Encuentra los clientes que no han hecho órdenes en 2023.
SELECT *
FROM clientes c
WHERE c.ID NOT IN (SELECT ClienteID FROM ordenes WHERE YEAR(Fecha) = 2023);

-- 7. Muestra los nombres de empleados con el salario más alto.
SELECT *
FROM empleados e
WHERE e.Salario = (SELECT MAX(Salario) FROM empleados);

-- 8. Lista los departamentos con más de 1 empleados.
SELECT DepartamentoID AS Departamento
FROM empleados 
GROUP BY DepartamentoID 
HAVING COUNT(*) > 1;

-- 9. Muestra los productos vendidos más de 1 vez. 
SELECT ProductoID AS Producto
FROM ordenproductos
GROUP BY ProductoID
HAVING SUM(Cantidad) > 1;

-- 10. Muestra las órdenes con el mayor total de venta.
SELECT *
FROM ordenes o
WHERE o.Total = (SELECT MAX(Total) FROM ordenes);