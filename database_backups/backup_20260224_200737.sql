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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-24 20:07:37
