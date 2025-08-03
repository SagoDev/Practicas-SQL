-- 1. Muestra los productos cuyo precio es menor al precio promedio.
SELECT *                  
FROM productos p          
WHERE  p.Precio < (SELECT AVG(Precio) FROM productos);
                          
-- 2. Lista los clientes que han realizado más de un pedido.
SELECT CONCAT(c.Nombre,' ', c.Apellido) AS Cliente
FROM clientes c           
WHERE c.ID IN (SELECT ClienteID FROM ordenes GROUP BY ClienteID HAVING COUNT(*) > 1);
                          
-- 3. Muestra los empleados que no han realizado ninguna venta.
SELECT e.Nombre AS Empleado
FROM empleados e          
WHERE e.ID NOT IN (SELECT EmpleadoID FROM ordenes);
                          
-- 4. Lista los productos que nunca se han vendido.
SELECT *                  
FROM productos p          
WHERE p.ID NOT IN (SELECT ProductoID FROM ordenproductos);
                          
-- 5. Obtén el nombre del cliente que realizó el pedido más reciente.
SELECT CONCAT(c.Nombre,' ', c.Apellido) AS Cliente
FROM clientes c           
WHERE c.ID = (SELECT ClienteID FROM ordenes WHERE Fecha = (SELECT MAX(Fecha) FROM ordenes));
                          
-- 6. Muestra los nombres de los productos de menor precio del proveedor 'Distribuidora XYZ'.
SELECT *
FROM productos p
WHERE p.ID IN (SELECT ID FROM productos WHERE Precio =(SELECT MIN(Precio) FROM productos WHERE ProveedorID = (SELECT ID FROM proveedores WHERE Nombre = 'Distribuidora XYZ')));  
                
-- 7. Muestra los productos con el precio más alto de la categoría 'Electrónica'.
SELECT *
FROM productos p
WHERE p.ID IN (SELECT ID FROM productos WHERE Precio =(SELECT MAX(Precio) FROM productos WHERE CategoriaID = (SELECT ID FROM categorias WHERE Nombre = 'Electrónica')));                         
                          
-- 8. Muestra los nombre de empleados que pertenecen a un proyecto.
SELECT *                 
FROM empleados e          
WHERE e.ID IN(SELECT EmpleadoID FROM empleadoproyecto);    
                          
-- 9. Lista los pedidos que contienen más de 3 productos distintos.
SELECT *
FROM ordenes o
WHERE o.ID IN(SELECT OrdenID FROM ordenproductos GROUP BY OrdenID HAVING COUNT(ProductoID) > 3);                       
                          
-- 10. Muestra los empleados del departamento de 'Ventas' cuyo salario está por encima del promedio del departamento.
SELECT *                  
FROM empleados e
WHERE e.ID IN (SELECT ID FROM empleados WHERE Salario > (SELECT AVG(Salario) FROM empleados WHERE DepartamentoID = (SELECT ID FROM departamentos WHERE Nombre = 'Ventas')));