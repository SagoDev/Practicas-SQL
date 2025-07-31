-- 1. Cuenta la cantidad total de productos registrados.
SELECT COUNT(ID) AS 'Total de Productos'
FROM productos;

-- 2. Calcula el precio promedio de todos los productos.
SELECT AVG(precio) AS 'Precio Promedio'
FROM productos;

-- 3. Muestra el total de ventas realizadas en 2025.
SELECT COUNT(ID) AS 'Total ventas 2025'
FROM ordenes
WHERE YEAR(Fecha) = 2025;

-- 4. Obtén el producto con el precio más alto.
SELECT  MAX(Precio)
FROM productos;

-- 5. Muestra el salario más bajo entre los empleados.
SELECT MIN(Salario)
FROM empleados;

-- 6. Agrupa los productos por categoría y muestra la cantidad por cada una.
SELECT CategoriaID AS Categoría,
		 SUM(ID) AS Cantidad
FROM productos
GROUP BY Categoría;

-- 7. Muestra el total de ventas por cliente.
SELECT o.ClienteID AS Cliente,
		 SUM(o.Total) AS 'Total de Compras'
FROM ordenes o
GROUP BY Cliente;

-- 8. Calcula el ingreso total por año.
SELECT YEAR(o.Fecha) AS Año,
		 SUM(o.Total) AS Total
FROM ordenes o
GROUP BY Año;

-- 9. Muestra el número de empleados por departamento.
SELECT DepartamentoID AS Departamento,
		 COUNT(ID) AS 'Empleados'
FROM empleados
GROUP BY Departamento;

-- 10. Muestra la fecha del pedido más reciente.
SELECT MAX(o.Fecha) AS Fecha		 
FROM ordenes o;