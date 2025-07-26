-- 1. Inserta un nuevo cliente en la tabla 'Clientes'.
INSERT INTO clientes(Nombre, Apellido, Email, Direccion, Pais, FechaIngreso)
VALUES ('Jose', 'Rodo','jose@examlpe.com', 'Calle 5','Argentina','2025-07-23');

-- 2. Inserta un nuevo producto con categoría 'Oficina'.
INSERT INTO productos(Nombre, Precio,CategoriaID, ProveedorID)
VALUES('Lapicera (x20)', 10,(SELECT ID FROM categorias WHERE Nombre = 'Oficina'));

-- 3. Actualiza el salario de todos los empleados en un 10%.
UPDATE empleados
SET Salario = Salario * 1.10;

-- 4. Elimina todos los productos que no se vendieron.
DELETE
FROM productos p
WHERE p.ID NOT IN (SELECT ProductoID FROM ordenproductos);

-- 5. Inserta una nueva orden para un cliente específico.
INSERT INTO ordenes (ClienteID, Fecha, Total)
VALUES (1, CURRENT_DATE, 250);

-- 6. Actualiza la dirección de un cliente.
UPDATE clientes c
SET c.Direccion = 'Calle 6';

-- 7. Borra todos los empleados que ya no están activos.
DELETE
FROM empleados e
WHERE e.Activo = 0;

-- 8. Inserta múltiples registros en la tabla 'Proveedores'.
INSERT INTO proveedores (Nombre, Telefono)
VALUES	('Probador P.M.', 112233),
			('Aqua S.A.', 445566);
			
-- 9. Aumenta el precio de todos los productos electrónicos en un 5%.
UPDATE productos
SET Precio = Precio * 1.05;

-- 10. Elimina a todos los clientes de un país específico.
DELETE
FROM clientes c
WHERE c.Pais = 'Uruguay';
