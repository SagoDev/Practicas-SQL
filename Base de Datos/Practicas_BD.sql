-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.42 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla ejercicios_bd.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ejercicios_bd.categorias: ~0 rows (aproximadamente)
INSERT INTO `categorias` (`ID`, `Nombre`) VALUES
	(1, 'Electrónica'),
	(2, 'Oficina');

-- Volcando estructura para tabla ejercicios_bd.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` text,
  `Apellido` text,
  `Email` text,
  `Direccion` text,
  `Pais` text,
  `FechaIngreso` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ejercicios_bd.clientes: ~0 rows (aproximadamente)
INSERT INTO `clientes` (`ID`, `Nombre`, `Apellido`, `Email`, `Direccion`, `Pais`, `FechaIngreso`) VALUES
	(1, 'María', 'Silva', 'maria@example.com', 'Calle 1', 'Uruguay', '2021-02-10'),
	(2, 'Pedro', 'Torres', 'pedro@example.com', 'Calle 2', 'Argentina', '2022-07-18'),
	(3, 'Lucía', 'Méndez', 'lucia@example.com', 'Calle 3', 'Chile', '2023-01-05');

-- Volcando estructura para tabla ejercicios_bd.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NombreCurso` text,
  `InstructorID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `InstructorID` (`InstructorID`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`InstructorID`) REFERENCES `instructores` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ejercicios_bd.cursos: ~0 rows (aproximadamente)
INSERT INTO `cursos` (`ID`, `NombreCurso`, `InstructorID`) VALUES
	(1, 'SQL Básico', 1),
	(2, 'Python Intermedio', 2);

-- Volcando estructura para tabla ejercicios_bd.departamentos
CREATE TABLE IF NOT EXISTS `departamentos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ejercicios_bd.departamentos: ~0 rows (aproximadamente)
INSERT INTO `departamentos` (`ID`, `Nombre`) VALUES
	(1, 'Ventas'),
	(2, 'IT'),
	(3, 'Recursos Humanos');

