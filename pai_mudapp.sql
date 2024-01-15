-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (x86_64)
--
-- Host: 127.0.0.1    Database: mudapp_pai
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coches`
--

DROP TABLE IF EXISTS `coches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coches` (
  `id_coche` varchar(100) NOT NULL,
  `id_transportistas` varchar(100) DEFAULT NULL,
  `matricula_coche` varchar(100) DEFAULT NULL,
  `modelo_coche` varchar(100) DEFAULT NULL,
  `color_coche` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_coche`),
  UNIQUE KEY `id_coche` (`id_coche`),
  UNIQUE KEY `id_transportistas` (`id_transportistas`),
  UNIQUE KEY `matrciula_coche` (`matricula_coche`),
  UNIQUE KEY `matricula_coche` (`matricula_coche`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coches`
--

LOCK TABLES `coches` WRITE;
/*!40000 ALTER TABLE `coches` DISABLE KEYS */;
INSERT INTO `coches` VALUES ('CAR1','TRN1','ABC123','Toyota','Rojo'),('CAR2','TRN2','XYZ789','Honda','Azul');
/*!40000 ALTER TABLE `coches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluaciones`
--

DROP TABLE IF EXISTS `evaluaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluaciones` (
  `id_evaluacion` varchar(100) NOT NULL,
  `id_usuario` varchar(100) DEFAULT NULL,
  `id_servicio` varchar(100) DEFAULT NULL,
  `valoracion` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_evaluacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluaciones`
--

LOCK TABLES `evaluaciones` WRITE;
/*!40000 ALTER TABLE `evaluaciones` DISABLE KEYS */;
INSERT INTO `evaluaciones` VALUES ('EVAL1','USR1','SERV1',4,'2023-01-05'),('EVAL2','USR2','SERV2',5,'2023-02-20');
/*!40000 ALTER TABLE `evaluaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` varchar(100) NOT NULL,
  `id_servicio` varchar(100) DEFAULT NULL,
  `id_usuario` varchar(100) DEFAULT NULL,
  `fecha` date NOT NULL,
  `monto_pago` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `id_pago` (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES ('PAY1','SERV1','USR1','2023-01-01',50),('PAY2','SERV2','USR2','2023-02-15',60);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros`
--

DROP TABLE IF EXISTS `registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros` (
  `id_registro` varchar(100) NOT NULL,
  `id_usuario` varchar(100) DEFAULT NULL,
  `id_transportista` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  UNIQUE KEY `id_registro` (`id_registro`),
  UNIQUE KEY `id_transportista` (`id_transportista`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `registros_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `registros_ibfk_2` FOREIGN KEY (`id_transportista`) REFERENCES `transportistas` (`id_transportista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros`
--

LOCK TABLES `registros` WRITE;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
INSERT INTO `registros` VALUES ('REG1','USR1','TRN1'),('REG2','USR2','TRN2');
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios_transporte`
--

DROP TABLE IF EXISTS `servicios_transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_transporte` (
  `id_servicio` varchar(100) NOT NULL,
  `id_usuario` varchar(100) DEFAULT NULL,
  `id_transportista` varchar(100) DEFAULT NULL,
  `id_evaluacion` varchar(100) DEFAULT NULL,
  `id_pago` varchar(100) DEFAULT NULL,
  `ubicacion_inicial` varchar(100) DEFAULT NULL,
  `ubicacion_final` varchar(100) DEFAULT NULL,
  `mercancia` varchar(255) DEFAULT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_servicio`),
  UNIQUE KEY `id_servicio` (`id_servicio`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_transportista` (`id_transportista`),
  KEY `id_pago` (`id_pago`),
  KEY `id_evaluacion` (`id_evaluacion`),
  CONSTRAINT `servicios_transporte_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `servicios_transporte_ibfk_2` FOREIGN KEY (`id_transportista`) REFERENCES `transportistas` (`id_transportista`),
  CONSTRAINT `servicios_transporte_ibfk_3` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id_pago`),
  CONSTRAINT `servicios_transporte_ibfk_4` FOREIGN KEY (`id_evaluacion`) REFERENCES `evaluaciones` (`id_evaluacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios_transporte`
--

LOCK TABLES `servicios_transporte` WRITE;
/*!40000 ALTER TABLE `servicios_transporte` DISABLE KEYS */;
INSERT INTO `servicios_transporte` VALUES ('SERV1','USR1','TRN1','EVAL1','PAY1','Ciudad A','Ciudad B','Electrodomésticos','2023-01-01'),('SERV2','USR2','TRN2','EVAL2','PAY2','Ciudad C','Ciudad D','Muebles','2023-02-15');
/*!40000 ALTER TABLE `servicios_transporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportistas`
--

DROP TABLE IF EXISTS `transportistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportistas` (
  `id_transportista` varchar(100) NOT NULL,
  `id_coche` varchar(100) DEFAULT NULL,
  `nombre_transportista` varchar(100) DEFAULT NULL,
  `primer_apellido` varchar(100) DEFAULT NULL,
  `segundo_apellido` varchar(100) DEFAULT NULL,
  `identificacion` varchar(100) DEFAULT NULL,
  `edad` int NOT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `numero_telefonico` int NOT NULL,
  PRIMARY KEY (`id_transportista`),
  UNIQUE KEY `id_transportista` (`id_transportista`),
  UNIQUE KEY `id_coche` (`id_coche`),
  UNIQUE KEY `identificacion` (`identificacion`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`),
  CONSTRAINT `transportistas_ibfk_1` FOREIGN KEY (`id_coche`) REFERENCES `coches` (`id_coche`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportistas`
--

LOCK TABLES `transportistas` WRITE;
/*!40000 ALTER TABLE `transportistas` DISABLE KEYS */;
INSERT INTO `transportistas` VALUES ('TRN1','CAR1','Carlos','Fernandez','Lopez','111111111A',30,'carlos.fernandez@email.com','password789',654321987),('TRN2','CAR2','Laura','Martinez','Garcia','222222222B',28,'laura.martinez@email.com','pass123',987654321);
/*!40000 ALTER TABLE `transportistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` varchar(100) NOT NULL,
  `nombre_usuario` varchar(100) DEFAULT NULL,
  `primer_apellido` varchar(100) DEFAULT NULL,
  `segundo_apellido` varchar(100) DEFAULT NULL,
  `identificacion` varchar(100) DEFAULT NULL,
  `edad` int NOT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `numero_telefonico` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  UNIQUE KEY `identificacion` (`identificacion`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('USR1','Juan','Perez','Lopez','123456789A',28,'juan.perez@email.com','contrasena123','Calle A #123',123456789),('USR2','Maria','Gomez','Ramirez','987654321B',35,'maria.gomez@email.com','password456','Calle B #456',987654321);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-15 16:02:55
