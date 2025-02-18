-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: Cafeteria
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'Hot Beverages'),(2,'Cold Beverages'),(3,'Breakfast Items'),(4,'Sandwiches'),(5,'Pastries & Desserts');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_product`
--

DROP TABLE IF EXISTS `Order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_product` (
  `f_order_id` int DEFAULT NULL,
  `f_product_id` int DEFAULT NULL,
  `quntity` int NOT NULL,
  KEY `f_order_id` (`f_order_id`),
  KEY `f_product_id` (`f_product_id`),
  CONSTRAINT `Order_product_ibfk_1` FOREIGN KEY (`f_order_id`) REFERENCES `Orders` (`order_id`),
  CONSTRAINT `Order_product_ibfk_2` FOREIGN KEY (`f_product_id`) REFERENCES `Product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_product`
--

LOCK TABLES `Order_product` WRITE;
/*!40000 ALTER TABLE `Order_product` DISABLE KEYS */;
INSERT INTO `Order_product` VALUES (10,3,2),(2,5,1),(7,10,4),(3,2,3),(5,7,2),(8,1,1),(4,9,2),(6,4,1),(9,6,3),(1,8,2),(1,2,3),(1,10,2),(3,9,1),(10,10,3),(5,4,2),(6,1,3);
/*!40000 ALTER TABLE `Order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `status` enum('Processing','Out for delivery','Done') DEFAULT 'Processing',
  `f_user_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `f_user_id` (`f_user_id`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`f_user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,'2023-10-01 10:00:00','Processing',1),(2,'2023-10-02 11:30:00','Out for delivery',2),(3,'2023-10-03 09:15:00','Done',3),(4,'2023-10-04 14:45:00','Processing',4),(5,'2023-10-05 16:20:00','Out for delivery',5),(6,'2023-10-06 08:00:00','Done',6),(7,'2023-10-07 12:10:00','Processing',7),(8,'2023-10-08 13:50:00','Out for delivery',8),(9,'2023-10-09 17:30:00','Done',9),(10,'2023-10-10 18:00:00','Processing',10);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `status` enum('available','unavailable') DEFAULT 'available',
  `f_category_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_product_category` (`f_category_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`f_category_id`) REFERENCES `Category` (`category_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Espresso',20.00,'uploads/espresso.jpg','available',1),(2,'Cappuccino',30.00,'uploads/cappuccino.jpg','available',1),(3,'Iced Latte',35.00,'uploads/iced_latte.jpg','available',2),(4,'Fresh Orange Juice',35.50,'uploads/orange_juice.jpg','available',2),(5,'Pancakes with Syrup',40.90,'uploads/pancakes.jpg','available',3),(6,'Egg & Cheese Sandwich',50.30,'uploads/egg_cheese_sandwich.jpg','available',3),(7,'Chicken Club Sandwich',40.00,'uploads/club_sandwich.jpg','available',4),(8,'Grilled Cheese Sandwich',50.40,'uploads/grilled_cheese.jpg','available',4),(9,'Chocolate Croissant',60.00,'uploads/chocolate_croissant.jpg','available',5),(10,'Cheesecake Slice',80.80,'uploads/cheesecake.jpg','available',5);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `ext` varchar(50) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `role` int NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Alice','alice@example.com','password123','123',NULL,1),(2,'Bob','bob@example.com','password123','456',NULL,0),(3,'Charlie','charlie@example.com','password123','789',NULL,1),(4,'David','david@example.com','password123','101',NULL,0),(5,'Eve','eve@example.com','password123','102',NULL,1),(6,'Frank','frank@example.com','password123','103',NULL,0),(7,'Grace','grace@example.com','password123','104',NULL,1),(8,'Hank','hank@example.com','password123','105',NULL,0),(9,'Ivy','ivy@example.com','password123','106',NULL,1),(10,'Jack','jack@example.com','password123','107',NULL,0);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!50001 DROP VIEW IF EXISTS `bill`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bill` AS SELECT 
 1 AS `f_order_id`,
 1 AS `user_name`,
 1 AS `product_name`,
 1 AS `quntity`,
 1 AS `price`,
 1 AS `total_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_room`
--

DROP TABLE IF EXISTS `user_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_room` (
  `user_id` int NOT NULL,
  `room_name` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`,`room_name`),
  CONSTRAINT `user_room_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_room`
--

LOCK TABLES `user_room` WRITE;
/*!40000 ALTER TABLE `user_room` DISABLE KEYS */;
INSERT INTO `user_room` VALUES (1,'Bedroom'),(1,'Living Room'),(2,'Kitchen'),(2,'Living Room'),(3,'Bathroom'),(4,'Dining Room'),(5,'Living Room'),(6,'Bedroom'),(7,'Kitchen'),(8,'Living Room');
/*!40000 ALTER TABLE `user_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `bill`
--

/*!50001 DROP VIEW IF EXISTS `bill`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bill` AS select `o`.`order_id` AS `f_order_id`,`u`.`user_name` AS `user_name`,`p`.`product_name` AS `product_name`,`op`.`quntity` AS `quntity`,`p`.`price` AS `price`,(`op`.`quntity` * `p`.`price`) AS `total_amount` from (((`Order_product` `op` join `Orders` `o` on((`op`.`f_order_id` = `o`.`order_id`))) join `User` `u` on((`o`.`f_user_id` = `u`.`user_id`))) join `Product` `p` on((`op`.`f_product_id` = `p`.`product_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-19  1:14:54
