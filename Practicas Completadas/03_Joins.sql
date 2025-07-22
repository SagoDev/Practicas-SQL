-- Practicas SQL: JOINS --

-- 1. Une las tablas 'Empleados' y 'Departamentos' para mostrar el nombre y departamento de cada empleado.
SELECT	e.Nombre AS Empleado,
		d.Nombre AS Departamento
FROM empleados e
	INNER JOIN departamentos d ON e.DepartamentoID = d.ID;

-- 2. Muestra todas las órdenes junto con el nombre del cliente que las realizó.
SELECT	o.ID AS Orden,
		c.Nombre AS Cliente
FROM ordenes o
	INNER JOIN clientes c ON o.ClienteID = c.ID;
			
-- 3. Muestra los productos y la cantidad vendida en las ordenes.
SELECT 	p.Nombre AS Producto,
		SUM(op.Cantidad) AS 'Cantidad Vendida'
FROM productos p
	INNER JOIN ordenproductos op ON p.ID = op.ProductoID
GROUP BY Producto;

-- 4. Lista los empleados y los proyectos en los que trabajan.
SELECT	e.Nombre AS Empleado,
		p.NombreProyecto AS Projecto
FROM empleadoproyecto ep
	INNER JOIN empleados e ON e.ID = ep.EmpleadoID
	INNER JOIN proyectos p ON p.ID = ep.ProyectoID;

-- 5. Muestra los clientes aunque no hayan realizado órdenes.
SELECT	CONCAT(c.Nombre,' ',c.Apellido) AS Cliente,
		o.ID AS 'Orden Id',
		o.Fecha AS 'Orden Fecha',
		o.Total AS 'Orden Total'
FROM clientes c
	LEFT JOIN ordenes o ON c.ID = o.ClienteID;

-- 6. Lista los productos que no esten asociados a una orden.
SELECT p.Nombre
FROM ordenproductos op
	RIGHT JOIN productos p ON op.ProductoID = p.ID
WHERE op.OrdenID IS NULL;


-- 7. Une las tablas 'Productos', 'Categorías' y 'Proveedores'.
SELECT	p.Nombre AS Producto,
		c.Nombre AS Categoria,
		pv.Nombre AS Proveedor
FROM productos p
	INNER JOIN categorias c ON  c.ID = p.CategoriaID
	INNER	JOIN proveedores pv ON pv.ID = p.ProveedorID;

-- 8. Muestra las órdenes con sus respectivas fechas y productos.
SELECT	o.ID AS 'Orden Id',
		o.Fecha AS 'Orden Fecha',
		p.Nombre AS Producto
FROM ordenes o
	INNER JOIN ordenproductos op ON op.OrdenID = o.ID
	INNER JOIN productos p ON p.ID = op.ProductoID
ORDER BY o.ID;

-- 9. Muestra el nombre del empleado que gestionó cada orden.
SELECT	o.ID AS Orden,
		e.Nombre AS Empleado
FROM empleados e
	INNER JOIN ordenes o ON o.EmpleadoID = e.ID;
	
-- 10. Lista todos los cursos junto con sus instructores.
SELECT 	c.NombreCurso AS Curso,
		i.NombreInstructor Instructor
FROM cursos c
	INNER JOIN instructores i ON i.ID = c.InstructorID;
