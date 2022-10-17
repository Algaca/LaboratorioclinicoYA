-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.31 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para laboratorioclinicoya
DROP DATABASE IF EXISTS `laboratorioclinicoya`;
CREATE DATABASE IF NOT EXISTS `laboratorioclinicoya` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laboratorioclinicoya`;

-- Volcando estructura para tabla laboratorioclinicoya.aseguradoras
DROP TABLE IF EXISTS `aseguradoras`;
CREATE TABLE IF NOT EXISTS `aseguradoras` (
  `Aseg_Id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `Aseg_Nit` int unsigned NOT NULL,
  `Aseg_Nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Aseg_Dir` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Aseg_Tel` int unsigned NOT NULL,
  `Aseg_Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Aseg_Id`),
  UNIQUE KEY `Aseg_Nit` (`Aseg_Nit`),
  UNIQUE KEY `Aseg_Nom` (`Aseg_Nom`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla laboratorioclinicoya.aseguradoras: ~1 rows (aproximadamente)
DELETE FROM `aseguradoras`;
INSERT INTO `aseguradoras` (`Aseg_Id`, `Aseg_Nit`, `Aseg_Nom`, `Aseg_Dir`, `Aseg_Tel`, `Aseg_Email`) VALUES
	(1, 82304515, 'SALUDMAS', 'CALLE CENTRAL', 3215475414, 'SALUDMAS@GMAIL.COM');

-- Volcando estructura para tabla laboratorioclinicoya.cargo
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `Cargo_Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Nom_cargo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Cargo_Id`),
  UNIQUE KEY `Nom_cargo` (`Nom_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla laboratorioclinicoya.cargo: ~3 rows (aproximadamente)
DELETE FROM `cargo`;
INSERT INTO `cargo` (`Cargo_Id`, `Nom_cargo`) VALUES
	(2, 'AUXILIAR'),
	(3, 'BACTERIOLOGO'),
	(1, 'FACTURADOR');

