/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: banglz
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bangle_box_colors`
--

DROP TABLE IF EXISTS `bangle_box_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bangle_box_colors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `color_name` varchar(255) NOT NULL,
  `bangle_box_size_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bangle_box_colors_bangle_box_size_id_foreign` (`bangle_box_size_id`),
  CONSTRAINT `bangle_box_colors_bangle_box_size_id_foreign` FOREIGN KEY (`bangle_box_size_id`) REFERENCES `bangle_box_sizes` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bangle_box_colors`
--

LOCK TABLES `bangle_box_colors` WRITE;
/*!40000 ALTER TABLE `bangle_box_colors` DISABLE KEYS */;
INSERT INTO `bangle_box_colors` VALUES
(1,'matte-peach.avif','Matte Peach',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(2,'matte-dark-peach.avif','Matte Dark Peach',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(3,'Peach with Glitter.avif','Peach with Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(4,'Peach Pink with Gold Glitter.avif','Peach Pink with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(5,'Peach with Gold Glitter.avif','Peach with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(6,'Matte Light Pink.avif','Matte Light Pink',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(7,'Light Pink with Silver Glitter.webp','Light Pink with Silver Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(8,'Pink with Gold Glitter.avif','Pink with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(9,'Matte Pink.avif','Matte Pink',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(10,'Matte Bright Pink.avif','Matte Bright Pink',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(11,'Metallic Velvet Rose.webp','Metallic Velvet Rose',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(12,'Rose with Gold Glitter.avif','Rose with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(13,'Wine with Gold Glitter.avif','Wine with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(14,'Hot Pink with Gold Glitter.avif','Hot Pink with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(15,'Coral Matte.avif','Coral Matte',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(16,'Matte Fuschia.avif','Matte Fuschia',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(17,'Metallic Velvet Fuschia.webp','Metallic Velvet Fuschia',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(18,'Matte Fuchsia with Sparkles.avif','Matte Fuchsia with Sparkles',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(19,'Fuchsia with Gold Glitter.avif','Fuchsia with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(20,'Dark Purple with Gold Glitter.avif','Dark Purple with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(21,'Metallic Velvet Purple.webp','Metallic Velvet Purple',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(22,'Velvet Purple.webp','Velvet Purple',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(23,'Purple with Gold Glitter.avif','Purple with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(24,'Matte Lavender.avif','Matte Lavender',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(25,'Velvet Lavender.webp','Velvet Lavender',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(26,'Light Purple with Silver Glitter.webp','Light Purple with Silver Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(27,'Matte Lilac.avif','Matte Lilac',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(28,'Metallic Velvet Lilac.webp','Metallic Velvet Lilac',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(29,'Lilac with Gold Glitter.avif','Lilac with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(30,'Grape with Gold Glitter.avif','Grape with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(31,'Matte Grape.avif','Matte Grape',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(32,'Navy Blue with Gold Glitter.avif','Navy Blue with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(33,'Matte Blue.avif','Matte Blue',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(34,'Blue with Gold Glitter.avif','Blue with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(35,'Matte Cobalt Blue.avif','Matte Cobalt Blue',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(36,'Cobalt Blue with Gold Glitter.avif','Cobalt Blue with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(37,'Matte Light Blue.avif','Matte Light Blue',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(38,'Light Blue with Gold Glitter.avif','Light Blue with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(39,'Teal with Gold Glitter.avif','Teal with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(40,'Dark Green with Gold Glitter.avif','Dark Green with Gold Glitter',1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(41,'matte-peach.avif','Matte Peach',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(42,'matte-dark-peach.avif','Matte Dark Peach',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(43,'Peach with Glitter.avif','Peach with Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(44,'Peach Pink with Gold Glitter.avif','Peach Pink with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(45,'Peach with Gold Glitter.avif','Peach with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(46,'Matte Light Pink.avif','Matte Light Pink',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(47,'Light Pink with Silver Glitter.webp','Light Pink with Silver Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(48,'Pink with Gold Glitter.avif','Pink with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(49,'Matte Pink.avif','Matte Pink',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(50,'Matte Bright Pink.avif','Matte Bright Pink',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(51,'Metallic Velvet Rose.webp','Metallic Velvet Rose',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(52,'Rose with Gold Glitter.avif','Rose with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(53,'Wine with Gold Glitter.avif','Wine with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(54,'Hot Pink with Gold Glitter.avif','Hot Pink with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(55,'Coral Matte.avif','Coral Matte',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(56,'Matte Fuschia.avif','Matte Fuschia',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(57,'Metallic Velvet Fuschia.webp','Metallic Velvet Fuschia',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(58,'Matte Fuchsia with Sparkles.avif','Matte Fuchsia with Sparkles',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(59,'Fuchsia with Gold Glitter.avif','Fuchsia with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(60,'Dark Purple with Gold Glitter.avif','Dark Purple with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(61,'Metallic Velvet Purple.webp','Metallic Velvet Purple',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(62,'Velvet Purple.webp','Velvet Purple',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(63,'Purple with Gold Glitter.avif','Purple with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(64,'Matte Lavender.avif','Matte Lavender',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(65,'Velvet Lavender.webp','Velvet Lavender',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(66,'Light Purple with Silver Glitter.webp','Light Purple with Silver Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(67,'Matte Lilac.avif','Matte Lilac',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(68,'Metallic Velvet Lilac.webp','Metallic Velvet Lilac',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(69,'Lilac with Gold Glitter.avif','Lilac with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(70,'Grape with Gold Glitter.avif','Grape with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(71,'Matte Grape.avif','Matte Grape',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(72,'Navy Blue with Gold Glitter.avif','Navy Blue with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(73,'Matte Blue.avif','Matte Blue',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(74,'Blue with Gold Glitter.avif','Blue with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(75,'Matte Cobalt Blue.avif','Matte Cobalt Blue',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(76,'Cobalt Blue with Gold Glitter.avif','Cobalt Blue with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(77,'Matte Light Blue.avif','Matte Light Blue',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(78,'Light Blue with Gold Glitter.avif','Light Blue with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(79,'Teal with Gold Glitter.avif','Teal with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(80,'Dark Green with Gold Glitter.avif','Dark Green with Gold Glitter',2,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(81,'matte-peach.avif','Matte Peach',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(82,'matte-dark-peach.avif','Matte Dark Peach',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(83,'Peach with Glitter.avif','Peach with Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(84,'Peach Pink with Gold Glitter.avif','Peach Pink with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(85,'Peach with Gold Glitter.avif','Peach with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(86,'Matte Light Pink.avif','Matte Light Pink',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(87,'Light Pink with Silver Glitter.webp','Light Pink with Silver Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(88,'Pink with Gold Glitter.avif','Pink with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(89,'Matte Pink.avif','Matte Pink',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(90,'Matte Bright Pink.avif','Matte Bright Pink',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(91,'Metallic Velvet Rose.webp','Metallic Velvet Rose',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(92,'Rose with Gold Glitter.avif','Rose with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(93,'Wine with Gold Glitter.avif','Wine with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(94,'Hot Pink with Gold Glitter.avif','Hot Pink with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(95,'Coral Matte.avif','Coral Matte',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(96,'Matte Fuschia.avif','Matte Fuschia',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(97,'Metallic Velvet Fuschia.webp','Metallic Velvet Fuschia',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(98,'Matte Fuchsia with Sparkles.avif','Matte Fuchsia with Sparkles',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(99,'Fuchsia with Gold Glitter.avif','Fuchsia with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(100,'Dark Purple with Gold Glitter.avif','Dark Purple with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(101,'Metallic Velvet Purple.webp','Metallic Velvet Purple',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(102,'Velvet Purple.webp','Velvet Purple',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(103,'Purple with Gold Glitter.avif','Purple with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(104,'Matte Lavender.avif','Matte Lavender',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(105,'Velvet Lavender.webp','Velvet Lavender',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(106,'Light Purple with Silver Glitter.webp','Light Purple with Silver Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(107,'Matte Lilac.avif','Matte Lilac',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(108,'Metallic Velvet Lilac.webp','Metallic Velvet Lilac',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(109,'Lilac with Gold Glitter.avif','Lilac with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(110,'Grape with Gold Glitter.avif','Grape with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(111,'Matte Grape.avif','Matte Grape',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(112,'Navy Blue with Gold Glitter.avif','Navy Blue with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(113,'Matte Blue.avif','Matte Blue',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(114,'Blue with Gold Glitter.avif','Blue with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(115,'Matte Cobalt Blue.avif','Matte Cobalt Blue',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(116,'Cobalt Blue with Gold Glitter.avif','Cobalt Blue with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(117,'Matte Light Blue.avif','Matte Light Blue',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(118,'Light Blue with Gold Glitter.avif','Light Blue with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(119,'Teal with Gold Glitter.avif','Teal with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(120,'Dark Green with Gold Glitter.avif','Dark Green with Gold Glitter',3,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(121,'matte-peach.avif','Matte Peach',4,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(122,'matte-dark-peach.avif','Matte Dark Peach',4,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(123,'Peach with Glitter.avif','Peach with Glitter',4,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(124,'Peach Pink with Gold Glitter.avif','Peach Pink with Gold Glitter',4,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(125,'Peach with Gold Glitter.avif','Peach with Gold Glitter',4,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(126,'Matte Light Pink.avif','Matte Light Pink',4,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(127,'Light Pink with Silver Glitter.webp','Light Pink with Silver Glitter',4,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(128,'Pink with Gold Glitter.avif','Pink with Gold Glitter',4,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(129,'Matte Pink.avif','Matte Pink',4,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(130,'Matte Bright Pink.avif','Matte Bright Pink',4,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(131,'Metallic Velvet Rose.webp','Metallic Velvet Rose',4,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(132,'Rose with Gold Glitter.avif','Rose with Gold Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(133,'Wine with Gold Glitter.avif','Wine with Gold Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(134,'Hot Pink with Gold Glitter.avif','Hot Pink with Gold Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(135,'Coral Matte.avif','Coral Matte',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(136,'Matte Fuschia.avif','Matte Fuschia',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(137,'Metallic Velvet Fuschia.webp','Metallic Velvet Fuschia',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(138,'Matte Fuchsia with Sparkles.avif','Matte Fuchsia with Sparkles',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(139,'Fuchsia with Gold Glitter.avif','Fuchsia with Gold Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(140,'Dark Purple with Gold Glitter.avif','Dark Purple with Gold Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(141,'Metallic Velvet Purple.webp','Metallic Velvet Purple',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(142,'Velvet Purple.webp','Velvet Purple',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(143,'Purple with Gold Glitter.avif','Purple with Gold Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(144,'Matte Lavender.avif','Matte Lavender',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(145,'Velvet Lavender.webp','Velvet Lavender',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(146,'Light Purple with Silver Glitter.webp','Light Purple with Silver Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(147,'Matte Lilac.avif','Matte Lilac',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(148,'Metallic Velvet Lilac.webp','Metallic Velvet Lilac',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(149,'Lilac with Gold Glitter.avif','Lilac with Gold Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(150,'Grape with Gold Glitter.avif','Grape with Gold Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(151,'Matte Grape.avif','Matte Grape',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(152,'Navy Blue with Gold Glitter.avif','Navy Blue with Gold Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(153,'Matte Blue.avif','Matte Blue',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(154,'Blue with Gold Glitter.avif','Blue with Gold Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(155,'Matte Cobalt Blue.avif','Matte Cobalt Blue',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(156,'Cobalt Blue with Gold Glitter.avif','Cobalt Blue with Gold Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(157,'Matte Light Blue.avif','Matte Light Blue',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(158,'Light Blue with Gold Glitter.avif','Light Blue with Gold Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(159,'Teal with Gold Glitter.avif','Teal with Gold Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00'),
(160,'Dark Green with Gold Glitter.avif','Dark Green with Gold Glitter',4,'2026-02-07 09:29:00','2026-02-07 09:29:00');
/*!40000 ALTER TABLE `bangle_box_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bangle_box_sizes`
--

DROP TABLE IF EXISTS `bangle_box_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bangle_box_sizes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `size` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bangle_box_sizes`
--

LOCK TABLES `bangle_box_sizes` WRITE;
/*!40000 ALTER TABLE `bangle_box_sizes` DISABLE KEYS */;
INSERT INTO `bangle_box_sizes` VALUES
(1,'2.4','2026-02-07 09:28:59','2026-02-07 09:28:59'),
(2,'2.6','2026-02-07 09:28:59','2026-02-07 09:28:59'),
(3,'2.8','2026-02-07 09:28:59','2026-02-07 09:28:59'),
(4,'2.10','2026-02-07 09:28:59','2026-02-07 09:28:59');
/*!40000 ALTER TABLE `bangle_box_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bangle_cart_colors`
--

DROP TABLE IF EXISTS `bangle_cart_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bangle_cart_colors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` bigint(20) unsigned NOT NULL,
  `color_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bangle_cart_colors_cart_id_foreign` (`cart_id`),
  KEY `bangle_cart_colors_color_id_foreign` (`color_id`),
  CONSTRAINT `bangle_cart_colors_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bangle_cart_colors_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `bangle_box_colors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bangle_cart_colors`
