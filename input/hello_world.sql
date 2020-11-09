--
-- Table structure for table `hello_world`
--

DROP DATABASE IF EXISTS `hello_world`;
CREATE DATABASE `hello_world`;

USE `hello_world`;
DROP TABLE IF EXISTS `hello_world`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hello_world` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hello_world`
--

LOCK TABLES `hello_world` WRITE;
/*!40000 ALTER TABLE `hello_world` DISABLE KEYS */;
INSERT INTO `hello_world` VALUES (1,'Hello'),(2,'World');
/*!40000 ALTER TABLE `hello_world` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hello_world'
--

--
-- Dumping routines for database 'hello_world'
--

DROP USER IF EXISTS 'webapp';
CREATE user 'webapp'@'%' identified by 'webpass123#';
GRANT SELECT ON `hello_world`.`hello_world` TO 'webapp'@'%';