-- Volcando estructura para tabla ejercicios_bd.empleadoproyecto
CREATE TABLE IF NOT EXISTS `empleadoproyecto` (
  `EmpleadoID` int DEFAULT NULL,
  `ProyectoID` int DEFAULT NULL,
  KEY `EmpleadoID` (`EmpleadoID`),
  KEY `ProyectoID` (`ProyectoID`),
  CONSTRAINT `empleadoproyecto_ibfk_1` FOREIGN KEY (`EmpleadoID`) REFERENCES `empleados` (`ID`),
  CONSTRAINT `empleadoproyecto_ibfk_2` FOREIGN KEY (`ProyectoID`) REFERENCES `proyectos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ejercicios_bd.empleadoproyecto: ~0 rows (aproximadamente)
INSERT INTO `empleadoproyecto` (`EmpleadoID`, `ProyectoID`) VALUES
	(1, 1),
	(2, 2),
	(3, 1);

-- Volcando estructura para tabla ejercicios_bd.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` text,
  `Apellido` text,
  `Edad` int DEFAULT NULL,
  `Salario` double DEFAULT NULL,
  `DepartamentoID` int DEFAULT NULL,
  `FechaIngreso` date DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `DepartamentoID` (`DepartamentoID`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`DepartamentoID`) REFERENCES `departamentos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ejercicios_bd.empleados: ~0 rows (aproximadamente)
INSERT INTO `empleados` (`ID`, `Nombre`, `Apellido`, `Edad`, `Salario`, `DepartamentoID`, `FechaIngreso`, `Activo`) VALUES
	(1, 'Carlos', 'Gómez', 45, 2500, 1, '2020-01-15', 1),
	(2, 'Ana', 'Pérez', 30, 2800, 2, '2022-05-10', 1),
	(3, 'Luis', 'Fernández', 50, 3200, 1, '2019-09-01', 1),
	(4, 'Sofía', 'Rodríguez', 27, 2100, 3, '2023-03-12', 1),
	(5, 'Javier', 'López', 38, 2900, 2, '2021-06-22', 0);

-- Volcando estructura para tabla ejercicios_bd.instructores
CREATE TABLE IF NOT EXISTS `instructores` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NombreInstructor` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ejercicios_bd.instructores: ~0 rows (aproximadamente)
INSERT INTO `instructores` (`ID`, `NombreInstructor`) VALUES
	(1, 'Martín García'),
	(2, 'Elena Suárez');

-- Volcando estructura para tabla ejercicios_bd.ordenes
CREATE TABLE IF NOT EXISTS `ordenes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ClienteID` int DEFAULT NULL,
  `EmpleadoID` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Total` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClienteID` (`ClienteID`),
  KEY `EmpleadoID` (`EmpleadoID`),
  CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clientes` (`ID`),
  CONSTRAINT `ordenes_ibfk_2` FOREIGN KEY (`EmpleadoID`) REFERENCES `empleados` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ejercicios_bd.ordenes: ~0 rows (aproximadamente)
INSERT INTO `ordenes` (`ID`, `ClienteID`, `EmpleadoID`, `Fecha`, `Total`) VALUES
	(1, 1, 1, '2023-07-01', 250),
	(2, 2, 2, '2023-07-02', 500);

-- Volcando estructura para tabla ejercicios_bd.ordenproductos
CREATE TABLE IF NOT EXISTS `ordenproductos` (
  `OrdenID` int DEFAULT NULL,
  `ProductoID` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  KEY `OrdenID` (`OrdenID`),
  KEY `ProductoID` (`ProductoID`),
  CONSTRAINT `ordenproductos_ibfk_1` FOREIGN KEY (`OrdenID`) REFERENCES `ordenes` (`ID`),
  CONSTRAINT `ordenproductos_ibfk_2` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ejercicios_bd.ordenproductos: ~0 rows (aproximadamente)
INSERT INTO `ordenproductos` (`OrdenID`, `ProductoID`, `Cantidad`) VALUES
	(1, 1, 1),
	(1, 2, 1),
	(2, 3, 2);

-- Volcando estructura para tabla ejercicios_bd.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` text,
  `Precio` double DEFAULT NULL,
  `CategoriaID` int DEFAULT NULL,
  `ProveedorID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CategoriaID` (`CategoriaID`),
  KEY `ProveedorID` (`ProveedorID`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`CategoriaID`) REFERENCES `categorias` (`ID`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`ProveedorID`) REFERENCES `proveedores` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ejercicios_bd.productos: ~0 rows (aproximadamente)
INSERT INTO `productos` (`ID`, `Nombre`, `Precio`, `CategoriaID`, `ProveedorID`) VALUES
	(1, 'Monitor', 200, 1, 1),
	(2, 'Teclado', 50, 1, 1),
	(3, 'Silla ergonómica', 150, 2, 2),
	(4, 'Escritorio', 300, 2, 2),
	(5, 'Radio', 35, 1, 1),
	(6, 'Cafetera Premium', 120, 2, 2);

-- Volcando estructura para tabla ejercicios_bd.proveedores
CREATE TABLE IF NOT EXISTS `proveedores` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` text,
  `Telefono` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ejercicios_bd.proveedores: ~0 rows (aproximadamente)
INSERT INTO `proveedores` (`ID`, `Nombre`, `Telefono`) VALUES
	(1, 'Proveedora S.A.', '099000111'),
	(2, 'Distribuidora XYZ', '098888777');

-- Volcando estructura para tabla ejercicios_bd.proyectos
CREATE TABLE IF NOT EXISTS `proyectos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NombreProyecto` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ejercicios_bd.proyectos: ~0 rows (aproximadamente)
INSERT INTO `proyectos` (`ID`, `NombreProyecto`) VALUES
	(1, 'Sistema de Ventas'),
	(2, 'Portal Web');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
