-- 1. Inserta un nuevo producto con nombre "Café Premium", precio 150 y proveedor ID = 3.
INSERT INTO productos(Nombre, Precio, ProveedorID)
VALUES ('Café Premium', 150, 3);

-- 2. Crea una tabla para el stock de productos e inserta stock para todos los productos.
CREATE TABLE IF NOT EXISTS stockproductos(
`ProductoID` INT NOT NULL,
`Stock` INT NULL,
FOREIGN KEY (`ProductoID`) REFERENCES `productos` (ID));

INSERT INTO stockproductos(ProductoID, Stock)
VALUES(1,15),(2,9),(3,11),(4,5),(5,18);

-- 3. Elimina el cliente cuyo correo electrónico sea 'jose@example.com'.
DELETE
FROM clientes
WHERE Email = 'jose@example.com';

-- 4. Aumenta en un 30% el precio de todos los productos de la categoría "Electrónica".
UPDATE productos p
SET p.Precio = p.Precio * 1.3
WHERE p.CategoriaID = 1;

-- 5. Duplica el stock de los productos con menos de 10 unidades.
UPDATE stockproductos 
SET Stock = Stock * 2
WHERE Stock < 10;

-- 6. Inserta un nuevo cliente con nombre, apellido y pais.
INSERT INTO clientes(Nombre, Apellido, Pais, FechaIngreso)
VALUES('Esteban', 'Quito', 'Brasil', CURRENT_DATE);

-- 7. Borra todos los pedidos realizados antes del 2020.
DELETE
FROM ordenes o
WHERE YEAR(o.Fecha) < 2020;

-- 8. Cambia el nombre del producto "Azúcar" por "Azúcar Blanca".
UPDATE productos p
SET p.Nombre = 'Azúcar Blanca'
WHERE p.Nombre = 'Azúcar';

-- 9. Inserta un nuevo pedido con 2 productos para el cliente de ID 4.
INSERT INTO ordenes (ClienteID, EmpleadoID, Fecha, Total)
VALUES(4, 2, CURRENT_DATE,((SELECT Precio FROM productos WHERE ID = 4) + (SELECT Precio FROM productos WHERE ID = 3)));

INSERT INTO ordenproductos(OrdenID, ProductoID, Cantidad)
VALUES(4, 4, 1),(4, 3, 1);

-- 10. Elimina al proveedor con ID = '6'.
DELETE
FROM proveedores pv
WHERE pv.ID = 6;