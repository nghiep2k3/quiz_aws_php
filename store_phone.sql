CREATE DATABASE  IF NOT EXISTS `ecommerce_doan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `ecommerce_doan`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_doan
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj9to9e3tjoimlgn3w4vjm4xe3` (`product_id`),
  KEY `FK8omq0tc18jd43bu5tjh6jvraq` (`user_id`),
  CONSTRAINT `FK8omq0tc18jd43bu5tjh6jvraq` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj9to9e3tjoimlgn3w4vjm4xe3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `desc` tinytext DEFAULT NULL,
  `discount_percent` decimal(10,0) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs08qf83fj01k3epnxh9n71v1s` (`product_id`),
  KEY `FKk7du8b8ewipawnnpg76d55fus` (`user_id`),
  CONSTRAINT `FKk7du8b8ewipawnnpg76d55fus` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKs08qf83fj01k3epnxh9n71v1s` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `number_of_products` int(11) DEFAULT NULL,
  `total_money` float DEFAULT NULL,
  `color` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (5,2,8,15,2,NULL,NULL),(6,2,6,10000000,1,NULL,NULL),(7,2,8,15,2,NULL,NULL),(8,2,6,10000000,1,NULL,NULL),(9,2,8,15,2,NULL,NULL),(10,2,6,10000000,1,NULL,NULL),(11,2,8,15,2,30,NULL),(12,2,6,10000000,1,10000000,NULL),(13,2,8,15,2,30,NULL),(14,2,6,10000000,1,10000000,NULL),(15,2,8,15,2,30,NULL),(16,2,6,10000000,2,20000000,NULL),(17,3,8,15,2,30,NULL),(18,3,6,10000000,2,20000000,NULL),(19,3,8,15,2,30,NULL),(20,3,6,10000000,1,10000000,NULL),(21,4,8,15,2,30,NULL),(22,4,6,10000000,1,10000000,NULL),(23,4,8,15,2,30,NULL),(24,4,6,10000000,1,10000000,NULL),(26,6,8,15,1,15,NULL),(27,6,6,10000000,1,10000000,NULL),(28,6,8,15,2,30,NULL),(29,6,6,10000000,2,20000000,NULL),(35,4,8,15,1,15,NULL),(36,4,6,10000000,1,10000000,NULL),(38,4,11,15,2,30,NULL),(39,4,6,10000000,1,10000000,NULL),(40,14,8,15,2,30,NULL),(41,14,6,10000000,2,20000000,NULL),(52,23,8,15,2,30,NULL),(53,23,6,10000000,2,20000000,NULL),(54,24,8,15,2,30,NULL),(55,24,6,10000000,2,20000000,NULL),(61,30,8,15,2,30,NULL),(62,30,6,10000000,2,20000000,NULL),(63,31,8,15,2,30,NULL),(64,31,6,10000000,2,20000000,NULL),(65,32,8,15,2,30,NULL),(66,32,6,10000000,2,20000000,NULL),(67,33,8,15,10,150,NULL),(68,33,6,10000000,2,20000000,NULL),(69,34,8,15,10,150,NULL),(70,34,6,10000000,2,20000000,NULL),(71,35,6,10000000,11,110000000,NULL),(72,35,6,10000000,2,20000000,NULL),(73,36,6,10000000,11,110000000,NULL),(74,36,6,10000000,2,20000000,NULL),(75,37,6,10000000,11,110000000,NULL),(76,37,6,10000000,2,20000000,NULL),(77,38,6,10000000,12,120000000,NULL),(78,38,6,10000000,2,20000000,NULL),(79,39,11,15,23,345,NULL),(80,39,6,10000000,1,10000000,NULL),(81,40,6,10000000,12,120000000,NULL),(82,40,6,10000000,2,20000000,NULL),(83,41,6,10000000,12,120000000,NULL),(84,41,6,10000000,2,20000000,NULL),(85,42,6,10000000,12,120000000,NULL),(86,42,6,10000000,2,20000000,NULL),(87,43,6,10000000,12,120000000,NULL),(88,43,6,10000000,2,20000000,NULL),(89,44,6,10000000,12,120000000,NULL),(90,44,6,10000000,2,20000000,NULL),(91,45,52,21000000,5,105000000,NULL),(92,45,10,15,5,75,NULL),(93,45,6,10000000,1,10000000,NULL);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `telephone` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `note` varchar(100) DEFAULT '',
  `order_date` datetime DEFAULT current_timestamp(),
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT NULL COMMENT 'Trạng thái đơn hàng',
  `total_money` float DEFAULT 0,
  `shipping_method` varchar(100) DEFAULT NULL,
  `shipping_address` varchar(200) DEFAULT '',
  `shipping_date` date DEFAULT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,2,'John Doe','john.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 10:39:14','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(3,3,'John Doe','john.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 11:20:58','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(4,4,'đã thêm id 6','21012510@st.phenikaa-uni.edu.vn','12345678','Hưng hà','Dễ vỡ','2024-07-17 16:40:39','pending',2222,'Standard','Thái Bình','2024-07-31',NULL,'PayPal'),(6,6,'John Doe','john.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 16:27:59','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(13,5,'John Doe','john.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 16:41:02','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(14,5,'John Doe','john.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 16:41:02','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(22,5,'John Doe','john.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 20:55:42','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(23,5,'John Doe','john.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 20:55:42','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(24,5,'John Doe','john.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 20:56:52','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(30,5,'John Doe','john.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 21:20:01','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(31,5,'John Doe','john.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 21:27:56','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(32,6,'John Doe','john.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 21:28:57','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(33,8,'Anh Long','nghiep11.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 22:32:35','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(34,8,'Anh Long','nghiep11.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 22:34:54','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(35,8,'Anh Long','nghiep11.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 22:39:59','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(36,8,'Anh Long2','nghiep11.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 22:44:39','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(37,8,'Anh Long23','nghiep11.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-17 22:45:39','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(38,8,'Anh Long2345','nghiep11.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-18 15:46:31','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(39,8,'Nguyễn Thiện Nghiệp','nguyennghiep1320@gmail.com','12345678','nghiepnguyen149@gmail.com','Dễ vỡ','2024-07-18 15:47:51','pending',10000000,'Standard','Thái Bình','2024-07-21',NULL,'Credit Card'),(40,8,'Anh Long23456','nghiep11.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-18 17:29:37','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(41,8,'Anh Long23456','nghiep11.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-18 17:29:48','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(42,5,'Anh Long23456','nghiep11.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-18 17:30:52','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(43,5,'Anh Long234567','nghiep11.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-18 17:32:28','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(44,5,'Anh Long2345678','nghiep11.doe@example.com','1234567890','123 Main St, Anytown, USA','Please deliver between 9 AM and 5 PM','2024-07-18 17:32:33','pending',150,'Standard','123 Main St, Anytown, USA','2024-07-20',NULL,'Credit Card'),(45,8,'Nghiệp','nguyennghiep1320@gmail.com','12345678','nguyennghiep1320@gmail.com','Dễ vỡ','2024-07-18 17:38:23','pending',115000000,'Standard','Thái Bình','2024-07-21',NULL,'Credit Card');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modify_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount` int(11) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `inventory` int(11) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5cypb0k23bovo3rn1a5jqs6j4` (`category_id`),
  CONSTRAINT `FK5cypb0k23bovo3rn1a5jqs6j4` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (6,30,'Samsung Galaxy A15 LTE 8GB 128GB',10000000,'Samsung',3,10,NULL,NULL,'Điện thoại samsung'),(8,NULL,'macbook',15,'h11',2,10,'2024-07-14 22:44:13.000000','2024-07-14 22:44:13.000000',NULL),(10,NULL,'Iphone 16',15,'iphone',3,11,'2024-07-15 00:42:42.000000','2024-07-15 00:42:42.000000',NULL),(11,NULL,'macbook',15,'h11',2,10,'2024-07-15 00:48:24.000000','2024-07-18 18:23:41.000000',NULL),(52,NULL,'Iphone 16',21000000,'iphone',3,10,'2024-07-16 16:17:24.000000','2024-07-16 16:17:24.000000',NULL),(53,NULL,'Iphone 17',21000000,'iphone',3,10,'2024-07-16 16:25:36.000000','2024-07-16 16:25:36.000000',NULL),(54,NULL,'Iphone 19',5,'iphone',3,3,'2024-07-16 16:28:22.000000','2024-07-16 16:28:22.000000',NULL),(55,NULL,'Iphone20',21000000,'iphone',3,10,'2024-07-16 16:30:50.000000','2024-07-16 16:30:50.000000',NULL),(56,NULL,'Iphone20',21000000,'iphone',3,10,'2024-07-16 16:32:53.000000','2024-07-16 16:32:53.000000',NULL),(57,NULL,'Iphone20',21000000,'iphone',3,10,'2024-07-16 16:35:29.000000','2024-07-16 16:35:29.000000',NULL),(58,NULL,'macbook',15,'iphone',2,23,'2024-07-16 16:42:56.000000','2024-07-16 23:09:05.000000',NULL),(69,NULL,'Iphone X',10000000,'Iphone',3,10,'2024-07-16 22:42:09.000000','2024-07-16 22:42:09.000000',NULL),(70,NULL,'Iphone 99',11,'ss',3,2,'2024-07-18 17:49:07.000000','2024-07-18 18:18:14.000000','Ram 2G');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Accessary'),(2,'Laptop'),(3,'Mobile');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `ram` int(11) NOT NULL,
  `cpu` varchar(255) DEFAULT NULL,
  `display` varchar(255) NOT NULL,
  `vga` varchar(255) DEFAULT NULL,
  `drive` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_details` (`product_id`),
  CONSTRAINT `fk_product_details` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` VALUES (47,11,8,'i5','15.6 inch',NULL,'128 GB');
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(300) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi8jnqq05sk5nkma3pfp3ylqrt` (`product_id`),
  CONSTRAINT `FKi8jnqq05sk5nkma3pfp3ylqrt` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (7,'http://res.cloudinary.com/dmuhayimh/image/upload/v1720947126/image/evxqkpxpgsfbb9xjr7t7.jpg',6),(10,'http://res.cloudinary.com/dmuhayimh/image/upload/v1720971951/image/ot2yxfy62tebtzypjzgt.jpg',8),(11,'http://res.cloudinary.com/dmuhayimh/image/upload/v1720971952/image/nin5eqvgayzg6ipum8zg.jpg',8),(13,'http://res.cloudinary.com/dmuhayimh/image/upload/v1720979066/image/riohnblkvjrjjbncqm3u.jpg',10),(14,'http://res.cloudinary.com/dmuhayimh/image/upload/v1720979407/image/b1prpdogqyjcihwiorjm.jpg',11),(81,'http://lorempixel.com/g/1280/1024/people/',51),(82,'http://res.cloudinary.com/dmuhayimh/image/upload/v1721121551/image/ubrdkonnxjtognmzgyku.png',52),(83,'http://res.cloudinary.com/dmuhayimh/image/upload/v1721122045/image/lxd0ghhqnrpooqptrlb3.png',53),(84,'http://res.cloudinary.com/dmuhayimh/image/upload/v1721122211/image/b6gjae7cvqrwfyaipjrp.png',54),(85,'http://res.cloudinary.com/dmuhayimh/image/upload/v1721122357/image/fy007krkftqmwprlbxm2.png',55),(86,'http://res.cloudinary.com/dmuhayimh/image/upload/v1721122472/image/ju1szincknj0bktzvxlv.png',56),(87,'http://res.cloudinary.com/dmuhayimh/image/upload/v1721122640/image/ctomvlvz8hwswk580hkw.png',57),(88,'http://res.cloudinary.com/dmuhayimh/image/upload/v1721123080/image/bh3rso9ev7ewnwoxeadm.jpg',58),(108,'http://res.cloudinary.com/dmuhayimh/image/upload/v1721299851/image/qrzv4zwqll3rudxpcwcy.jpg',70);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `token_type` varchar(50) NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_mobile` tinyint(1) DEFAULT NULL,
  `refresh_expiration_date` datetime(6) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
INSERT INTO `user_address` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_payment`
--

DROP TABLE IF EXISTS `user_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_payment` (
  `id` int(11) NOT NULL,
  `account_no` int(11) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_payment`
--

LOCK TABLES `user_payment` WRITE;
/*!40000 ALTER TABLE `user_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_roles_roles` (`role_id`),
  CONSTRAINT `fk_user_roles_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_user_roles_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (2,1),(3,1),(4,1),(5,2),(6,2),(7,2),(8,2);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `delete_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modify_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `profile_image` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `fk_address_id` (`address`),
  CONSTRAINT `fk_address_id` FOREIGN KEY (`address`) REFERENCES `user_address` (`id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'trandai','$2a$10$rTaM3BDt0jmgfO/HZvvayueCOrkQYNQ.g.IoaXnSHiJaUgWcjzXke',2,'tran','dai','01234','trandai@gmail.com',1,'2024-07-17 04:56:43','2024-07-17 11:56:43','2024-07-17 04:56:43',NULL),(3,'nghiep1320','$2a$10$4M8QBG.eZkpvn83Lmem7ButsYYP9db1JCfiRNLfEWdgOKP6ZMNaee',1,NULL,NULL,'01234','trandai99@gmail.com',2,'2024-07-17 04:53:42','2024-07-17 11:53:42','2024-07-17 04:53:42',NULL),(4,'vinh','$2a$10$XU2SJXWpi7SIOjrOON/BX.3txH0iS44s90ofXzFAUmqLpNIDg2Via',1,NULL,NULL,'0333033033','123@gmail.com',3,'2024-07-17 04:53:46','2024-07-17 11:53:46','2024-07-17 04:53:46',NULL),(5,'trandai123','$2a$10$.0lmU6MrNHArAyFzsaV.b.3.3TTAKCRO8ykNv9wgEX7fvXvBj/Cyi',NULL,NULL,NULL,'123','trandai123@gmail.com',4,'2024-07-17 08:56:22','2024-07-17 15:56:22','2024-07-17 08:56:22',NULL),(6,'nghiep','$2a$10$YgDcO4oAqCzsyWeOHPu99O2HW3Pd.iRIo2yOnAc1KGYqsR1l1I.Tq',2,NULL,NULL,'123','trandai12@gmail.com',5,'2024-07-17 09:19:56','2024-07-17 16:19:56','2024-07-17 09:19:56',NULL),(7,'nghiep1','$2a$10$RI2cHLu5B.dnxyNZM7qFl.QpNbjYKd87PmMEHwhCYnXB1iefvbqvW',NULL,NULL,NULL,'123','trandai1@gmail.com',6,'2024-07-17 09:21:32','2024-07-17 16:21:32','2024-07-17 09:21:32',NULL),(8,'nghiep11','$2a$10$BLteM5E6EbfX//IWagfFceqIkY8/IzKOxlrZAL6GAG7gl8N3AC5nu',NULL,NULL,NULL,'123','trandai11@gmail.com',7,'2024-07-17 15:31:17','2024-07-17 22:31:17','2024-07-17 15:31:17',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-10 22:28:29