-- Volcando estructura para tabla laboratorioclinicoya.contratos
DROP TABLE IF EXISTS `contratos`;
CREATE TABLE IF NOT EXISTS `contratos` (
  `Cont_Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Cont_Nombre` varchar(50) NOT NULL,
  `Cont_Niteps` int unsigned NOT NULL,
  `Cont_Nomeps` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cont_fechdesde` date NOT NULL,
  `Cont_fechhasta` date NOT NULL,
  PRIMARY KEY (`Cont_Id`),
  UNIQUE KEY `Cont_Niteps` (`Cont_Niteps`),
  UNIQUE KEY `Cont_Nomeps` (`Cont_Nomeps`),
  CONSTRAINT `FK_contratos_aseguradoras` FOREIGN KEY (`Cont_Niteps`) REFERENCES `aseguradoras` (`Aseg_Nit`),
  CONSTRAINT `FK_contratos_aseguradoras_2` FOREIGN KEY (`Cont_Nomeps`) REFERENCES `aseguradoras` (`Aseg_Nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla laboratorioclinicoya.contratos: ~0 rows (aproximadamente)
DELETE FROM `contratos`;

-- Volcando estructura para tabla laboratorioclinicoya.entregaresultados
DROP TABLE IF EXISTS `entregaresultados`;
CREATE TABLE IF NOT EXISTS `entregaresultados` (
  `Entre_Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Entre_Doc` int unsigned NOT NULL,
  `Entre_Nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Entre_Id`),
  UNIQUE KEY `Entre_Doc` (`Entre_Doc`),
  UNIQUE KEY `Entre_Nom` (`Entre_Nom`),
  CONSTRAINT `FK_entregaresultados_usuarios` FOREIGN KEY (`Entre_Doc`) REFERENCES `usuarios` (`Usu_Doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla laboratorioclinicoya.entregaresultados: ~0 rows (aproximadamente)
DELETE FROM `entregaresultados`;

-- Volcando estructura para tabla laboratorioclinicoya.facturacion
DROP TABLE IF EXISTS `facturacion`;
CREATE TABLE IF NOT EXISTS `facturacion` (
  `Num_fact` int unsigned NOT NULL AUTO_INCREMENT,
  `Fact_doc` int unsigned NOT NULL,
  `Fact_Nom` varchar(50) NOT NULL,
  `Fact_Fecha` date NOT NULL,
  `Fact_Aseg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Fact_Codpro` int unsigned NOT NULL,
  `Fact_Proc` varchar(50) NOT NULL,
  `Fact_Valor` int unsigned NOT NULL,
  PRIMARY KEY (`Num_fact`),
  UNIQUE KEY `Fact_doc` (`Fact_doc`),
  UNIQUE KEY `Fact_Nom` (`Fact_Nom`),
  UNIQUE KEY `Fact_Aseg` (`Fact_Aseg`),
  UNIQUE KEY `Fact_Codpro` (`Fact_Codpro`),
  UNIQUE KEY `Fact_Proc` (`Fact_Proc`),
  CONSTRAINT `FK_facturacion_aseguradoras` FOREIGN KEY (`Fact_Aseg`) REFERENCES `aseguradoras` (`Aseg_Nom`),
  CONSTRAINT `FK_facturacion_procedimientos` FOREIGN KEY (`Fact_Proc`) REFERENCES `procedimientos` (`Proc_Nombre`),
  CONSTRAINT `FK_facturacion_procedimientos_2` FOREIGN KEY (`Fact_Codpro`) REFERENCES `procedimientos` (`Proc_Cod`),
  CONSTRAINT `FK_facturacion_usuarios` FOREIGN KEY (`Fact_doc`) REFERENCES `usuarios` (`Usu_Doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla laboratorioclinicoya.facturacion: ~0 rows (aproximadamente)
DELETE FROM `facturacion`;

-- Volcando estructura para tabla laboratorioclinicoya.laboratorio
DROP TABLE IF EXISTS `laboratorio`;
CREATE TABLE IF NOT EXISTS `laboratorio` (
  `Lab_Id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `Lab_Nit` int unsigned NOT NULL,
  `Lab_RazonSocial` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Lab_Direccion` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Lab_Pais` tinyint unsigned NOT NULL,
  `Lab_Departamento` smallint unsigned NOT NULL,
  `Lab_Municipio` mediumint unsigned NOT NULL,
  `Lab_Telefono` int unsigned NOT NULL,
  `Lab_Email` varchar(200) NOT NULL,
  PRIMARY KEY (`Lab_Id`),
  UNIQUE KEY `Lab_Nit` (`Lab_Nit`),
  KEY `Lab_Pais` (`Lab_Pais`),
  KEY `Lab_Departamento` (`Lab_Departamento`),
  KEY `Lab_Municipio` (`Lab_Municipio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Crea la empresa';

-- Volcando datos para la tabla laboratorioclinicoya.laboratorio: ~1 rows (aproximadamente)
DELETE FROM `laboratorio`;
INSERT INTO `laboratorio` (`Lab_Id`, `Lab_Nit`, `Lab_RazonSocial`, `Lab_Direccion`, `Lab_Pais`, `Lab_Departamento`, `Lab_Municipio`, `Lab_Telefono`, `Lab_Email`) VALUES
	(1, 547425421, 'LABORATORIO CLINICO YA', 'CIUDAD CENTRAL', 190, 70, 1, 3245854566, 'LABORATORIO@GMAIL.COM');

-- Volcando estructura para tabla laboratorioclinicoya.procedimientos
DROP TABLE IF EXISTS `procedimientos`;
CREATE TABLE IF NOT EXISTS `procedimientos` (
  `Proc_Id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `Proc_Cod` int unsigned NOT NULL,
  `Proc_Nombre` varchar(100) NOT NULL,
  `Proc_Precio` int NOT NULL,
  PRIMARY KEY (`Proc_Id`),
  UNIQUE KEY `Proc_Cod` (`Proc_Cod`),
  UNIQUE KEY `Proc_Nombre` (`Proc_Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla laboratorioclinicoya.procedimientos: ~0 rows (aproximadamente)
DELETE FROM `procedimientos`;

-- Volcando estructura para tabla laboratorioclinicoya.representante legal
DROP TABLE IF EXISTS `representante legal`;
CREATE TABLE IF NOT EXISTS `representante legal` (
  `Rep_Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Rep_Emp` varchar(50) NOT NULL,
  `Rep_Doc` int unsigned NOT NULL,
  `Rep_Nombre` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Rep_Dir` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Rep_Tel` int NOT NULL,
  `Rep_Email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Rep_Fechainicio` date NOT NULL,
  PRIMARY KEY (`Rep_Id`),
  UNIQUE KEY `Rep_Doc` (`Rep_Doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla laboratorioclinicoya.representante legal: ~0 rows (aproximadamente)
DELETE FROM `representante legal`;

-- Volcando estructura para tabla laboratorioclinicoya.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `Rol_Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Roles_sis` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Rol_Id`),
  UNIQUE KEY `Roles_sis` (`Roles_sis`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Roles del sistema';

-- Volcando datos para la tabla laboratorioclinicoya.roles: ~3 rows (aproximadamente)
DELETE FROM `roles`;
INSERT INTO `roles` (`Rol_Id`, `Roles_sis`) VALUES
	(2, 'COORDINADOR'),
	(1, 'DIGITADOR'),
	(3, 'SUPERUSUARIO');

-- Volcando estructura para tabla laboratorioclinicoya.tipomuestras
DROP TABLE IF EXISTS `tipomuestras`;
CREATE TABLE IF NOT EXISTS `tipomuestras` (
  `Tipo_Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Tipo_mues` varchar(50) NOT NULL,
  `Tipo_Fecha` date NOT NULL,
  PRIMARY KEY (`Tipo_Id`),
  UNIQUE KEY `Tipo_mues` (`Tipo_mues`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla laboratorioclinicoya.tipomuestras: ~0 rows (aproximadamente)
DELETE FROM `tipomuestras`;

-- Volcando estructura para tabla laboratorioclinicoya.tomamuestras
DROP TABLE IF EXISTS `tomamuestras`;
CREATE TABLE IF NOT EXISTS `tomamuestras` (
  `Toma_Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Toma_IdUsu` int unsigned NOT NULL,
  `Toma_nomb` varchar(100) NOT NULL,
  `Toma_Muestra` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Toma_Id`),
  UNIQUE KEY `Toma_IdUsu` (`Toma_IdUsu`),
  KEY `FK_tomamuestras_tipomuestras` (`Toma_Muestra`),
  CONSTRAINT `FK_tomamuestras_tipomuestras` FOREIGN KEY (`Toma_Muestra`) REFERENCES `tipomuestras` (`Tipo_mues`),
  CONSTRAINT `FK_tomamuestras_usuarios` FOREIGN KEY (`Toma_IdUsu`) REFERENCES `usuarios` (`Usu_Doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla laboratorioclinicoya.tomamuestras: ~0 rows (aproximadamente)
DELETE FROM `tomamuestras`;

-- Volcando estructura para tabla laboratorioclinicoya.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `Usu_Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Usu_Doc` int unsigned NOT NULL,
  `Usu_Nomb` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Usu_Dir` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Usu_Tel` int unsigned NOT NULL,
  `Usu_Dep` smallint NOT NULL,
  `Usu-Mun` mediumint NOT NULL,
  PRIMARY KEY (`Usu_Id`),
  UNIQUE KEY `Usu_Doc` (`Usu_Doc`),
  KEY `Usu_Dep` (`Usu_Dep`),
  KEY `Usu-Mun` (`Usu-Mun`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla laboratorioclinicoya.usuarios: ~1 rows (aproximadamente)
DELETE FROM `usuarios`;
INSERT INTO `usuarios` (`Usu_Id`, `Usu_Doc`, `Usu_Nomb`, `Usu_Dir`, `Usu_Tel`, `Usu_Dep`, `Usu-Mun`) VALUES
	(1, 32894774, 'CINA CARDOZA', 'CALLE 2', 3215478525, 70, 265);

-- Volcando estructura para tabla laboratorioclinicoya.usuariosistema
DROP TABLE IF EXISTS `usuariosistema`;
CREATE TABLE IF NOT EXISTS `usuariosistema` (
  `Usis_Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Usis_Doc` int unsigned NOT NULL,
  `Usis_Nomb` varchar(200) NOT NULL,
  `Usis_Rol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Usis_Dir` varchar(100) NOT NULL,
  `Usis_Tel` int NOT NULL,
  `Usis_Cargo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Usis_Id`),
  UNIQUE KEY `Usis_Doc` (`Usis_Doc`),
  UNIQUE KEY `Usis_Rol` (`Usis_Rol`),
  KEY `FK_usuariosistema_cargo` (`Usis_Cargo`),
  CONSTRAINT `FK_usuariosistema_cargo` FOREIGN KEY (`Usis_Cargo`) REFERENCES `cargo` (`Nom_cargo`),
  CONSTRAINT `FK_usuariosistema_roles` FOREIGN KEY (`Usis_Rol`) REFERENCES `roles` (`Roles_sis`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla laboratorioclinicoya.usuariosistema: ~1 rows (aproximadamente)
DELETE FROM `usuariosistema`;
INSERT INTO `usuariosistema` (`Usis_Id`, `Usis_Doc`, `Usis_Nomb`, `Usis_Rol`, `Usis_Dir`, `Usis_Tel`, `Usis_Cargo`) VALUES
	(1, 32894774, 'CINA CARDOZA', 'SUPERUSUARIO', 'CALLE 2', 321547852, 'BACTERIOLOGO');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
