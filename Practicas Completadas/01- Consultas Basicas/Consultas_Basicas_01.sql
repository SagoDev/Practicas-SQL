-- 10 EJERCICIOS BASICOS PARA PRACTICAR SQL --

-- 1. Selecciona todos los datos de la tabla 'Empleados'.
SELECT * FROM Empleados;

-- 2. Muestra el nombre y salario de los empleados.
SELECT Nombre, Salario
FROM Empleados;

-- 3. Lista los productos con un precio mayor a 100.
SELECT *
FROM Productos
WHERE Precio > 100;

-- 4. Ordena los clientes por apellido de forma ascendente.
SELECT *
FROM Clientes
ORDER BY Apellido ASC;

-- 5. Muestra los empleados del departamento 'Ventas'.
SELECT *
FROM Empleados
WHERE DepartamentoID = 1;

-- 6. Selecciona todos los registros cuya fecha de ingreso sea en 2022.
SELECT *
FROM Empleados
WHERE FechaIngreso BETWEEN '2022-01-01' AND '2022-12-31';


-- 7. Muestra los 5 productos más caros.
SELECT *
FROM Productos
ORDER BY Precio DESC
LIMIT 5;

-- 8. Muestra los nombres únicos de los departamentos.
SELECT Nombre
FROM Departamentos;

-- 9. Selecciona los clientes cuyo nombre comience con 'A'.
SELECT *
FROM Clientes
WHERE Nombre LIKE 'A%';

-- 10. Muestra los productos cuyo nombre contenga la palabra 'Premium'.
SELECT *
FROM Productos
WHERE Nombre LIKE '%Premium%';