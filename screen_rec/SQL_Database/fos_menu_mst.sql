-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: fos
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `menu_mst`
--

DROP TABLE IF EXISTS `menu_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_mst` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `reg_status` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_mst`
--

LOCK TABLES `menu_mst` WRITE;
/*!40000 ALTER TABLE `menu_mst` DISABLE KEYS */;
INSERT INTO `menu_mst` VALUES (1,'Pohe','Breakfast',15,1),(2,'Upma','Breakfast',20,1),(3,'Sabudana','Breakfast',25,1),(4,'Potato Sandwich','Breakfast',25,1),(5,'Dal Fry','Main Cource',130,1),(6,'Shev Bhaji','Main Course',100,1),(7,'Pav Bhaji','Main Course',80,1),(8,'Mixed Veg','Main Course',130,1),(9,'Bhindi Masala','Main Course',135,1),(10,'Kaju Curry','Main Course',125,1),(11,'Palak Paneer','Main Course',110,1),(12,'Paneer Tikka','Main Course',135,1),(13,'Chapati','Indian Brat',9,1),(14,'Tandoor Roti','Indian Brat',12,1),(15,'Nan Roti','Indian Brat',15,1),(16,'Aloo Paratha','Indian Brat',13,1),(17,'Fruit Salad','Salad',75,1),(18,'Green Salad','Salad',70,1),(19,'Carrot Salad','Salad',50,1),(20,'Broccoli','Salad',50,1),(21,'Jeera Rice','Rice',55,1),(22,'Fried Rice','Rice',100,1),(23,'Pulav','Rice',90,1),(24,'Veg Biryani','Rice',90,1),(25,'Tea','Drinks',10,1),(26,'Coffee','Drinks',15,1),(27,'Lassi','Drinks',20,1),(28,'Cold Drinks','Drinks',25,1),(29,'Idli Sambhar','Breakfast',40,1),(30,'Mayore Masala Dosa','Breakfast',40,1),(31,'Paneer Masala','Main Cource',165,1),(32,'Veg Kolhapuri','Main Cource',135,1),(33,'Veg Kofta','Main Cource',130,1),(34,'Dum Aloo','Main Cource',100,1),(35,'Jowar Roti','Indian Brat',22,1),(36,'Bajra Roti','Indian Brat',22,1),(37,'Steamed Rice','Rice',70,1),(38,'Kashmiri Pulav','Rice',120,1),(39,'Mango Milkshake','Drinks',54,1),(40,'Chocolate Milkshake','Drinks',54,1);
/*!40000 ALTER TABLE `menu_mst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-19  9:19:59
