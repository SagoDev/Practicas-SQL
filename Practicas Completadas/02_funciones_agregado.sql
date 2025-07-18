-- PRACTICAS: Funciones de agregado --

-- 1. Cuenta cuántos empleados hay en total.
SELECT COUNT(Nombre) AS 'Cantidad de Empleados'
FROM empleados;

-- 2. Muestra el salario promedio de todos los empleados.
SELECT AVG(Salario) AS 'Salario Promedio'
FROM empleados;

-- 3. Encuentra el salario máximo en la empresa.
SELECT MAX(Salario)
FROM empleados;

-- 4. Muestra el número total de productos vendidos.
SELECT COUNT(ProductoID) AS 'Total Productos Vendidos'
FROM ordenproductos;

-- 5. Calcula el total de ventas por producto.
SELECT	ProductoID AS 'ID de Producto',
		SUM(Cantidad) AS 'Cantidad Vendido'
FROM ordenproductos
GROUP BY ProductoID;

-- 6. Muestra la cantidad de clientes por país.
SELECT 	Pais,
		COUNT(ID) AS 'Cantidad de Clientes'
FROM clientes
GROUP BY Pais;

-- 7. Muestra el producto más barato.
SELECT *
FROM productos
ORDER BY Precio ASC
LIMIT 1;

-- 8. Muestra el ingreso total generado por ventas.
SELECT SUM(Total) AS 'Total Ventas'
FROM ordenes;

-- 9. Muestra la fecha más reciente de ingreso de un cliente.
SELECT *
FROM clientes
ORDER BY FechaIngreso DESC
LIMIT 1;

-- 10. Calcula el promedio de edad de los empleados.
SELECT AVG(Edad) AS 'Promedio de Edad'
FROM empleados;