--

LOCK TABLES `bangle_cart_colors` WRITE;
/*!40000 ALTER TABLE `bangle_cart_colors` DISABLE KEYS */;
/*!40000 ALTER TABLE `bangle_cart_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogs_slug_unique` (`slug`),
  KEY `blogs_category_id_foreign` (`category_id`),
  CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `box_sizes`
--

DROP TABLE IF EXISTS `box_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `box_sizes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `size` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box_sizes`
--

LOCK TABLES `box_sizes` WRITE;
/*!40000 ALTER TABLE `box_sizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `box_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundle_products`
--

DROP TABLE IF EXISTS `bundle_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bundle_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bundle_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variation_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bundle_products_bundle_id_foreign` (`bundle_id`),
  KEY `bundle_products_product_id_foreign` (`product_id`),
  KEY `bundle_products_variation_id_foreign` (`variation_id`),
  CONSTRAINT `bundle_products_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundle_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundle_products_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundle_products`
--

LOCK TABLES `bundle_products` WRITE;
/*!40000 ALTER TABLE `bundle_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundle_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundles`
--

DROP TABLE IF EXISTS `bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bundles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bundles_user_id_foreign` (`user_id`),
  CONSTRAINT `bundles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundles`
--

LOCK TABLES `bundles` WRITE;
/*!40000 ALTER TABLE `bundles` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `stripe_pm_id` varchar(255) DEFAULT NULL,
  `card_last4` varchar(4) DEFAULT NULL,
  `card_brand` varchar(255) DEFAULT NULL,
  `exp_month` tinyint(4) DEFAULT NULL,
  `exp_year` smallint(6) DEFAULT NULL,
  `expiry` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_user_id_index` (`user_id`),
  KEY `cards_stripe_pm_id_index` (`stripe_pm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) unsigned DEFAULT NULL,
  `bangle_box_id` bigint(20) unsigned DEFAULT NULL,
  `bangle_box_size` varchar(255) DEFAULT NULL,
  `bangle_size_id` bigint(20) unsigned DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `recipient_email` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variation_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_variation_id_foreign` (`variation_id`),
  KEY `carts_bangle_box_id_foreign` (`bangle_box_id`),
  KEY `carts_bangle_size_id_foreign` (`bangle_size_id`),
  CONSTRAINT `carts_bangle_box_id_foreign` FOREIGN KEY (`bangle_box_id`) REFERENCES `box_sizes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_bangle_size_id_foreign` FOREIGN KEY (`bangle_size_id`) REFERENCES `bangle_box_sizes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `slug` varchar(255) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `description` text DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `top_listed` tinyint(1) NOT NULL DEFAULT 0,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `allow_size` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,'Bangles',1,'bangles','[\"bride-3.png\"]','Bangles description for testing',1,1,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:59',NULL,0),
(2,'Ready to Wear',1,'ready-to-wear','[\"bride-1.png\"]','Ready to Wear description for testing',0,1,1,'2026-02-07 09:28:58','2026-02-07 09:28:59',NULL,0),
(3,'Banglez Boxes',1,'banglez-boxes','[\"bride-3.png\"]','Banglez Boxes description for testing',0,1,1,'2026-02-07 09:28:58','2026-02-07 09:28:59',NULL,0),
(4,'Banglez Chest',1,'banglez-chest','[\"bride-1.png\"]','Banglez Chest description for testing',0,0,1,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(5,'Stone Bangles',1,'stone-bangles','[\"bride-2.png\"]','Stone Bangles description for testing',0,0,1,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(6,'Punjabi Choora',1,'punjabi-choora','[\"bride-4.png\"]','Punjabi Choora description for testing',0,0,1,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(7,'Necklaces',1,'necklaces','[\"bride-3.png\"]','Necklaces description for testing',1,0,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(8,'Bridal/Formal',1,'bridalformal','[\"bride-1.png\"]','Bridal/Formal description for testing',0,0,7,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(9,'Party',1,'party','[\"bride-4.png\"]','Party description for testing',0,0,7,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(10,'Chokers',1,'chokers','[\"bride-4.png\"]','Chokers description for testing',0,0,7,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(11,'Pendant/ Longhaar',1,'pendant-longhaar','[\"bride-2.png\"]','Pendant/ Longhaar description for testing',0,0,7,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(12,'Earrings',1,'earrings','[\"bride-1.png\"]','Earrings description for testing',1,0,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(13,'Jhumka',1,'jhumka','[\"bride-1.png\"]','Jhumka description for testing',0,0,12,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(14,'Earrings + tikka set',1,'earrings-tikka-set','[\"bride-2.png\"]','Earrings + tikka set description for testing',0,0,12,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(15,'tops/studs',1,'topsstuds','[\"bride-2.png\"]','tops/studs description for testing',0,0,12,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(16,'Headpieces',1,'headpieces','[\"bride-2.png\"]','Headpieces description for testing',1,0,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(17,'Tikkas',1,'tikkas','[\"bride-1.png\"]','Tikkas description for testing',0,0,16,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(18,'Jhumar/Passa',1,'jhumarpassa','[\"bride-4.png\"]','Jhumar/Passa description for testing',0,0,16,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(19,'Matha Patti',1,'matha-patti','[\"bride-2.png\"]','Matha Patti description for testing',0,0,16,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(20,'Accessories',1,'accessories','[\"bride-1.png\"]','Accessories description for testing',1,0,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(21,'Nose Rings',1,'nose-rings','[\"bride-4.png\"]','Nose Rings description for testing',0,0,20,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(22,'Payal/Anklets',1,'payalanklets','[\"bride-4.png\"]','Payal/Anklets description for testing',0,0,20,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(23,'Rings',1,'rings','[\"bride-2.png\"]','Rings description for testing',0,0,20,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(24,'Hand Pieces',1,'hand-pieces','[\"bride-4.png\"]','Hand Pieces description for testing',0,0,20,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(25,'Kamarbands/belts',1,'kamarbandsbelts','[\"bride-2.png\"]','Kamarbands/belts description for testing',0,0,20,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(26,'Kaleera',1,'kaleera','[\"bride-3.png\"]','Kaleera description for testing',0,0,20,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(27,'Trending',1,'trending','[\"bride-3.png\"]','Trending description for testing',1,0,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(28,'Pre-Orders',1,'pre-orders','[\"bride-3.png\"]','Pre-Orders description for testing',0,0,27,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0),
(29,'Gift Sets',1,'gift-sets','[\"bride-2.png\"]','Gift Sets description for testing',0,0,27,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_boxes`
--

DROP TABLE IF EXISTS `category_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_boxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_boxes_category_id_foreign` (`category_id`),
  CONSTRAINT `category_boxes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_boxes`
--

LOCK TABLES `category_boxes` WRITE;
/*!40000 ALTER TABLE `category_boxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_products`
--

DROP TABLE IF EXISTS `collection_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_products_collection_id_product_id_unique` (`collection_id`,`product_id`),
  KEY `collection_products_product_id_foreign` (`product_id`),
  CONSTRAINT `collection_products_collection_id_foreign` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `collection_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_products`
--

LOCK TABLES `collection_products` WRITE;
/*!40000 ALTER TABLE `collection_products` DISABLE KEYS */;
INSERT INTO `collection_products` VALUES
(1,1,1,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(2,1,2,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(3,3,3,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(4,2,4,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(5,1,5,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(6,2,5,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(7,3,6,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(8,3,7,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(9,3,8,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(10,1,9,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(11,2,9,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(12,1,10,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(13,3,10,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(14,2,11,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(15,1,12,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(16,3,12,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(17,1,13,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(18,3,13,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(19,1,14,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(20,1,15,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(21,2,15,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(22,1,16,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(23,3,17,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(24,1,18,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(25,2,19,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(26,1,20,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(27,2,20,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(28,1,21,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(29,1,22,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(30,2,22,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(31,1,23,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(32,2,23,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(33,2,24,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(34,3,24,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(35,3,25,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(36,2,26,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(37,2,27,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(38,3,27,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(39,3,28,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(40,1,29,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(41,3,29,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(42,3,30,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(43,1,31,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(44,2,31,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(45,2,32,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(46,2,33,'2026-02-07 09:28:59','2026-02-07 09:28:59');
/*!40000 ALTER TABLE `collection_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `collections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `slug` varchar(255) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collections_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES
(1,'Wedding Collection',1,'wedding-collection','[\"collection-1.png\"]','Wedding Collection description','2026-02-07 09:28:58','2026-02-07 09:28:58',NULL),
(2,'Casual Collection',1,'casual-collection','[\"collection-1.png\"]','Casual Collection description','2026-02-07 09:28:58','2026-02-07 09:28:58',NULL),
(3,'Premium Collection',1,'premium-collection','[\"collection-2.png\"]','Premium Collection description','2026-02-07 09:28:58','2026-02-07 09:28:58',NULL);
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
INSERT INTO `failed_jobs` VALUES
(2,'a62574ef-a9bd-4a96-a583-4f9361ffa281','database','default','{\"uuid\":\"a62574ef-a9bd-4a96-a583-4f9361ffa281\",\"displayName\":\"App\\\\Mail\\\\PreferencesUpdatedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:31:\\\"App\\\\Mail\\\\PreferencesUpdatedMail\\\":4:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:11:\\\"preferences\\\";a:4:{s:16:\\\"marketing_emails\\\";i:0;s:13:\\\"order_updates\\\";i:1;s:10:\\\"newsletter\\\";i:1;s:23:\\\"product_recommendations\\\";i:1;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:15:\\\"admin@admin.com\\\";}}s:6:\\\"mailer\\\";s:3:\\\"log\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}','ErrorException: Trying to access array offset on int in /media/hassaan/Backup/Fiverr Projects/banglz/storage/framework/views/888592796a2326ca7a39b93835ffe1d6.php:11\nStack trace:\n#0 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Foundation/Bootstrap/HandleExceptions.php(255): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /media/hassaan/Backup/Fiverr Projects/banglz/storage/framework/views/888592796a2326ca7a39b93835ffe1d6.php(11): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Filesystem/Filesystem.php(123): require(\'...\')\n#3 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Filesystem/Filesystem.php(124): Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}()\n#4 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/View/Engines/PhpEngine.php(58): Illuminate\\Filesystem\\Filesystem->getRequire()\n#5 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/View/Engines/CompilerEngine.php(72): Illuminate\\View\\Engines\\PhpEngine->evaluatePath()\n#6 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/View/View.php(207): Illuminate\\View\\Engines\\CompilerEngine->get()\n#7 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/View/View.php(190): Illuminate\\View\\View->getContents()\n#8 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/View/View.php(159): Illuminate\\View\\View->renderContents()\n#9 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/Markdown.php(65): Illuminate\\View\\View->render()\n#10 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(366): Illuminate\\Mail\\Markdown->render()\n#11 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Collections/helpers.php(224): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#12 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(429): value()\n#13 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(408): Illuminate\\Mail\\Mailer->renderView()\n#14 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(320): Illuminate\\Mail\\Mailer->addContent()\n#15 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#16 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#17 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#18 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#19 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#20 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#21 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#22 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#23 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#24 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#25 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#26 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#28 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#29 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#30 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#31 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#32 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#33 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#34 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#35 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#36 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(333): Illuminate\\Queue\\Worker->runJob()\n#37 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->runNextJob()\n#38 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#39 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#40 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#41 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#42 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#43 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#44 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#45 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#46 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#47 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#48 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#49 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#50 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#51 /media/hassaan/Backup/Fiverr Projects/banglz/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#52 {main}\n\nNext Illuminate\\View\\ViewException: Trying to access array offset on int (View: /media/hassaan/Backup/Fiverr Projects/banglz/resources/views/emails/preferences-updated.blade.php) in /media/hassaan/Backup/Fiverr Projects/banglz/storage/framework/views/888592796a2326ca7a39b93835ffe1d6.php:11\nStack trace:\n#0 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/View/Engines/PhpEngine.php(60): Illuminate\\View\\Engines\\CompilerEngine->handleViewException()\n#1 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/View/Engines/CompilerEngine.php(72): Illuminate\\View\\Engines\\PhpEngine->evaluatePath()\n#2 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/View/View.php(207): Illuminate\\View\\Engines\\CompilerEngine->get()\n#3 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/View/View.php(190): Illuminate\\View\\View->getContents()\n#4 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/View/View.php(159): Illuminate\\View\\View->renderContents()\n#5 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/Markdown.php(65): Illuminate\\View\\View->render()\n#6 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(366): Illuminate\\Mail\\Markdown->render()\n#7 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Collections/helpers.php(224): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#8 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(429): value()\n#9 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(408): Illuminate\\Mail\\Mailer->renderView()\n#10 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(320): Illuminate\\Mail\\Mailer->addContent()\n#11 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#12 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#13 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#14 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#15 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#16 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#18 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#19 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#20 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#21 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#22 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#24 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#25 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#26 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#28 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#29 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#30 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#32 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(333): Illuminate\\Queue\\Worker->runJob()\n#33 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->runNextJob()\n#34 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#35 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#37 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#38 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#39 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#40 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#41 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#42 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#43 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#44 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#45 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#46 /media/hassaan/Backup/Fiverr Projects/banglz/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#47 /media/hassaan/Backup/Fiverr Projects/banglz/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#48 {main}','2026-02-07 12:53:22');
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_card_codes`
--

DROP TABLE IF EXISTS `gift_card_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gift_card_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recipient_email` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT 'unused',
  `order_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gift_card_codes_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_card_codes`
--

LOCK TABLES `gift_card_codes` WRITE;
/*!40000 ALTER TABLE `gift_card_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_card_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_card_histories`
--

DROP TABLE IF EXISTS `gift_card_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gift_card_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gift_card_id` bigint(20) unsigned NOT NULL,
  `used_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gift_card_histories_gift_card_id_foreign` (`gift_card_id`),
  CONSTRAINT `gift_card_histories_gift_card_id_foreign` FOREIGN KEY (`gift_card_id`) REFERENCES `gift_card_codes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_card_histories`
--

LOCK TABLES `gift_card_histories` WRITE;
/*!40000 ALTER TABLE `gift_card_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_card_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES
(3,'default','{\"uuid\":\"01427f8e-394f-4107-84fe-4b0cb0a03e4d\",\"displayName\":\"App\\\\Mail\\\\PreferencesUpdatedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:31:\\\"App\\\\Mail\\\\PreferencesUpdatedMail\\\":4:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:11:\\\"preferences\\\";a:4:{s:16:\\\"marketing_emails\\\";i:0;s:13:\\\"order_updates\\\";i:1;s:10:\\\"newsletter\\\";i:1;s:23:\\\"product_recommendations\\\";i:1;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:15:\\\"admin@admin.com\\\";}}s:6:\\\"mailer\\\";s:3:\\\"log\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}',0,NULL,1770486990,1770486990),
(4,'default','{\"uuid\":\"eee2cc5c-a922-45e1-bf8f-b25435bafc40\",\"displayName\":\"App\\\\Mail\\\\PasswordChangedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\PasswordChangedMail\\\":4:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:9:\\\"changedAt\\\";s:24:\\\"February 7, 2026 7:15 PM\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:17:\\\"hassaan@gmail.com\\\";}}s:6:\\\"mailer\\\";s:3:\\\"log\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}',0,NULL,1770491726,1770491726);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2025_08_07_174622_create_categories_table',1),
(6,'2025_08_07_194208_create_collections_table',1),
(7,'2025_08_07_194610_create_products_table',1),
(8,'2025_08_07_195239_create_tags_table',1),
(9,'2025_08_07_195427_create_product_tags_table',1),
(10,'2025_08_07_195622_create_collection_products_table',1),
(11,'2025_08_11_180806_create_product_variations_table',1),
(12,'2025_08_16_103439_add_type_to_users_table',1),
(13,'2025_08_16_115623_add_deleted_at_to_products_table',1),
(14,'2025_08_18_184232_add_compare_price_to_product_variations',1),
(15,'2025_08_19_173442_add_deleted_at_to_tags_table',1),
(16,'2025_08_19_191654_add_soft_deletes_to_collections_table',1),
(17,'2025_08_20_171816_add_extra_fields_to_products_table',1),
(18,'2025_08_21_175540_add_soft_deletes_to_categories_table',1),
(19,'2025_08_28_172102_add_profile_fields_to_users_table',1),
(20,'2025_08_28_175759_add_member_price_to_products_table',1),
(21,'2025_08_28_184302_create_product_colors_table',1),
(22,'2025_08_28_190516_add_deleted_at_to_product_colors_table',1),
(23,'2025_08_28_191225_add_color_names_to_products_table',1),
(24,'2025_08_29_185409_create_blog_categories_table',1),
(25,'2025_08_29_185451_create_blogs_table',1),
(26,'2025_09_02_180838_create_carts_table',1),
(27,'2025_09_02_180841_create_bundles_table',1),
(28,'2025_09_02_180853_create_bundle_products_table',1),
(29,'2025_09_03_180522_update_product_variations_add_color_id',1),
(30,'2025_09_03_192354_add_variation_id_to_cart_and_bundle_products_tables',1),
(31,'2025_09_06_075754_add_session_id_to_users_table',1),
(32,'2025_09_06_082615_create_cards_table',1),
(33,'2025_09_06_110021_create_page_settings_table',1),
(34,'2025_09_06_111131_add_stripe_customer_id_to_users_table',1),
(35,'2025_09_06_120133_create_orders_table',1),
(36,'2025_09_09_191357_create_user_rewards_table',1),
(37,'2025_09_09_194540_add_rewards_to_users_table',1),
(38,'2025_09_12_194344_add_unavailable_quantity_to_products_and_product_variations',1),
(39,'2025_09_15_171328_create_wishlists_table',1),
(40,'2025_09_16_170059_add_is_top_listed_to_products_table',1),
(41,'2025_09_17_153814_add_us_import_duties_to_orders_table',1),
(42,'2025_09_18_171703_create_category_boxes_table',1),
(43,'2025_09_18_180742_add_category_box_id_to_products_table',1),
(44,'2025_09_19_203230_alter_page_settings_add_images_column',1),
(45,'2025_09_20_095942_create_product_notify_table',1),
(46,'2025_09_23_171728_add_color_id_and_size_to_products_table',1),
(47,'2025_09_23_175632_add_allow_size_to_categories_table',1),
(48,'2025_09_23_183046_create_payments_table',1),
(49,'2025_09_25_013034_add_seo_and_images_details_to_products_table',1),
(50,'2025_09_26_013532_add_is_pre_order_to_products_table',1),
(51,'2025_09_26_022703_add_is_guest_and_customer_id_to_users_table',1),
(52,'2025_09_27_095122_add_order_id_to_orders_table',1),
(53,'2025_10_02_184310_add_email_to_cart_table',1),
(54,'2025_10_04_080253_create_gift_card_codes_table',1),
(55,'2025_10_04_121011_create_gift_card_histories_table',1),
(56,'2025_10_06_025024_add_applied_gift_card_meta_data_to_orders_table',1),
(57,'2025_10_09_035848_add_weight_to_products_and_product_variations_table',1),
(58,'2025_10_12_141149_create_bangle_box_sizes_table',1),
(59,'2025_10_12_141222_create_box_sizes_table',1),
(60,'2025_10_12_141300_create_bangle_box_colors_table',1),
(61,'2025_10_15_012201_create_bangle_cart_colors_table',1),
(62,'2025_10_15_012900_add_bangle_box_columns_to_carts_table',1),
(63,'2025_10_16_012402_add_bangle_box_meta_data_to_orders_table',1),
(64,'2025_10_22_015408_add_weight_unit_to_products_table',1),
(65,'2025_11_22_000001_update_page_settings_add_page_type_and_meta_data',1),
(66,'2025_11_22_120001_update_page_settings_schema',1),
(67,'2026_01_19_195503_add_appointments_to_page_settings',1),
(68,'2026_02_02_181441_create_shipping_addresses_table',1),
(69,'2026_02_02_181552_add_communication_preferences_to_users_table',1),
(70,'2026_02_07_143452_create_sessions_table',2),
(71,'2026_02_07_150000_add_apartment_and_phone_to_shipping_addresses',3),
(72,'2026_02_07_174443_create_jobs_table',4),
(73,'2026_02_17_152253_add_shipping_label_data_to_orders_table',5),
(74,'2026_02_19_185254_add_shipping_fields_to_products_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) DEFAULT NULL,
  `applied_points` varchar(255) DEFAULT '0',
  `rewards_discount` varchar(255) DEFAULT '0',
  `applied_shipping` tinyint(1) DEFAULT 0,
  `sub_total` varchar(255) DEFAULT '0',
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `products_meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`products_meta_data`)),
  `delivery_meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`delivery_meta_data`)),
  `bangle_box_meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`bangle_box_meta_data`)),
  `total_amount` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `shipping_fee` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `shipping_label_data` text DEFAULT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `label_url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `user_meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`user_meta_data`)),
  `applied_gift_card_meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`applied_gift_card_meta_data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `us_import_duties` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_id_unique` (`order_id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_settings`
--

DROP TABLE IF EXISTS `page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `heading` varchar(255) NOT NULL,
  `sub_heading` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `page_name` varchar(255) NOT NULL,
  `page_type` varchar(255) DEFAULT NULL,
  `meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta_data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_settings`
--

LOCK TABLES `page_settings` WRITE;
/*!40000 ALTER TABLE `page_settings` DISABLE KEYS */;
INSERT INTO `page_settings` VALUES
(1,NULL,NULL,'Book Your Personal Appointment',NULL,'Book your personal appointment for styling and personalized consultation','appointments','appointments','{\"appointments\":[{\"title\":\"CUSTOM BANGLE SET\",\"description\":\"Create your perfect bangle set with our expert guidance and personalized styling.\",\"image\":\"ear.jpg\",\"link\":\"\\/appointment\"},{\"title\":\"In-person Appointment\",\"description\":\"Visit our store for a personalized consultation and styling session.\",\"image\":\"ear.jpg\",\"link\":\"\\/appointment\"},{\"title\":\"CURATED JEWELRY LOOK\",\"description\":\"Get a complete jewelry look curated by our professional stylists.\",\"image\":\"ear.jpg\",\"link\":\"\\/appointment\"},{\"title\":\"CUSTOM DESIGN\",\"description\":\"Design your own unique jewelry piece with our custom design service.\",\"image\":\"ear.jpg\",\"link\":\"\\/appointment\"}]}','2026-02-07 09:29:00','2026-02-07 09:29:00');
/*!40000 ALTER TABLE `page_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(255) NOT NULL,
  `payer_id` varchar(255) NOT NULL,
  `payer_email` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_colors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `hex_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_colors`
--

LOCK TABLES `product_colors` WRITE;
/*!40000 ALTER TABLE `product_colors` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_notify`
--

DROP TABLE IF EXISTS `product_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_notify` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `variation_id` bigint(20) unsigned DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_notify_user_id_foreign` (`user_id`),
  KEY `product_notify_product_id_foreign` (`product_id`),
  KEY `product_notify_variation_id_foreign` (`variation_id`),
  CONSTRAINT `product_notify_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_notify_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_notify_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_notify`
--

LOCK TABLES `product_notify` WRITE;
/*!40000 ALTER TABLE `product_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tags`
--

DROP TABLE IF EXISTS `product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_tags_product_id_tag_id_unique` (`product_id`,`tag_id`),
  KEY `product_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tags`
--

LOCK TABLES `product_tags` WRITE;
/*!40000 ALTER TABLE `product_tags` DISABLE KEYS */;
INSERT INTO `product_tags` VALUES
(1,1,8,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(2,1,10,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(3,2,1,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(4,2,3,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(5,3,4,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(6,3,8,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(7,4,5,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(8,5,4,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(9,5,7,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(10,6,2,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(11,6,4,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(12,6,5,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(13,7,2,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(14,7,5,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(15,7,6,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(16,8,3,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(17,8,9,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(18,9,6,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(19,10,7,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(20,10,9,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(21,10,10,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(22,11,2,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(23,12,5,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(24,12,7,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(25,13,2,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(26,13,3,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(27,13,7,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(28,14,6,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(29,14,8,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(30,15,2,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(31,15,4,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(32,16,2,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(33,16,7,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(34,16,10,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(35,17,6,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(36,17,7,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(37,18,9,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(38,18,10,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(39,19,1,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(40,19,5,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(41,19,8,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(42,20,3,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(43,20,9,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(44,21,9,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(45,22,3,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(46,22,7,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(47,22,10,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(48,23,2,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(49,23,3,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(50,23,7,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(51,24,3,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(52,24,4,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(53,24,6,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(54,25,6,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(55,25,8,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(56,26,1,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(57,26,10,'2026-02-07 09:28:58','2026-02-07 09:28:58'),
(58,27,6,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(59,28,1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(60,28,10,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(61,29,1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(62,30,6,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(63,31,4,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(64,31,6,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(65,31,7,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(66,32,1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(67,33,1,'2026-02-07 09:28:59','2026-02-07 09:28:59'),
(68,33,8,'2026-02-07 09:28:59','2026-02-07 09:28:59');
/*!40000 ALTER TABLE `product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variations`
--

DROP TABLE IF EXISTS `product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `color_id` bigint(20) unsigned DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `member_price` decimal(10,2) DEFAULT NULL,
  `compare_price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `unavailable_quantity` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `weight_unit` varchar(255) DEFAULT NULL,
  `country_of_origin` varchar(2) DEFAULT NULL COMMENT 'ISO 2-letter country code',
  `hs_code` varchar(10) DEFAULT NULL COMMENT 'Harmonized System code for customs',
  PRIMARY KEY (`id`),
  KEY `product_variations_product_id_foreign` (`product_id`),
  KEY `product_variations_color_id_foreign` (`color_id`),
  CONSTRAINT `product_variations_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `product_colors` (`id`) ON DELETE SET NULL,
  CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variations`
--

LOCK TABLES `product_variations` WRITE;
/*!40000 ALTER TABLE `product_variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `images_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images_details`)),
  `care` longtext DEFAULT NULL,
  `sustainability` longtext DEFAULT NULL,
  `shipping` longtext DEFAULT NULL,
  `returns` longtext DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `member_price` decimal(10,2) DEFAULT NULL,
  `color_id` bigint(20) unsigned DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `compare_price` decimal(10,2) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `unavailable_quantity` int(11) DEFAULT 0,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `attributes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attributes`)),
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `category_box_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `colors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`colors`)),
  `is_top_listed` tinyint(1) DEFAULT 0,
  `is_pre_order` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(255) DEFAULT NULL,
  `weight_unit` varchar(255) DEFAULT NULL,
  `country_of_origin` varchar(2) DEFAULT NULL COMMENT 'ISO 2-letter country code',
  `hs_code` varchar(10) DEFAULT NULL COMMENT 'Harmonized System code for customs',
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_category_box_id_foreign` (`category_box_id`),
  KEY `products_color_id_foreign` (`color_id`),
  CONSTRAINT `products_category_box_id_foreign` FOREIGN KEY (`category_box_id`) REFERENCES `category_boxes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `product_colors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
(1,'Party Choker Necklace','Crystal choker necklace for party occasions.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,180.00,NULL,NULL,NULL,220.00,'NEC-CHK-007-69874c2a51f5c',18,0,'[\"product-2.png\"]','{\"material\":\"Stone\",\"style\":\"Party\"}',1,0,'party-choker-necklace-69874c2a51f60',1,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(2,'22K Gold Bridal Necklace','Elegant 22K gold bridal necklace with matching earrings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2500.00,NULL,NULL,NULL,3000.00,'BNG-22K-001-69874c2a57f45',10,0,'[\"product-1.png\",\"product-2.png\"]','{\"material\":\"Gold\",\"style\":\"Bridal\"}',1,0,'22k-gold-bridal-necklace-69874c2a57f53',1,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(3,'Diamond Pendant Set','Diamond pendant with matching earrings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,800.00,NULL,NULL,NULL,950.00,'NEC-DMD-013-69874c2a5f0cf',8,0,'[\"product-2.png\"]','{\"material\":\"Diamond\",\"style\":\"Formal\"}',1,0,'diamond-pendant-set-69874c2a5f0df',1,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(4,'Vintage Hand Piece','Beautiful vintage-style gold hand piece.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,140.00,NULL,NULL,NULL,160.00,'ACC-HND-008-69874c2a63b23',14,0,'[\"product-1.png\"]','{\"material\":\"Gold\",\"style\":\"Vintage\"}',1,0,'vintage-hand-piece-69874c2a63b2f',1,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(5,'Vintage Hand Piece','Beautiful vintage-style gold hand piece.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,140.00,NULL,NULL,NULL,160.00,'ACC-HND-008-69874c2a67c10',14,0,'[\"product-1.png\"]','{\"material\":\"Gold\",\"style\":\"Vintage\"}',1,0,'vintage-hand-piece-69874c2a67c1a',1,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(6,'Diamond Pendant Set','Diamond pendant with matching earrings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,800.00,NULL,NULL,NULL,950.00,'NEC-DMD-013-69874c2a6ebc9',8,0,'[\"product-2.png\"]','{\"material\":\"Diamond\",\"style\":\"Formal\"}',1,0,'diamond-pendant-set-69874c2a6ebda',1,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(7,'Diamond Pendant Set','Diamond pendant with matching earrings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,800.00,NULL,NULL,NULL,950.00,'NEC-DMD-013-69874c2a75d17',8,0,'[\"product-2.png\"]','{\"material\":\"Diamond\",\"style\":\"Formal\"}',1,0,'diamond-pendant-set-69874c2a75d25',2,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(8,'Silver Anklets Pair','Pair of silver anklets with intricate design.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,90.00,NULL,NULL,NULL,110.00,'ACC-ANK-012-69874c2a7c898',22,0,'[\"product-1.png\"]','{\"material\":\"Silver\",\"style\":\"Casual\"}',1,0,'silver-anklets-pair-69874c2a7c8a6',2,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(9,'Silver Anklets Pair','Pair of silver anklets with intricate design.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,90.00,NULL,NULL,NULL,110.00,'ACC-ANK-012-69874c2a81806',22,0,'[\"product-1.png\"]','{\"material\":\"Silver\",\"style\":\"Casual\"}',1,0,'silver-anklets-pair-69874c2a81811',2,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(10,'Pearl Bridal Earrings','Pearl drop earrings perfect for brides.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,160.00,NULL,NULL,NULL,200.00,'EAR-PRL-010-69874c2a872d5',15,0,'[\"product-2.png\"]','{\"material\":\"Pearl\",\"style\":\"Bridal\"}',1,0,'pearl-bridal-earrings-69874c2a872de',2,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(11,'Stone Jhumka Earrings','Traditional stone jhumka earrings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,130.00,NULL,NULL,NULL,150.00,'EAR-STN-011-69874c2a8e937',30,0,'[\"product-1.png\"]','{\"material\":\"Stone\",\"style\":\"Wedding\"}',1,0,'stone-jhumka-earrings-69874c2a8e940',2,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(12,'Diamond Pendant Set','Diamond pendant with matching earrings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,800.00,NULL,NULL,NULL,950.00,'NEC-DMD-013-69874c2a93676',8,0,'[\"product-2.png\"]','{\"material\":\"Diamond\",\"style\":\"Formal\"}',1,0,'diamond-pendant-set-69874c2a9368f',2,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(13,'Silver Casual Bangles','Lightweight silver bangles perfect for casual wear.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,150.00,NULL,NULL,NULL,180.00,'BNG-SLV-002-69874c2a99ec9',25,0,'[\"product-3.png\"]','{\"material\":\"Silver\",\"style\":\"Casual\"}',1,0,'silver-casual-bangles-69874c2a99ed0',3,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(14,'Pearl Bridal Earrings','Pearl drop earrings perfect for brides.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,160.00,NULL,NULL,NULL,200.00,'EAR-PRL-010-69874c2aa283a',15,0,'[\"product-2.png\"]','{\"material\":\"Pearl\",\"style\":\"Bridal\"}',1,0,'pearl-bridal-earrings-69874c2aa2844',3,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(15,'Gold Kamarband','Traditional gold-plated kamarband for weddings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,300.00,NULL,NULL,NULL,350.00,'ACC-KMB-015-69874c2aa763a',10,0,'[\"product-4.png\"]','{\"material\":\"Gold\",\"style\":\"Wedding\"}',1,0,'gold-kamarband-69874c2aa7645',3,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(16,'Silver Anklets Pair','Pair of silver anklets with intricate design.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,90.00,NULL,NULL,NULL,110.00,'ACC-ANK-012-69874c2aaef89',22,0,'[\"product-1.png\"]','{\"material\":\"Silver\",\"style\":\"Casual\"}',1,0,'silver-anklets-pair-69874c2aaef92',3,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(17,'Diamond Stud Earrings','Classic diamond stud earrings for all occasions.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,NULL,NULL,NULL,600.00,'EAR-DMD-003-69874c2ab4fa4',30,0,'[\"product-4.png\"]','{\"material\":\"Diamond\",\"style\":\"Formal\"}',1,0,'diamond-stud-earrings-69874c2ab4fa9',3,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(18,'Diamond Pendant Set','Diamond pendant with matching earrings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,800.00,NULL,NULL,NULL,950.00,'NEC-DMD-013-69874c2aba460',8,0,'[\"product-2.png\"]','{\"material\":\"Diamond\",\"style\":\"Formal\"}',1,0,'diamond-pendant-set-69874c2aba477',3,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(19,'22K Gold Bridal Necklace','Elegant 22K gold bridal necklace with matching earrings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2500.00,NULL,NULL,NULL,3000.00,'BNG-22K-001',10,0,'[\"product-1.png\",\"product-2.png\"]','{\"material\":\"Gold\",\"style\":\"Bridal\"}',1,0,'22k-gold-bridal-necklace',22,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(20,'Silver Casual Bangles','Lightweight silver bangles perfect for casual wear.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,150.00,NULL,NULL,NULL,180.00,'BNG-SLV-002',25,0,'[\"product-3.png\"]','{\"material\":\"Silver\",\"style\":\"Casual\"}',1,0,'silver-casual-bangles',8,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(21,'Diamond Stud Earrings','Classic diamond stud earrings for all occasions.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,NULL,NULL,NULL,600.00,'EAR-DMD-003',30,0,'[\"product-4.png\"]','{\"material\":\"Diamond\",\"style\":\"Formal\"}',1,0,'diamond-stud-earrings',24,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(22,'Pearl Pendant Necklace','Elegant pearl pendant necklace with sterling silver chain.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,350.00,NULL,NULL,NULL,400.00,'NEC-PRL-004',15,0,'[\"product-2.png\"]','{\"material\":\"Pearl\",\"style\":\"Vintage\"}',1,0,'pearl-pendant-necklace',26,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(23,'Stone Bangles Set','Beautiful stone bangles set in vibrant colors.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,120.00,NULL,NULL,NULL,150.00,'BNG-STN-005',40,0,'[\"product-2.png\",\"product-3.png\"]','{\"material\":\"Stone\",\"style\":\"Boho\"}',1,0,'stone-bangles-set',16,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(24,'Bridal Matha Patti','Gold-plated matha patti for bridal wear.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,200.00,NULL,NULL,NULL,250.00,'HDP-MTH-006',20,0,'[\"product-4.png\"]','{\"material\":\"Gold\",\"style\":\"Wedding\"}',1,0,'bridal-matha-patti',26,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(25,'Party Choker Necklace','Crystal choker necklace for party occasions.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,180.00,NULL,NULL,NULL,220.00,'NEC-CHK-007',18,0,'[\"product-2.png\"]','{\"material\":\"Stone\",\"style\":\"Party\"}',1,0,'party-choker-necklace',17,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(26,'Vintage Hand Piece','Beautiful vintage-style gold hand piece.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,140.00,NULL,NULL,NULL,160.00,'ACC-HND-008',14,0,'[\"product-1.png\"]','{\"material\":\"Gold\",\"style\":\"Vintage\"}',1,0,'vintage-hand-piece',7,NULL,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(27,'Formal Nose Ring','Elegant formal gold nose ring.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,NULL,NULL,NULL,130.00,'ACC-NOS-009',25,0,'[\"product-3.png\"]','{\"material\":\"Gold\",\"style\":\"Formal\"}',1,0,'formal-nose-ring',4,NULL,'2026-02-07 09:28:59','2026-02-07 09:28:59',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(28,'Pearl Bridal Earrings','Pearl drop earrings perfect for brides.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,160.00,NULL,NULL,NULL,200.00,'EAR-PRL-010',15,0,'[\"product-2.png\"]','{\"material\":\"Pearl\",\"style\":\"Bridal\"}',1,0,'pearl-bridal-earrings',8,NULL,'2026-02-07 09:28:59','2026-02-07 09:28:59',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(29,'Stone Jhumka Earrings','Traditional stone jhumka earrings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,130.00,NULL,NULL,NULL,150.00,'EAR-STN-011',30,0,'[\"product-1.png\"]','{\"material\":\"Stone\",\"style\":\"Wedding\"}',1,0,'stone-jhumka-earrings',14,NULL,'2026-02-07 09:28:59','2026-02-07 09:28:59',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(30,'Silver Anklets Pair','Pair of silver anklets with intricate design.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,90.00,NULL,NULL,NULL,110.00,'ACC-ANK-012',22,0,'[\"product-1.png\"]','{\"material\":\"Silver\",\"style\":\"Casual\"}',1,0,'silver-anklets-pair',24,NULL,'2026-02-07 09:28:59','2026-02-07 09:28:59',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(31,'Diamond Pendant Set','Diamond pendant with matching earrings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,800.00,NULL,NULL,NULL,950.00,'NEC-DMD-013',8,0,'[\"product-2.png\"]','{\"material\":\"Diamond\",\"style\":\"Formal\"}',1,0,'diamond-pendant-set',20,NULL,'2026-02-07 09:28:59','2026-02-07 09:28:59',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(32,'Boho Stone Ring','Boho-style adjustable stone ring.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,70.00,NULL,NULL,NULL,85.00,'ACC-RNG-014',40,0,'[\"product-3.png\"]','{\"material\":\"Stone\",\"style\":\"Boho\"}',1,0,'boho-stone-ring',17,NULL,'2026-02-07 09:28:59','2026-02-07 09:28:59',NULL,NULL,0,0,NULL,NULL,NULL,NULL),
(33,'Gold Kamarband','Traditional gold-plated kamarband for weddings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,300.00,NULL,NULL,NULL,350.00,'ACC-KMB-015',10,0,'[\"product-4.png\"]','{\"material\":\"Gold\",\"style\":\"Wedding\"}',1,0,'gold-kamarband',24,NULL,'2026-02-07 09:28:59','2026-02-07 09:28:59',NULL,NULL,0,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
('g0JN6TULoSopFu7VnJ3bFmg6L8fRuqNpTwxuwtuM',2,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSUNaR3FKUWJkRXkxclpYWm1rdjZPZTFxN3Y3RHhKd1JWMDh3c2NzQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC93aXNobGlzdHMiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=',1770491912);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_addresses`
--

DROP TABLE IF EXISTS `shipping_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `street_address` varchar(500) NOT NULL,
  `apartment` varchar(50) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipping_addresses_user_id_index` (`user_id`),
  CONSTRAINT `shipping_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_addresses`
--

LOCK TABLES `shipping_addresses` WRITE;
/*!40000 ALTER TABLE `shipping_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(255) NOT NULL DEFAULT 'material',
  `top_listed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES
(1,'Gold','gold','Gold tag description',1,'material',1,'2026-02-07 09:28:58','2026-02-07 09:28:59',NULL),
(2,'Silver','silver','Silver tag description',1,'material',0,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL),
(3,'Diamond','diamond','Diamond tag description',1,'material',0,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL),
(4,'Pearl','pearl','Pearl tag description',1,'material',0,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL),
(5,'Stone','stone','Stone tag description',1,'material',0,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL),
(6,'Wedding','wedding','Wedding tag description',1,'style',1,'2026-02-07 09:28:58','2026-02-07 09:28:59',NULL),
(7,'Casual','casual','Casual tag description',1,'style',1,'2026-02-07 09:28:58','2026-02-07 09:28:59',NULL),
(8,'Formal','formal','Formal tag description',1,'style',0,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL),
(9,'Vintage','vintage','Vintage tag description',1,'style',0,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL),
(10,'Boho','boho','Boho tag description',1,'style',0,'2026-02-07 09:28:58','2026-02-07 09:28:58',NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rewards`
--

DROP TABLE IF EXISTS `user_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_rewards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `bundle_id` bigint(20) unsigned DEFAULT NULL,
  `type` enum('shipping','points') NOT NULL,
  `type_value` bigint(20) unsigned NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_rewards_user_id_foreign` (`user_id`),
  KEY `user_rewards_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `user_rewards_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_rewards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rewards`
--

LOCK TABLES `user_rewards` WRITE;
/*!40000 ALTER TABLE `user_rewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `latitude` bigint(20) unsigned DEFAULT NULL,
  `longitude` bigint(20) unsigned DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `total_points` bigint(20) unsigned NOT NULL DEFAULT 0,
  `total_shippings` int(10) unsigned NOT NULL DEFAULT 0,
  `stripe_customer_id` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'user',
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `customer_id` varchar(255) DEFAULT NULL,
  `email_subscribed` tinyint(1) NOT NULL DEFAULT 1,
  `marketing_emails` tinyint(1) NOT NULL DEFAULT 1,
  `order_updates` tinyint(1) NOT NULL DEFAULT 1,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `product_recommendations` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_customer_id_unique` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Admin',NULL,'admin@admin.com',NULL,NULL,NULL,NULL,NULL,'$2y$12$FRVmn23T5HULlxk7cp8mz.uLVPDN8hrVGx/xnE1xHlaPLXXcjIOde',NULL,0,0,NULL,NULL,'2026-02-07 09:28:58','2026-02-07 13:09:17','admin',0,NULL,1,1,1,0,1),
(2,'Hassaan','Shahid','hassaan@gmail.com','xyz','AF',NULL,NULL,NULL,'$2y$12$0Hl7oTVaRz9DsuzEhTJx2.QwtG2qD.pXSjLVbQSE4V2sGkgc377Gu',NULL,0,0,NULL,NULL,'2026-02-07 14:12:25','2026-02-07 14:16:19','user',0,'CUST-002',1,1,1,1,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `session_id` char(36) DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `variation_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-24 20:03:33
