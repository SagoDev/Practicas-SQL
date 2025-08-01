-- 1. Muestra los nombres de los clientes junto con el número de cada pedido.
SELECT c.Nombre AS cliente,
		 O.ID AS Orden
FROM clientes c
	JOIN ordenes o ON o.ClienteID = c.ID;

-- 2. Lista los productos vendidos en cada pedido con su cantidad.
SELECT op.OrdenID AS Orden,
		 p.Nombre AS Producto,
		 op.Cantidad
FROM productos p
	JOIN ordenproductos op ON op.ProductoID = p.ID;

-- 3. Muestra los nombres de los empleados junto con los pedidos que gestionaron.
SELECT e.Nombre AS Empleado,
		 o.ID AS Orden
FROM empleados e
	JOIN ordenes o ON o.EmpleadoID = e.ID;

-- 4. Muestra todos los pedidos con los datos completos del cliente.
SELECT o.ID AS Orden,
		 o.Fecha,
		 o.Total,
		 c.*
FROM ordenes o
	JOIN clientes c ON c.ID = o.ClienteID;

-- 5. Muestra los productos junto con el nombre de su categoría.
SELECT p.Nombre AS Producto,
		 c.Nombre AS Categoria
FROM productos p
	JOIN categorias c ON c.ID = p.CategoriaID;

-- 6. Muestra los pedidos junto con los nombres de los productos incluidos en ellos.
SELECT op.OrdenID AS Orden,
		 p.Nombre AS 'Productos'
FROM ordenproductos op
	JOIN productos p ON p.ID = op.ProductoID;
	
-- 7. Muestra los nombres de clientes que no han hecho ningún pedido.
SELECT CONCAT(c.Nombre,' ',c.Apellido) AS Cliente
FROM clientes c
	LEFT JOIN ordenes o ON o.ClienteID = c.ID
WHERE o.ClienteID IS NULL;
	
-- 8. Lista todos los productos que no tienen una categoría asignada.
SELECT p.*
FROM productos p
   LEFT JOIN categorias c ON c.ID = p.CategoriaID
WHERE p.CategoriaID IS NULL;

-- 9. Muestra la cantidad total de productos por proveedor.
SELECT pv.Nombre AS Proveedor,
		 COUNT(p.ID) AS Cantidad
FROM proveedores pv
	JOIN productos p ON p.ProveedorID = pv.ID
GROUP BY Proveedor;

-- 10. Muestra los nombres de los empleados y sus respectivos departamentos.
SELECT e.Nombre AS Empleado,
		 d.Nombre AS Departamento
FROM empleados e
	JOIN departamentos d ON d.ID = e.DepartamentoID;