-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 22, 2026 at 09:10 AM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u981402959_banglz`
--

-- --------------------------------------------------------

--
-- Table structure for table `bangle_box_colors`
--

CREATE TABLE `bangle_box_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `color_name` varchar(255) NOT NULL,
  `bangle_box_size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bangle_box_colors`
--

INSERT INTO `bangle_box_colors` (`id`, `image`, `color_name`, `bangle_box_size_id`, `created_at`, `updated_at`) VALUES
(1, 'matte-peach.avif', 'Matte Peach', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(2, 'matte-dark-peach.avif', 'Matte Dark Peach', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(3, 'Peach with Glitter.avif', 'Peach with Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(4, 'Peach Pink with Gold Glitter.avif', 'Peach Pink with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(5, 'Peach with Gold Glitter.avif', 'Peach with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(6, 'Matte Light Pink.avif', 'Matte Light Pink', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(7, 'Light Pink with Silver Glitter.webp', 'Light Pink with Silver Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(8, 'Pink with Gold Glitter.avif', 'Pink with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(9, 'Matte Pink.avif', 'Matte Pink', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(10, 'Matte Bright Pink.avif', 'Matte Bright Pink', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(11, 'Metallic Velvet Rose.webp', 'Metallic Velvet Rose', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(12, 'Rose with Gold Glitter.avif', 'Rose with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(13, 'Wine with Gold Glitter.avif', 'Wine with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(14, 'Hot Pink with Gold Glitter.avif', 'Hot Pink with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(15, 'Coral Matte.avif', 'Coral Matte', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(16, 'Matte Fuschia.avif', 'Matte Fuschia', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(17, 'Metallic Velvet Fuschia.webp', 'Metallic Velvet Fuschia', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(18, 'Matte Fuchsia with Sparkles.avif', 'Matte Fuchsia with Sparkles', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(19, 'Fuchsia with Gold Glitter.avif', 'Fuchsia with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(20, 'Dark Purple with Gold Glitter.avif', 'Dark Purple with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(21, 'Metallic Velvet Purple.webp', 'Metallic Velvet Purple', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(22, 'Velvet Purple.webp', 'Velvet Purple', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(23, 'Purple with Gold Glitter.avif', 'Purple with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(24, 'Matte Lavender.avif', 'Matte Lavender', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(25, 'Velvet Lavender.webp', 'Velvet Lavender', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(26, 'Light Purple with Silver Glitter.webp', 'Light Purple with Silver Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(27, 'Matte Lilac.avif', 'Matte Lilac', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(28, 'Metallic Velvet Lilac.webp', 'Metallic Velvet Lilac', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(29, 'Lilac with Gold Glitter.avif', 'Lilac with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(30, 'Grape with Gold Glitter.avif', 'Grape with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(31, 'Matte Grape.avif', 'Matte Grape', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(32, 'Navy Blue with Gold Glitter.avif', 'Navy Blue with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(33, 'Matte Blue.avif', 'Matte Blue', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(34, 'Blue with Gold Glitter.avif', 'Blue with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(35, 'Matte Cobalt Blue.avif', 'Matte Cobalt Blue', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(36, 'Cobalt Blue with Gold Glitter.avif', 'Cobalt Blue with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(37, 'Matte Light Blue.avif', 'Matte Light Blue', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(38, 'Light Blue with Gold Glitter.avif', 'Light Blue with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(39, 'Teal with Gold Glitter.avif', 'Teal with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(40, 'Dark Green with Gold Glitter.avif', 'Dark Green with Gold Glitter', 1, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(41, 'matte-peach.avif', 'Matte Peach', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(42, 'matte-dark-peach.avif', 'Matte Dark Peach', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(43, 'Peach with Glitter.avif', 'Peach with Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(44, 'Peach Pink with Gold Glitter.avif', 'Peach Pink with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(45, 'Peach with Gold Glitter.avif', 'Peach with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(46, 'Matte Light Pink.avif', 'Matte Light Pink', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(47, 'Light Pink with Silver Glitter.webp', 'Light Pink with Silver Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(48, 'Pink with Gold Glitter.avif', 'Pink with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(49, 'Matte Pink.avif', 'Matte Pink', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(50, 'Matte Bright Pink.avif', 'Matte Bright Pink', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(51, 'Metallic Velvet Rose.webp', 'Metallic Velvet Rose', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(52, 'Rose with Gold Glitter.avif', 'Rose with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(53, 'Wine with Gold Glitter.avif', 'Wine with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(54, 'Hot Pink with Gold Glitter.avif', 'Hot Pink with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(55, 'Coral Matte.avif', 'Coral Matte', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(56, 'Matte Fuschia.avif', 'Matte Fuschia', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(57, 'Metallic Velvet Fuschia.webp', 'Metallic Velvet Fuschia', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(58, 'Matte Fuchsia with Sparkles.avif', 'Matte Fuchsia with Sparkles', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(59, 'Fuchsia with Gold Glitter.avif', 'Fuchsia with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(60, 'Dark Purple with Gold Glitter.avif', 'Dark Purple with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(61, 'Metallic Velvet Purple.webp', 'Metallic Velvet Purple', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(62, 'Velvet Purple.webp', 'Velvet Purple', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(63, 'Purple with Gold Glitter.avif', 'Purple with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(64, 'Matte Lavender.avif', 'Matte Lavender', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(65, 'Velvet Lavender.webp', 'Velvet Lavender', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(66, 'Light Purple with Silver Glitter.webp', 'Light Purple with Silver Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(67, 'Matte Lilac.avif', 'Matte Lilac', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(68, 'Metallic Velvet Lilac.webp', 'Metallic Velvet Lilac', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(69, 'Lilac with Gold Glitter.avif', 'Lilac with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(70, 'Grape with Gold Glitter.avif', 'Grape with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(71, 'Matte Grape.avif', 'Matte Grape', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(72, 'Navy Blue with Gold Glitter.avif', 'Navy Blue with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(73, 'Matte Blue.avif', 'Matte Blue', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(74, 'Blue with Gold Glitter.avif', 'Blue with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(75, 'Matte Cobalt Blue.avif', 'Matte Cobalt Blue', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(76, 'Cobalt Blue with Gold Glitter.avif', 'Cobalt Blue with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(77, 'Matte Light Blue.avif', 'Matte Light Blue', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(78, 'Light Blue with Gold Glitter.avif', 'Light Blue with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(79, 'Teal with Gold Glitter.avif', 'Teal with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(80, 'Dark Green with Gold Glitter.avif', 'Dark Green with Gold Glitter', 2, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(81, 'matte-peach.avif', 'Matte Peach', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(82, 'matte-dark-peach.avif', 'Matte Dark Peach', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(83, 'Peach with Glitter.avif', 'Peach with Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(84, 'Peach Pink with Gold Glitter.avif', 'Peach Pink with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(85, 'Peach with Gold Glitter.avif', 'Peach with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(86, 'Matte Light Pink.avif', 'Matte Light Pink', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(87, 'Light Pink with Silver Glitter.webp', 'Light Pink with Silver Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(88, 'Pink with Gold Glitter.avif', 'Pink with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(89, 'Matte Pink.avif', 'Matte Pink', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(90, 'Matte Bright Pink.avif', 'Matte Bright Pink', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(91, 'Metallic Velvet Rose.webp', 'Metallic Velvet Rose', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(92, 'Rose with Gold Glitter.avif', 'Rose with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(93, 'Wine with Gold Glitter.avif', 'Wine with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(94, 'Hot Pink with Gold Glitter.avif', 'Hot Pink with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(95, 'Coral Matte.avif', 'Coral Matte', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(96, 'Matte Fuschia.avif', 'Matte Fuschia', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(97, 'Metallic Velvet Fuschia.webp', 'Metallic Velvet Fuschia', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(98, 'Matte Fuchsia with Sparkles.avif', 'Matte Fuchsia with Sparkles', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(99, 'Fuchsia with Gold Glitter.avif', 'Fuchsia with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(100, 'Dark Purple with Gold Glitter.avif', 'Dark Purple with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(101, 'Metallic Velvet Purple.webp', 'Metallic Velvet Purple', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(102, 'Velvet Purple.webp', 'Velvet Purple', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(103, 'Purple with Gold Glitter.avif', 'Purple with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(104, 'Matte Lavender.avif', 'Matte Lavender', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(105, 'Velvet Lavender.webp', 'Velvet Lavender', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(106, 'Light Purple with Silver Glitter.webp', 'Light Purple with Silver Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(107, 'Matte Lilac.avif', 'Matte Lilac', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(108, 'Metallic Velvet Lilac.webp', 'Metallic Velvet Lilac', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(109, 'Lilac with Gold Glitter.avif', 'Lilac with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(110, 'Grape with Gold Glitter.avif', 'Grape with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(111, 'Matte Grape.avif', 'Matte Grape', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(112, 'Navy Blue with Gold Glitter.avif', 'Navy Blue with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(113, 'Matte Blue.avif', 'Matte Blue', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(114, 'Blue with Gold Glitter.avif', 'Blue with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(115, 'Matte Cobalt Blue.avif', 'Matte Cobalt Blue', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(116, 'Cobalt Blue with Gold Glitter.avif', 'Cobalt Blue with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(117, 'Matte Light Blue.avif', 'Matte Light Blue', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(118, 'Light Blue with Gold Glitter.avif', 'Light Blue with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(119, 'Teal with Gold Glitter.avif', 'Teal with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(120, 'Dark Green with Gold Glitter.avif', 'Dark Green with Gold Glitter', 3, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(121, 'matte-peach.avif', 'Matte Peach', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(122, 'matte-dark-peach.avif', 'Matte Dark Peach', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(123, 'Peach with Glitter.avif', 'Peach with Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(124, 'Peach Pink with Gold Glitter.avif', 'Peach Pink with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(125, 'Peach with Gold Glitter.avif', 'Peach with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(126, 'Matte Light Pink.avif', 'Matte Light Pink', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(127, 'Light Pink with Silver Glitter.webp', 'Light Pink with Silver Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(128, 'Pink with Gold Glitter.avif', 'Pink with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(129, 'Matte Pink.avif', 'Matte Pink', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(130, 'Matte Bright Pink.avif', 'Matte Bright Pink', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(131, 'Metallic Velvet Rose.webp', 'Metallic Velvet Rose', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(132, 'Rose with Gold Glitter.avif', 'Rose with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(133, 'Wine with Gold Glitter.avif', 'Wine with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(134, 'Hot Pink with Gold Glitter.avif', 'Hot Pink with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(135, 'Coral Matte.avif', 'Coral Matte', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(136, 'Matte Fuschia.avif', 'Matte Fuschia', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(137, 'Metallic Velvet Fuschia.webp', 'Metallic Velvet Fuschia', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(138, 'Matte Fuchsia with Sparkles.avif', 'Matte Fuchsia with Sparkles', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(139, 'Fuchsia with Gold Glitter.avif', 'Fuchsia with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(140, 'Dark Purple with Gold Glitter.avif', 'Dark Purple with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(141, 'Metallic Velvet Purple.webp', 'Metallic Velvet Purple', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(142, 'Velvet Purple.webp', 'Velvet Purple', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(143, 'Purple with Gold Glitter.avif', 'Purple with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(144, 'Matte Lavender.avif', 'Matte Lavender', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(145, 'Velvet Lavender.webp', 'Velvet Lavender', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(146, 'Light Purple with Silver Glitter.webp', 'Light Purple with Silver Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(147, 'Matte Lilac.avif', 'Matte Lilac', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(148, 'Metallic Velvet Lilac.webp', 'Metallic Velvet Lilac', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(149, 'Lilac with Gold Glitter.avif', 'Lilac with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(150, 'Grape with Gold Glitter.avif', 'Grape with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(151, 'Matte Grape.avif', 'Matte Grape', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(152, 'Navy Blue with Gold Glitter.avif', 'Navy Blue with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(153, 'Matte Blue.avif', 'Matte Blue', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(154, 'Blue with Gold Glitter.avif', 'Blue with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(155, 'Matte Cobalt Blue.avif', 'Matte Cobalt Blue', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(156, 'Cobalt Blue with Gold Glitter.avif', 'Cobalt Blue with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(157, 'Matte Light Blue.avif', 'Matte Light Blue', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(158, 'Light Blue with Gold Glitter.avif', 'Light Blue with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(159, 'Teal with Gold Glitter.avif', 'Teal with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(160, 'Dark Green with Gold Glitter.avif', 'Dark Green with Gold Glitter', 4, '2025-10-17 01:19:56', '2025-10-17 01:19:56');

-- --------------------------------------------------------

--
-- Table structure for table `bangle_box_sizes`
--

CREATE TABLE `bangle_box_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bangle_box_sizes`
--

INSERT INTO `bangle_box_sizes` (`id`, `size`, `created_at`, `updated_at`) VALUES
(1, '2.4', '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(2, '2.6', '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(3, '2.8', '2025-10-17 01:19:56', '2025-10-17 01:19:56'),
(4, '2.10', '2025-10-17 01:19:56', '2025-10-17 01:19:56');

-- --------------------------------------------------------

--
-- Table structure for table `bangle_cart_colors`
--

CREATE TABLE `bangle_cart_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bangle_cart_colors`
--

INSERT INTO `bangle_cart_colors` (`id`, `cart_id`, `color_id`, `created_at`, `updated_at`) VALUES
(22, 53, 3, '2025-12-12 20:34:30', '2025-12-12 20:34:30'),
(23, 53, 4, '2025-12-12 20:34:30', '2025-12-12 20:34:30'),
(24, 53, 5, '2025-12-12 20:34:30', '2025-12-12 20:34:30'),
(25, 53, 6, '2025-12-12 20:34:30', '2025-12-12 20:34:30'),
(26, 53, 3, '2025-12-12 20:34:30', '2025-12-12 20:34:30'),
(27, 53, 2, '2025-12-12 20:34:30', '2025-12-12 20:34:30');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `author`, `image`, `slug`, `content`, `short_description`, `category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'The Cherished Tradition of Bridesmaids: A Journey Through History and Cultur', 'Maria Gomez', '1760182776-68ea41f8360c5.webp', 'the-cherished-tradition-of-bridesmaids-a-journey-through-history-and-cultur-68ea6feab3e1c', '<h2><strong>History of Bridesmaids:</strong></h2><p><strong>Ancient Origins:</strong></p><p>The role of bridesmaids traces back to ancient Rome, where <i>they donned similar attire to the bride, aiming to confuse evil spirits and safeguard her during the ceremony</i>. Over centuries, their duties expanded to include emotional support, aiding in wedding preparations, and standing by the bride\'s side during the vows.</p><p><strong>Medieval Europe:</strong></p><p>In medieval Europe, bridesmaids<i> assisted the bride with wedding preparations and ensured her safe journey to the groom\'s village</i>. By the Victorian era, they became integral to wedding ceremonies, often wearing flowers and accompanying the bride down the aisle.</p><p><strong>Modern Times:</strong></p><p>The number of bridesmaids varies based on personal and cultural preferences, typically three to seven. <i>Themes and colour schemes for bridesmaids\' dresses complement the overall aesthetic of the wedding</i>, adding to the visual appeal and unity of the bridal party.</p><p>&nbsp;</p><h2><strong>South Asian Bridesmaids:</strong></h2><p>In South Asian weddings, bridesmaids hold ceremonial significance beyond mere companions and <i>participate in traditional pre-wedding rituals such as intricate henna designs and ceremonies like the Mehndi or Sangeet.</i> South Asian bridesmaids don elaborately designed traditional outfits that harmonize with the bride\'s attire, reflecting the vibrant cultural heritage of the region.</p><p><img src=\"https://cdn.shopify.com/s/files/1/0647/6507/files/DSC_6772_7bcda6fb-0aca-4b65-b212-68a51189e08a_1024x1024.jpg?v=1724290231\" alt=\"\"></p><p>A modern trend, the bridesmaid proposal, allows brides to invite their closest friends and family members to be part of the bridal party in a thoughtful and personalized manner. In South Asian weddings, being chosen as a bridesmaid is considered an honour, showcasing loyalty and family obligation.</p><p>&nbsp;</p><h2><strong>Gift Ideas for Bridesmaids:</strong></h2><p><strong>Personalized Jewelry:</strong></p><p><a href=\"https://banglez.com/\">Timeless keepsakes </a>that can be worn on the wedding day and beyond. Consider personalized and custom-designed bangle sets with earrings to match for a unique touch that not only looks great, but allows your bridesmaids to match!</p><p><img src=\"https://cdn.shopify.com/s/files/1/0647/6507/files/IMG_5987_38bbc579-d1f5-4676-98a3-3dcbc1976198_1024x1024.jpg?v=1724290469\" alt=\"\"></p><p>&nbsp;</p><p><strong>Customized Robes or PJs:</strong></p><p>Perfect for pre-wedding festivities and getting ready on the big day.</p><p><strong>Experience Gifts:</strong></p><p>A day at the spa, a cooking class, or a fun group activity to create lasting memories together. Complement these experiences with thoughtful tokens from <a href=\"https://banglez.com/\">Banglez.com</a></p><p>&nbsp;</p><h2><strong>Conclusion:</strong></h2><p>Bridesmaids play an indispensable role in weddings, symbolizing love, friendship, and support. Across cultures, their duties may vary, but their significance remains constant. Whether in Western or South Asian weddings, bridesmaids make the bride\'s special day unforgettable, adding cultural richness and festive flair to celebrations.</p>', 'Bridesmaids have long played a cherished role in weddings, offering unwavering support to the bride on her big day. But where did this tradition originate, and how has it evolved? Let\'s take a closer look at the rich history and cultural significance of bridesmaids, with a special focus on South Asian bridesmaids', 1, '2025-10-11 11:39:36', '2025-10-11 14:57:19', '2025-10-11 14:57:19'),
(2, 'The Cherished Tradition of Bridesmaids: A Journey Through History and Culture', 'Maria Gomez', '1760194952-68ea718823d2d.webp', 'the-cherished-tradition-of-bridesmaids-a-journey-through-history-and-culture-68ea719783260', '<h2><strong>History of Bridesmaids:</strong></h2><p><strong>Ancient Origins:</strong></p><p>The role of bridesmaids traces back to ancient Rome, where <i>they donned similar attire to the bride, aiming to confuse evil spirits and safeguard her during the ceremony</i>. Over centuries, their duties expanded to include emotional support, aiding in wedding preparations, and standing by the bride\'s side during the vows.</p><p><strong>Medieval Europe:</strong></p><p>In medieval Europe, bridesmaids<i> assisted the bride with wedding preparations and ensured her safe journey to the groom\'s village</i>. By the Victorian era, they became integral to wedding ceremonies, often wearing flowers and accompanying the bride down the aisle.</p><p><strong>Modern Times:</strong></p><p>The number of bridesmaids varies based on personal and cultural preferences, typically three to seven. <i>Themes and colour schemes for bridesmaids\' dresses complement the overall aesthetic of the wedding</i>, adding to the visual appeal and unity of the bridal party.</p><p>&nbsp;</p><h2><strong>South Asian Bridesmaids:</strong></h2><p>In South Asian weddings, bridesmaids hold ceremonial significance beyond mere companions and <i>participate in traditional pre-wedding rituals such as intricate henna designs and ceremonies like the Mehndi or Sangeet.</i> South Asian bridesmaids don elaborately designed traditional outfits that harmonize with the bride\'s attire, reflecting the vibrant cultural heritage of the region.</p><p><img src=\"https://cdn.shopify.com/s/files/1/0647/6507/files/DSC_6772_7bcda6fb-0aca-4b65-b212-68a51189e08a_1024x1024.jpg?v=1724290231\" alt=\"\"></p><p>A modern trend, the bridesmaid proposal, allows brides to invite their closest friends and family members to be part of the bridal party in a thoughtful and personalized manner. In South Asian weddings, being chosen as a bridesmaid is considered an honour, showcasing loyalty and family obligation.</p><p>&nbsp;</p><h2><strong>Gift Ideas for Bridesmaids:</strong></h2><p><strong>Personalized Jewelry:</strong></p><p><a href=\"https://banglez.com/\">Timeless keepsakes </a>that can be worn on the wedding day and beyond. Consider personalized and custom-designed bangle sets with earrings to match for a unique touch that not only looks great, but allows your bridesmaids to match!</p><p><img src=\"https://cdn.shopify.com/s/files/1/0647/6507/files/IMG_5987_38bbc579-d1f5-4676-98a3-3dcbc1976198_1024x1024.jpg?v=1724290469\" alt=\"\"></p><p>&nbsp;</p><p><strong>Customized Robes or PJs:</strong></p><p>Perfect for pre-wedding festivities and getting ready on the big day.</p><p><strong>Experience Gifts:</strong></p><p>A day at the spa, a cooking class, or a fun group activity to create lasting memories together. Complement these experiences with thoughtful tokens from <a href=\"https://banglez.com/\">Banglez.com</a></p><p>&nbsp;</p><h2><strong>Conclusion:</strong></h2><p>Bridesmaids play an indispensable role in weddings, symbolizing love, friendship, and support. Across cultures, their duties may vary, but their significance remains constant. Whether in Western or South Asian weddings, bridesmaids make the bride\'s special day unforgettable, adding cultural richness and festive flair to celebrations.</p>', 'Bridesmaids have long played a cherished role in weddings, offering unwavering support to the bride on her big day. But where did this tradition originate, and how has it evolved? Let\'s take a closer look at the rich history and cultural significance of bridesmaids, with a special focus on South Asian bridesmaids.', 1, '2025-10-11 15:02:32', '2025-10-11 15:36:46', '2025-10-11 15:36:46'),
(3, 'The Cherished Tradition of Bridesmaids: A Journey Through History and Culture', 'Maria Gomez', '1760197074-68ea79d27310c.webp', 'the-cherished-tradition-of-bridesmaids-a-journey-through-history-and-culture-68ea79e1ea0ad', '<h2><strong>History of Bridesmaids:</strong></h2><p><strong>Ancient Origins:</strong></p><p>The role of bridesmaids traces back to ancient Rome, where <i>they donned similar attire to the bride, aiming to confuse evil spirits and safeguard her during the ceremony</i>. Over centuries, their duties expanded to include emotional support, aiding in wedding preparations, and standing by the bride\'s side during the vows.</p><p><strong>Medieval Europe:</strong></p><p>In medieval Europe, bridesmaids<i> assisted the bride with wedding preparations and ensured her safe journey to the groom\'s village</i>. By the Victorian era, they became integral to wedding ceremonies, often wearing flowers and accompanying the bride down the aisle.</p><p><strong>Modern Times:</strong></p><p>The number of bridesmaids varies based on personal and cultural preferences, typically three to seven. <i>Themes and colour schemes for bridesmaids\' dresses complement the overall aesthetic of the wedding</i>, adding to the visual appeal and unity of the bridal party.</p><p>&nbsp;</p><h2><strong>South Asian Bridesmaids:</strong></h2><p>In South Asian weddings, bridesmaids hold ceremonial significance beyond mere companions and <i>participate in traditional pre-wedding rituals such as intricate henna designs and ceremonies like the Mehndi or Sangeet.</i> South Asian bridesmaids don elaborately designed traditional outfits that harmonize with the bride\'s attire, reflecting the vibrant cultural heritage of the region.</p><p><img src=\"https://cdn.shopify.com/s/files/1/0647/6507/files/DSC_6772_7bcda6fb-0aca-4b65-b212-68a51189e08a_1024x1024.jpg?v=1724290231\" alt=\"\"></p><p>A modern trend, the bridesmaid proposal, allows brides to invite their closest friends and family members to be part of the bridal party in a thoughtful and personalized manner. In South Asian weddings, being chosen as a bridesmaid is considered an honour, showcasing loyalty and family obligation.</p><p>&nbsp;</p><h2><strong>Gift Ideas for Bridesmaids:</strong></h2><p><strong>Personalized Jewelry:</strong></p><p><a href=\"https://banglez.com/\">Timeless keepsakes </a>that can be worn on the wedding day and beyond. Consider personalized and custom-designed bangle sets with earrings to match for a unique touch that not only looks great, but allows your bridesmaids to match!</p><p><img src=\"https://cdn.shopify.com/s/files/1/0647/6507/files/IMG_5987_38bbc579-d1f5-4676-98a3-3dcbc1976198_1024x1024.jpg?v=1724290469\" alt=\"\"></p><p>&nbsp;</p><p><strong>Customized Robes or PJs:</strong></p><p>Perfect for pre-wedding festivities and getting ready on the big day.</p><p><strong>Experience Gifts:</strong></p><p>A day at the spa, a cooking class, or a fun group activity to create lasting memories together. Complement these experiences with thoughtful tokens from <a href=\"https://banglez.com/\">Banglez.com</a></p><p>&nbsp;</p><h2><strong>Conclusion:</strong></h2><p>Bridesmaids play an indispensable role in weddings, symbolizing love, friendship, and support. Across cultures, their duties may vary, but their significance remains constant. Whether in Western or South Asian weddings, bridesmaids make the bride\'s special day unforgettable, adding cultural richness and festive flair to celebrations.</p>', 'Bridesmaids have long played a cherished role in weddings, offering unwavering support to the bride on her big day. But where did this tradition originate, and how has it evolved? Let\'s take a closer look at the rich history and cultural significance of bridesmaids, with a special focus on South Asian bridesmaids.', 1, '2025-10-11 15:37:54', '2025-10-11 15:38:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bangles', '2025-09-08 13:29:18', '2025-09-08 13:29:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `box_sizes`
--

CREATE TABLE `box_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `box_sizes`
--

INSERT INTO `box_sizes` (`id`, `size`, `price`, `created_at`, `updated_at`) VALUES
(1, '6', 29.95, '2025-10-17 01:23:16', '2025-10-17 01:23:16'),
(2, '9', 39.95, '2025-10-17 01:24:27', '2025-10-17 01:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `bundles`
--

CREATE TABLE `bundles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bundles`
--

INSERT INTO `bundles` (`id`, `session_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(8, '64b0b8c5-6d8a-4da3-b1fd-588080e057cc', NULL, 'cancelled', '2025-09-14 15:36:37', '2025-12-12 21:04:37'),
(11, '78beef52-2f1a-4fc6-824e-d35daa302c42', NULL, 'cancelled', '2025-09-14 17:43:34', '2025-12-12 21:04:37'),
(17, '0fc700a5-add1-4158-aca8-38924b0400ae', 4, 'cancelled', '2025-12-04 20:59:38', '2025-12-04 21:28:17'),
(18, '0fc700a5-add1-4158-aca8-38924b0400ae', 1, 'complete', '2025-12-04 21:28:02', '2025-12-04 21:28:17'),
(19, 'e76f5f1b-b289-4f0d-9144-44bcb765cac7', NULL, 'complete', '2025-12-12 21:04:20', '2025-12-12 21:04:37'),
(20, '35f93800-6466-4013-a6a9-8f5ee6ca83a1', NULL, 'pending', '2026-01-04 03:12:43', '2026-01-04 03:12:43'),
(21, '025f79e2-ec86-4fd8-89f4-a3d0a3b76666', NULL, 'pending', '2026-01-05 10:32:41', '2026-01-05 10:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `bundle_products`
--

CREATE TABLE `bundle_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bundle_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variation_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bundle_products`
--

INSERT INTO `bundle_products` (`id`, `bundle_id`, `product_id`, `created_at`, `updated_at`, `variation_id`) VALUES
(31, 11, 1, '2025-09-14 17:43:34', '2025-09-14 17:43:34', NULL),
(32, 11, 1, '2025-09-14 17:43:38', '2025-09-14 17:43:38', NULL),
(33, 11, 1, '2025-09-14 17:43:42', '2025-09-14 17:43:42', NULL),
(49, 17, 17, '2025-12-04 20:59:38', '2025-12-04 20:59:38', 88),
(50, 18, 18, '2025-12-04 21:28:02', '2025-12-04 21:28:02', 91),
(51, 18, 18, '2025-12-04 21:28:07', '2025-12-04 21:28:07', 91),
(52, 18, 18, '2025-12-04 21:28:10', '2025-12-04 21:28:10', 91),
(53, 19, 12, '2025-12-12 21:04:20', '2025-12-12 21:04:20', NULL),
(54, 19, 17, '2025-12-12 21:04:25', '2025-12-12 21:04:25', 88),
(55, 19, 17, '2025-12-12 21:04:33', '2025-12-12 21:04:33', 88),
(56, 20, 12, '2026-01-04 03:12:43', '2026-01-04 03:12:43', NULL),
(57, 21, 12, '2026-01-05 10:32:41', '2026-01-05 10:32:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bangle_box_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bangle_box_size` varchar(255) DEFAULT NULL,
  `bangle_size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `recipient_email` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variation_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `type`, `type_id`, `bangle_box_id`, `bangle_box_size`, `bangle_size_id`, `session_id`, `recipient_email`, `user_id`, `qty`, `created_at`, `updated_at`, `variation_id`) VALUES
(31, 'product', 17, NULL, NULL, NULL, 'faba1368-ddc4-47e8-8732-74abb0a08c46', NULL, NULL, 1, '2025-09-27 15:39:30', '2025-09-27 15:39:30', 88),
(48, 'product', 24, NULL, NULL, NULL, 'd64a3bfd-d7c9-4cbc-9d20-2f40fb62f9f0', NULL, 4, 1, '2025-12-04 20:55:53', '2025-12-04 20:55:53', 107),
(49, 'product', 17, NULL, NULL, NULL, 'd64a3bfd-d7c9-4cbc-9d20-2f40fb62f9f0', NULL, 4, 1, '2025-12-04 21:00:12', '2025-12-04 21:00:12', 88),
(50, 'bundle', 18, NULL, NULL, NULL, 'd64a3bfd-d7c9-4cbc-9d20-2f40fb62f9f0', NULL, 1, 1, '2025-12-04 21:28:17', '2025-12-04 21:28:17', NULL),
(51, 'product', 60, NULL, NULL, NULL, 'e191bd02-a091-468f-81bb-cf4083a44ad4', NULL, 1, 1, '2025-12-05 00:42:25', '2025-12-05 00:43:19', 227),
(52, 'product', 12, NULL, NULL, NULL, '9b5040ac-7f8d-4b4b-b700-381c5538c943', NULL, NULL, 1, '2025-12-12 20:28:04', '2025-12-12 20:28:04', NULL),
(53, 'bangle_box', NULL, 1, '6', 1, '9b5040ac-7f8d-4b4b-b700-381c5538c943', NULL, NULL, 1, '2025-12-12 20:34:30', '2025-12-12 20:34:30', NULL),
(54, 'bundle', 19, NULL, NULL, NULL, '9b5040ac-7f8d-4b4b-b700-381c5538c943', NULL, NULL, 1, '2025-12-12 21:04:37', '2025-12-12 21:04:37', NULL),
(55, 'product', 17, NULL, NULL, NULL, '1a352b8a-ec26-44f8-af40-1bedf575cd99', NULL, NULL, 1, '2026-01-03 19:59:25', '2026-01-03 19:59:25', 88),
(56, 'product', 32, NULL, NULL, NULL, '8c6c48da-eede-4b87-bf6c-e330e1fa8a89', NULL, NULL, 1, '2026-01-19 19:37:33', '2026-01-19 19:37:33', 233);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `slug` varchar(255) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `description` text DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `top_listed` tinyint(1) NOT NULL DEFAULT 0,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `allow_size` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `slug`, `images`, `description`, `is_featured`, `top_listed`, `parent_id`, `created_at`, `updated_at`, `deleted_at`, `allow_size`) VALUES
(2, 'Bangles', 1, 'bangles-68dc163c1b6ee', '[\"1757275512-68bde5789e0d9.jpg\"]', 'Here is testing category you can del from admin portal', 0, 0, NULL, '2025-09-07 20:05:12', '2025-09-30 17:41:16', NULL, 1),
(3, 'Necklaces', 1, 'necklaces-68c990ea2f7a5', '[\"1757349266-68bf0592eed75.jpg\"]', 'Neckless', 1, 0, NULL, '2025-09-08 16:34:26', '2025-09-16 16:31:38', NULL, 0),
(4, 'Earrings', 1, 'earrings-68c990dabe470', '[\"1757432660-68c04b54e7fa5.jpg\"]', NULL, 1, 0, NULL, '2025-09-09 15:44:20', '2025-09-16 16:31:22', NULL, 0),
(5, 'Headpieces', 1, 'headpieces-68c990abc125c', '[\"1757432795-68c04bdbc99de.jpg\"]', NULL, 1, 0, NULL, '2025-09-09 15:46:35', '2025-09-16 16:30:35', NULL, 0),
(6, 'Accessories', 1, 'accessories-68c990b59fab9', '[\"1757432983-68c04c973c064.jpg\"]', NULL, 1, 0, NULL, '2025-09-09 15:49:43', '2025-09-16 16:30:45', NULL, 0),
(7, 'Trending', 1, 'trending-68c04cfa08c3d', '[\"1757433082-68c04cfa05f89.jpg\"]', NULL, 0, 0, NULL, '2025-09-09 15:51:22', '2025-10-06 12:13:03', '2025-10-06 12:13:03', 0),
(8, 'Ready to Wear', 1, 'ready-to-wear-68dc165b4bb5a', '[\"1757433350-68c04e066657e.webp\"]', NULL, 1, 1, 2, '2025-09-09 15:53:29', '2025-09-30 17:41:47', NULL, 1),
(9, 'Banglez Boxes', 1, 'banglez-boxes-68dc167315c38', '[\"1757433295-68c04dcfb65b5.webp\"]', NULL, 1, 0, 2, '2025-09-09 15:54:55', '2025-09-30 17:42:11', NULL, 1),
(10, 'Banglez Chest', 1, 'banglez-chest-68dc169045695', '[\"1757433443-68c04e6399108.webp\"]', NULL, 0, 0, 2, '2025-09-09 15:57:23', '2025-09-30 17:42:40', NULL, 1),
(11, 'Stone Bangles', 1, 'stone-bangles-68dc16a51e9fb', '[\"1757433547-68c04ecbda93d.webp\"]', NULL, 1, 1, 2, '2025-09-09 15:59:07', '2025-09-30 17:43:01', NULL, 1),
(12, 'Punjabi Choora', 1, 'punjabi-choora-68dc16b7886e3', '[\"1757433702-68c04f66c0526.webp\"]', NULL, 0, 1, 2, '2025-09-09 16:01:42', '2025-09-30 17:43:19', NULL, 1),
(13, 'Bridal/Formal', 1, 'bridalformal-68c04fd94063f', '[\"1757433817-68c04fd9401ea.webp\"]', NULL, 0, 0, 3, '2025-09-09 16:03:37', '2025-09-09 16:03:37', NULL, 0),
(14, 'Party', 1, 'party-68c0509f5ee29', '[\"1757434015-68c0509f5ea00.webp\"]', NULL, 0, 0, 3, '2025-09-09 16:06:55', '2025-09-09 16:06:55', NULL, 0),
(15, 'Chokers', 1, 'chokers-68c050f363019', '[\"1757434099-68c050f36293b.webp\"]', NULL, 0, 0, 3, '2025-09-09 16:08:19', '2025-09-09 16:08:19', NULL, 0),
(16, 'Pendant/ Longhaar', 1, 'pendant-longhaar-68c0517f7c2dc', '[\"1757434239-68c0517f7bdd3.webp\"]', NULL, 0, 0, 3, '2025-09-09 16:10:39', '2025-09-09 16:10:39', NULL, 0),
(17, 'Jhumka', 1, 'jhumka-68c051f71a811', '[\"1757434359-68c051f71a402.webp\"]', NULL, 0, 0, 4, '2025-09-09 16:12:39', '2025-09-09 16:12:39', NULL, 0),
(18, 'Earrings + tikka set', 1, 'earrings-tikka-set-68c05272d19a7', '[\"1757434482-68c05272d14e7.webp\"]', NULL, 0, 0, 4, '2025-09-09 16:14:42', '2025-09-09 16:14:42', NULL, 0),
(19, 'Tops/Studs', 1, 'topsstuds-68c052de51e63', '[\"1757434590-68c052de51b4e.webp\"]', NULL, 0, 0, 4, '2025-09-09 16:16:30', '2025-09-09 16:16:30', NULL, 0),
(20, 'Tikkas', 1, 'tikkas-68c0536bd3469', '[\"1757434731-68c0536bd301e.webp\"]', NULL, 0, 0, 5, '2025-09-09 16:18:51', '2025-09-09 16:18:51', NULL, 0),
(21, 'Jhumar/Passa', 1, 'jhumarpassa-68c99bb5ed457', '[\"1757434842-68c053dab4720.webp\"]', NULL, 0, 1, 5, '2025-09-09 16:20:42', '2025-09-16 17:17:41', NULL, 0),
(22, 'Matha Patti', 1, 'matha-patti-68c056e657362', '[\"1757435622-68c056e65689f.jpg\"]', NULL, 0, 0, 5, '2025-09-09 16:33:42', '2025-09-09 16:33:42', NULL, 0),
(23, 'Nose Rings', 1, 'nose-rings-68c057bfbd468', '[\"1757435839-68c057bfbd1cd.webp\"]', NULL, 0, 0, 6, '2025-09-09 16:37:19', '2025-09-09 16:37:19', NULL, 0),
(24, 'Payal/Anklets', 1, 'payalanklets-68c05a3c92406', '[\"1757436476-68c05a3c921ef.webp\"]', NULL, 0, 0, 6, '2025-09-09 16:44:03', '2025-09-09 16:47:56', NULL, 0),
(25, 'Rings', 1, 'rings-68c05ab90adc8', '[\"1757436601-68c05ab90aba8.webp\"]', NULL, 0, 0, 6, '2025-09-09 16:50:01', '2025-09-09 16:50:01', NULL, 0),
(26, 'Hand Pieces', 1, 'hand-pieces-68c05b041699d', '[\"1757436676-68c05b04166fc.webp\"]', NULL, 0, 0, 6, '2025-09-09 16:51:16', '2025-09-09 16:51:16', NULL, 0),
(27, 'Kaleera', 1, 'kaleera-68c05e0861aa0', '[\"1757437448-68c05e0860674.JPG\"]', NULL, 0, 0, 6, '2025-09-09 16:55:13', '2025-09-09 17:04:08', NULL, 0),
(28, 'Kamarbands/belts', 1, 'kamarbandsbelts-68c05def68f29', '[\"1757437423-68c05def681af.JPG\"]', NULL, 0, 0, 6, '2025-09-09 17:03:43', '2025-09-09 17:03:43', NULL, 0),
(29, 'Pre-Orders', 1, 'pre-orders-68c06cfe05f5e', '[\"1757441278-68c06cfe05d30.jpeg\"]', NULL, 0, 0, 7, '2025-09-09 18:07:58', '2025-10-06 16:24:10', '2025-10-06 16:24:10', 0),
(30, 'Gift Sets', 1, 'gift-sets-68d1813779c5f', '[\"1757441663-68c06e7fe0b8e.png\"]', NULL, 0, 0, 7, '2025-09-09 18:14:23', '2025-10-06 16:24:29', '2025-10-06 16:24:29', 0),
(31, 'Pre Order', 1, 'pre-order-69307a33bb2bd', '[\"1759753141-68e3b3b5d58ba.webp\"]', NULL, 1, 0, 2, '2025-10-06 12:19:01', '2025-12-03 17:58:11', NULL, 0),
(32, 'Pre Order', 1, 'pre-order-69307a29595f7', '[\"1759767980-68e3edac6b67b.webp\"]', NULL, 1, 0, 3, '2025-10-06 16:26:20', '2025-12-03 17:58:01', NULL, 0),
(33, 'Pre Order', 1, 'pre-order-69307a1f5ae52', '[\"1759768010-68e3edcac9ed4.webp\"]', NULL, 1, 0, 4, '2025-10-06 16:26:50', '2025-12-03 17:57:51', NULL, 0),
(34, 'Pre Order', 1, 'pre-order-69307a0a730bd', '[\"1759768038-68e3ede66629b.webp\"]', NULL, 1, 0, 5, '2025-10-06 16:27:18', '2025-12-03 17:57:30', NULL, 0),
(35, 'Pre Order', 1, 'pre-order-693079f790842', '[\"1759768078-68e3ee0e764cf.webp\"]', NULL, 0, 0, 6, '2025-10-06 16:27:58', '2025-12-03 17:57:11', NULL, 0),
(36, 'Adria Kundan Bangles', 1, 'adria-kundan-bangles-6932311ca6858', '[\"1764897052-6932311ca650e.png\"]', NULL, 0, 0, 2, '2025-12-05 01:10:52', '2025-12-05 01:19:14', '2025-12-05 01:19:14', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_boxes`
--

CREATE TABLE `category_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_boxes`
--

INSERT INTO `category_boxes` (`id`, `category_id`, `name`, `created_at`, `updated_at`) VALUES
(3, 9, 'Box 1', '2025-09-22 17:27:56', '2025-09-30 17:42:11'),
(4, 9, 'Box 2', '2025-09-22 17:27:56', '2025-09-30 17:42:11'),
(5, 8, 'Box ready', '2025-09-22 17:29:29', '2025-09-30 17:41:47'),
(6, 8, 'Box ready 2', '2025-09-22 17:29:29', '2025-09-30 17:41:47'),
(7, 36, 'Adria Kundan', '2025-12-05 01:10:52', '2025-12-05 01:10:52');

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `slug` varchar(255) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `name`, `status`, `slug`, `images`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bridal Perfection', 1, 'bridal-perfection-68cacee770675', '[\"1757275736-68bde658ede72.jpg\"]', 'Find our most fashionable pieces', '2025-09-07 20:08:56', '2025-09-17 15:08:23', NULL),
(2, 'Gold Minimal', 1, 'gold-minimal-68ea757d291e7', '[\"1757349328-68bf05d0c5829.jpg\"]', 'Our Must have Gold Pieces', '2025-09-08 16:35:28', '2025-10-11 15:19:25', NULL),
(3, 'Premium Collection', 1, 'premium-collection-68ea7752d934f', '[\"1760196434-68ea7752d8ead.webp\"]', 'Premium Collection description', '2025-10-11 15:27:14', '2025-10-11 15:27:14', NULL),
(4, 'ksankjlsadn', 1, 'ksankjlsadn-68ea7764864f4', '[\"1760196452-68ea7764862de.webp\"]', 'kcankj', '2025-10-11 15:27:32', '2025-10-11 15:29:11', '2025-10-11 15:29:11'),
(5, 'Wedding Collection', 1, 'wedding-collection-68ea793134c2f', '[\"1760196913-68ea793133f7c.jpg\"]', 'Wedding Collection description', '2025-10-11 15:35:13', '2025-10-11 15:35:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `collection_products`
--

CREATE TABLE `collection_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `collection_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collection_products`
--

INSERT INTO `collection_products` (`id`, `collection_id`, `product_id`, `created_at`, `updated_at`) VALUES
(7, 1, 4, '2025-09-13 18:42:49', '2025-09-13 18:42:49'),
(9, 2, 6, '2025-09-13 18:53:08', '2025-09-13 18:53:08'),
(10, 2, 7, '2025-09-13 18:54:49', '2025-09-13 18:54:49'),
(12, 2, 10, '2025-09-13 19:18:39', '2025-09-13 19:18:39'),
(20, 2, 11, '2025-09-13 19:40:34', '2025-09-13 19:40:34'),
(30, 2, 13, '2025-09-13 20:02:58', '2025-09-13 20:02:58'),
(31, 2, 66, '2025-09-30 17:49:47', '2025-09-30 17:49:47'),
(32, 2, 65, '2025-12-04 18:31:47', '2025-12-04 18:31:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gift_card_codes`
--

CREATE TABLE `gift_card_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipient_email` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT 'unused',
  `order_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gift_card_codes`
--

INSERT INTO `gift_card_codes` (`id`, `recipient_email`, `code`, `amount`, `status`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 'tayyebgondal5@gmail.com', 'GJTXCGSR', 250.00, 'active', 'ORDCD-UAHMTN', '2025-10-06 12:14:51', '2025-10-06 12:14:51'),
(2, 'ismael@growthtapdigital.com', 'VGG7QOTV', 10.00, 'active', 'ORDCD-BBBXFY', '2025-12-03 17:52:11', '2025-12-03 17:52:11'),
(3, 'ismael@growthtapdigital.com', 'NDGJPCYJ', 10.00, 'active', 'ORDCD-TFD2BZ', '2025-12-03 17:52:31', '2025-12-03 17:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `gift_card_histories`
--

CREATE TABLE `gift_card_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gift_card_id` bigint(20) UNSIGNED NOT NULL,
  `used_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gift_card_histories`
--

INSERT INTO `gift_card_histories` (`id`, `gift_card_id`, `used_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 67.95, '2025-10-06 12:17:22', '2025-10-06 12:17:22');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_08_07_174622_create_categories_table', 1),
(6, '2025_08_07_194208_create_collections_table', 1),
(7, '2025_08_07_194610_create_products_table', 1),
(8, '2025_08_07_195239_create_tags_table', 1),
(9, '2025_08_07_195427_create_product_tags_table', 1),
(10, '2025_08_07_195622_create_collection_products_table', 1),
(11, '2025_08_11_180806_create_product_variations_table', 1),
(12, '2025_08_16_103439_add_type_to_users_table', 1),
(13, '2025_08_16_115623_add_deleted_at_to_products_table', 1),
(14, '2025_08_18_184232_add_compare_price_to_product_variations', 1),
(15, '2025_08_19_173442_add_deleted_at_to_tags_table', 1),
(16, '2025_08_19_191654_add_soft_deletes_to_collections_table', 1),
(17, '2025_08_20_171816_add_extra_fields_to_products_table', 1),
(18, '2025_08_21_175540_add_soft_deletes_to_categories_table', 1),
(19, '2025_08_28_172102_add_profile_fields_to_users_table', 1),
(20, '2025_08_28_175759_add_member_price_to_products_table', 1),
(21, '2025_08_28_184302_create_product_colors_table', 1),
(22, '2025_08_28_190516_add_deleted_at_to_product_colors_table', 1),
(23, '2025_08_28_191225_add_color_names_to_products_table', 1),
(24, '2025_08_29_185409_create_blog_categories_table', 1),
(25, '2025_08_29_185451_create_blogs_table', 1),
(26, '2025_09_02_180838_create_carts_table', 1),
(27, '2025_09_02_180841_create_bundles_table', 1),
(28, '2025_09_02_180853_create_bundle_products_table', 1),
(29, '2025_09_03_180522_update_product_variations_add_color_id', 1),
(30, '2025_09_03_192354_add_variation_id_to_cart_and_bundle_products_tables', 1),
(31, '2025_09_06_075754_add_session_id_to_users_table', 1),
(32, '2025_09_06_082615_create_cards_table', 1),
(33, '2025_09_06_110021_create_page_settings_table', 1),
(34, '2025_09_06_111131_add_stripe_customer_id_to_users_table', 1),
(35, '2025_09_06_120133_create_orders_table', 1),
(36, '2025_09_09_191357_create_user_rewards_table', 2),
(37, '2025_09_09_194540_add_rewards_to_users_table', 2),
(38, '2025_09_12_194344_add_unavailable_quantity_to_products_and_product_variations', 3),
(39, '2025_09_15_171328_create_wishlists_table', 4),
(40, '2025_09_16_170059_add_is_top_listed_to_products_table', 4),
(41, '2025_09_17_153814_add_us_import_duties_to_orders_table', 4),
(42, '2025_09_18_171703_create_category_boxes_table', 5),
(43, '2025_09_18_180742_add_category_box_id_to_products_table', 5),
(44, '2025_09_19_203230_alter_page_settings_add_images_column', 5),
(45, '2025_09_20_095942_create_product_notify_table', 5),
(46, '2025_09_23_171728_add_color_id_and_size_to_products_table', 6),
(47, '2025_09_23_175632_add_allow_size_to_categories_table', 6),
(48, '2025_09_23_183046_create_payments_table', 6),
(49, '2025_09_25_013034_add_seo_and_images_details_to_products_table', 6),
(50, '2025_09_26_013532_add_is_pre_order_to_products_table', 6),
(51, '2025_09_26_022703_add_is_guest_and_customer_id_to_users_table', 6),
(52, '2025_09_27_095122_add_order_id_to_orders_table', 6),
(53, '2025_10_02_184310_add_email_to_cart_table', 7),
(54, '2025_10_04_080253_create_gift_card_codes_table', 7),
(55, '2025_10_04_121011_create_gift_card_histories_table', 7),
(56, '2025_10_06_025024_add_applied_gift_card_meta_data_to_orders_table', 7),
(57, '2025_10_09_035848_add_weight_to_products_and_product_variations_table', 8),
(58, '2025_10_12_141149_create_bangle_box_sizes_table', 9),
(59, '2025_10_12_141222_create_box_sizes_table', 9),
(60, '2025_10_12_141300_create_bangle_box_colors_table', 9),
(61, '2025_10_15_012201_create_bangle_cart_colors_table', 9),
(62, '2025_10_15_012900_add_bangle_box_columns_to_carts_table', 9),
(63, '2025_10_16_012402_add_bangle_box_meta_data_to_orders_table', 9),
(64, '2025_10_22_015408_add_weight_unit_to_products_table', 10),
(65, '2025_11_22_000001_update_page_settings_add_page_type_and_meta_data', 10),
(66, '2025_11_22_120001_update_page_settings_schema', 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `applied_points` varchar(255) DEFAULT '0',
  `rewards_discount` varchar(255) DEFAULT '0',
  `applied_shipping` tinyint(1) DEFAULT 0,
  `sub_total` varchar(255) DEFAULT '0',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `products_meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`products_meta_data`)),
  `delivery_meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`delivery_meta_data`)),
  `bangle_box_meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`bangle_box_meta_data`)),
  `total_amount` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `shipping_fee` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `user_meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`user_meta_data`)),
  `applied_gift_card_meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`applied_gift_card_meta_data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `us_import_duties` bigint(20) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `applied_points`, `rewards_discount`, `applied_shipping`, `sub_total`, `user_id`, `session_id`, `products_meta_data`, `delivery_meta_data`, `bangle_box_meta_data`, `total_amount`, `tax`, `shipping_fee`, `status`, `email`, `payment_status`, `user_meta_data`, `applied_gift_card_meta_data`, `created_at`, `updated_at`, `us_import_duties`) VALUES
(1, 'ORD-0001', '0', '0', 0, '0', 2, NULL, '\"{\\\"Products\\\":[{\\\"cart_id\\\":10,\\\"qty\\\":1,\\\"final_price\\\":\\\"10.00\\\",\\\"line_total\\\":10,\\\"product\\\":{\\\"id\\\":1,\\\"name\\\":\\\"Gregory Hobbs\\\",\\\"description\\\":\\\"<p>desc<\\\\\\/p>\\\",\\\"care\\\":\\\"here will care\\\",\\\"sustainability\\\":\\\"here will sustainability\\\",\\\"shipping\\\":\\\"shipping\\\",\\\"returns\\\":\\\"returns\\\",\\\"price\\\":\\\"20.00\\\",\\\"member_price\\\":\\\"10.00\\\",\\\"compare_price\\\":\\\"12.00\\\",\\\"sku\\\":\\\"SKU\\\",\\\"quantity\\\":30,\\\"images\\\":[\\\"1757276401-68bde8f1864a8.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"gregory-hobbs-68c2faf47a154\\\",\\\"category_id\\\":2,\\\"created_at\\\":\\\"2025-09-07T20:20:01.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-11T16:38:12.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null},\\\"variation\\\":null}],\\\"Bundle\\\":[{\\\"cart_id\\\":11,\\\"qty\\\":1,\\\"final_price\\\":30,\\\"line_total\\\":30,\\\"bundle\\\":{\\\"id\\\":6,\\\"user_id\\\":2,\\\"session_id\\\":\\\"9874a4e0-967e-424e-b0e0-7de1a5959c78\\\",\\\"products\\\":[{\\\"product\\\":{\\\"id\\\":1,\\\"name\\\":\\\"Gregory Hobbs\\\",\\\"description\\\":\\\"<p>desc<\\\\\\/p>\\\",\\\"care\\\":\\\"here will care\\\",\\\"sustainability\\\":\\\"here will sustainability\\\",\\\"shipping\\\":\\\"shipping\\\",\\\"returns\\\":\\\"returns\\\",\\\"price\\\":\\\"20.00\\\",\\\"member_price\\\":\\\"10.00\\\",\\\"compare_price\\\":\\\"12.00\\\",\\\"sku\\\":\\\"SKU\\\",\\\"quantity\\\":30,\\\"images\\\":[\\\"1757276401-68bde8f1864a8.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"gregory-hobbs-68c2faf47a154\\\",\\\"category_id\\\":2,\\\"created_at\\\":\\\"2025-09-07T20:20:01.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-11T16:38:12.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null},\\\"variation\\\":null,\\\"qty\\\":1,\\\"price\\\":\\\"10.00\\\"},{\\\"product\\\":{\\\"id\\\":1,\\\"name\\\":\\\"Gregory Hobbs\\\",\\\"description\\\":\\\"<p>desc<\\\\\\/p>\\\",\\\"care\\\":\\\"here will care\\\",\\\"sustainability\\\":\\\"here will sustainability\\\",\\\"shipping\\\":\\\"shipping\\\",\\\"returns\\\":\\\"returns\\\",\\\"price\\\":\\\"20.00\\\",\\\"member_price\\\":\\\"10.00\\\",\\\"compare_price\\\":\\\"12.00\\\",\\\"sku\\\":\\\"SKU\\\",\\\"quantity\\\":30,\\\"images\\\":[\\\"1757276401-68bde8f1864a8.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"gregory-hobbs-68c2faf47a154\\\",\\\"category_id\\\":2,\\\"created_at\\\":\\\"2025-09-07T20:20:01.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-11T16:38:12.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null},\\\"variation\\\":null,\\\"qty\\\":1,\\\"price\\\":\\\"10.00\\\"},{\\\"product\\\":{\\\"id\\\":1,\\\"name\\\":\\\"Gregory Hobbs\\\",\\\"description\\\":\\\"<p>desc<\\\\\\/p>\\\",\\\"care\\\":\\\"here will care\\\",\\\"sustainability\\\":\\\"here will sustainability\\\",\\\"shipping\\\":\\\"shipping\\\",\\\"returns\\\":\\\"returns\\\",\\\"price\\\":\\\"20.00\\\",\\\"member_price\\\":\\\"10.00\\\",\\\"compare_price\\\":\\\"12.00\\\",\\\"sku\\\":\\\"SKU\\\",\\\"quantity\\\":30,\\\"images\\\":[\\\"1757276401-68bde8f1864a8.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"gregory-hobbs-68c2faf47a154\\\",\\\"category_id\\\":2,\\\"created_at\\\":\\\"2025-09-07T20:20:01.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-11T16:38:12.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null},\\\"variation\\\":null,\\\"qty\\\":1,\\\"price\\\":\\\"10.00\\\"}]}},{\\\"cart_id\\\":12,\\\"qty\\\":1,\\\"final_price\\\":30,\\\"line_total\\\":30,\\\"bundle\\\":{\\\"id\\\":7,\\\"user_id\\\":2,\\\"session_id\\\":\\\"9874a4e0-967e-424e-b0e0-7de1a5959c78\\\",\\\"products\\\":[{\\\"product\\\":{\\\"id\\\":1,\\\"name\\\":\\\"Gregory Hobbs\\\",\\\"description\\\":\\\"<p>desc<\\\\\\/p>\\\",\\\"care\\\":\\\"here will care\\\",\\\"sustainability\\\":\\\"here will sustainability\\\",\\\"shipping\\\":\\\"shipping\\\",\\\"returns\\\":\\\"returns\\\",\\\"price\\\":\\\"20.00\\\",\\\"member_price\\\":\\\"10.00\\\",\\\"compare_price\\\":\\\"12.00\\\",\\\"sku\\\":\\\"SKU\\\",\\\"quantity\\\":30,\\\"images\\\":[\\\"1757276401-68bde8f1864a8.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"gregory-hobbs-68c2faf47a154\\\",\\\"category_id\\\":2,\\\"created_at\\\":\\\"2025-09-07T20:20:01.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-11T16:38:12.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null},\\\"variation\\\":null,\\\"qty\\\":1,\\\"price\\\":\\\"10.00\\\"},{\\\"product\\\":{\\\"id\\\":1,\\\"name\\\":\\\"Gregory Hobbs\\\",\\\"description\\\":\\\"<p>desc<\\\\\\/p>\\\",\\\"care\\\":\\\"here will care\\\",\\\"sustainability\\\":\\\"here will sustainability\\\",\\\"shipping\\\":\\\"shipping\\\",\\\"returns\\\":\\\"returns\\\",\\\"price\\\":\\\"20.00\\\",\\\"member_price\\\":\\\"10.00\\\",\\\"compare_price\\\":\\\"12.00\\\",\\\"sku\\\":\\\"SKU\\\",\\\"quantity\\\":30,\\\"images\\\":[\\\"1757276401-68bde8f1864a8.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"gregory-hobbs-68c2faf47a154\\\",\\\"category_id\\\":2,\\\"created_at\\\":\\\"2025-09-07T20:20:01.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-11T16:38:12.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null},\\\"variation\\\":null,\\\"qty\\\":1,\\\"price\\\":\\\"10.00\\\"},{\\\"product\\\":{\\\"id\\\":1,\\\"name\\\":\\\"Gregory Hobbs\\\",\\\"description\\\":\\\"<p>desc<\\\\\\/p>\\\",\\\"care\\\":\\\"here will care\\\",\\\"sustainability\\\":\\\"here will sustainability\\\",\\\"shipping\\\":\\\"shipping\\\",\\\"returns\\\":\\\"returns\\\",\\\"price\\\":\\\"20.00\\\",\\\"member_price\\\":\\\"10.00\\\",\\\"compare_price\\\":\\\"12.00\\\",\\\"sku\\\":\\\"SKU\\\",\\\"quantity\\\":30,\\\"images\\\":[\\\"1757276401-68bde8f1864a8.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"gregory-hobbs-68c2faf47a154\\\",\\\"category_id\\\":2,\\\"created_at\\\":\\\"2025-09-07T20:20:01.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-11T16:38:12.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null},\\\"variation\\\":null,\\\"qty\\\":1,\\\"price\\\":\\\"10.00\\\"}]}}]}\"', '{\"country\":\"Pakistan\",\"city\":\"lahore\",\"street\":\"address\",\"postcode\":\"21212\"}', NULL, 70.50, 3.50, 0.00, 'completed', 'tayyebgondal5@gmail.com', 'paid', '\"{\\\"name\\\":\\\"Tayyeb\\\",\\\"last_name\\\":\\\"Gondal\\\",\\\"phone\\\":\\\"33333333\\\",\\\"email\\\":\\\"tayyebgondal5@gmail.com\\\"}\"', NULL, '2025-09-11 17:13:15', '2025-09-30 17:29:38', 0),
(2, 'ORD-0002', '0', '0', 0, '0', 1, NULL, '\"{\\\"Products\\\":[{\\\"cart_id\\\":13,\\\"qty\\\":2,\\\"final_price\\\":\\\"10.00\\\",\\\"line_total\\\":20,\\\"product\\\":{\\\"id\\\":1,\\\"name\\\":\\\"Gregory Hobbs\\\",\\\"description\\\":\\\"<p>desc<\\\\\\/p>\\\",\\\"care\\\":\\\"here will care\\\",\\\"sustainability\\\":\\\"here will sustainability\\\",\\\"shipping\\\":\\\"shipping\\\",\\\"returns\\\":\\\"returns\\\",\\\"price\\\":\\\"20.00\\\",\\\"member_price\\\":\\\"10.00\\\",\\\"compare_price\\\":\\\"12.00\\\",\\\"sku\\\":\\\"SKU\\\",\\\"quantity\\\":23,\\\"unavailable_quantity\\\":3,\\\"images\\\":[\\\"1757276401-68bde8f1864a8.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"gregory-hobbs-68c497a7ca8da\\\",\\\"category_id\\\":2,\\\"created_at\\\":\\\"2025-09-07T20:20:01.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-12T21:59:03.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null},\\\"variation\\\":null}],\\\"Bundle\\\":[{\\\"cart_id\\\":1,\\\"qty\\\":2,\\\"final_price\\\":30,\\\"line_total\\\":60,\\\"bundle\\\":{\\\"id\\\":1,\\\"user_id\\\":null,\\\"session_id\\\":\\\"fb050440-ac38-4fc1-9999-b3d29f16ed8e\\\",\\\"products\\\":[{\\\"product\\\":{\\\"id\\\":1,\\\"name\\\":\\\"Gregory Hobbs\\\",\\\"description\\\":\\\"<p>desc<\\\\\\/p>\\\",\\\"care\\\":\\\"here will care\\\",\\\"sustainability\\\":\\\"here will sustainability\\\",\\\"shipping\\\":\\\"shipping\\\",\\\"returns\\\":\\\"returns\\\",\\\"price\\\":\\\"20.00\\\",\\\"member_price\\\":\\\"10.00\\\",\\\"compare_price\\\":\\\"12.00\\\",\\\"sku\\\":\\\"SKU\\\",\\\"quantity\\\":23,\\\"unavailable_quantity\\\":3,\\\"images\\\":[\\\"1757276401-68bde8f1864a8.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"gregory-hobbs-68c497a7ca8da\\\",\\\"category_id\\\":2,\\\"created_at\\\":\\\"2025-09-07T20:20:01.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-12T21:59:03.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null},\\\"variation\\\":null,\\\"qty\\\":1,\\\"price\\\":\\\"10.00\\\"},{\\\"product\\\":{\\\"id\\\":1,\\\"name\\\":\\\"Gregory Hobbs\\\",\\\"description\\\":\\\"<p>desc<\\\\\\/p>\\\",\\\"care\\\":\\\"here will care\\\",\\\"sustainability\\\":\\\"here will sustainability\\\",\\\"shipping\\\":\\\"shipping\\\",\\\"returns\\\":\\\"returns\\\",\\\"price\\\":\\\"20.00\\\",\\\"member_price\\\":\\\"10.00\\\",\\\"compare_price\\\":\\\"12.00\\\",\\\"sku\\\":\\\"SKU\\\",\\\"quantity\\\":23,\\\"unavailable_quantity\\\":3,\\\"images\\\":[\\\"1757276401-68bde8f1864a8.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"gregory-hobbs-68c497a7ca8da\\\",\\\"category_id\\\":2,\\\"created_at\\\":\\\"2025-09-07T20:20:01.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-12T21:59:03.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null},\\\"variation\\\":null,\\\"qty\\\":1,\\\"price\\\":\\\"10.00\\\"},{\\\"product\\\":{\\\"id\\\":1,\\\"name\\\":\\\"Gregory Hobbs\\\",\\\"description\\\":\\\"<p>desc<\\\\\\/p>\\\",\\\"care\\\":\\\"here will care\\\",\\\"sustainability\\\":\\\"here will sustainability\\\",\\\"shipping\\\":\\\"shipping\\\",\\\"returns\\\":\\\"returns\\\",\\\"price\\\":\\\"20.00\\\",\\\"member_price\\\":\\\"10.00\\\",\\\"compare_price\\\":\\\"12.00\\\",\\\"sku\\\":\\\"SKU\\\",\\\"quantity\\\":23,\\\"unavailable_quantity\\\":3,\\\"images\\\":[\\\"1757276401-68bde8f1864a8.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"gregory-hobbs-68c497a7ca8da\\\",\\\"category_id\\\":2,\\\"created_at\\\":\\\"2025-09-07T20:20:01.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-12T21:59:03.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null},\\\"variation\\\":null,\\\"qty\\\":1,\\\"price\\\":\\\"10.00\\\"}]}}]}\"', '{\"address\":\"Pakistan Chowk, Saddar New Chali, Karachi, Pakistan\",\"street\":null,\"formatted_address\":\"Pakistan Chowk, Saddar New Chali, Karachi, Pakistan\",\"city\":\"Karachi\",\"state_province\":\"Sindh\",\"province_code\":\"Sindh\",\"country\":\"Pakistan\",\"country_iso\":\"PK\",\"postal_code\":\"75660\",\"latitude\":\"24.8543266\",\"longitude\":\"67.0124143\",\"place_id\":null,\"area\":null,\"sub_area\":null,\"updated_at\":\"2025-12-04 18:53:25\"}', NULL, 89.00, 4.00, 5.00, 'pending', 'bangles@admin.com', 'paid', '\"{\\\"name\\\":\\\"Admin\\\",\\\"last_name\\\":\\\"Last name\\\",\\\"phone\\\":\\\"33333333\\\",\\\"email\\\":\\\"bangles@admin.com\\\"}\"', NULL, '2025-09-12 22:10:31', '2025-12-04 18:53:25', 0),
(3, 'ORD-0003', '0', '0.00', 0, '199.75', 1, NULL, '\"{\\\"Products\\\":[{\\\"cart_id\\\":29,\\\"qty\\\":2,\\\"final_price\\\":\\\"39.95\\\",\\\"line_total\\\":79.9,\\\"product\\\":{\\\"id\\\":60,\\\"sku\\\":null,\\\"name\\\":\\\"Olivia Bangles\\\",\\\"description\\\":\\\"<p>The <strong>Olivia Bangles<\\\\\\/strong> are a luxe pair plated in 22k gold and wrapped with a double band of pearls for a timeless, elegant look. Sold in matching sizes, they offer a blend of classic glamour and modern versatility\\\\u2014ideal for transitioning from wedding ceremonies to evening receptions. With their pearl detail and warm gold finish, they add softness and refined texture to your bridal jewellery set or festive stack.&nbsp;<\\\\\\/p><p><strong>Best Paired For:<\\\\\\/strong> pearl-accented lehengas, wedding reception outfits, Eid celebrations, agricultural-heritage inspired styling, and gifts for bridesmaids.<\\\\\\/p>\\\",\\\"meta_title\\\":null,\\\"meta_description\\\":null,\\\"images_details\\\":null,\\\"care\\\":\\\"Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.\\\",\\\"sustainability\\\":\\\"Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.\\\",\\\"shipping\\\":\\\"Orders are usually shipped within 1\\\\u20133 business days (Tue\\\\u2013Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.\\\",\\\"returns\\\":\\\"Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags\\\\\\/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.\\\",\\\"price\\\":null,\\\"member_price\\\":null,\\\"color_id\\\":null,\\\"size\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":null,\\\"unavailable_quantity\\\":null,\\\"images\\\":[\\\"1758041883-68c9971b8bd4d.jpg\\\",\\\"1758041883-68c9971b8c510.jpg\\\",\\\"1758041883-68c9971b8cbd5.jpg\\\",\\\"1758041883-68c9971b8d1e1.jpg\\\",\\\"1758041883-68c9971b8d76b.jpg\\\",\\\"1758041883-68c9971b8dc30.jpg\\\",\\\"1758041883-68c9971b8e1e9.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"olivia-bangles-68c9971b8e802\\\",\\\"category_id\\\":8,\\\"category_box_id\\\":5,\\\"created_at\\\":\\\"2025-09-16T16:58:03.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-22T17:30:27.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null,\\\"is_top_listed\\\":0,\\\"is_pre_order\\\":0},\\\"variation\\\":{\\\"id\\\":227,\\\"product_id\\\":60,\\\"color_id\\\":1,\\\"size\\\":\\\"2.4\\\",\\\"price\\\":\\\"39.95\\\",\\\"member_price\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":5,\\\"unavailable_quantity\\\":0,\\\"created_at\\\":\\\"2025-09-16T16:58:03.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-16T16:58:03.000000Z\\\"}}],\\\"Bundle\\\":[{\\\"cart_id\\\":24,\\\"qty\\\":1,\\\"final_price\\\":119.85000000000001,\\\"line_total\\\":119.85000000000001,\\\"bundle\\\":{\\\"id\\\":13,\\\"user_id\\\":1,\\\"session_id\\\":\\\"247b062c-96d7-4453-b496-2d5a2d69bd0a\\\",\\\"products\\\":[{\\\"product\\\":{\\\"id\\\":9,\\\"sku\\\":null,\\\"name\\\":\\\"Anastasia Bangles\\\",\\\"description\\\":\\\"<p>Brighten your look with the <strong>Anastasia Bangles<\\\\\\/strong>, finished in 22k gold plating and accented with stones for a refined sparkle. Sold as a pair, they serve as perfect statement pieces for weddings, Eid, or festive occasions.<\\\\\\/p><p>Crafted for elegance and durability, the Anastasia Bangles offer a timeless design that complements both bridal and contemporary styles. Whether stacked or worn solo, they make a gorgeous gift or standout accessory.<\\\\\\/p>\\\",\\\"meta_title\\\":null,\\\"meta_description\\\":null,\\\"images_details\\\":null,\\\"care\\\":\\\"Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.\\\",\\\"sustainability\\\":\\\"Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.\\\",\\\"shipping\\\":\\\"Orders are usually shipped within 1\\\\u20133 business days (Tue\\\\u2013Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.\\\",\\\"returns\\\":\\\"Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags\\\\\\/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.\\\",\\\"price\\\":null,\\\"member_price\\\":null,\\\"color_id\\\":null,\\\"size\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":null,\\\"unavailable_quantity\\\":null,\\\"images\\\":[\\\"1757790608-68c5c19015bf0.jpg\\\",\\\"1757790608-68c5c19016124.jpg\\\",\\\"1757790608-68c5c19016555.jpg\\\",\\\"1757790608-68c5c19016910.jpg\\\",\\\"1757790608-68c5c19016e18.jpg\\\",\\\"1757790608-68c5c190173e5.jpg\\\",\\\"1757790608-68c5c1901788c.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"anastasia-bangles-68cae04f031dd\\\",\\\"category_id\\\":11,\\\"category_box_id\\\":null,\\\"created_at\\\":\\\"2025-09-13T19:10:08.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T16:22:39.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null,\\\"is_top_listed\\\":1,\\\"is_pre_order\\\":0},\\\"variation\\\":{\\\"id\\\":261,\\\"product_id\\\":9,\\\"color_id\\\":1,\\\"size\\\":\\\"2.6\\\",\\\"price\\\":\\\"39.95\\\",\\\"member_price\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":2,\\\"unavailable_quantity\\\":0,\\\"created_at\\\":\\\"2025-09-17T16:22:39.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T16:22:39.000000Z\\\"},\\\"qty\\\":1,\\\"price\\\":\\\"39.95\\\"},{\\\"product\\\":{\\\"id\\\":9,\\\"sku\\\":null,\\\"name\\\":\\\"Anastasia Bangles\\\",\\\"description\\\":\\\"<p>Brighten your look with the <strong>Anastasia Bangles<\\\\\\/strong>, finished in 22k gold plating and accented with stones for a refined sparkle. Sold as a pair, they serve as perfect statement pieces for weddings, Eid, or festive occasions.<\\\\\\/p><p>Crafted for elegance and durability, the Anastasia Bangles offer a timeless design that complements both bridal and contemporary styles. Whether stacked or worn solo, they make a gorgeous gift or standout accessory.<\\\\\\/p>\\\",\\\"meta_title\\\":null,\\\"meta_description\\\":null,\\\"images_details\\\":null,\\\"care\\\":\\\"Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.\\\",\\\"sustainability\\\":\\\"Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.\\\",\\\"shipping\\\":\\\"Orders are usually shipped within 1\\\\u20133 business days (Tue\\\\u2013Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.\\\",\\\"returns\\\":\\\"Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags\\\\\\/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.\\\",\\\"price\\\":null,\\\"member_price\\\":null,\\\"color_id\\\":null,\\\"size\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":null,\\\"unavailable_quantity\\\":null,\\\"images\\\":[\\\"1757790608-68c5c19015bf0.jpg\\\",\\\"1757790608-68c5c19016124.jpg\\\",\\\"1757790608-68c5c19016555.jpg\\\",\\\"1757790608-68c5c19016910.jpg\\\",\\\"1757790608-68c5c19016e18.jpg\\\",\\\"1757790608-68c5c190173e5.jpg\\\",\\\"1757790608-68c5c1901788c.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"anastasia-bangles-68cae04f031dd\\\",\\\"category_id\\\":11,\\\"category_box_id\\\":null,\\\"created_at\\\":\\\"2025-09-13T19:10:08.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T16:22:39.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null,\\\"is_top_listed\\\":1,\\\"is_pre_order\\\":0},\\\"variation\\\":{\\\"id\\\":262,\\\"product_id\\\":9,\\\"color_id\\\":1,\\\"size\\\":\\\"2.8\\\",\\\"price\\\":\\\"39.95\\\",\\\"member_price\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":2,\\\"unavailable_quantity\\\":0,\\\"created_at\\\":\\\"2025-09-17T16:22:39.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T16:22:39.000000Z\\\"},\\\"qty\\\":1,\\\"price\\\":\\\"39.95\\\"},{\\\"product\\\":{\\\"id\\\":9,\\\"sku\\\":null,\\\"name\\\":\\\"Anastasia Bangles\\\",\\\"description\\\":\\\"<p>Brighten your look with the <strong>Anastasia Bangles<\\\\\\/strong>, finished in 22k gold plating and accented with stones for a refined sparkle. Sold as a pair, they serve as perfect statement pieces for weddings, Eid, or festive occasions.<\\\\\\/p><p>Crafted for elegance and durability, the Anastasia Bangles offer a timeless design that complements both bridal and contemporary styles. Whether stacked or worn solo, they make a gorgeous gift or standout accessory.<\\\\\\/p>\\\",\\\"meta_title\\\":null,\\\"meta_description\\\":null,\\\"images_details\\\":null,\\\"care\\\":\\\"Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.\\\",\\\"sustainability\\\":\\\"Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.\\\",\\\"shipping\\\":\\\"Orders are usually shipped within 1\\\\u20133 business days (Tue\\\\u2013Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.\\\",\\\"returns\\\":\\\"Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags\\\\\\/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.\\\",\\\"price\\\":null,\\\"member_price\\\":null,\\\"color_id\\\":null,\\\"size\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":null,\\\"unavailable_quantity\\\":null,\\\"images\\\":[\\\"1757790608-68c5c19015bf0.jpg\\\",\\\"1757790608-68c5c19016124.jpg\\\",\\\"1757790608-68c5c19016555.jpg\\\",\\\"1757790608-68c5c19016910.jpg\\\",\\\"1757790608-68c5c19016e18.jpg\\\",\\\"1757790608-68c5c190173e5.jpg\\\",\\\"1757790608-68c5c1901788c.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"anastasia-bangles-68cae04f031dd\\\",\\\"category_id\\\":11,\\\"category_box_id\\\":null,\\\"created_at\\\":\\\"2025-09-13T19:10:08.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T16:22:39.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null,\\\"is_top_listed\\\":1,\\\"is_pre_order\\\":0},\\\"variation\\\":{\\\"id\\\":263,\\\"product_id\\\":9,\\\"color_id\\\":1,\\\"size\\\":\\\"2.10\\\",\\\"price\\\":\\\"39.95\\\",\\\"member_price\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":2,\\\"unavailable_quantity\\\":0,\\\"created_at\\\":\\\"2025-09-17T16:22:39.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-17T16:22:39.000000Z\\\"},\\\"qty\\\":1,\\\"price\\\":\\\"39.95\\\"}]}},{\\\"cart_id\\\":28,\\\"qty\\\":1,\\\"final_price\\\":0,\\\"line_total\\\":0,\\\"bundle\\\":{\\\"id\\\":14,\\\"user_id\\\":1,\\\"session_id\\\":\\\"247b062c-96d7-4453-b496-2d5a2d69bd0a\\\",\\\"products\\\":[]}}]}\"', '{\"address\":\"Lahore-Islamabad Motorway, Sabzazar Block E Sabzazar Housing Scheme Phase 1 & 2 Lahore, Pakistan\",\"country\":\"Pakistan\",\"country_iso\":\"PK\",\"state_province\":\"Punjab\",\"city\":\"Lahore\",\"street\":\"Lahore-Islamabad Motorway\",\"postcode\":\"\",\"latitude\":\"31.5306914\",\"longitude\":\"74.2597962\"}', NULL, 254.69, 9.99, 5.00, 'pending', 'bangles@admin.com', 'paid', '\"{\\\"name\\\":\\\"Admin\\\",\\\"last_name\\\":\\\"Last name\\\",\\\"phone\\\":\\\"33333333\\\",\\\"email\\\":\\\"bangles@admin.com\\\"}\"', NULL, '2025-09-27 15:58:16', '2025-09-27 15:58:16', 0),
(4, 'ORD-0004', '0', '0.00', 0, '9.95', 1, NULL, '\"{\\\"Products\\\":[{\\\"cart_id\\\":32,\\\"qty\\\":1,\\\"final_price\\\":\\\"9.95\\\",\\\"line_total\\\":9.95,\\\"product\\\":{\\\"id\\\":12,\\\"sku\\\":null,\\\"name\\\":\\\"Ariana Glass Bangles\\\",\\\"description\\\":\\\"<p>Add a touch of soft glamour with the <strong>Ariana Glass Bangles<\\\\\\/strong>, featuring a rose and gold design accented by stones. These glass bangles deliver a delicate sparkle\\\\u2014perfect for festivals, wedding guest looks, or elevating everyday style.<\\\\\\/p>\\\",\\\"meta_title\\\":null,\\\"meta_description\\\":null,\\\"images_details\\\":\\\"[{\\\\\\\"name\\\\\\\":\\\\\\\"1757792656-68c5c990e2bc9.jpg\\\\\\\",\\\\\\\"alt\\\\\\\":\\\\\\\"\\\\\\\"},{\\\\\\\"name\\\\\\\":\\\\\\\"1757792656-68c5c990e30c6.jpg\\\\\\\",\\\\\\\"alt\\\\\\\":\\\\\\\"\\\\\\\"},{\\\\\\\"name\\\\\\\":\\\\\\\"1757792656-68c5c990e35ef.jpg\\\\\\\",\\\\\\\"alt\\\\\\\":\\\\\\\"\\\\\\\"},{\\\\\\\"name\\\\\\\":\\\\\\\"1757792656-68c5c990e3bf7.jpg\\\\\\\",\\\\\\\"alt\\\\\\\":\\\\\\\"\\\\\\\"},{\\\\\\\"name\\\\\\\":\\\\\\\"1757792656-68c5c990e4291.jpg\\\\\\\",\\\\\\\"alt\\\\\\\":\\\\\\\"\\\\\\\"},{\\\\\\\"name\\\\\\\":\\\\\\\"1757792656-68c5c990e4a5b.jpg\\\\\\\",\\\\\\\"alt\\\\\\\":\\\\\\\"\\\\\\\"}]\\\",\\\"care\\\":\\\"Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.\\\",\\\"sustainability\\\":\\\"Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.\\\",\\\"shipping\\\":\\\"Orders are usually shipped within 1\\\\u20133 business days (Tue\\\\u2013Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.\\\",\\\"returns\\\":\\\"Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags\\\\\\/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.\\\",\\\"price\\\":\\\"9.95\\\",\\\"member_price\\\":null,\\\"color_id\\\":15,\\\"size\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":1,\\\"unavailable_quantity\\\":0,\\\"images\\\":[\\\"1757792656-68c5c990e2bc9.jpg\\\",\\\"1757792656-68c5c990e30c6.jpg\\\",\\\"1757792656-68c5c990e35ef.jpg\\\",\\\"1757792656-68c5c990e3bf7.jpg\\\",\\\"1757792656-68c5c990e4291.jpg\\\",\\\"1757792656-68c5c990e4a5b.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"ariana-glass-bangles-68c5cb8382d9f\\\",\\\"category_id\\\":8,\\\"category_box_id\\\":null,\\\"created_at\\\":\\\"2025-09-13T19:44:16.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-27T15:26:22.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null,\\\"is_top_listed\\\":0,\\\"is_pre_order\\\":0},\\\"variation\\\":null}],\\\"Bundle\\\":[]}\"', '{\"address\":\"Lahore-Islamabad Motorway, Sabzazar Block E Sabzazar Housing Scheme Phase 1 & 2 Lahore, Pakistan\",\"country\":\"Pakistan\",\"country_iso\":\"PK\",\"state_province\":\"Punjab\",\"city\":\"Lahore\",\"street\":\"Lahore-Islamabad Motorway\",\"postcode\":\"\",\"latitude\":\"31.5306914\",\"longitude\":\"74.2597962\"}', NULL, 15.45, 0.50, 5.00, 'pending', 'bangles@admin.com', 'paid', '\"{\\\"name\\\":\\\"Tayyeb\\\",\\\"last_name\\\":\\\"Last name\\\",\\\"phone\\\":\\\"33333333\\\",\\\"email\\\":\\\"bangles@admin.com\\\"}\"', NULL, '2025-09-30 17:10:28', '2025-09-30 17:10:28', 0),
(5, 'ORD-0005', '0', '0.00', 0, '100.00', 3, 'PLMOXvOVv2rsUa5COVjZ1eY7TAcpY0OLLsoG6Cnh', '\"{\\\"Products\\\":[{\\\"cart_id\\\":33,\\\"qty\\\":1,\\\"final_price\\\":\\\"100.00\\\",\\\"line_total\\\":100,\\\"product\\\":{\\\"id\\\":66,\\\"sku\\\":null,\\\"name\\\":\\\"Testing product\\\",\\\"description\\\":\\\"<p>Here will be description&nbsp;<\\\\\\/p>\\\",\\\"meta_title\\\":\\\"Meta title\\\",\\\"meta_description\\\":\\\"Meta description will be here\\\",\\\"images_details\\\":\\\"[{\\\\\\\"name\\\\\\\":\\\\\\\"1759254587-68dc183b15803.jpg\\\\\\\",\\\\\\\"alt\\\\\\\":\\\\\\\"Image 1 ALT\\\\\\\"},{\\\\\\\"name\\\\\\\":\\\\\\\"1759254587-68dc183b15ae9.jpg\\\\\\\",\\\\\\\"alt\\\\\\\":\\\\\\\"Image Alt 2\\\\\\\"},{\\\\\\\"name\\\\\\\":\\\\\\\"1759254587-68dc183b16c7c.jpg\\\\\\\",\\\\\\\"alt\\\\\\\":\\\\\\\"Image alt 3\\\\\\\"}]\\\",\\\"care\\\":\\\"Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.\\\",\\\"sustainability\\\":\\\"Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.\\\",\\\"shipping\\\":\\\"Orders are usually shipped within 1\\\\u20133 business days (Tue\\\\u2013Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.\\\",\\\"returns\\\":\\\"Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags\\\\\\/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.\\\",\\\"price\\\":null,\\\"member_price\\\":null,\\\"color_id\\\":null,\\\"size\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":null,\\\"unavailable_quantity\\\":null,\\\"images\\\":[\\\"1759254587-68dc183b15803.jpg\\\",\\\"1759254587-68dc183b15ae9.jpg\\\",\\\"1759254587-68dc183b16c7c.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":0,\\\"slug\\\":\\\"testing-product-68dc183b16e30\\\",\\\"category_id\\\":11,\\\"category_box_id\\\":null,\\\"created_at\\\":\\\"2025-09-30T17:49:47.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-30T17:49:47.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null,\\\"is_top_listed\\\":0,\\\"is_pre_order\\\":1},\\\"variation\\\":{\\\"id\\\":266,\\\"product_id\\\":66,\\\"color_id\\\":1,\\\"size\\\":\\\"2.6\\\",\\\"price\\\":\\\"100.00\\\",\\\"member_price\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":10,\\\"unavailable_quantity\\\":0,\\\"created_at\\\":\\\"2025-09-30T17:49:47.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-30T17:49:47.000000Z\\\"}}],\\\"Bundle\\\":[]}\"', '{\"address\":\"U.S. Route 66, Albuquerque, NM, USA\",\"country\":\"United States\",\"country_iso\":\"US\",\"state_province\":\"New Mexico\",\"city\":\"Albuquerque\",\"street\":\"U.S. Route 66\",\"postcode\":\"\",\"latitude\":\"35.0809334\",\"longitude\":\"-106.6182312\"}', NULL, 130.00, 5.00, 5.00, 'processing', 'test@email.com', 'paid', '\"{\\\"name\\\":\\\"Test \\\",\\\"last_name\\\":\\\"Customer\\\",\\\"phone\\\":\\\"33333333\\\",\\\"email\\\":\\\"test@email.com\\\"}\"', NULL, '2025-09-30 17:53:32', '2025-10-06 17:28:07', 20),
(6, 'ORD-0006', '0', '0.00', 0, '59.95', 2, NULL, '\"{\\\"Products\\\":[{\\\"cart_id\\\":30,\\\"qty\\\":1,\\\"final_price\\\":\\\"59.95\\\",\\\"line_total\\\":59.95,\\\"product\\\":{\\\"id\\\":17,\\\"sku\\\":null,\\\"name\\\":\\\"Arora Pink Bangles\\\",\\\"description\\\":\\\"<p>Brighten up your look with the <strong>Arora Pink Bangles<\\\\\\/strong>, a refined pair adorned with delicate pink beading and floral detailing. Perfect for weddings, festive events, or adding a soft touch of elegance to everyday wear.<\\\\\\/p>\\\",\\\"meta_title\\\":null,\\\"meta_description\\\":null,\\\"images_details\\\":null,\\\"care\\\":\\\"Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.\\\",\\\"sustainability\\\":\\\"Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.\\\",\\\"shipping\\\":\\\"Orders are usually shipped within 1\\\\u20133 business days (Tue\\\\u2013Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.\\\",\\\"returns\\\":\\\"Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags\\\\\\/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.\\\",\\\"price\\\":null,\\\"member_price\\\":null,\\\"color_id\\\":null,\\\"size\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":null,\\\"unavailable_quantity\\\":null,\\\"images\\\":[\\\"1757796257-68c5d7a199cf3.jpg\\\",\\\"1757796257-68c5d7a19c9d4.jpg\\\",\\\"1757796257-68c5d7a19cfe6.jpg\\\",\\\"1757796257-68c5d7a19d544.jpg\\\",\\\"1757796257-68c5d7a19dbd2.jpg\\\",\\\"1757796257-68c5d7a19e1f5.jpg\\\",\\\"1757796257-68c5d7a19e652.jpg\\\",\\\"1757796257-68c5d7a19eb6c.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":0,\\\"slug\\\":\\\"arora-pink-bangles-68c5d814d7ca7\\\",\\\"category_id\\\":8,\\\"category_box_id\\\":null,\\\"created_at\\\":\\\"2025-09-13T20:44:17.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-13T20:46:12.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null,\\\"is_top_listed\\\":0,\\\"is_pre_order\\\":0},\\\"variation\\\":{\\\"id\\\":88,\\\"product_id\\\":17,\\\"color_id\\\":25,\\\"size\\\":\\\"2.4\\\",\\\"price\\\":\\\"59.95\\\",\\\"member_price\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":1,\\\"unavailable_quantity\\\":0,\\\"created_at\\\":\\\"2025-09-13T20:46:12.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-13T20:46:12.000000Z\\\"}}],\\\"Bundle\\\":[],\\\"GiftCards\\\":[]}\"', '{\"address\":\"101 9 Ave SW, Calgary, AB T2P 1J9, Canada\",\"country\":\"Canada\",\"country_iso\":null,\"state_province\":\"Alberta\",\"city\":\"Calgary\",\"street\":null,\"postcode\":null,\"latitude\":\"51.04430800000001\",\"longitude\":\"-114.0630914\"}', NULL, 0.00, 3.00, 5.00, 'pending', 'tayyebgondal5@gmail.com', 'paid', '\"{\\\"name\\\":\\\"Tayyeb\\\",\\\"last_name\\\":\\\"Iqbal\\\",\\\"phone\\\":\\\"+92 3445081997\\\",\\\"email\\\":\\\"tayyebgondal5@gmail.com\\\"}\"', '[{\"code\":\"GJTXCGSR\",\"applied\":67.95,\"total\":\"250.00\",\"remaining\":250}]', '2025-10-06 12:17:22', '2025-10-11 15:43:11', 0),
(7, 'ORD-0007', '0', '0.00', 0, '29.95', 2, NULL, '\"{\\\"Products\\\":[],\\\"Bundle\\\":[],\\\"GiftCards\\\":[],\\\"BangleBox\\\":[{\\\"cart_id\\\":39,\\\"qty\\\":1,\\\"final_price\\\":\\\"29.95\\\",\\\"line_total\\\":29.95,\\\"bangle_box\\\":{\\\"id\\\":1,\\\"size\\\":\\\"6\\\",\\\"price\\\":\\\"29.95\\\",\\\"created_at\\\":\\\"2025-10-17T01:23:16.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:23:16.000000Z\\\"},\\\"bangle_size\\\":{\\\"id\\\":1,\\\"size\\\":\\\"2.4\\\",\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"},\\\"colors\\\":[{\\\"id\\\":1,\\\"cart_id\\\":39,\\\"color_id\\\":20,\\\"created_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"color\\\":{\\\"id\\\":20,\\\"image\\\":\\\"Dark Purple with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Dark Purple with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":2,\\\"cart_id\\\":39,\\\"color_id\\\":15,\\\"created_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"color\\\":{\\\"id\\\":15,\\\"image\\\":\\\"Coral Matte.avif\\\",\\\"color_name\\\":\\\"Coral Matte\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":3,\\\"cart_id\\\":39,\\\"color_id\\\":17,\\\"created_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"color\\\":{\\\"id\\\":17,\\\"image\\\":\\\"Metallic Velvet Fuschia.webp\\\",\\\"color_name\\\":\\\"Metallic Velvet Fuschia\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":4,\\\"cart_id\\\":39,\\\"color_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"color\\\":{\\\"id\\\":1,\\\"image\\\":\\\"matte-peach.avif\\\",\\\"color_name\\\":\\\"Matte Peach\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":5,\\\"cart_id\\\":39,\\\"color_id\\\":30,\\\"created_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"color\\\":{\\\"id\\\":30,\\\"image\\\":\\\"Grape with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Grape with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":6,\\\"cart_id\\\":39,\\\"color_id\\\":40,\\\"created_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"color\\\":{\\\"id\\\":40,\\\"image\\\":\\\"Dark Green with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Dark Green with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}}]}]}\"', '{\"address\":\"Pakistan Town Phase 2 Road, Block A Police Foundation, Islamabad, Pakistan\",\"country\":\"Pakistan\",\"country_iso\":\"PK\",\"state_province\":\"Punjab\",\"city\":\"Islamabad\",\"street\":\"Pakistan Town Phase 2 Road\",\"postcode\":\"\",\"latitude\":\"33.5654323\",\"longitude\":\"73.1391587\"}', '\"[{\\\"cart_id\\\":39,\\\"qty\\\":1,\\\"final_price\\\":\\\"29.95\\\",\\\"line_total\\\":29.95,\\\"bangle_box\\\":{\\\"id\\\":1,\\\"size\\\":\\\"6\\\",\\\"price\\\":\\\"29.95\\\",\\\"created_at\\\":\\\"2025-10-17T01:23:16.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:23:16.000000Z\\\"},\\\"bangle_size\\\":{\\\"id\\\":1,\\\"size\\\":\\\"2.4\\\",\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"},\\\"colors\\\":[{\\\"id\\\":1,\\\"cart_id\\\":39,\\\"color_id\\\":20,\\\"created_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"color\\\":{\\\"id\\\":20,\\\"image\\\":\\\"Dark Purple with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Dark Purple with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":2,\\\"cart_id\\\":39,\\\"color_id\\\":15,\\\"created_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"color\\\":{\\\"id\\\":15,\\\"image\\\":\\\"Coral Matte.avif\\\",\\\"color_name\\\":\\\"Coral Matte\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":3,\\\"cart_id\\\":39,\\\"color_id\\\":17,\\\"created_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"color\\\":{\\\"id\\\":17,\\\"image\\\":\\\"Metallic Velvet Fuschia.webp\\\",\\\"color_name\\\":\\\"Metallic Velvet Fuschia\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":4,\\\"cart_id\\\":39,\\\"color_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"color\\\":{\\\"id\\\":1,\\\"image\\\":\\\"matte-peach.avif\\\",\\\"color_name\\\":\\\"Matte Peach\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":5,\\\"cart_id\\\":39,\\\"color_id\\\":30,\\\"created_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"color\\\":{\\\"id\\\":30,\\\"image\\\":\\\"Grape with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Grape with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":6,\\\"cart_id\\\":39,\\\"color_id\\\":40,\\\"created_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:24:58.000000Z\\\",\\\"color\\\":{\\\"id\\\":40,\\\"image\\\":\\\"Dark Green with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Dark Green with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}}]}]\"', 36.45, 1.50, 5.00, 'pending', 'tayyebgondal5@gmail.com', 'paid', '\"{\\\"name\\\":\\\"Tayyeb\\\",\\\"last_name\\\":\\\"Gondal\\\",\\\"phone\\\":\\\"987654\\\",\\\"email\\\":\\\"tayyebgondal5@gmail.com\\\"}\"', '[]', '2025-10-17 01:26:19', '2025-10-17 01:26:19', 0),
(8, 'ORD-0008', '0', '0.00', 0, '59.95', 2, NULL, '\"{\\\"Products\\\":[{\\\"cart_id\\\":40,\\\"qty\\\":1,\\\"final_price\\\":\\\"59.95\\\",\\\"line_total\\\":59.95,\\\"product\\\":{\\\"id\\\":17,\\\"sku\\\":null,\\\"name\\\":\\\"Arora Pink Bangles\\\",\\\"description\\\":\\\"<p>Brighten up your look with the <strong>Arora Pink Bangles<\\\\\\/strong>, a refined pair adorned with delicate pink beading and floral detailing. Perfect for weddings, festive events, or adding a soft touch of elegance to everyday wear.<\\\\\\/p>\\\",\\\"meta_title\\\":null,\\\"meta_description\\\":null,\\\"images_details\\\":null,\\\"care\\\":\\\"Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.\\\",\\\"sustainability\\\":\\\"Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.\\\",\\\"shipping\\\":\\\"Orders are usually shipped within 1\\\\u20133 business days (Tue\\\\u2013Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.\\\",\\\"returns\\\":\\\"Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags\\\\\\/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.\\\",\\\"price\\\":null,\\\"member_price\\\":null,\\\"color_id\\\":null,\\\"size\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":null,\\\"unavailable_quantity\\\":null,\\\"images\\\":[\\\"1757796257-68c5d7a199cf3.jpg\\\",\\\"1757796257-68c5d7a19c9d4.jpg\\\",\\\"1757796257-68c5d7a19cfe6.jpg\\\",\\\"1757796257-68c5d7a19d544.jpg\\\",\\\"1757796257-68c5d7a19dbd2.jpg\\\",\\\"1757796257-68c5d7a19e1f5.jpg\\\",\\\"1757796257-68c5d7a19e652.jpg\\\",\\\"1757796257-68c5d7a19eb6c.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":0,\\\"slug\\\":\\\"arora-pink-bangles-68c5d814d7ca7\\\",\\\"category_id\\\":8,\\\"category_box_id\\\":null,\\\"created_at\\\":\\\"2025-09-13T20:44:17.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-13T20:46:12.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null,\\\"is_top_listed\\\":0,\\\"is_pre_order\\\":0,\\\"weight\\\":null},\\\"variation\\\":{\\\"id\\\":88,\\\"product_id\\\":17,\\\"color_id\\\":25,\\\"size\\\":\\\"2.4\\\",\\\"price\\\":\\\"59.95\\\",\\\"member_price\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":0,\\\"unavailable_quantity\\\":0,\\\"created_at\\\":\\\"2025-09-13T20:46:12.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-06T12:17:22.000000Z\\\",\\\"weight\\\":null}}],\\\"Bundle\\\":[],\\\"GiftCards\\\":[],\\\"BangleBox\\\":[]}\"', '{\"address\":\"Pakistan Town Phase 2 Road, Block A Police Foundation, Islamabad, Pakistan\",\"country\":\"Pakistan\",\"country_iso\":\"PK\",\"state_province\":\"Punjab\",\"city\":\"Islamabad\",\"street\":\"Pakistan Town Phase 2 Road\",\"postcode\":\"\",\"latitude\":\"33.5654323\",\"longitude\":\"73.1391587\"}', '\"[]\"', 67.95, 3.00, 5.00, 'pending', 'tayyebgondal5@gmail.com', 'paid', '\"{\\\"name\\\":\\\"Tayyeb\\\",\\\"last_name\\\":\\\"Gondal\\\",\\\"phone\\\":\\\"987654\\\",\\\"email\\\":\\\"tayyebgondal5@gmail.com\\\"}\"', '[]', '2025-10-17 01:33:03', '2025-10-17 01:33:03', 0);
INSERT INTO `orders` (`id`, `order_id`, `applied_points`, `rewards_discount`, `applied_shipping`, `sub_total`, `user_id`, `session_id`, `products_meta_data`, `delivery_meta_data`, `bangle_box_meta_data`, `total_amount`, `tax`, `shipping_fee`, `status`, `email`, `payment_status`, `user_meta_data`, `applied_gift_card_meta_data`, `created_at`, `updated_at`, `us_import_duties`) VALUES
(9, 'ORD-0009', '0', '0.00', 0, '59.95', 2, NULL, '\"{\\\"Products\\\":[{\\\"cart_id\\\":41,\\\"qty\\\":1,\\\"final_price\\\":\\\"59.95\\\",\\\"line_total\\\":59.95,\\\"product\\\":{\\\"id\\\":20,\\\"sku\\\":null,\\\"name\\\":\\\"Arora White Bangles\\\",\\\"description\\\":\\\"<p>Elevate your ensemble with the <strong>Arora White Bangles<\\\\\\/strong>, a graceful pair featuring elegant white stones and intricate detailing. These bangles deliver refined sparkle\\\\u2014ideal for weddings, festive events, or adding soft elegance to everyday wear.<\\\\\\/p>\\\",\\\"meta_title\\\":null,\\\"meta_description\\\":null,\\\"images_details\\\":null,\\\"care\\\":\\\"Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.\\\",\\\"sustainability\\\":\\\"Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.\\\",\\\"shipping\\\":\\\"Orders are usually shipped within 1\\\\u20133 business days (Tue\\\\u2013Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.\\\",\\\"returns\\\":\\\"Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags\\\\\\/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.\\\",\\\"price\\\":null,\\\"member_price\\\":null,\\\"color_id\\\":null,\\\"size\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":null,\\\"unavailable_quantity\\\":null,\\\"images\\\":[\\\"1757798988-68c5e24c09b60.jpg\\\",\\\"1757798988-68c5e24c0a315.jpg\\\",\\\"1757798988-68c5e24c0a98b.jpg\\\",\\\"1757798988-68c5e24c0afa4.jpg\\\",\\\"1757798988-68c5e24c0b58e.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"arora-white-bangles-68c9c5755016d\\\",\\\"category_id\\\":8,\\\"category_box_id\\\":null,\\\"created_at\\\":\\\"2025-09-13T21:29:48.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-16T20:15:49.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null,\\\"is_top_listed\\\":0,\\\"is_pre_order\\\":0,\\\"weight\\\":null},\\\"variation\\\":{\\\"id\\\":248,\\\"product_id\\\":20,\\\"color_id\\\":3,\\\"size\\\":\\\"2.4\\\",\\\"price\\\":\\\"59.95\\\",\\\"member_price\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":0,\\\"unavailable_quantity\\\":0,\\\"created_at\\\":\\\"2025-09-16T20:15:49.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-16T20:15:49.000000Z\\\",\\\"weight\\\":null}}],\\\"Bundle\\\":[],\\\"GiftCards\\\":[],\\\"BangleBox\\\":[]}\"', '{\"address\":\"Pakistan Chowk, Saddar New Chali, Karachi, Pakistan\",\"country\":\"Pakistan\",\"country_iso\":\"PK\",\"state_province\":\"Sindh\",\"city\":\"Karachi\",\"street\":\"Pakistan Chowk\",\"postcode\":\"\",\"latitude\":\"24.8543266\",\"longitude\":\"67.0124143\"}', '\"[]\"', 67.95, 3.00, 5.00, 'pending', 'tayyebgondal5@gmail.com', 'paid', '\"{\\\"name\\\":\\\"Tayyeb\\\",\\\"last_name\\\":\\\"Gondal\\\",\\\"phone\\\":\\\"987654\\\",\\\"email\\\":\\\"tayyebgondal5@gmail.com\\\"}\"', '[]', '2025-10-17 01:41:21', '2025-10-17 01:41:21', 0),
(10, 'ORD-0010', '0', '0.00', 0, '59.95', 2, NULL, '\"{\\\"Products\\\":[{\\\"cart_id\\\":42,\\\"qty\\\":1,\\\"final_price\\\":\\\"59.95\\\",\\\"line_total\\\":59.95,\\\"product\\\":{\\\"id\\\":20,\\\"sku\\\":null,\\\"name\\\":\\\"Arora White Bangles\\\",\\\"description\\\":\\\"<p>Elevate your ensemble with the <strong>Arora White Bangles<\\\\\\/strong>, a graceful pair featuring elegant white stones and intricate detailing. These bangles deliver refined sparkle\\\\u2014ideal for weddings, festive events, or adding soft elegance to everyday wear.<\\\\\\/p>\\\",\\\"meta_title\\\":null,\\\"meta_description\\\":null,\\\"images_details\\\":null,\\\"care\\\":\\\"Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.\\\",\\\"sustainability\\\":\\\"Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.\\\",\\\"shipping\\\":\\\"Orders are usually shipped within 1\\\\u20133 business days (Tue\\\\u2013Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.\\\",\\\"returns\\\":\\\"Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags\\\\\\/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.\\\",\\\"price\\\":null,\\\"member_price\\\":null,\\\"color_id\\\":null,\\\"size\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":null,\\\"unavailable_quantity\\\":null,\\\"images\\\":[\\\"1757798988-68c5e24c09b60.jpg\\\",\\\"1757798988-68c5e24c0a315.jpg\\\",\\\"1757798988-68c5e24c0a98b.jpg\\\",\\\"1757798988-68c5e24c0afa4.jpg\\\",\\\"1757798988-68c5e24c0b58e.jpg\\\"],\\\"attributes\\\":\\\"{\\\\\\\"materials\\\\\\\":[],\\\\\\\"styles\\\\\\\":[]}\\\",\\\"status\\\":1,\\\"is_featured\\\":1,\\\"slug\\\":\\\"arora-white-bangles-68c9c5755016d\\\",\\\"category_id\\\":8,\\\"category_box_id\\\":null,\\\"created_at\\\":\\\"2025-09-13T21:29:48.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-16T20:15:49.000000Z\\\",\\\"deleted_at\\\":null,\\\"colors\\\":null,\\\"is_top_listed\\\":0,\\\"is_pre_order\\\":0,\\\"weight\\\":null},\\\"variation\\\":{\\\"id\\\":248,\\\"product_id\\\":20,\\\"color_id\\\":3,\\\"size\\\":\\\"2.4\\\",\\\"price\\\":\\\"59.95\\\",\\\"member_price\\\":null,\\\"compare_price\\\":null,\\\"quantity\\\":0,\\\"unavailable_quantity\\\":0,\\\"created_at\\\":\\\"2025-09-16T20:15:49.000000Z\\\",\\\"updated_at\\\":\\\"2025-09-16T20:15:49.000000Z\\\",\\\"weight\\\":null}}],\\\"Bundle\\\":[],\\\"GiftCards\\\":[],\\\"BangleBox\\\":[]}\"', '{\"address\":\"181 Bay St., Toronto, ON M5J 2S8, Canada\",\"street\":null,\"formatted_address\":\"181 Bay St., Toronto, ON M5J 2S8, Canada\",\"city\":\"Toronto\",\"state_province\":\"Ontario\",\"province_code\":\"ON\",\"country\":\"Canada\",\"country_iso\":\"CA\",\"postal_code\":\"M5J 2S8\",\"latitude\":\"43.6469877\",\"longitude\":\"-79.3791303\",\"place_id\":null,\"area\":null,\"sub_area\":null,\"updated_at\":\"2025-12-04 18:38:55\"}', '\"[]\"', 67.95, 3.00, 5.00, 'pending', 'tayyebgondal5@gmail.com', 'paid', '\"{\\\"name\\\":\\\"Tayyeb\\\",\\\"last_name\\\":\\\"Gondal\\\",\\\"phone\\\":\\\"987654\\\",\\\"email\\\":\\\"tayyebgondal5@gmail.com\\\"}\"', '[]', '2025-10-17 01:45:33', '2025-12-04 18:38:55', 0),
(11, 'ORD-0011', '1496', '14.96', 0, '69.90', 1, NULL, '\"{\\\"Products\\\":[],\\\"Bundle\\\":[],\\\"GiftCards\\\":[],\\\"BangleBox\\\":[{\\\"cart_id\\\":45,\\\"qty\\\":1,\\\"final_price\\\":\\\"29.95\\\",\\\"line_total\\\":29.95,\\\"bangle_box\\\":{\\\"id\\\":1,\\\"size\\\":\\\"6\\\",\\\"price\\\":\\\"29.95\\\",\\\"created_at\\\":\\\"2025-10-17T01:23:16.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:23:16.000000Z\\\"},\\\"bangle_size\\\":{\\\"id\\\":1,\\\"size\\\":\\\"2.4\\\",\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"},\\\"colors\\\":[{\\\"id\\\":7,\\\"cart_id\\\":45,\\\"color_id\\\":4,\\\"created_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"color\\\":{\\\"id\\\":4,\\\"image\\\":\\\"Peach Pink with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Peach Pink with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":8,\\\"cart_id\\\":45,\\\"color_id\\\":5,\\\"created_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"color\\\":{\\\"id\\\":5,\\\"image\\\":\\\"Peach with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Peach with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":9,\\\"cart_id\\\":45,\\\"color_id\\\":6,\\\"created_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"color\\\":{\\\"id\\\":6,\\\"image\\\":\\\"Matte Light Pink.avif\\\",\\\"color_name\\\":\\\"Matte Light Pink\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":10,\\\"cart_id\\\":45,\\\"color_id\\\":7,\\\"created_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"color\\\":{\\\"id\\\":7,\\\"image\\\":\\\"Light Pink with Silver Glitter.webp\\\",\\\"color_name\\\":\\\"Light Pink with Silver Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":11,\\\"cart_id\\\":45,\\\"color_id\\\":8,\\\"created_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"color\\\":{\\\"id\\\":8,\\\"image\\\":\\\"Pink with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Pink with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":12,\\\"cart_id\\\":45,\\\"color_id\\\":9,\\\"created_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"color\\\":{\\\"id\\\":9,\\\"image\\\":\\\"Matte Pink.avif\\\",\\\"color_name\\\":\\\"Matte Pink\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}}]},{\\\"cart_id\\\":46,\\\"qty\\\":1,\\\"final_price\\\":\\\"39.95\\\",\\\"line_total\\\":39.95,\\\"bangle_box\\\":{\\\"id\\\":2,\\\"size\\\":\\\"9\\\",\\\"price\\\":\\\"39.95\\\",\\\"created_at\\\":\\\"2025-10-17T01:24:27.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:24:27.000000Z\\\"},\\\"bangle_size\\\":{\\\"id\\\":1,\\\"size\\\":\\\"2.4\\\",\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"},\\\"colors\\\":[{\\\"id\\\":13,\\\"cart_id\\\":46,\\\"color_id\\\":4,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":4,\\\"image\\\":\\\"Peach Pink with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Peach Pink with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":14,\\\"cart_id\\\":46,\\\"color_id\\\":5,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":5,\\\"image\\\":\\\"Peach with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Peach with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":15,\\\"cart_id\\\":46,\\\"color_id\\\":3,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":3,\\\"image\\\":\\\"Peach with Glitter.avif\\\",\\\"color_name\\\":\\\"Peach with Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":16,\\\"cart_id\\\":46,\\\"color_id\\\":2,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":2,\\\"image\\\":\\\"matte-dark-peach.avif\\\",\\\"color_name\\\":\\\"Matte Dark Peach\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":17,\\\"cart_id\\\":46,\\\"color_id\\\":1,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":1,\\\"image\\\":\\\"matte-peach.avif\\\",\\\"color_name\\\":\\\"Matte Peach\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":18,\\\"cart_id\\\":46,\\\"color_id\\\":7,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":7,\\\"image\\\":\\\"Light Pink with Silver Glitter.webp\\\",\\\"color_name\\\":\\\"Light Pink with Silver Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":19,\\\"cart_id\\\":46,\\\"color_id\\\":40,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":40,\\\"image\\\":\\\"Dark Green with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Dark Green with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":20,\\\"cart_id\\\":46,\\\"color_id\\\":39,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":39,\\\"image\\\":\\\"Teal with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Teal with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":21,\\\"cart_id\\\":46,\\\"color_id\\\":34,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":34,\\\"image\\\":\\\"Blue with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Blue with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}}]}]}\"', '{\"address\":\"181 Bedford Road, Toronto, ON, Canada\",\"formatted_address\":\"\",\"street\":\"181 Bedford Road\",\"area\":\"\",\"sub_area\":\"\",\"city\":\"Toronto\",\"state_province\":\"Ontario\",\"province_code\":\"ON\",\"country\":\"Canada\",\"country_iso\":\"CA\",\"postcode\":\"M5R 0C2\",\"latitude\":\"43.6748081\",\"longitude\":\"-79.3996562\",\"place_id\":\"\"}', '\"[{\\\"cart_id\\\":45,\\\"qty\\\":1,\\\"final_price\\\":\\\"29.95\\\",\\\"line_total\\\":29.95,\\\"bangle_box\\\":{\\\"id\\\":1,\\\"size\\\":\\\"6\\\",\\\"price\\\":\\\"29.95\\\",\\\"created_at\\\":\\\"2025-10-17T01:23:16.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:23:16.000000Z\\\"},\\\"bangle_size\\\":{\\\"id\\\":1,\\\"size\\\":\\\"2.4\\\",\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"},\\\"colors\\\":[{\\\"id\\\":7,\\\"cart_id\\\":45,\\\"color_id\\\":4,\\\"created_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"color\\\":{\\\"id\\\":4,\\\"image\\\":\\\"Peach Pink with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Peach Pink with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":8,\\\"cart_id\\\":45,\\\"color_id\\\":5,\\\"created_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"color\\\":{\\\"id\\\":5,\\\"image\\\":\\\"Peach with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Peach with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":9,\\\"cart_id\\\":45,\\\"color_id\\\":6,\\\"created_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"color\\\":{\\\"id\\\":6,\\\"image\\\":\\\"Matte Light Pink.avif\\\",\\\"color_name\\\":\\\"Matte Light Pink\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":10,\\\"cart_id\\\":45,\\\"color_id\\\":7,\\\"created_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"color\\\":{\\\"id\\\":7,\\\"image\\\":\\\"Light Pink with Silver Glitter.webp\\\",\\\"color_name\\\":\\\"Light Pink with Silver Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":11,\\\"cart_id\\\":45,\\\"color_id\\\":8,\\\"created_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"color\\\":{\\\"id\\\":8,\\\"image\\\":\\\"Pink with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Pink with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":12,\\\"cart_id\\\":45,\\\"color_id\\\":9,\\\"created_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-03T18:00:10.000000Z\\\",\\\"color\\\":{\\\"id\\\":9,\\\"image\\\":\\\"Matte Pink.avif\\\",\\\"color_name\\\":\\\"Matte Pink\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}}]},{\\\"cart_id\\\":46,\\\"qty\\\":1,\\\"final_price\\\":\\\"39.95\\\",\\\"line_total\\\":39.95,\\\"bangle_box\\\":{\\\"id\\\":2,\\\"size\\\":\\\"9\\\",\\\"price\\\":\\\"39.95\\\",\\\"created_at\\\":\\\"2025-10-17T01:24:27.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:24:27.000000Z\\\"},\\\"bangle_size\\\":{\\\"id\\\":1,\\\"size\\\":\\\"2.4\\\",\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"},\\\"colors\\\":[{\\\"id\\\":13,\\\"cart_id\\\":46,\\\"color_id\\\":4,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":4,\\\"image\\\":\\\"Peach Pink with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Peach Pink with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":14,\\\"cart_id\\\":46,\\\"color_id\\\":5,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":5,\\\"image\\\":\\\"Peach with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Peach with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":15,\\\"cart_id\\\":46,\\\"color_id\\\":3,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":3,\\\"image\\\":\\\"Peach with Glitter.avif\\\",\\\"color_name\\\":\\\"Peach with Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":16,\\\"cart_id\\\":46,\\\"color_id\\\":2,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":2,\\\"image\\\":\\\"matte-dark-peach.avif\\\",\\\"color_name\\\":\\\"Matte Dark Peach\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":17,\\\"cart_id\\\":46,\\\"color_id\\\":1,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":1,\\\"image\\\":\\\"matte-peach.avif\\\",\\\"color_name\\\":\\\"Matte Peach\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":18,\\\"cart_id\\\":46,\\\"color_id\\\":7,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":7,\\\"image\\\":\\\"Light Pink with Silver Glitter.webp\\\",\\\"color_name\\\":\\\"Light Pink with Silver Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":19,\\\"cart_id\\\":46,\\\"color_id\\\":40,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":40,\\\"image\\\":\\\"Dark Green with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Dark Green with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":20,\\\"cart_id\\\":46,\\\"color_id\\\":39,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":39,\\\"image\\\":\\\"Teal with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Teal with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}},{\\\"id\\\":21,\\\"cart_id\\\":46,\\\"color_id\\\":34,\\\"created_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"updated_at\\\":\\\"2025-12-04T18:12:55.000000Z\\\",\\\"color\\\":{\\\"id\\\":34,\\\"image\\\":\\\"Blue with Gold Glitter.avif\\\",\\\"color_name\\\":\\\"Blue with Gold Glitter\\\",\\\"bangle_box_size_id\\\":1,\\\"created_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\",\\\"updated_at\\\":\\\"2025-10-17T01:19:56.000000Z\\\"}}]}]\"', 63.44, 3.50, 5.00, 'pending', 'bangles@admin.com', 'paid', '\"{\\\"name\\\":\\\"Admin\\\",\\\"last_name\\\":\\\"Akingbola Mujidat\\\",\\\"phone\\\":\\\"5879219016\\\",\\\"email\\\":\\\"bangles@admin.com\\\"}\"', '[]', '2025-12-04 21:27:06', '2025-12-04 21:27:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `page_settings`
--

CREATE TABLE `page_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `heading` varchar(255) NOT NULL,
  `sub_heading` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `page_name` varchar(255) NOT NULL,
  `page_type` varchar(255) DEFAULT NULL,
  `meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta_data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_settings`
--

INSERT INTO `page_settings` (`id`, `image`, `images`, `heading`, `sub_heading`, `description`, `page_name`, `page_type`, `meta_data`, `created_at`, `updated_at`) VALUES
(4, '1764785039_dW27t.jpg', '[{\"src\":\"1764785039_dW27t.jpg\",\"transform\":\"translate(0px, 0px) scale(1.1178509521484383)\"},{\"src\":\"1764785274_U6Ecd.jpg\",\"transform\":\"translate(0px, 0px) scale(1.286708984375)\"}]', 'Create Bangle box for all Styles', '', 'Explore our diverse selection of bangles designed for every occasion.', 'home', 'home', '{\"sections\":{\"hero\":{\"heading\":\"Create Bangle box for all Styles\",\"description\":\"Explore our diverse selection of bangles designed for every occasion.\",\"button_label\":\"Start building your bangle box\",\"size_label\":\"Select Your Size\",\"style_label\":\"Select Your Style\",\"images\":[{\"src\":\"1764785039_dW27t.jpg\",\"transform\":\"translate(0px, 0px) scale(1.1178509521484383)\"},{\"src\":\"1764785274_U6Ecd.jpg\",\"transform\":\"translate(0px, 0px) scale(1.286708984375)\"}]}}}', '2025-11-29 14:35:24', '2025-12-03 18:07:54');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `payer_id` varchar(255) NOT NULL,
  `payer_email` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
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
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `compare_price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `unavailable_quantity` int(11) DEFAULT 0,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `attributes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attributes`)),
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_box_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `colors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`colors`)),
  `is_top_listed` tinyint(1) DEFAULT 0,
  `is_pre_order` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(255) DEFAULT NULL,
  `weight_unit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `description`, `meta_title`, `meta_description`, `images_details`, `care`, `sustainability`, `shipping`, `returns`, `price`, `member_price`, `color_id`, `size`, `compare_price`, `quantity`, `unavailable_quantity`, `images`, `attributes`, `status`, `is_featured`, `slug`, `category_id`, `category_box_id`, `created_at`, `updated_at`, `deleted_at`, `colors`, `is_top_listed`, `is_pre_order`, `weight`, `weight_unit`) VALUES
(1, NULL, 'Gregory Hobbs', '<p>desc</p>', NULL, NULL, NULL, 'here will care', 'here will sustainability', 'shipping', 'returns', 20.00, 10.00, NULL, NULL, 12.00, 15, 3, '[\"1757276401-68bde8f1864a8.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'gregory-hobbs-68c5b6ba5030e', 2, NULL, '2025-09-07 20:20:01', '2025-09-13 18:23:54', NULL, NULL, 0, 0, NULL, NULL),
(2, '01', 'Adria Kundan Bangles', '<p>Elevate your bridal look with the Adria Kundan Bangles, a classic set designed for elegance and cultural heritage. Crafted with traditional Indian kundan work, these gold-tone bangles shimmer with mirror-like stones that catch every light—perfect for weddings, mehndi, and festive celebrations.</p><p>Each bangle in the Adria set features detailed settings and rich gold plating over a durable base, giving you that luxurious look without the premium gold price. They fit comfortably whether you’re stacking multiple or wearing a single bold statement piece. Match them with a bridal necklace set, a bridal tikka, or earrings for a complete wedding jewelry set.</p><p>Whether you\'re looking for kundan necklace pairing or just a stunning bangles set, these are designed for brides &amp; bridesmaids alike.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'At Banglez, we believe jewelry should be as thoughtful as it is beautiful. Our sustainability approach focuses on responsible sourcing, careful material selection, and mindful production practices. We use long-lasting, high-quality plating and traditional techniques that reduce waste, while partnering with suppliers who share our commitment to ethical standards. Each piece is designed to be timeless, encouraging customers to buy fewer, better accessories rather than fast-fashion alternatives. We also emphasize reusable and minimal packaging to limit environmental impact. By combining cultural artistry with conscious practices, we aim to create jewelry that not only celebrates tradition but also respects the future of our planet.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available on international orders over $200 CAD, while members qualify for free shipping on orders over $80 CAD. Free shipping can also be applied when rewards from bundles are redeemed. Worldwide shipping is offered, with delivery times varying by location, and local curbside pickup is available in Oakville, ON. Tracking details are provided by email once your order ships.', 'Returns from online orders are accepted within 15 days of ship date for customers in North America, and 30 days for international customers. Items must be unused, in original packaging, with barcodes/tags intact. A 10% restocking fee applies to approved returns.\r\nClearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757786349-68c5b0ed5e3ae.jpg\",\"1757786349-68c5b0ed5f5a5.jpg\",\"1757786349-68c5b0ed5fcc7.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'adria-kundan-bangles-68c84809a4f64', 11, NULL, '2025-09-13 17:59:09', '2025-09-15 17:08:25', NULL, NULL, 0, 0, NULL, NULL),
(3, NULL, 'Akasha Bangles', '<p>Elevate your accessory collection with the <strong>Akasha Bangles</strong>, a timeless pair that blends traditional craftsmanship with modern elegance. Each bangle is finished in a radiant gold tone and detailed with stones that add just the right amount of sparkle to your look.</p><p>The Akasha Bangles are designed as a versatile statement piece — perfect for weddings, festive occasions like Eid or Diwali, or simply adding sophistication to everyday wear. Their neutral style makes them easy to pair with bridal jewelry sets, kundan necklaces, or tikka sets.</p><p>Wear them stacked for a bold statement or on their own for refined elegance. With fine detailing and durable plating, these bangles deliver lasting quality and timeless appeal, making them an ideal choice for brides, bridesmaids, or as a meaningful gift.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757787320-68c5b4b865fe5.jpg\",\"1757787320-68c5b4b86658b.jpg\",\"1757787320-68c5b4b866ea3.jpg\",\"1757787320-68c5b4b8674a9.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'akasha-bangles-68c84828947fb', 11, NULL, '2025-09-13 18:15:20', '2025-09-15 17:08:56', NULL, NULL, 0, 0, NULL, NULL),
(4, NULL, 'Testing Error', NULL, NULL, NULL, NULL, 'Magna corporis volup', 'Ea do possimus proi', 'Praesentium consecte', 'Cupiditate do labore', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757788168-68c5b8085bcfe.jpg\",\"1757788168-68c5b8085c949.jpg\",\"1757788671-68c5b9ff7a646.webp\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'testing-error-68c5bb293fd51', 7, NULL, '2025-09-13 18:29:28', '2025-09-13 18:47:23', '2025-09-13 18:47:23', NULL, 0, 0, NULL, NULL),
(5, NULL, 'Ally Glass Bangles', '<p>Brighten your look with the <strong>Ally Glass Bangles</strong>, designed in glass with clear and champagne stones that catch the light beautifully. These bangles offer refined elegance and a neutral tone that makes them easy to pair with both traditional outfits and modern styles.</p><p>Perfect for weddings, festive celebrations like Eid or Diwali, or simply elevating your everyday look, the Ally Glass Bangles bring just the right amount of sparkle. They can be layered with other jewelry or worn alone as a subtle yet striking accessory.</p><p>Crafted with attention to detail, these bangles balance delicate appearance with durability, making them an ideal choice for brides, bridesmaids, or as a thoughtful gift.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757788550-68c5b9866538c.jpg\",\"1757788550-68c5b986658ba.jpg\",\"1757788550-68c5b986660d0.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'ally-glass-bangles-68c84837396d2', 11, NULL, '2025-09-13 18:35:50', '2025-09-15 17:09:11', NULL, NULL, 0, 0, NULL, NULL),
(6, NULL, 'Testing product', '<p><i><strong>HERE WILL BE THE DESCRIPTION&nbsp;</strong></i></p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757789472-68c5bd20cf22c.webp\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'testing-product-68c5bd9416a2b', 2, NULL, '2025-09-13 18:51:12', '2025-09-13 19:10:40', '2025-09-13 19:10:40', NULL, 0, 0, NULL, NULL),
(7, NULL, 'Testing product without variations', '<p>Here will be description</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', 100.00, 60.00, NULL, NULL, 90.00, 100, 20, '[\"1757789689-68c5bdf91e721.webp\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'testing-product-without-variations-68c5bdf91e90e', 4, NULL, '2025-09-13 18:54:49', '2025-09-13 19:10:34', '2025-09-13 19:10:34', NULL, 0, 0, NULL, NULL),
(8, NULL, 'Aman Bangles', '<p>Shine bright with the <strong>Aman Bangles</strong>, crafted in 22k gold plating with a chic teardrop design accentuated by champagne-tone stones. Sold as a pair, they bring elegance and sparkle to weddings, festive events, or your everyday look.</p><p>Designed with timeless detailing and enduring finish, these pieces offer a touch of luxury—perfect for layering or wearing solo as statement accessories or thoughtful gifts.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757789867-68c5beab03189.jpg\",\"1757789867-68c5beab0387b.jpg\",\"1757789867-68c5beab03de2.jpg\",\"1757789867-68c5beab043af.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'aman-bangles-68c84846943bb', 11, NULL, '2025-09-13 18:57:47', '2025-09-15 17:09:26', NULL, NULL, 0, 0, NULL, NULL),
(9, NULL, 'Anastasia Bangles', '<p>Brighten your look with the <strong>Anastasia Bangles</strong>, finished in 22k gold plating and accented with stones for a refined sparkle. Sold as a pair, they serve as perfect statement pieces for weddings, Eid, or festive occasions.</p><p>Crafted for elegance and durability, the Anastasia Bangles offer a timeless design that complements both bridal and contemporary styles. Whether stacked or worn solo, they make a gorgeous gift or standout accessory.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757790608-68c5c19015bf0.jpg\",\"1757790608-68c5c19016124.jpg\",\"1757790608-68c5c19016555.jpg\",\"1757790608-68c5c19016910.jpg\",\"1757790608-68c5c19016e18.jpg\",\"1757790608-68c5c190173e5.jpg\",\"1757790608-68c5c1901788c.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'anastasia-bangles-68cae04f031dd', 11, NULL, '2025-09-13 19:10:08', '2025-09-17 16:22:39', NULL, NULL, 1, 0, NULL, NULL),
(10, NULL, 'Testing SKU Optional', '<p>Here is the hygsdjah</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', 12.00, 12.00, NULL, NULL, 12.00, 90, 12, '[\"1757791096-68c5c37843e83.webp\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'testing-sku-optional-68c5c38f1dd93', 2, NULL, '2025-09-13 19:18:16', '2025-09-13 19:18:51', '2025-09-13 19:18:51', NULL, 0, 0, NULL, NULL),
(11, NULL, 'Testing product without variations', '<p>Here will be description</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757789689-68c5bdf91e721.webp\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'testing-product-without-variations-68c5c8b2465a1', 4, NULL, '2025-09-13 19:19:01', '2025-09-13 19:44:59', '2025-09-13 19:44:59', NULL, 0, 0, NULL, NULL),
(12, NULL, 'Ariana Glass Bangles', '<p>Add a touch of soft glamour with the <strong>Ariana Glass Bangles</strong>, featuring a rose and gold design accented by stones. These glass bangles deliver a delicate sparkle—perfect for festivals, wedding guest looks, or elevating everyday style.</p>', NULL, NULL, '[{\"name\":\"1757792656-68c5c990e2bc9.jpg\",\"alt\":\"\"},{\"name\":\"1757792656-68c5c990e30c6.jpg\",\"alt\":\"\"},{\"name\":\"1757792656-68c5c990e35ef.jpg\",\"alt\":\"\"},{\"name\":\"1757792656-68c5c990e3bf7.jpg\",\"alt\":\"\"},{\"name\":\"1757792656-68c5c990e4291.jpg\",\"alt\":\"\"},{\"name\":\"1757792656-68c5c990e4a5b.jpg\",\"alt\":\"\"}]', 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', 9.95, NULL, 15, NULL, NULL, 0, 0, '[\"1757792656-68c5c990e2bc9.jpg\",\"1757792656-68c5c990e30c6.jpg\",\"1757792656-68c5c990e35ef.jpg\",\"1757792656-68c5c990e3bf7.jpg\",\"1757792656-68c5c990e4291.jpg\",\"1757792656-68c5c990e4a5b.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'ariana-glass-bangles-68c5cb8382d9f', 8, NULL, '2025-09-13 19:44:16', '2025-10-02 15:41:24', NULL, NULL, 0, 0, NULL, NULL),
(13, NULL, 'Testing Product', '<p>Here will be description</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757793277-68c5cbfd601e4.webp\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'testing-product-68c5cdf2bce0c', 4, NULL, '2025-09-13 19:54:37', '2025-09-13 20:06:10', '2025-09-13 20:06:10', NULL, 0, 0, NULL, NULL),
(14, NULL, 'Arora Champagne Bangles', '<p>These floral-inspired bangles are traced with soft champagne stones and detailed stonework that add a delicate sparkle to any look. Designed as a refined pair, the <strong>Arora Champagne Bangles</strong> offer elegance for weddings, festive celebrations, or styled everyday wear.</p><p>Crafted with quality plating and intricate design, they’re perfect as a statement accessory or gift that blends tradition with contemporary style.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757793875-68c5ce535496d.jpg\",\"1757793875-68c5ce5354f46.jpg\",\"1757793875-68c5ce5355595.jpg\",\"1757793875-68c5ce5355ae0.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'arora-champagne-bangles-68c848ea10520', 11, NULL, '2025-09-13 20:04:35', '2025-09-15 17:12:10', NULL, NULL, 0, 0, NULL, NULL),
(15, NULL, 'Arora Mint Bangles', '<p>The <strong>Arora Mint Bangles</strong> are a refined pair with soft mint tones and delicate stonework, perfect for adding subtle sparkle to weddings, festive events, or everyday looks.</p><p>Crafted with elegance and care, these bangles blend classic design with versatility—wear them solo or style with your favorite sets for timeless flair.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757794672-68c5d170b2192.jpg\",\"1757794672-68c5d170b27d2.jpg\",\"1757794672-68c5d170b2cdd.jpg\",\"1757794672-68c5d170b320b.jpg\",\"1757794672-68c5d170b36fa.jpg\",\"1757794672-68c5d170b3c27.jpg\",\"1757794672-68c5d170b40ef.jpg\",\"1757794672-68c5d170b4592.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'arora-mint-bangles-68c848d6cead7', 11, NULL, '2025-09-13 20:17:52', '2025-09-15 17:11:50', NULL, NULL, 0, 0, NULL, NULL),
(16, NULL, 'Arora Blush Bangles', '<p>Add delicate elegance to your look with the <strong>Arora Blush Bangles</strong>, a refined pair adorned with subtle blush stones and detailed stonework. These bangles offer soft sparkle and timeless beauty—ideal for weddings, festive occasions, or adorning your everyday style.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757795558-68c5d4e602346.jpg\",\"1757795558-68c5d4e60295b.jpg\",\"1757795558-68c5d4e602e91.jpg\",\"1757795558-68c5d4e603233.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'arora-blush-bangles-68c848b097482', 11, NULL, '2025-09-13 20:32:38', '2025-09-15 17:11:12', NULL, NULL, 0, 0, NULL, NULL),
(17, NULL, 'Arora Pink Bangles', '<p>Brighten up your look with the <strong>Arora Pink Bangles</strong>, a refined pair adorned with delicate pink beading and floral detailing. Perfect for weddings, festive events, or adding a soft touch of elegance to everyday wear.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757796257-68c5d7a199cf3.jpg\",\"1757796257-68c5d7a19c9d4.jpg\",\"1757796257-68c5d7a19cfe6.jpg\",\"1757796257-68c5d7a19d544.jpg\",\"1757796257-68c5d7a19dbd2.jpg\",\"1757796257-68c5d7a19e1f5.jpg\",\"1757796257-68c5d7a19e652.jpg\",\"1757796257-68c5d7a19eb6c.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'arora-pink-bangles-68c5d814d7ca7', 8, NULL, '2025-09-13 20:44:17', '2025-09-13 20:46:12', NULL, NULL, 0, 0, NULL, NULL),
(18, NULL, 'Arora Rose Bangles', '<p>Elevate your style with the <strong>Arora Rose Bangles</strong>, a refined pair accented with rose tones and delicate stonework. Perfect for weddings, festive occasions, or adding a hint of softness and glamour to your daily outfits.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757797666-68c5dd22a61be.jpg\",\"1757797666-68c5dd22a6889.jpg\",\"1757797666-68c5dd22a6f56.jpg\",\"1757797666-68c5dd22a73ef.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'arora-rose-bangles-68c5dd22a7886', 8, NULL, '2025-09-13 21:07:46', '2025-09-13 21:07:46', NULL, NULL, 0, 0, NULL, NULL),
(19, NULL, 'Arora Sage Bangles', '<p>Bring subtle elegance to your look with the <strong>Arora Sage Bangles</strong>, a refined pair accentuated with sage-green stones and intricate detailing. These bangles offer soft sparkle ideal for festive celebrations, weddings, or elevated everyday styling.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757798364-68c5dfdc77402.jpg\",\"1757798364-68c5dfdc77b3b.jpg\",\"1757798364-68c5dfdc780fd.jpg\",\"1757798364-68c5dfdc7863c.jpg\",\"1757798364-68c5dfdc78be2.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'arora-sage-bangles-68c8488360792', 11, NULL, '2025-09-13 21:19:24', '2025-09-15 17:10:27', NULL, NULL, 0, 0, NULL, NULL),
(20, NULL, 'Arora White Bangles', '<p>Elevate your ensemble with the <strong>Arora White Bangles</strong>, a graceful pair featuring elegant white stones and intricate detailing. These bangles deliver refined sparkle—ideal for weddings, festive events, or adding soft elegance to everyday wear.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757798988-68c5e24c09b60.jpg\",\"1757798988-68c5e24c0a315.jpg\",\"1757798988-68c5e24c0a98b.jpg\",\"1757798988-68c5e24c0afa4.jpg\",\"1757798988-68c5e24c0b58e.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'arora-white-bangles-68c9c5755016d', 8, NULL, '2025-09-13 21:29:48', '2025-09-16 20:15:49', NULL, NULL, 0, 0, NULL, NULL),
(21, NULL, 'Ashley Glass Bangles', '<p>The <strong>Ashley Glass Bangles</strong> are a shimmering six-piece set of glass bangles accented with clear stones, perfect for adding subtle sparkle to weddings, festive events, or everyday outfits.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757799422-68c5e3fe28ac7.jpg\",\"1757799422-68c5e3fe29489.jpg\",\"1757799422-68c5e3fe29d90.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'ashley-glass-bangles-68c5e3fe2a3f1', 8, NULL, '2025-09-13 21:37:02', '2025-09-13 21:37:02', NULL, NULL, 0, 0, NULL, NULL),
(22, NULL, 'Allison Bangles', '<p>The <strong>Allison Bangles</strong> are a refined pair combining elegant beads with soft champagne stones. Perfect for adding sparkle to weddings, festive events, or enhancing everyday style with sophistication.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757800037-68c5e665a4e0e.png\",\"1757800037-68c5e665a5228.png\",\"1757800037-68c5e665a54f2.jpg\",\"1757800037-68c5e665a5b20.jpg\",\"1757800037-68c5e665a6043.jpg\",\"1757800037-68c5e665a683c.jpg\",\"1757800037-68c5e665a6e04.jpg\",\"1757800037-68c5e665a758c.jpg\",\"1757800037-68c5e665a7b77.jpg\",\"1757800037-68c5e665a820e.jpg\",\"1757800037-68c5e665a867c.jpg\",\"1757800037-68c5e665a8d39.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'allison-bangles-68c5e665a923c', 8, NULL, '2025-09-13 21:47:17', '2025-09-13 21:47:17', NULL, NULL, 0, 0, NULL, NULL),
(23, NULL, 'Avi Bangles', '<p>Radiate elegance with the <strong>Avi Bangles</strong>, a refined pair adorned with clear stones, oval accents, and delicate pearls—all finished in 22k gold plating. These bangles offer a blend of heritage charm and sparkling elegance, perfect for weddings, festive events, or adding a touch of luxe to your everyday style.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757800477-68c5e81dc4989.jpg\",\"1757800477-68c5e81dc518a.jpg\",\"1757800477-68c5e81dc597e.jpg\",\"1757800477-68c5e81dc60ab.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'avi-bangles-68c5e81dc6527', 8, NULL, '2025-09-13 21:54:37', '2025-09-13 21:54:37', NULL, NULL, 0, 0, NULL, NULL),
(24, NULL, 'Baljit Bangles', '<p>Add a refined touch to your look with the <strong>Baljit Bangles</strong>, a tasteful pair adorned with tiny pearls and champagne-tone accents. Crafted with 22k gold plating, these bangles bring soft sparkle and elegance—ideal for weddings, festive events, or elevating everyday style.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757801087-68c5ea7fe73d8.jpg\",\"1757801087-68c5ea7fe7ac4.jpg\",\"1757801087-68c5ea7fe81be.jpg\",\"1757801087-68c5ea7fe898a.jpg\",\"1757801087-68c5ea7fe8ffd.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'baljit-bangles-68c5ea7fe9872', 8, NULL, '2025-09-13 22:04:47', '2025-09-13 22:04:47', NULL, NULL, 0, 0, NULL, NULL),
(25, NULL, 'Belinda Bangles', '<p>The <strong>Belinda Bangles</strong> are refined antique-gold bangles accented with clear stones, offering timeless sparkle. Sold individually, they add a touch of elegance to bridal looks, festive events, or everyday style.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757801609-68c5ec89e4eb9.jpg\",\"1757801609-68c5ec89e5607.png\",\"1757801609-68c5ec89e5a03.jpg\",\"1757801609-68c5ec89e610d.jpg\",\"1757801609-68c5ec89e6877.jpg\",\"1757801609-68c5ec89e70e0.jpg\",\"1757801609-68c5ec89e7849.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'belinda-bangles-68c5ec89e7ff1', 8, NULL, '2025-09-13 22:13:29', '2025-09-13 22:13:29', NULL, NULL, 0, 0, NULL, NULL),
(26, NULL, 'Bella Bangles', '<p>levate your style with <strong>Bella Bangles</strong>, a refined pair plated in 22k gold and accented with clear stones for timeless elegance. Perfect for weddings, festivals, or dressing up everyday looks.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757802145-68c5eea1b1d50.jpg\",\"1757802145-68c5eea1b2242.jpg\",\"1757802145-68c5eea1b26d5.jpg\",\"1757802145-68c5eea1b2cc1.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'bella-bangles-68c70366748ed', 8, NULL, '2025-09-13 22:22:25', '2025-09-14 18:03:18', NULL, NULL, 0, 0, NULL, NULL),
(27, NULL, 'Bubblegum Pink Choora', '<p>Show up with a pop of color in the <strong>Bubblegum Pink Choora</strong>, a vibrant bridal statement designed in plastic with sparkle accents. These bold pieces bring playful elegance to weddings, special occasions, or when you want to stand out.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757802834-68c5f1525927c.jpg\",\"1757802834-68c5f152599ac.jpg\",\"1757802834-68c5f15259f96.jpg\",\"1757802834-68c5f1525aa7e.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'bubblegum-pink-choora-68c703157440f', 12, NULL, '2025-09-13 22:33:54', '2025-09-14 18:01:57', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` (`id`, `sku`, `name`, `description`, `meta_title`, `meta_description`, `images_details`, `care`, `sustainability`, `shipping`, `returns`, `price`, `member_price`, `color_id`, `size`, `compare_price`, `quantity`, `unavailable_quantity`, `images`, `attributes`, `status`, `is_featured`, `slug`, `category_id`, `category_box_id`, `created_at`, `updated_at`, `deleted_at`, `colors`, `is_top_listed`, `is_pre_order`, `weight`, `weight_unit`) VALUES
(28, NULL, 'Candice Glass Bangles', '<p>Add elegance to your look with the <strong>Candice Glass Bangles</strong> — a delicate six-piece set featuring rose and soft gold tones that bring sparkle without overt shine. Perfect for weddings, festive celebrations, or styled everyday moments.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757953570-68c83e223254c.png\",\"1757953570-68c83e22329f4.jpg\",\"1757953570-68c83e223329e.jpg\",\"1757953570-68c83e2233968.jpg\",\"1757953570-68c83e223438a.jpg\",\"1757953570-68c83e2234ec2.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'candice-glass-bangles-68c83e22354f3', 8, NULL, '2025-09-15 16:26:10', '2025-09-15 16:26:10', NULL, NULL, 0, 0, NULL, NULL),
(29, NULL, 'Casey Glass Bangles', '<p>Elevate your accessory collection with the <strong>Casey Glass Bangles</strong>, a six-piece set featuring metallic green and brushed gold tones for understated elegance. Perfect for festive events, weddings, or adding radiant sparkle to everyday style.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757954350-68c8412e33a40.jpg\",\"1757954350-68c8412e343ec.jpg\",\"1757954350-68c8412e34aa0.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'casey-glass-bangles-68c8412e34f62', 8, NULL, '2025-09-15 16:39:10', '2025-09-15 16:39:10', NULL, NULL, 0, 0, NULL, NULL),
(30, NULL, 'Chloe Bangles', '<p>The <strong>Chloe Bangles</strong> are a refined pair finished in gold-tone plating and detailed with clear stones for timeless sparkle; designed to elevate both traditional and modern looks, they’re&nbsp;</p><p><strong>Best Paired For:</strong> weddings, bridal sets, festive celebrations (Eid/Diwali), bridesmaid gifting, and polished everyday styling.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757955086-68c8440e8fce1.jpg\",\"1757955169-68c844611955e.jpg\",\"1757955169-68c8446119c08.jpg\",\"1757955169-68c844611a2a7.jpg\",\"1757955169-68c844611a972.jpg\",\"1757955169-68c844611ae8a.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'chloe-bangles-68c8465b1d172', 8, NULL, '2025-09-15 16:51:26', '2025-09-15 17:01:15', NULL, NULL, 0, 0, NULL, NULL),
(31, NULL, 'Rayne Peach Bangles', '<p>The <strong>Rayne Peach Bangles</strong> are a refined pair with soft opaque peach stones set on a shiny rose gold finish, designed to add subtle color contrast and sparkle; they’re&nbsp;</p><p><strong>Best Paired For:</strong> wedding events, bridesmaid sets, layered festival looks (Eid, Diwali), or accessorizing neutral outfits for cultural celebrations.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757956069-68c847e53c130.jpg\",\"1757956069-68c847e53c78f.jpg\",\"1757956069-68c847e53cce0.jpg\",\"1757956069-68c847e53d250.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'rayne-peach-bangles-68c84ae42c6cc', 11, NULL, '2025-09-15 17:07:49', '2025-09-15 17:20:36', NULL, NULL, 0, 0, NULL, NULL),
(32, NULL, 'Coral Bridal Choora', '<p>The <strong>Coral Bridal Choora</strong> is a vibrant set crafted in coral tones with decorative sparkle accents, designed in traditional plastic choora style. It’s a bold cultural statement piece,&nbsp;</p><p><strong>Best Paired For:</strong> bridal ceremonies, festive celebrations (Eid/Diwali), and cultural events where tradition meets elegance.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757957113-68c84bf9b121d.jpg\",\"1757957113-68c84bf9b169c.jpg\",\"1758042572-68c999cceb25b.webp\",\"1758042572-68c999cceb4c7.webp\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'coral-bridal-choora-68c999cceb893', 12, NULL, '2025-09-15 17:25:13', '2025-09-16 17:09:32', NULL, NULL, 0, 0, NULL, NULL),
(33, NULL, 'Deepi Bangles', '<p>The <strong>Deepi Bangles</strong> are a sophisticated pair of 22k gold-plated bangles featuring clear zircon diamonds that bring a touch of classical elegance; they’re&nbsp;</p><p><strong>Best Paired For:</strong> bridal jewelry sets, weddings, reception styling, and festive cultural celebrations (Eid, Diwali) that call for refined sparkle.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757957911-68c84f17a6753.jpg\",\"1757957911-68c84f17a7035.jpg\",\"1757957911-68c84f17a77be.jpg\",\"1757957911-68c84f17a7dd1.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'deepi-bangles-68c84f17a82ec', 11, NULL, '2025-09-15 17:38:31', '2025-09-15 17:38:31', NULL, NULL, 0, 0, NULL, NULL),
(34, NULL, 'Denise Bangles', '<p>The <strong>Denise Bangles</strong> are a lavish pair plated in 22k gold and adorned with champagne-tone zircon diamonds, bringing refined sparkle with every move; they’re&nbsp;</p><p><strong>Best Paired For:</strong> elegant wedding ensembles, reception styling, festive occasions (Eid/Diwali), and cultural celebrations where statement jewelry accentuates your outfit.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757958208-68c8504074778.jpg\",\"1757958208-68c85040750a1.jpg\",\"1757958208-68c8504075574.jpg\",\"1757958208-68c8504075bb8.jpg\",\"1757958208-68c85040762c5.jpg\",\"1757958208-68c8504076839.jpg\",\"1757958208-68c8504076ed7.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'denise-bangles-68c85040775ca', 11, NULL, '2025-09-15 17:43:28', '2025-09-15 17:43:28', NULL, NULL, 0, 0, NULL, NULL),
(35, NULL, 'Destiny Bangles', '<p>The <strong>Destiny Bangles</strong> are a refined pair plated in 22k gold and adorned with oval zircon diamonds for timeless sparkle; they’re&nbsp;</p><p><strong>Best Paired For:</strong> weddings, bridal ensembles, festive occasions like Eid or Diwali, reception styling, or gifting to bridesmaids.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757958605-68c851cd4f42f.jpg\",\"1757958605-68c851cd4fbf0.jpg\",\"1757958605-68c851cd5011b.jpg\",\"1757958605-68c851cd50778.jpg\",\"1757958605-68c851cd50d74.jpg\",\"1757958605-68c851cd51190.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'destiny-bangles-68c851cd516b7', 11, NULL, '2025-09-15 17:50:05', '2025-09-15 17:50:05', NULL, NULL, 0, 0, NULL, NULL),
(36, NULL, 'Disha Bangles', '<p>The <strong>Disha Bangles</strong> are a striking pair with a plastic choora-style base and decorative stonework, delivering bold cultural flair with sparkle; they’re&nbsp;</p><p><strong>Best Paired For:</strong> Eid/Diwali celebrations, bridal choora layering, festive gifting, statement accessorial styling, and adding flair to traditional bridal outfits.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757958947-68c853239cb7d.jpg\",\"1757958947-68c853239cfe9.jpg\",\"1757958947-68c853239d6b8.jpg\",\"1757958947-68c853239dc82.jpg\",\"1757958947-68c853239e260.jpg\",\"1757958947-68c853239e76a.jpg\",\"1757958947-68c853239ec71.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'disha-bangles-68c853239f27b', 11, NULL, '2025-09-15 17:55:47', '2025-09-15 17:55:47', NULL, NULL, 0, 0, NULL, NULL),
(37, NULL, 'Electric Blue Bridal Choora', '<p>The <strong>Electric Blue Bridal Choora</strong> is a vibrant choora set crafted in electric blue plastic with decorative shine accents, designed for striking cultural flair; they’re&nbsp;</p><p><strong>Best Paired For:</strong> wedding ceremonies, bridal looks, cultural celebrations (Eid/Diwali), photo events, and gifting that demands bold color.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757959241-68c85449f40c5.jpg\",\"1757959242-68c8544a00511.jpg\",\"1757959242-68c8544a00e1e.jpg\",\"1757959242-68c8544a0171c.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'electric-blue-bridal-choora-68c8544a01d3d', 12, NULL, '2025-09-15 18:00:42', '2025-09-15 18:00:42', NULL, NULL, 0, 0, NULL, NULL),
(38, NULL, 'Fuschia Bridal Choora', '<p>The <strong>Fuschia Bridal Choora</strong> is a vibrant choora set in bold fuschia tones with decorative sparkle accents, offering rich color and cultural tradition; they’re&nbsp;</p><p><strong>Best Paired For:</strong> wedding ceremonies, bridal sets, festive celebrations (Eid/Diwali), photo-shoot looks, and statement gifting.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757962046-68c85f3e74941.jpg\",\"1757962046-68c85f3e75046.jpg\",\"1757962046-68c85f3e754d1.jpg\",\"1757962046-68c85f3e75ef7.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'fuschia-bridal-choora-68c85f3e76a8e', 12, NULL, '2025-09-15 18:47:26', '2025-09-15 18:47:26', NULL, NULL, 0, 0, NULL, NULL),
(39, NULL, 'Gloria Bangles', '<p>The <strong>Gloria Bangles</strong> are a set of four bangles featuring soft ivory pearls on radiant 22k gold plating for timeless elegance; they’re&nbsp;</p><p><strong>Best Paired For:</strong> weddings, bridal ensembles, graceful everyday style, tea receptions, and cultural celebrations where subtle luxury enhances your look.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757962970-68c862dad7d47.jpg\",\"1757962970-68c862dad829c.jpg\",\"1757962970-68c862dad8ae5.jpg\",\"1757962970-68c862dad912a.jpg\",\"1757962970-68c862dad99eb.jpg\",\"1757962970-68c862dad9ff7.jpg\",\"1757962970-68c862dada67a.jpg\",\"1757962970-68c862dadab1b.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'gloria-bangles-68cae041f3746', 8, NULL, '2025-09-15 19:02:50', '2025-09-17 16:22:25', NULL, NULL, 1, 0, NULL, NULL),
(40, NULL, 'Gurvina Glass Bangles', '<p>The <strong>Gurvina Glass Bangles</strong> are a six-piece set of glass bangles in neutral tones with decorative sparkle, offering cultural elegance and shimmer; they’re&nbsp;</p><p><strong>Best Paired For:</strong> Eid and Diwali styling, stacked glass bangle collections, gift sets, bridal accessories, and layering with neutral outfits for festive flair.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757963174-68c863a66436c.jpg\",\"1757963174-68c863a664a57.jpg\",\"1757963174-68c863a6651bb.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'gurvina-glass-bangles-68c863a665b97', 8, NULL, '2025-09-15 19:06:14', '2025-09-15 19:06:14', NULL, NULL, 0, 0, NULL, NULL),
(41, NULL, 'Irami Bangles', '<p>The <strong>Irami Bangles</strong> are a bold, heavy cuff-style bangle in black with vibrant stone accents, perfect for adding striking contrast and elegance; they’re&nbsp;</p><p><strong>Best Paired For:</strong> evening wear, reception styling, bridal cocktails, cultural celebrations, and accenting neutral outfits with statement pieces.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757963528-68c86508d8eb4.jpg\",\"1757963528-68c86508d93b0.jpg\",\"1757963528-68c86508d98b0.jpg\",\"1757963528-68c86508d9d03.jpg\",\"1757963528-68c86508da169.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'irami-bangles-68c86508da609', 8, NULL, '2025-09-15 19:12:08', '2025-09-15 19:12:08', NULL, NULL, 0, 0, NULL, NULL),
(42, NULL, 'Isha Bangles', '<p>The <strong>Isha Bangles</strong> are an elegant pair plated in shimmering 22k gold and adorned with clear stone embellishments for radiant detail; they’re&nbsp;</p><p><strong>Best Paired For:</strong> traditional bridal jewelry sets, weddings, reception styling, festive occasions like Eid/Diwali, and gifting to bridesmaids or loved ones.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757964140-68c8676cb1361.jpg\",\"1757964140-68c8676cb1a45.jpg\",\"1757964140-68c8676cb20f2.jpg\",\"1757964140-68c8676cb2893.jpg\",\"1757964140-68c8676cb3026.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'isha-bangles-68c8676cb38dd', 11, NULL, '2025-09-15 19:22:20', '2025-09-15 19:22:20', NULL, NULL, 0, 0, NULL, NULL),
(43, NULL, 'Jillian Bangles', '<p>The <strong>Jillian Bangles</strong> are a striking set of four bangles with a choora base and zircon stone detailing that deliver shimmering style without heaviness; they’re&nbsp;</p><p><strong>Best Paired For:</strong> festive occasions, everyday layering, gifting, Eid/Diwali styling, or adding sparkle to bridal or reception looks.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757964529-68c868f166c10.jpg\",\"1757964529-68c868f167142.jpg\",\"1757964529-68c868f16762d.jpg\",\"1757964529-68c868f167b84.jpg\",\"1757964529-68c868f16809e.jpg\",\"1757964529-68c868f168517.jpg\",\"1757964529-68c868f1689fd.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'jillian-bangles-68c868f168f09', 11, NULL, '2025-09-15 19:28:49', '2025-09-15 19:28:49', NULL, NULL, 0, 0, NULL, NULL),
(44, NULL, 'Joyti Bangles', '<p>With an antique gold finish these bangles are fully studded with pearls. The contrast between the pearls and antique gold base is what creates a striking look in this bangle.&nbsp;<br>Perfect to wear on its own but mixes well as a centre bangle in a set.&nbsp;</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757964932-68c86a84a77f3.jpg\",\"1757964932-68c86a84a7ca6.jpg\",\"1757964932-68c86a84a815e.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'joyti-bangles-68c86a84a86c5', 8, NULL, '2025-09-15 19:35:32', '2025-09-15 19:35:32', NULL, NULL, 0, 0, NULL, NULL),
(45, NULL, 'Karen Bangles', '<p>The <strong>Karen Bangles</strong> are a refined pair plated in 22k gold with clear zircon diamonds for timeless sparkle; they’re&nbsp;</p><p><strong>Best Paired For:</strong> weddings, bridal ensembles, reception styling, festive cultural celebrations like Eid or Diwali, and gifting to bridesmaids or loved ones.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757965152-68c86b607b80a.jpg\",\"1757965152-68c86b607bda6.jpg\",\"1757965152-68c86b607c206.jpg\",\"1757965152-68c86b607c632.jpg\",\"1757965152-68c86b607cb44.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'karen-bangles-68c86b607d06c', 11, NULL, '2025-09-15 19:39:12', '2025-09-15 19:39:12', NULL, NULL, 0, 0, NULL, NULL),
(46, NULL, 'Kavita Bangles', '<p>Sparkle up your stack with the <strong>Kavita Bangles</strong>, a set of 4 final-sale choora-style bangles crafted with a plastic base and crystal zircon stones in a shimmering mixed tone. With teardrop settings and 22k gold plating, they add dramatic flair to both bridal vibes and everyday cultural style. Let them shine solo or layered into your festive bangle sets.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757966198-68c86f761765d.jpg\",\"1757966198-68c86f7617bd7.jpg\",\"1757966198-68c86f7618242.jpg\",\"1757966198-68c86f7618793.jpg\",\"1757966198-68c86f7618d6b.jpg\",\"1757966198-68c86f7619294.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'kavita-bangles-68c86f7619823', 11, NULL, '2025-09-15 19:56:38', '2025-09-15 19:56:38', NULL, NULL, 0, 0, NULL, NULL),
(47, NULL, 'Kavita Bangles', '<p>The <strong>Kavita Bangles</strong> bring more golden warmth than their twin, Lanna, with a teardrop design plated in 22k gold and set with shimmering white zircon stones. Their sleek shape and radiant finish make them a glam statement on their own, while also versatile for layering. Add them to both ends of your bangle stack to frame your look with sparkle and balance.&nbsp;</p><p><strong>Best Paired For:</strong> bridal sets, Eid/Diwali celebrations, wedding receptions, or bridesmaid gifts that need timeless elegance.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757966884-68c8722433b9f.jpg\",\"1757966884-68c8722434218.jpg\",\"1757966884-68c8722434789.jpg\",\"1757966884-68c8722434ccb.jpg\",\"1757966884-68c872243521f.jpg\",\"1757966884-68c87224356fa.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'kavita-bangles-68c8722435e16', 11, NULL, '2025-09-15 20:08:04', '2025-09-15 20:08:04', NULL, NULL, 0, 0, NULL, NULL),
(48, NULL, 'Kendra Glass Bangles', '<p>Light up your stack with <strong>Kendra Glass Bangles</strong>, a six-piece set in soft pink and champagne tones with a glass finish that subtly sparkles. These bangles bring festive elegance to your look, ideal for layering with bridal sets or choora styles. With their delicate design, they’re punchy enough to go solo, yet perfect for mixing into your cultural jewelry collection.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757967407-68c8742f579a8.jpg\",\"1757967407-68c8742f57f34.jpg\",\"1757967407-68c8742f58748.jpg\",\"1757967407-68c8742f58e03.jpg\",\"1757967407-68c8742f59621.jpg\",\"1757967407-68c8742f59cc9.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'kendra-glass-bangles-68c8742f5a439', 11, NULL, '2025-09-15 20:16:47', '2025-09-15 20:16:47', NULL, NULL, 0, 0, NULL, NULL),
(49, NULL, 'Lanna Bangles', '<p>The <strong>Lanna Bangles</strong> glow in pale Zardozi gold plating with teardrop settings of white zircon stones that blend regal elegance with everyday glam; they’re&nbsp;</p><p><strong>Best Paired For:</strong> weddings, bridal ensembles, Eid/Diwali looks, cultural celebrations, and elevating minimalist outfits with luxurious detail.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757977470-68c89b7ef2560.jpg\",\"1757977470-68c89b7ef2dae.jpg\",\"1757977470-68c89b7ef34a1.jpg\",\"1757977470-68c89b7ef3ae5.jpg\",\"1757977470-68c89b7ef41e1.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'lanna-bangles-68c89b7f00578', 11, NULL, '2025-09-15 23:04:31', '2025-09-15 23:04:31', NULL, NULL, 0, 0, NULL, NULL),
(50, NULL, 'Light Peach Choora', '<p>The <strong>Light Peach Bridal Choora</strong> is a six-dozen set in soft pastel peach tones, crafted in traditional plastic for cultural authenticity and bridal ceremonies. Its delicate finish makes it a staple for South Asian weddings, mehndi, and choora rituals, while also perfect for layering into Eid or Diwali bangle stacks. A timeless addition to bridal jewelry collections, this choora brings elegance, tradition, and festive versatility in one.&nbsp;</p><p><strong>Best Paired For:</strong> weddings, bridal photo shoots, choora ceremonies, cultural celebrations, and bridesmaid gifting.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757977832-68c89ce81843a.jpg\",\"1757977832-68c89ce81885a.jpg\",\"1757977832-68c89ce818cb5.jpg\",\"1757977832-68c89ce819499.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'light-peach-choora-68c89ce819d34', 12, NULL, '2025-09-15 23:10:32', '2025-09-15 23:10:32', NULL, NULL, 0, 0, NULL, NULL),
(51, NULL, 'Lily Bangles', '<p>The <strong>Lily Bangles</strong> are a luxurious pair plated in 22k gold with clear zircon diamonds and an elegant pearl-border detail, designed to bring warmth and sparkle to any outfit. Sold in a pair, these pieces shine as bridal accessories or when layered into festive stacks. Perfect for gentler styling that still commands luxury, they elevate looks for weddings, receptions, or cultural celebrations.&nbsp;</p><p><strong>Best Paired For:</strong> bridal jewelry sets, Eid/Diwali ensembles, gift pieces, pearl accents, photo-shoot moments.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757978246-68c89e86c05cd.jpg\",\"1757978246-68c89e86c0c09.jpg\",\"1757978246-68c89e86c12e2.jpg\",\"1757978246-68c89e86c17d1.jpg\",\"1757978246-68c89e86c1cad.jpg\",\"1757978246-68c89e86c225f.jpg\",\"1757978246-68c89e86c2817.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'lily-bangles-68c89e86c2e27', 11, NULL, '2025-09-15 23:17:26', '2025-09-15 23:17:26', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `products` (`id`, `sku`, `name`, `description`, `meta_title`, `meta_description`, `images_details`, `care`, `sustainability`, `shipping`, `returns`, `price`, `member_price`, `color_id`, `size`, `compare_price`, `quantity`, `unavailable_quantity`, `images`, `attributes`, `status`, `is_featured`, `slug`, `category_id`, `category_box_id`, `created_at`, `updated_at`, `deleted_at`, `colors`, `is_top_listed`, `is_pre_order`, `weight`, `weight_unit`) VALUES
(52, NULL, 'Lubna Bangles', '<p>The <strong>Lubna Bangles</strong> pair richness and sparkle in gold plating with champagne zircon detailing, offering warm glam flair for any ensemble. Dress them up with bridal jewelry or tone them down for daily cultural elegance. Their timeless design shines through both traditional occasions and modern stylings.</p><p><strong>Best Paired For:</strong> reception evenings, bridal stacks, Eid and Diwali occasions, gifting that celebrates cultural beauty.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757978679-68c8a037ac59e.jpg\",\"1757978679-68c8a037acb8e.jpg\",\"1757978679-68c8a037ad364.jpg\",\"1757978679-68c8a037adb2b.jpg\",\"1757978679-68c8a037ae2c5.jpg\",\"1757978679-68c8a037ae9c5.png\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'lubna-bangles-68c8a037aecd3', 8, NULL, '2025-09-15 23:24:39', '2025-09-15 23:24:39', NULL, NULL, 0, 0, NULL, NULL),
(53, NULL, 'Madison Bangles', '<p>The <strong>Madison Bangles</strong> are plated in 22k gold and designed with a double band of clear crystals that deliver a radiant sparkle to your wrist. A polished pair perfect for instant glam, whether you’re dressing up for reception nights or elevating your everyday style. Crafted as a final-sale staple, they blend elegance and durability for festival looks or bridal box highlights.&nbsp;</p><p><strong>Best Paired For:</strong> wedding events, mehndi &amp; sangeet functions, gift giving for bridesmaids, Eid &amp; Diwali styling, and glamorous date-nights.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1757979036-68c8a19cb764d.jpg\",\"1757979036-68c8a19cb7ab7.jpg\",\"1757979036-68c8a19cb7e77.jpg\",\"1757979036-68c8a19cb8313.jpg\",\"1757979036-68c8a19cb8842.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'madison-bangles-68c8a19cb8d52', 11, NULL, '2025-09-15 23:30:36', '2025-09-15 23:30:36', NULL, NULL, 0, 0, NULL, NULL),
(54, NULL, 'Manisha Glass Bangles', '<p>Add a pop of blush to your jewelry collection with the <strong>Manisha Glass Bangles</strong>, a playful set of six light matte pink glass bangles edged with soft gold accents that bring subtle warmth and cheerful sparkle. Sold as a glass set, these are crafted for delicate layering and add effortless beauty to daily ensembles or festive color stories. The lightweight design makes them perfect for stacking with metal bangles or choora for weddings, mehndi, or Eid festivities.&nbsp;</p><p><strong>Best Paired For:</strong> pastel bridal palettes, photo shoots, gift bundles, Eid/Diwali splashes, and everyday cultural flair.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1758037444-68c985c45cc1e.jpg\",\"1758037444-68c985c45d09f.jpg\",\"1758037444-68c985c45d8b1.jpg\",\"1758037444-68c985c45e078.jpg\",\"1758037444-68c985c45e7da.jpg\",\"1758037444-68c985c45ef40.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'manisha-glass-bangles-68c985c45f61b', 8, NULL, '2025-09-16 15:44:04', '2025-09-22 17:04:54', NULL, NULL, 0, 0, NULL, NULL),
(55, NULL, 'Mariella Glass Bangles', '<p>The <strong>Mariella Glass Bangles</strong> are a delicate, neutral-tone set that radiate subdued elegance with glass finish and light shimmer, perfect for adding softness to your wrist stack. Ideal for layering with statement jewellery or pairing with traditional ensembles without overwhelming. Lightweight yet eye-catching, they bridge everyday style and subtle festive polish.&nbsp;</p><p><strong>Best Paired For:</strong> Eid dinner styling, bridal mehndi gifts, pastel wedding palettes, mothers-of-bride elegance, and cultural celebration outfits.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1758037684-68c986b40704a.jpg\",\"1758037684-68c986b407623.jpg\",\"1758037684-68c986b407e92.jpg\",\"1758037684-68c986b408654.jpg\",\"1758037684-68c986b408ea3.jpg\",\"1758037684-68c986b409595.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'mariella-glass-bangles-68c986b409c48', 8, NULL, '2025-09-16 15:48:04', '2025-09-16 15:48:04', NULL, NULL, 0, 0, NULL, NULL),
(56, NULL, 'Meera Bangles', '<p>The <strong>Meera Bangles</strong> are a luxurious pair plated in 22k gold and adorned with delicate champagne diamonds and pearl accents, elevating every wrist with classic sparkle. Their elegant design blends traditional bridal vibes with modern glam, making them ideal for charting statement looks across ceremonies and festive nights. Crafted for versatility, they shine solo or stacked in a choora or bangle set.&nbsp;</p><p><strong>Best Paired For:</strong> wedding receptions, bridal showers, Eid/Diwali gatherings, mother-of-the-bride looks, and timeless cultural celebrations.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1758037889-68c987817c32b.jpg\",\"1758037889-68c987817c739.jpg\",\"1758037889-68c987817cc60.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'meera-bangles-68c987817d158', 11, NULL, '2025-09-16 15:51:29', '2025-09-16 15:51:29', NULL, NULL, 0, 0, NULL, NULL),
(57, NULL, 'Metallic Blue - 2 Tone Choora', '<p>Make a bold bridal statement with the <strong>Metallic Blue - 2 Tone Choora</strong>, a striking set in radiant metallic blue that brings edge and elegance to your cultural look. Crafted with lustrous finish and size variety, this 4-dozen choora set layers beautifully into bridal sets or stands out in Eid splashes. Perfect for night receptions or pairing with pearl and gold accents to balance its vivid hue.</p><p>&nbsp;<strong>Best Paired For:</strong> wedding choora rituals, festive Eid &amp; Diwali celebrations, groom gift moments, photo shoots, cultural ceremonies</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1758038317-68c9892d0754d.jpg\",\"1758038317-68c9892d081b3.jpg\",\"1758038317-68c9892d088b3.jpg\",\"1758038317-68c9892d093af.jpg\",\"1758038317-68c9892d09fb1.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'metallic-blue-2-tone-choora-68c9892d0a734', 12, NULL, '2025-09-16 15:58:37', '2025-09-16 15:58:37', NULL, NULL, 0, 0, NULL, NULL),
(58, NULL, 'Metallic Wine Bridal Choora', '<p>The <strong>Metallic Wine Bridal Choora</strong> offers rich, bold color in luxurious metallic wine tones, crafting a traditional choora set with an eye-catching finish that blends glamour with cultural heritage. This full bridal choora celebrates ceremonial custom with striking vibrancy—perfect for choora ritual moments or adding a dramatic touch to your wedding ensemble. Plastic build fits snug, with a suggestion to size up for regular metal bangle wearers.&nbsp;</p><p><strong>Best Paired For:</strong> wedding ceremonies, bridal rituals, long reception nights, deep jewel-tone lehengas, gifting that captures timeless flair</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1758038582-68c98a36dc335.jpg\",\"1758038582-68c98a36dc88e.jpg\",\"1758038582-68c98a36dce01.jpg\",\"1758038582-68c98a36dd87c.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'metallic-wine-bridal-choora-68c98a36de520', 12, NULL, '2025-09-16 16:03:02', '2025-09-16 16:03:02', NULL, NULL, 0, 0, NULL, NULL),
(59, NULL, 'Miley Glass Bangles', '<p>The <strong>Miley Glass Bangles</strong> are a chic six-piece set in soft peach and light gold tones, crafted from sleek glass for delicate shimmer and ease of wear. Designed to lend gentle elegance without overwhelming your look, they layer beautifully into pastel bridal sets or add warmth to festive outfits. Perfect for accenting ivory lehengas or soft pink tones in your wedding jewelry box.&nbsp;</p><p><strong>Best Paired For:</strong> bridal photo shoots, mehndi ceremonies, pastel-themed Eid/Diwali styling, bridesmaid gifts, and subtle everyday sparkle.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1758041376-68c9952018b4a.jpg\",\"1758041376-68c99520190d6.jpg\",\"1758041376-68c9952019803.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'miley-glass-bangles-68c9952019fae', 8, NULL, '2025-09-16 16:49:36', '2025-09-16 16:49:36', NULL, NULL, 0, 0, NULL, NULL),
(60, NULL, 'Olivia Bangles', '<p>The <strong>Olivia Bangles</strong> are a luxe pair plated in 22k gold and wrapped with a double band of pearls for a timeless, elegant look. Sold in matching sizes, they offer a blend of classic glamour and modern versatility—ideal for transitioning from wedding ceremonies to evening receptions. With their pearl detail and warm gold finish, they add softness and refined texture to your bridal jewellery set or festive stack.&nbsp;</p><p><strong>Best Paired For:</strong> pearl-accented lehengas, wedding reception outfits, Eid celebrations, agricultural-heritage inspired styling, and gifts for bridesmaids.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1758041883-68c9971b8bd4d.jpg\",\"1758041883-68c9971b8c510.jpg\",\"1758041883-68c9971b8cbd5.jpg\",\"1758041883-68c9971b8d1e1.jpg\",\"1758041883-68c9971b8d76b.jpg\",\"1758041883-68c9971b8dc30.jpg\",\"1758041883-68c9971b8e1e9.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'olivia-bangles-68c9971b8e802', 8, 5, '2025-09-16 16:58:03', '2025-09-22 17:30:27', NULL, NULL, 0, 0, NULL, NULL),
(61, NULL, 'Orange Bridal Choora', '<p>Make a bold statement with the <strong>Orange Bridal Choora</strong>, a vibrant full choora set in radiant orange tones crafted in traditional plastic for rich color and heritage flair. Designed to command attention, these pieces are made for bridal rituals, photo shoots &amp; festive wardrobe highlights. Lightweight yet dramatic, this choora adds cultural authenticity with every movement.&nbsp;</p><p><strong>Best Paired For:</strong> weddings &amp; mehndi ceremonies, Haldi festivities, reception night accents, gift sets, and bold color-block sari or lehenga looks.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1758042105-68c997f9e75de.jpg\",\"1758042105-68c997f9e7b02.jpg\",\"1758042105-68c997f9e7fca.jpg\",\"1758042105-68c997f9e8acd.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'orange-bridal-choora-68c998105cc49', 12, NULL, '2025-09-16 17:01:45', '2025-09-16 17:02:08', NULL, NULL, 0, 0, NULL, NULL),
(62, NULL, 'Anique Jhumar', '<p>Elevate your wedding hairstyles with the <strong>Anique Jhumar</strong>, a round platinum-gold plated accessory adorned with shimmering diamond zircon stones that glint in every light. This elegant jhumar doubles beautifully as a side hair ornament or chunni drape, adding cultural texture and bridal sparkle. Perfect for completing ceremonial looks or enhancing mehndi and engagement ensembles.&nbsp;</p><p><strong>Best Paired For:</strong> wedding rituals, engagement photoshoots, bridal sets, cultural headpieces, and festive ethnic accessories.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', 14.95, NULL, NULL, NULL, NULL, 1, 0, '[\"1758042975-68c99b5f0b148.jpg\",\"1758042975-68c99b5f0bfce.jpg\",\"1758042975-68c99b5f0cbfb.jpg\",\"1758042975-68c99b5f0da1b.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'anique-jhumar-68c99b7e2e72b', 21, NULL, '2025-09-16 17:16:15', '2025-09-16 17:16:46', NULL, NULL, 0, 0, NULL, NULL),
(63, NULL, 'Fiona Necklace', '<p>The <strong>Fiona Necklace</strong> combines traditional meenakari hand-work with shimmering clear cubic zirconia stones set on a delicate 18-inch gold-plated chain, available in Ivory, Light Pink, and Teal. Perfect for adding cultural texture and subtle color to bridal outfits, festive wear, or day-to-evening looks. Lightweight yet eye-catching, it bridges Indian ethnic style with modern minimalist aesthetics.&nbsp;</p><p><strong>Best Paired For:</strong> wedding receptions, engagement photos, Eid/Diwali outfits, pastel or jewel-tone lehengas, or as a thoughtful gift accent.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1758051927-68c9be57acd93.jpg\",\"1758051927-68c9be57ad8e3.jpg\",\"1758052172-68c9bf4c64e31.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'fiona-necklace-68c9c085bb283', 13, NULL, '2025-09-16 19:45:27', '2025-09-16 19:54:45', NULL, NULL, 0, 0, NULL, NULL),
(64, NULL, 'Aman Necklace Set', '<p>Add dramatic elegance with the <strong>Aman Necklace Set</strong>, a full bridal jewelry ensemble featuring a luxe necklace, matching earrings, and tikka, all accented with mauve tones and champagne diamonds for soft color and sparkle. Plated in warm polished gold, this set blends traditional craftsmanship with modern glam—perfect for standing out at wedding rituals or reception events. Versatile enough to pair with pastel, jewel-tone or ivory lehengas, it enhances both traditional and fusion styles.&nbsp;</p><p><strong>Best Paired For:</strong> bridal ceremonies, engagement photoshoots, cultural weddings, banquet receptions, and gifting for the bride.</p>', NULL, NULL, NULL, 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1758053486-68c9c46e07b5b.jpg\",\"1758053486-68c9c46e07d93.jpg\",\"1758053486-68c9c46e07f85.jpg\",\"1758053486-68c9c46e08191.jpg\",\"1758053486-68c9c46e08344.jpg\",\"1758053486-68c9c46e08516.jpg\",\"1758053486-68c9c46e08709.jpg\",\"1758126220-68cae08c11302.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'aman-necklace-set-68cae09f2d2ad', 15, NULL, '2025-09-16 20:11:26', '2025-09-17 16:23:59', NULL, NULL, 0, 0, NULL, NULL),
(65, NULL, 'Amia Necklace Set', '<p>The <strong>Amia Necklace Set</strong> is expertly crafted in 22k gold plating, featuring handmade semi-precious gemstones, pastel teal accents, and sparkling clear stones that blend traditional craftsmanship with modern elegance. Perfect for bridal affairs and cultural events, this set shines brightest when paired with ivory or pastel lehengas, or used as a statement focal for receptions. Its soft teal and gemstone tones add seasonal freshness—ideal for spring weddings or intimate ceremony photos.&nbsp;</p><p><strong>Best Paired For:</strong> bridesmaid jewelry sets, engagement ensembles, destination weddings, pastel wardrobe highlights, cultural heirloom gifts</p>', NULL, NULL, '[{\"name\":\"1758054245-68c9c7655298b.jpg\",\"alt\":\"\"},{\"name\":\"1758054245-68c9c7655381c.jpg\",\"alt\":\"\"},{\"name\":\"1758054245-68c9c765545db.jpg\",\"alt\":\"\"},{\"name\":\"1758054245-68c9c76554f47.jpg\",\"alt\":\"\"},{\"name\":\"1758054245-68c9c76555bcb.jpg\",\"alt\":\"\"},{\"name\":\"1758054245-68c9c76556700.jpg\",\"alt\":\"\"},{\"name\":\"1758054245-68c9c76556de2.jpg\",\"alt\":\"\"},{\"name\":\"1758054245-68c9c76557831.jpg\",\"alt\":\"\"},{\"name\":\"1758054245-68c9c7655837e.jpg\",\"alt\":\"\"},{\"name\":\"1758054245-68c9c76558b8b.jpg\",\"alt\":\"\"},{\"name\":\"1758054245-68c9c765591e6.jpg\",\"alt\":\"\"},{\"name\":\"1758054245-68c9c76559996.jpg\",\"alt\":\"\"}]', 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', 329.95, NULL, 4, NULL, NULL, 1, 0, '[\"1758054245-68c9c7655298b.jpg\",\"1758054245-68c9c7655381c.jpg\",\"1758054245-68c9c765545db.jpg\",\"1758054245-68c9c76554f47.jpg\",\"1758054245-68c9c76555bcb.jpg\",\"1758054245-68c9c76556700.jpg\",\"1758054245-68c9c76556de2.jpg\",\"1758054245-68c9c76557831.jpg\",\"1758054245-68c9c7655837e.jpg\",\"1758054245-68c9c76558b8b.jpg\",\"1758054245-68c9c765591e6.jpg\",\"1758054245-68c9c76559996.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 1, 'amia-necklace-set-68cae03295781', 3, NULL, '2025-09-16 20:24:05', '2025-12-04 18:31:46', NULL, NULL, 1, 1, NULL, 'g'),
(66, NULL, 'Testing product', '<p>Here will be description&nbsp;</p>', 'Meta title', 'Meta description will be here', '[{\"name\":\"1759254587-68dc183b15803.jpg\",\"alt\":\"Image 1 ALT\"},{\"name\":\"1759254587-68dc183b15ae9.jpg\",\"alt\":\"Image Alt 2\"},{\"name\":\"1759254587-68dc183b16c7c.jpg\",\"alt\":\"Image alt 3\"}]', 'Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches.', 'Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing. Each piece is designed to be timeless, for wear over seasons rather than fleeting trends, and packaging is reusable and minimal in environmental impact.', 'Orders are usually shipped within 1–3 business days (Tue–Fri). Free standard shipping is available when orders exceed $80 CAD (members) or when rewards from bundles are redeemed. International shipping is offered; delivery times vary by location. Tracking information will be provided by email once your order ships.', 'Returns for online orders are accepted within 15 days of ship date for North American customers, and within 30 days for international orders. Items must be unused, in original packaging, and with tags/barcodes intact. A 10% restocking fee may apply. Clearance sale items, gift cards, bangle boxes, sleeves, and Bridal Choora sets are final sale, with no exchanges or refunds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1759254587-68dc183b15803.jpg\",\"1759254587-68dc183b15ae9.jpg\",\"1759254587-68dc183b16c7c.jpg\"]', '{\"materials\":[],\"styles\":[]}', 1, 0, 'testing-product-68dc183b16e30', 11, NULL, '2025-09-30 17:49:47', '2025-10-02 15:38:37', '2025-10-02 15:38:37', NULL, 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `hex_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_colors`
--

INSERT INTO `product_colors` (`id`, `name`, `hex_code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Gold', '#D59A07', '2025-09-09 18:28:30', '2025-09-09 18:28:30', NULL),
(2, 'Neutral', '#FFFFFF', '2025-09-09 18:36:47', '2025-09-14 16:22:28', '2025-09-14 16:22:28'),
(3, 'White', '#FFFFFF', '2025-09-09 18:37:25', '2025-09-09 18:37:25', NULL),
(4, 'Teal', '#73CFE1', '2025-09-09 18:38:49', '2025-09-09 18:38:49', NULL),
(5, 'Fuschia', '#C73BA9', '2025-09-09 18:40:54', '2025-09-09 18:40:54', NULL),
(6, 'Orange', '#FF8A00', '2025-09-09 18:41:12', '2025-09-09 18:41:12', NULL),
(7, 'Beige', '#E5D3A7', '2025-09-09 18:42:04', '2025-09-09 18:42:04', NULL),
(8, 'Purple', '#A54DD0', '2025-09-09 18:42:33', '2025-09-09 18:42:33', NULL),
(9, 'Blue', '#025BD1', '2025-09-09 18:42:53', '2025-09-09 18:42:53', NULL),
(10, 'Yellow', '#F8DF02', '2025-09-09 18:43:10', '2025-09-09 18:43:10', NULL),
(11, 'Yellow', '#F8DF02', '2025-09-09 18:43:10', '2025-09-09 18:51:35', '2025-09-09 18:51:35'),
(12, 'Silver', '#CFCFCF', '2025-09-09 18:43:27', '2025-09-09 18:43:27', NULL),
(13, 'Matte Blue', '#7AE1EC', '2025-09-09 18:43:56', '2025-09-09 18:43:56', NULL),
(14, 'Green', '#02A83D', '2025-09-09 18:44:15', '2025-09-09 18:44:15', NULL),
(15, 'Navy', '#271F97', '2025-09-09 18:44:56', '2025-09-09 18:44:56', NULL),
(16, 'Rose gold', '#B76F79', '2025-09-09 18:45:15', '2025-09-09 18:45:15', NULL),
(17, 'Brown', '#9A5630', '2025-09-09 18:45:44', '2025-09-09 18:45:44', NULL),
(18, 'Gray', '#808080', '2025-09-09 18:46:00', '2025-09-09 18:46:00', NULL),
(19, 'Multicolor', '#FFFFFF', '2025-09-09 18:46:28', '2025-09-14 16:22:10', '2025-09-14 16:22:10'),
(20, 'Red', '#F6201F', '2025-09-09 18:46:56', '2025-09-09 18:46:56', NULL),
(21, 'Black', '#000000', '2025-09-09 18:47:09', '2025-09-09 18:47:09', NULL),
(22, 'Coral', '#FD8A8A', '2025-09-09 18:49:25', '2025-09-09 18:49:25', NULL),
(23, 'Grey', '#808080', '2025-09-09 18:49:49', '2025-09-09 18:49:49', NULL),
(24, 'Maroon', '#A01514', '2025-09-09 18:50:02', '2025-09-09 18:50:02', NULL),
(25, 'Pink', '#FF9FDB', '2025-09-09 18:50:16', '2025-09-09 18:50:16', NULL),
(26, 'Rainbow', '#FFFFFF', '2025-09-09 18:50:39', '2025-09-14 16:22:01', '2025-09-14 16:22:01'),
(27, 'Peach', '#FFBBB9', '2025-09-09 18:51:02', '2025-09-09 18:51:02', NULL),
(28, 'Bronze', '#CB7E31', '2025-09-09 18:51:19', '2025-09-09 18:51:19', NULL),
(29, 'Floral', '#FFFFFF', '2025-09-13 20:07:40', '2025-09-14 16:21:54', '2025-09-14 16:21:54');

-- --------------------------------------------------------

--
-- Table structure for table `product_notify`
--

CREATE TABLE `product_notify` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_notify`
--

INSERT INTO `product_notify` (`id`, `user_id`, `product_id`, `variation_id`, `email`, `created_at`, `updated_at`) VALUES
(2, NULL, 53, 214, 'bangles@admin.com', '2025-09-22 17:39:49', '2025-09-22 17:39:49');

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tags`
--

INSERT INTO `product_tags` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(89, 4, 15, '2025-09-13 18:42:49', '2025-09-13 18:42:49'),
(90, 4, 21, '2025-09-13 18:42:49', '2025-09-13 18:42:49'),
(91, 4, 5, '2025-09-13 18:42:49', '2025-09-13 18:42:49'),
(92, 4, 8, '2025-09-13 18:42:49', '2025-09-13 18:42:49'),
(93, 4, 9, '2025-09-13 18:42:49', '2025-09-13 18:42:49'),
(111, 6, 11, '2025-09-13 18:53:08', '2025-09-13 18:53:08'),
(112, 6, 3, '2025-09-13 18:53:08', '2025-09-13 18:53:08'),
(113, 7, 13, '2025-09-13 18:54:49', '2025-09-13 18:54:49'),
(114, 7, 9, '2025-09-13 18:54:49', '2025-09-13 18:54:49'),
(151, 10, 13, '2025-09-13 19:18:39', '2025-09-13 19:18:39'),
(152, 10, 4, '2025-09-13 19:18:39', '2025-09-13 19:18:39'),
(224, 11, 13, '2025-09-13 19:40:34', '2025-09-13 19:40:34'),
(225, 11, 9, '2025-09-13 19:40:34', '2025-09-13 19:40:34'),
(269, 13, 14, '2025-09-13 20:02:58', '2025-09-13 20:02:58'),
(270, 13, 3, '2025-09-13 20:02:58', '2025-09-13 20:02:58'),
(287, 17, 11, '2025-09-13 20:46:12', '2025-09-13 20:46:12'),
(288, 17, 14, '2025-09-13 20:46:12', '2025-09-13 20:46:12'),
(289, 17, 2, '2025-09-13 20:46:12', '2025-09-13 20:46:12'),
(290, 17, 24, '2025-09-13 20:46:12', '2025-09-13 20:46:12'),
(291, 17, 25, '2025-09-13 20:46:12', '2025-09-13 20:46:12'),
(292, 18, 11, '2025-09-13 21:07:46', '2025-09-13 21:07:46'),
(293, 18, 14, '2025-09-13 21:07:46', '2025-09-13 21:07:46'),
(294, 18, 20, '2025-09-13 21:07:46', '2025-09-13 21:07:46'),
(295, 18, 2, '2025-09-13 21:07:46', '2025-09-13 21:07:46'),
(296, 18, 24, '2025-09-13 21:07:46', '2025-09-13 21:07:46'),
(297, 18, 25, '2025-09-13 21:07:46', '2025-09-13 21:07:46'),
(307, 21, 15, '2025-09-13 21:37:02', '2025-09-13 21:37:02'),
(308, 21, 2, '2025-09-13 21:37:02', '2025-09-13 21:37:02'),
(309, 21, 6, '2025-09-13 21:37:02', '2025-09-13 21:37:02'),
(310, 22, 15, '2025-09-13 21:47:17', '2025-09-13 21:47:17'),
(311, 22, 2, '2025-09-13 21:47:17', '2025-09-13 21:47:17'),
(312, 22, 23, '2025-09-13 21:47:17', '2025-09-13 21:47:17'),
(313, 22, 25, '2025-09-13 21:47:17', '2025-09-13 21:47:17'),
(314, 23, 15, '2025-09-13 21:54:37', '2025-09-13 21:54:37'),
(315, 23, 8, '2025-09-13 21:54:37', '2025-09-13 21:54:37'),
(316, 23, 23, '2025-09-13 21:54:37', '2025-09-13 21:54:37'),
(317, 23, 25, '2025-09-13 21:54:37', '2025-09-13 21:54:37'),
(318, 24, 15, '2025-09-13 22:04:47', '2025-09-13 22:04:47'),
(319, 24, 2, '2025-09-13 22:04:47', '2025-09-13 22:04:47'),
(320, 24, 23, '2025-09-13 22:04:47', '2025-09-13 22:04:47'),
(321, 24, 24, '2025-09-13 22:04:47', '2025-09-13 22:04:47'),
(322, 24, 25, '2025-09-13 22:04:47', '2025-09-13 22:04:47'),
(323, 25, 15, '2025-09-13 22:13:29', '2025-09-13 22:13:29'),
(324, 25, 18, '2025-09-13 22:13:29', '2025-09-13 22:13:29'),
(325, 25, 2, '2025-09-13 22:13:29', '2025-09-13 22:13:29'),
(326, 25, 23, '2025-09-13 22:13:29', '2025-09-13 22:13:29'),
(327, 25, 24, '2025-09-13 22:13:29', '2025-09-13 22:13:29'),
(340, 27, 16, '2025-09-14 18:01:57', '2025-09-14 18:01:57'),
(341, 27, 21, '2025-09-14 18:01:57', '2025-09-14 18:01:57'),
(342, 27, 3, '2025-09-14 18:01:57', '2025-09-14 18:01:57'),
(349, 26, 13, '2025-09-14 18:03:18', '2025-09-14 18:03:18'),
(350, 26, 23, '2025-09-14 18:03:18', '2025-09-14 18:03:18'),
(351, 26, 25, '2025-09-14 18:03:18', '2025-09-14 18:03:18'),
(352, 28, 15, '2025-09-15 16:26:10', '2025-09-15 16:26:10'),
(353, 28, 6, '2025-09-15 16:26:10', '2025-09-15 16:26:10'),
(354, 29, 15, '2025-09-15 16:39:10', '2025-09-15 16:39:10'),
(355, 29, 6, '2025-09-15 16:39:10', '2025-09-15 16:39:10'),
(368, 30, 14, '2025-09-15 17:01:15', '2025-09-15 17:01:15'),
(369, 30, 15, '2025-09-15 17:01:15', '2025-09-15 17:01:15'),
(370, 30, 2, '2025-09-15 17:01:15', '2025-09-15 17:01:15'),
(371, 30, 6, '2025-09-15 17:01:15', '2025-09-15 17:01:15'),
(375, 2, 14, '2025-09-15 17:08:25', '2025-09-15 17:08:25'),
(376, 2, 15, '2025-09-15 17:08:25', '2025-09-15 17:08:25'),
(377, 2, 17, '2025-09-15 17:08:25', '2025-09-15 17:08:25'),
(378, 2, 2, '2025-09-15 17:08:25', '2025-09-15 17:08:25'),
(379, 2, 23, '2025-09-15 17:08:25', '2025-09-15 17:08:25'),
(380, 3, 11, '2025-09-15 17:08:56', '2025-09-15 17:08:56'),
(381, 3, 14, '2025-09-15 17:08:56', '2025-09-15 17:08:56'),
(382, 3, 15, '2025-09-15 17:08:56', '2025-09-15 17:08:56'),
(383, 3, 17, '2025-09-15 17:08:56', '2025-09-15 17:08:56'),
(384, 3, 2, '2025-09-15 17:08:56', '2025-09-15 17:08:56'),
(385, 3, 23, '2025-09-15 17:08:56', '2025-09-15 17:08:56'),
(386, 5, 11, '2025-09-15 17:09:11', '2025-09-15 17:09:11'),
(387, 5, 14, '2025-09-15 17:09:11', '2025-09-15 17:09:11'),
(388, 5, 6, '2025-09-15 17:09:11', '2025-09-15 17:09:11'),
(389, 5, 23, '2025-09-15 17:09:11', '2025-09-15 17:09:11'),
(390, 8, 2, '2025-09-15 17:09:26', '2025-09-15 17:09:26'),
(391, 8, 23, '2025-09-15 17:09:26', '2025-09-15 17:09:26'),
(392, 19, 11, '2025-09-15 17:10:27', '2025-09-15 17:10:27'),
(393, 19, 12, '2025-09-15 17:10:27', '2025-09-15 17:10:27'),
(394, 19, 14, '2025-09-15 17:10:27', '2025-09-15 17:10:27'),
(395, 19, 20, '2025-09-15 17:10:27', '2025-09-15 17:10:27'),
(396, 19, 2, '2025-09-15 17:10:27', '2025-09-15 17:10:27'),
(397, 19, 23, '2025-09-15 17:10:27', '2025-09-15 17:10:27'),
(398, 16, 15, '2025-09-15 17:11:12', '2025-09-15 17:11:12'),
(399, 16, 2, '2025-09-15 17:11:12', '2025-09-15 17:11:12'),
(400, 16, 23, '2025-09-15 17:11:12', '2025-09-15 17:11:12'),
(401, 15, 11, '2025-09-15 17:11:50', '2025-09-15 17:11:50'),
(402, 15, 12, '2025-09-15 17:11:50', '2025-09-15 17:11:50'),
(403, 15, 14, '2025-09-15 17:11:50', '2025-09-15 17:11:50'),
(404, 15, 2, '2025-09-15 17:11:50', '2025-09-15 17:11:50'),
(405, 15, 24, '2025-09-15 17:11:50', '2025-09-15 17:11:50'),
(406, 14, 23, '2025-09-15 17:12:10', '2025-09-15 17:12:10'),
(407, 14, 24, '2025-09-15 17:12:10', '2025-09-15 17:12:10'),
(413, 31, 15, '2025-09-15 17:20:36', '2025-09-15 17:20:36'),
(414, 31, 2, '2025-09-15 17:20:36', '2025-09-15 17:20:36'),
(415, 31, 23, '2025-09-15 17:20:36', '2025-09-15 17:20:36'),
(420, 33, 15, '2025-09-15 17:38:31', '2025-09-15 17:38:31'),
(421, 33, 16, '2025-09-15 17:38:31', '2025-09-15 17:38:31'),
(422, 33, 2, '2025-09-15 17:38:31', '2025-09-15 17:38:31'),
(423, 33, 24, '2025-09-15 17:38:31', '2025-09-15 17:38:31'),
(424, 34, 2, '2025-09-15 17:43:28', '2025-09-15 17:43:28'),
(425, 34, 24, '2025-09-15 17:43:28', '2025-09-15 17:43:28'),
(426, 35, 11, '2025-09-15 17:50:05', '2025-09-15 17:50:05'),
(427, 35, 12, '2025-09-15 17:50:05', '2025-09-15 17:50:05'),
(428, 35, 14, '2025-09-15 17:50:05', '2025-09-15 17:50:05'),
(429, 35, 15, '2025-09-15 17:50:05', '2025-09-15 17:50:05'),
(430, 35, 2, '2025-09-15 17:50:05', '2025-09-15 17:50:05'),
(431, 35, 23, '2025-09-15 17:50:05', '2025-09-15 17:50:05'),
(432, 36, 3, '2025-09-15 17:55:47', '2025-09-15 17:55:47'),
(433, 36, 23, '2025-09-15 17:55:47', '2025-09-15 17:55:47'),
(434, 37, 11, '2025-09-15 18:00:42', '2025-09-15 18:00:42'),
(435, 37, 15, '2025-09-15 18:00:42', '2025-09-15 18:00:42'),
(436, 37, 3, '2025-09-15 18:00:42', '2025-09-15 18:00:42'),
(437, 38, 11, '2025-09-15 18:47:26', '2025-09-15 18:47:26'),
(438, 38, 12, '2025-09-15 18:47:26', '2025-09-15 18:47:26'),
(439, 38, 14, '2025-09-15 18:47:26', '2025-09-15 18:47:26'),
(440, 38, 3, '2025-09-15 18:47:26', '2025-09-15 18:47:26'),
(446, 40, 2, '2025-09-15 19:06:14', '2025-09-15 19:06:14'),
(447, 40, 6, '2025-09-15 19:06:14', '2025-09-15 19:06:14'),
(448, 41, 15, '2025-09-15 19:12:08', '2025-09-15 19:12:08'),
(449, 41, 23, '2025-09-15 19:12:08', '2025-09-15 19:12:08'),
(450, 41, 26, '2025-09-15 19:12:08', '2025-09-15 19:12:08'),
(451, 42, 14, '2025-09-15 19:22:20', '2025-09-15 19:22:20'),
(452, 42, 15, '2025-09-15 19:22:20', '2025-09-15 19:22:20'),
(453, 42, 2, '2025-09-15 19:22:20', '2025-09-15 19:22:20'),
(454, 42, 23, '2025-09-15 19:22:20', '2025-09-15 19:22:20'),
(455, 43, 15, '2025-09-15 19:28:49', '2025-09-15 19:28:49'),
(456, 43, 18, '2025-09-15 19:28:49', '2025-09-15 19:28:49'),
(457, 43, 3, '2025-09-15 19:28:49', '2025-09-15 19:28:49'),
(458, 43, 23, '2025-09-15 19:28:49', '2025-09-15 19:28:49'),
(459, 44, 13, '2025-09-15 19:35:32', '2025-09-15 19:35:32'),
(460, 44, 15, '2025-09-15 19:35:32', '2025-09-15 19:35:32'),
(461, 44, 16, '2025-09-15 19:35:32', '2025-09-15 19:35:32'),
(462, 44, 20, '2025-09-15 19:35:32', '2025-09-15 19:35:32'),
(463, 44, 2, '2025-09-15 19:35:32', '2025-09-15 19:35:32'),
(464, 44, 25, '2025-09-15 19:35:32', '2025-09-15 19:35:32'),
(465, 45, 11, '2025-09-15 19:39:12', '2025-09-15 19:39:12'),
(466, 45, 12, '2025-09-15 19:39:12', '2025-09-15 19:39:12'),
(467, 45, 14, '2025-09-15 19:39:12', '2025-09-15 19:39:12'),
(468, 45, 2, '2025-09-15 19:39:12', '2025-09-15 19:39:12'),
(469, 45, 23, '2025-09-15 19:39:12', '2025-09-15 19:39:12'),
(470, 46, 3, '2025-09-15 19:56:38', '2025-09-15 19:56:38'),
(471, 46, 23, '2025-09-15 19:56:38', '2025-09-15 19:56:38'),
(472, 47, 11, '2025-09-15 20:08:04', '2025-09-15 20:08:04'),
(473, 47, 12, '2025-09-15 20:08:04', '2025-09-15 20:08:04'),
(474, 47, 15, '2025-09-15 20:08:04', '2025-09-15 20:08:04'),
(475, 47, 16, '2025-09-15 20:08:04', '2025-09-15 20:08:04'),
(476, 47, 2, '2025-09-15 20:08:04', '2025-09-15 20:08:04'),
(477, 47, 23, '2025-09-15 20:08:04', '2025-09-15 20:08:04'),
(478, 48, 13, '2025-09-15 20:16:47', '2025-09-15 20:16:47'),
(479, 48, 15, '2025-09-15 20:16:47', '2025-09-15 20:16:47'),
(480, 48, 21, '2025-09-15 20:16:47', '2025-09-15 20:16:47'),
(481, 48, 6, '2025-09-15 20:16:47', '2025-09-15 20:16:47'),
(482, 48, 24, '2025-09-15 20:16:47', '2025-09-15 20:16:47'),
(483, 49, 13, '2025-09-15 23:04:31', '2025-09-15 23:04:31'),
(484, 49, 15, '2025-09-15 23:04:31', '2025-09-15 23:04:31'),
(485, 49, 16, '2025-09-15 23:04:31', '2025-09-15 23:04:31'),
(486, 49, 20, '2025-09-15 23:04:31', '2025-09-15 23:04:31'),
(487, 49, 2, '2025-09-15 23:04:31', '2025-09-15 23:04:31'),
(488, 49, 23, '2025-09-15 23:04:31', '2025-09-15 23:04:31'),
(489, 50, 13, '2025-09-15 23:10:32', '2025-09-15 23:10:32'),
(490, 50, 16, '2025-09-15 23:10:32', '2025-09-15 23:10:32'),
(491, 50, 21, '2025-09-15 23:10:32', '2025-09-15 23:10:32'),
(492, 50, 22, '2025-09-15 23:10:32', '2025-09-15 23:10:32'),
(493, 50, 3, '2025-09-15 23:10:32', '2025-09-15 23:10:32'),
(494, 51, 14, '2025-09-15 23:17:26', '2025-09-15 23:17:26'),
(495, 51, 15, '2025-09-15 23:17:26', '2025-09-15 23:17:26'),
(496, 51, 18, '2025-09-15 23:17:26', '2025-09-15 23:17:26'),
(497, 51, 20, '2025-09-15 23:17:26', '2025-09-15 23:17:26'),
(498, 51, 2, '2025-09-15 23:17:26', '2025-09-15 23:17:26'),
(499, 51, 24, '2025-09-15 23:17:26', '2025-09-15 23:17:26'),
(500, 51, 25, '2025-09-15 23:17:26', '2025-09-15 23:17:26'),
(501, 52, 11, '2025-09-15 23:24:39', '2025-09-15 23:24:39'),
(502, 52, 17, '2025-09-15 23:24:39', '2025-09-15 23:24:39'),
(503, 52, 20, '2025-09-15 23:24:39', '2025-09-15 23:24:39'),
(504, 52, 2, '2025-09-15 23:24:39', '2025-09-15 23:24:39'),
(505, 52, 23, '2025-09-15 23:24:39', '2025-09-15 23:24:39'),
(519, 55, 2, '2025-09-16 15:48:04', '2025-09-16 15:48:04'),
(520, 55, 6, '2025-09-16 15:48:04', '2025-09-16 15:48:04'),
(521, 55, 25, '2025-09-16 15:48:04', '2025-09-16 15:48:04'),
(522, 56, 11, '2025-09-16 15:51:29', '2025-09-16 15:51:29'),
(523, 56, 12, '2025-09-16 15:51:29', '2025-09-16 15:51:29'),
(524, 56, 14, '2025-09-16 15:51:29', '2025-09-16 15:51:29'),
(525, 56, 15, '2025-09-16 15:51:29', '2025-09-16 15:51:29'),
(526, 56, 2, '2025-09-16 15:51:29', '2025-09-16 15:51:29'),
(527, 56, 23, '2025-09-16 15:51:29', '2025-09-16 15:51:29'),
(528, 56, 24, '2025-09-16 15:51:29', '2025-09-16 15:51:29'),
(529, 57, 11, '2025-09-16 15:58:37', '2025-09-16 15:58:37'),
(530, 57, 12, '2025-09-16 15:58:37', '2025-09-16 15:58:37'),
(531, 57, 13, '2025-09-16 15:58:37', '2025-09-16 15:58:37'),
(532, 57, 14, '2025-09-16 15:58:37', '2025-09-16 15:58:37'),
(533, 57, 20, '2025-09-16 15:58:37', '2025-09-16 15:58:37'),
(534, 57, 3, '2025-09-16 15:58:37', '2025-09-16 15:58:37'),
(535, 58, 14, '2025-09-16 16:03:02', '2025-09-16 16:03:02'),
(536, 58, 15, '2025-09-16 16:03:02', '2025-09-16 16:03:02'),
(537, 58, 17, '2025-09-16 16:03:02', '2025-09-16 16:03:02'),
(538, 58, 20, '2025-09-16 16:03:02', '2025-09-16 16:03:02'),
(539, 58, 21, '2025-09-16 16:03:02', '2025-09-16 16:03:02'),
(540, 58, 3, '2025-09-16 16:03:02', '2025-09-16 16:03:02'),
(541, 59, 11, '2025-09-16 16:49:36', '2025-09-16 16:49:36'),
(542, 59, 12, '2025-09-16 16:49:36', '2025-09-16 16:49:36'),
(543, 59, 14, '2025-09-16 16:49:36', '2025-09-16 16:49:36'),
(544, 59, 20, '2025-09-16 16:49:36', '2025-09-16 16:49:36'),
(545, 59, 21, '2025-09-16 16:49:36', '2025-09-16 16:49:36'),
(546, 59, 2, '2025-09-16 16:49:36', '2025-09-16 16:49:36'),
(547, 59, 6, '2025-09-16 16:49:36', '2025-09-16 16:49:36'),
(548, 59, 25, '2025-09-16 16:49:36', '2025-09-16 16:49:36'),
(563, 61, 13, '2025-09-16 17:02:08', '2025-09-16 17:02:08'),
(564, 61, 14, '2025-09-16 17:02:08', '2025-09-16 17:02:08'),
(565, 61, 15, '2025-09-16 17:02:08', '2025-09-16 17:02:08'),
(566, 61, 16, '2025-09-16 17:02:08', '2025-09-16 17:02:08'),
(567, 61, 20, '2025-09-16 17:02:08', '2025-09-16 17:02:08'),
(568, 61, 21, '2025-09-16 17:02:08', '2025-09-16 17:02:08'),
(569, 61, 22, '2025-09-16 17:02:08', '2025-09-16 17:02:08'),
(570, 61, 3, '2025-09-16 17:02:08', '2025-09-16 17:02:08'),
(571, 32, 11, '2025-09-16 17:09:32', '2025-09-16 17:09:32'),
(572, 32, 12, '2025-09-16 17:09:32', '2025-09-16 17:09:32'),
(573, 32, 14, '2025-09-16 17:09:32', '2025-09-16 17:09:32'),
(574, 32, 3, '2025-09-16 17:09:32', '2025-09-16 17:09:32'),
(581, 62, 11, '2025-09-16 17:16:46', '2025-09-16 17:16:46'),
(582, 62, 12, '2025-09-16 17:16:46', '2025-09-16 17:16:46'),
(583, 62, 13, '2025-09-16 17:16:46', '2025-09-16 17:16:46'),
(584, 62, 14, '2025-09-16 17:16:46', '2025-09-16 17:16:46'),
(585, 62, 20, '2025-09-16 17:16:46', '2025-09-16 17:16:46'),
(586, 62, 2, '2025-09-16 17:16:46', '2025-09-16 17:16:46'),
(607, 63, 11, '2025-09-16 19:54:45', '2025-09-16 19:54:45'),
(608, 63, 12, '2025-09-16 19:54:45', '2025-09-16 19:54:45'),
(609, 63, 14, '2025-09-16 19:54:45', '2025-09-16 19:54:45'),
(610, 63, 2, '2025-09-16 19:54:45', '2025-09-16 19:54:45'),
(616, 20, 15, '2025-09-16 20:15:49', '2025-09-16 20:15:49'),
(617, 20, 2, '2025-09-16 20:15:49', '2025-09-16 20:15:49'),
(618, 20, 25, '2025-09-16 20:15:49', '2025-09-16 20:15:49'),
(636, 39, 15, '2025-09-17 16:22:26', '2025-09-17 16:22:26'),
(637, 39, 17, '2025-09-17 16:22:26', '2025-09-17 16:22:26'),
(638, 39, 18, '2025-09-17 16:22:26', '2025-09-17 16:22:26'),
(639, 39, 2, '2025-09-17 16:22:26', '2025-09-17 16:22:26'),
(640, 39, 25, '2025-09-17 16:22:26', '2025-09-17 16:22:26'),
(641, 9, 11, '2025-09-17 16:22:39', '2025-09-17 16:22:39'),
(642, 9, 14, '2025-09-17 16:22:39', '2025-09-17 16:22:39'),
(643, 9, 15, '2025-09-17 16:22:39', '2025-09-17 16:22:39'),
(644, 9, 2, '2025-09-17 16:22:39', '2025-09-17 16:22:39'),
(645, 9, 23, '2025-09-17 16:22:39', '2025-09-17 16:22:39'),
(651, 64, 11, '2025-09-17 16:23:59', '2025-09-17 16:23:59'),
(652, 64, 12, '2025-09-17 16:23:59', '2025-09-17 16:23:59'),
(653, 64, 20, '2025-09-17 16:23:59', '2025-09-17 16:23:59'),
(654, 64, 2, '2025-09-17 16:23:59', '2025-09-17 16:23:59'),
(655, 64, 23, '2025-09-17 16:23:59', '2025-09-17 16:23:59'),
(663, 54, 11, '2025-09-22 17:04:54', '2025-09-22 17:04:54'),
(664, 54, 14, '2025-09-22 17:04:54', '2025-09-22 17:04:54'),
(665, 54, 16, '2025-09-22 17:04:54', '2025-09-22 17:04:54'),
(666, 54, 20, '2025-09-22 17:04:54', '2025-09-22 17:04:54'),
(667, 54, 2, '2025-09-22 17:04:54', '2025-09-22 17:04:54'),
(668, 54, 6, '2025-09-22 17:04:54', '2025-09-22 17:04:54'),
(669, 54, 25, '2025-09-22 17:04:54', '2025-09-22 17:04:54'),
(670, 60, 11, '2025-09-22 17:30:27', '2025-09-22 17:30:27'),
(671, 60, 12, '2025-09-22 17:30:27', '2025-09-22 17:30:27'),
(672, 60, 14, '2025-09-22 17:30:27', '2025-09-22 17:30:27'),
(673, 60, 20, '2025-09-22 17:30:27', '2025-09-22 17:30:27'),
(674, 60, 2, '2025-09-22 17:30:27', '2025-09-22 17:30:27'),
(675, 60, 25, '2025-09-22 17:30:27', '2025-09-22 17:30:27'),
(681, 53, 11, '2025-09-22 17:37:33', '2025-09-22 17:37:33'),
(682, 53, 12, '2025-09-22 17:37:33', '2025-09-22 17:37:33'),
(683, 53, 14, '2025-09-22 17:37:33', '2025-09-22 17:37:33'),
(684, 53, 20, '2025-09-22 17:37:33', '2025-09-22 17:37:33'),
(685, 53, 2, '2025-09-22 17:37:33', '2025-09-22 17:37:33'),
(686, 53, 23, '2025-09-22 17:37:33', '2025-09-22 17:37:33'),
(735, 66, 12, '2025-09-30 17:49:47', '2025-09-30 17:49:47'),
(736, 66, 3, '2025-09-30 17:49:47', '2025-09-30 17:49:47'),
(742, 12, 13, '2025-10-02 15:41:24', '2025-10-02 15:41:24'),
(743, 12, 15, '2025-10-02 15:41:24', '2025-10-02 15:41:24'),
(744, 12, 16, '2025-10-02 15:41:24', '2025-10-02 15:41:24'),
(745, 12, 2, '2025-10-02 15:41:24', '2025-10-02 15:41:24'),
(746, 12, 6, '2025-10-02 15:41:24', '2025-10-02 15:41:24'),
(757, 65, 11, '2025-12-04 18:31:47', '2025-12-04 18:31:47'),
(758, 65, 12, '2025-12-04 18:31:47', '2025-12-04 18:31:47'),
(759, 65, 20, '2025-12-04 18:31:47', '2025-12-04 18:31:47'),
(760, 65, 2, '2025-12-04 18:31:47', '2025-12-04 18:31:47'),
(761, 65, 24, '2025-12-04 18:31:47', '2025-12-04 18:31:47');

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `member_price` decimal(10,2) DEFAULT NULL,
  `compare_price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `unavailable_quantity` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `weight_unit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `product_id`, `color_id`, `size`, `price`, `member_price`, `compare_price`, `quantity`, `unavailable_quantity`, `created_at`, `updated_at`, `weight`, `weight_unit`) VALUES
(7, 4, 1, '2.6', 100.00, 75.00, 90.00, 10, 2, '2025-09-13 18:42:49', '2025-09-13 18:42:49', NULL, NULL),
(8, 4, 6, '2.7', 150.00, 120.00, 145.00, 30, 3, '2025-09-13 18:42:49', '2025-09-13 18:42:49', NULL, NULL),
(13, 6, 9, '2.6', 100.00, 80.00, 95.00, 10, 2, '2025-09-13 18:53:08', '2025-09-13 18:53:08', NULL, NULL),
(58, 11, 8, '2.6', 100.00, 60.00, 90.00, 90, 0, '2025-09-13 19:40:34', '2025-09-13 19:40:34', NULL, NULL),
(59, 11, 1, '2.7', 100.00, 20.00, 80.00, 80, 0, '2025-09-13 19:40:34', '2025-09-13 19:40:34', NULL, NULL),
(73, 13, NULL, '2.6', 30.00, NULL, NULL, 20, NULL, '2025-09-13 20:02:58', '2025-09-13 20:02:58', NULL, NULL),
(88, 17, 25, '2.4', 59.95, NULL, NULL, 0, 0, '2025-09-13 20:46:12', '2025-10-06 12:17:22', NULL, NULL),
(89, 17, 25, '2.6', 59.95, NULL, NULL, 0, 0, '2025-09-13 20:46:12', '2025-09-13 20:46:12', NULL, NULL),
(90, 17, 25, '2.8', 59.95, NULL, NULL, 0, 0, '2025-09-13 20:46:12', '2025-09-13 20:46:12', NULL, NULL),
(91, 18, 27, '2.4', 59.95, NULL, NULL, 4, 0, '2025-09-13 21:07:46', '2025-09-13 21:07:46', NULL, NULL),
(92, 18, 27, '2.6', 59.95, NULL, NULL, 1, 0, '2025-09-13 21:07:46', '2025-09-13 21:07:46', NULL, NULL),
(93, 18, 27, '2.8', 59.95, NULL, NULL, 1, 0, '2025-09-13 21:07:46', '2025-09-13 21:07:46', NULL, NULL),
(94, 18, 27, '2.10', 59.95, NULL, NULL, 1, 0, '2025-09-13 21:07:46', '2025-09-13 21:07:46', NULL, NULL),
(103, 21, 1, '2.4', 14.95, NULL, NULL, 2, 0, '2025-09-13 21:37:02', '2025-09-13 21:37:02', NULL, NULL),
(104, 22, 14, '2.8', 22.95, NULL, NULL, 1, 0, '2025-09-13 21:47:17', '2025-09-13 21:47:17', NULL, NULL),
(105, 22, 20, '2.8', 22.95, NULL, NULL, 0, 0, '2025-09-13 21:47:17', '2025-09-13 21:47:17', NULL, NULL),
(106, 23, 1, '2.6', 54.95, NULL, NULL, 2, 0, '2025-09-13 21:54:37', '2025-09-13 21:54:37', NULL, NULL),
(107, 24, 1, '2.6', 39.95, NULL, NULL, 2, 0, '2025-09-13 22:04:47', '2025-09-13 22:04:47', NULL, NULL),
(108, 24, 1, '2.8', 39.95, NULL, NULL, 2, 0, '2025-09-13 22:04:47', '2025-09-13 22:04:47', NULL, NULL),
(109, 25, 1, '2.6', 24.95, NULL, NULL, 1, 0, '2025-09-13 22:13:29', '2025-09-13 22:13:29', NULL, NULL),
(120, 27, 25, '2.4', 59.95, NULL, NULL, 1, 0, '2025-09-14 18:01:57', '2025-09-14 18:01:57', NULL, NULL),
(127, 26, 1, '2.4', 49.95, NULL, NULL, 6, 0, '2025-09-14 18:03:18', '2025-09-14 18:03:18', NULL, NULL),
(128, 26, 1, '2.8', 49.95, NULL, NULL, 0, 0, '2025-09-14 18:03:18', '2025-09-14 18:03:18', NULL, NULL),
(129, 26, 1, '2.10', 49.95, NULL, NULL, 4, 0, '2025-09-14 18:03:18', '2025-09-14 18:03:18', NULL, NULL),
(130, 28, 16, '2.4', 9.95, NULL, NULL, 1, 0, '2025-09-15 16:26:10', '2025-09-15 16:26:10', NULL, NULL),
(131, 29, 14, '2.4', 9.95, NULL, NULL, 2, 0, '2025-09-15 16:39:10', '2025-09-15 16:39:10', NULL, NULL),
(135, 30, 1, '2.6', 39.95, NULL, NULL, 6, 0, '2025-09-15 17:01:15', '2025-09-15 17:01:15', NULL, NULL),
(139, 2, 1, '2.4', 49.95, NULL, NULL, 1, 0, '2025-09-15 17:08:25', '2025-09-15 17:08:25', NULL, NULL),
(140, 3, 1, '2.8', 39.95, NULL, NULL, 2, 0, '2025-09-15 17:08:56', '2025-09-15 17:08:56', NULL, NULL),
(141, 3, 1, '2.10', 39.95, NULL, NULL, 2, 0, '2025-09-15 17:08:56', '2025-09-15 17:08:56', NULL, NULL),
(142, 5, 1, '2.4', 14.95, NULL, NULL, 1, 0, '2025-09-15 17:09:11', '2025-09-15 17:09:11', NULL, NULL),
(143, 8, 1, '2.8', 49.95, NULL, NULL, 16, 0, '2025-09-15 17:09:26', '2025-09-15 17:09:26', NULL, NULL),
(144, 8, 1, '2.10', 49.95, NULL, NULL, 16, 0, '2025-09-15 17:09:26', '2025-09-15 17:09:26', NULL, NULL),
(145, 8, 1, '2.12', 49.95, NULL, NULL, 11, 0, '2025-09-15 17:09:26', '2025-09-15 17:09:26', NULL, NULL),
(146, 19, 14, '2.4', 59.95, NULL, NULL, 1, 0, '2025-09-15 17:10:27', '2025-09-15 17:10:27', NULL, NULL),
(147, 19, 14, '2.6', 59.95, NULL, NULL, 0, 0, '2025-09-15 17:10:27', '2025-09-15 17:10:27', NULL, NULL),
(148, 19, 14, '2.8', 59.95, NULL, NULL, 0, 0, '2025-09-15 17:10:27', '2025-09-15 17:10:27', NULL, NULL),
(149, 19, 14, '2.10', 59.95, NULL, NULL, 2, 0, '2025-09-15 17:10:27', '2025-09-15 17:10:27', NULL, NULL),
(150, 16, 27, '2.4', 59.95, NULL, NULL, 1, 0, '2025-09-15 17:11:12', '2025-09-15 17:11:12', NULL, NULL),
(151, 16, 27, '2.10', 59.95, NULL, NULL, 1, 0, '2025-09-15 17:11:12', '2025-09-15 17:11:12', NULL, NULL),
(152, 15, 14, '2.4', 59.95, NULL, NULL, 1, 0, '2025-09-15 17:11:50', '2025-09-15 17:11:50', NULL, NULL),
(153, 14, NULL, '2.4', 59.95, NULL, NULL, 2, 0, '2025-09-15 17:12:10', '2025-09-15 17:12:10', NULL, NULL),
(154, 14, NULL, '2.6', 59.95, NULL, NULL, 0, 0, '2025-09-15 17:12:10', '2025-09-15 17:12:10', NULL, NULL),
(155, 14, NULL, '2.8', 59.95, NULL, NULL, 0, 0, '2025-09-15 17:12:10', '2025-09-15 17:12:10', NULL, NULL),
(156, 14, NULL, '2.10', 59.95, NULL, NULL, 0, 0, '2025-09-15 17:12:10', '2025-09-15 17:12:10', NULL, NULL),
(160, 31, 27, '2.4', 28.95, NULL, NULL, 8, 0, '2025-09-15 17:20:36', '2025-09-15 17:20:36', NULL, NULL),
(161, 31, 27, '2.6', 28.95, NULL, NULL, 7, 0, '2025-09-15 17:20:36', '2025-09-15 17:20:36', NULL, NULL),
(162, 31, 27, '2.8', 28.95, NULL, NULL, 6, 0, '2025-09-15 17:20:36', '2025-09-15 17:20:36', NULL, NULL),
(165, 33, 1, '2.2', 49.95, NULL, NULL, 2, 0, '2025-09-15 17:38:31', '2025-09-15 17:38:31', NULL, NULL),
(166, 33, 1, '2.8', 49.95, NULL, NULL, 24, 0, '2025-09-15 17:38:31', '2025-09-15 17:38:31', NULL, NULL),
(167, 33, 1, '2.10', 49.95, NULL, NULL, 6, 0, '2025-09-15 17:38:31', '2025-09-15 17:38:31', NULL, NULL),
(168, 34, 1, '2.6', 69.95, NULL, NULL, 3, 0, '2025-09-15 17:43:28', '2025-09-15 17:43:28', NULL, NULL),
(169, 35, 1, '2.6', 49.95, NULL, NULL, 6, 0, '2025-09-15 17:50:05', '2025-09-15 17:50:05', NULL, NULL),
(170, 35, 1, '2.8', 49.95, NULL, NULL, 4, 0, '2025-09-15 17:50:05', '2025-09-15 17:50:05', NULL, NULL),
(171, 35, 1, '2.10', 49.95, NULL, NULL, 4, 0, '2025-09-15 17:50:05', '2025-09-15 17:50:05', NULL, NULL),
(172, 35, 1, '2.12', 49.95, NULL, NULL, 2, 0, '2025-09-15 17:50:05', '2025-09-15 17:50:05', NULL, NULL),
(173, 36, 1, '2.8', 19.95, NULL, NULL, 1, 0, '2025-09-15 17:55:47', '2025-09-15 17:55:47', NULL, NULL),
(174, 37, 9, '2.4', 59.95, NULL, NULL, 1, 0, '2025-09-15 18:00:42', '2025-09-15 18:00:42', NULL, NULL),
(175, 37, 9, '2.6', 59.95, NULL, NULL, 1, 0, '2025-09-15 18:00:42', '2025-09-15 18:00:42', NULL, NULL),
(176, 37, 9, '2.8', 59.95, NULL, NULL, 1, 0, '2025-09-15 18:00:42', '2025-09-15 18:00:42', NULL, NULL),
(177, 37, 9, '2.10', 59.95, NULL, NULL, 1, 0, '2025-09-15 18:00:42', '2025-09-15 18:00:42', NULL, NULL),
(178, 38, 5, '2.4', 59.95, NULL, NULL, 1, 0, '2025-09-15 18:47:26', '2025-09-15 18:47:26', NULL, NULL),
(179, 38, 5, '2.6', 59.95, NULL, NULL, 1, 0, '2025-09-15 18:47:26', '2025-09-15 18:47:26', NULL, NULL),
(180, 38, 5, '2.8', 59.95, NULL, NULL, 1, 0, '2025-09-15 18:47:26', '2025-09-15 18:47:26', NULL, NULL),
(186, 40, 1, '2.4', 14.95, NULL, NULL, 1, 0, '2025-09-15 19:06:14', '2025-09-15 19:06:14', NULL, NULL),
(187, 41, 21, '2.10', 12.95, NULL, NULL, 2, 0, '2025-09-15 19:12:08', '2025-09-15 19:12:08', NULL, NULL),
(188, 42, 1, '2.10', 69.95, NULL, NULL, 11, 0, '2025-09-15 19:22:20', '2025-09-15 19:22:20', NULL, NULL),
(189, 43, 1, '2.4', 14.95, NULL, NULL, 6, 0, '2025-09-15 19:28:49', '2025-09-15 19:28:49', NULL, NULL),
(190, 43, 1, '2.6', 14.95, NULL, NULL, 6, 0, '2025-09-15 19:28:49', '2025-09-15 19:28:49', NULL, NULL),
(191, 43, 1, '2.8', 14.95, NULL, NULL, 10, 0, '2025-09-15 19:28:49', '2025-09-15 19:28:49', NULL, NULL),
(192, 43, 1, '2.10', 14.95, NULL, NULL, 10, 0, '2025-09-15 19:28:49', '2025-09-15 19:28:49', NULL, NULL),
(193, 44, 1, '2.2', 18.95, NULL, NULL, 1, 0, '2025-09-15 19:35:32', '2025-09-15 19:35:32', NULL, NULL),
(194, 44, 1, '2.6', 18.95, NULL, NULL, 0, 0, '2025-09-15 19:35:32', '2025-09-15 19:35:32', NULL, NULL),
(195, 44, 1, '2.8', 18.95, NULL, NULL, 0, 0, '2025-09-15 19:35:32', '2025-09-15 19:35:32', NULL, NULL),
(196, 44, 1, '2.10', 18.95, NULL, NULL, 0, 0, '2025-09-15 19:35:32', '2025-09-15 19:35:32', NULL, NULL),
(197, 45, 1, '2.4', 49.95, NULL, NULL, 18, 0, '2025-09-15 19:39:12', '2025-09-15 19:39:12', NULL, NULL),
(198, 46, 1, '2.8', 14.95, NULL, NULL, 10, 0, '2025-09-15 19:56:38', '2025-09-15 19:56:38', NULL, NULL),
(199, 46, 1, '2.10', 14.95, NULL, NULL, 0, 0, '2025-09-15 19:56:38', '2025-09-15 19:56:38', NULL, NULL),
(200, 46, 1, '2.12', 14.95, NULL, NULL, 8, 0, '2025-09-15 19:56:38', '2025-09-15 19:56:38', NULL, NULL),
(201, 47, 1, '2.4', 44.95, NULL, NULL, 1, 0, '2025-09-15 20:08:04', '2025-09-15 20:08:04', NULL, NULL),
(202, 47, 1, '2.10', 44.95, NULL, NULL, 6, 0, '2025-09-15 20:08:04', '2025-09-15 20:08:04', NULL, NULL),
(203, 48, 25, '2.8', 9.95, NULL, NULL, 1, 0, '2025-09-15 20:16:47', '2025-09-15 20:16:47', NULL, NULL),
(204, 49, 1, '2.4', 44.95, NULL, NULL, 1, 0, '2025-09-15 23:04:31', '2025-09-15 23:04:31', NULL, NULL),
(205, 49, 1, '2.8', 44.95, NULL, NULL, 0, 0, '2025-09-15 23:04:31', '2025-09-15 23:04:31', NULL, NULL),
(206, 49, 1, '2.10', 44.95, NULL, NULL, 7, 0, '2025-09-15 23:04:31', '2025-09-15 23:04:31', NULL, NULL),
(207, 50, 27, '2.4', 59.95, NULL, NULL, 1, 0, '2025-09-15 23:10:32', '2025-09-15 23:10:32', NULL, NULL),
(208, 50, 27, '2.6', 59.95, NULL, NULL, 2, 0, '2025-09-15 23:10:32', '2025-09-15 23:10:32', NULL, NULL),
(209, 50, 27, '2.8', 59.95, NULL, NULL, 1, 0, '2025-09-15 23:10:32', '2025-09-15 23:10:32', NULL, NULL),
(210, 51, 1, '2.4', 69.95, NULL, NULL, 6, 0, '2025-09-15 23:17:26', '2025-09-15 23:17:26', NULL, NULL),
(211, 52, 1, '2.4', 49.95, NULL, NULL, 1, 0, '2025-09-15 23:24:39', '2025-09-15 23:24:39', NULL, NULL),
(212, 53, 1, '2.4', 39.95, NULL, NULL, 0, 0, '2025-09-15 23:30:36', '2025-09-22 17:37:33', NULL, NULL),
(213, 53, 1, '2.6', 39.95, NULL, NULL, 0, 0, '2025-09-15 23:30:36', '2025-09-22 17:37:33', NULL, NULL),
(214, 53, 1, '2.8', 39.95, NULL, NULL, 0, 0, '2025-09-15 23:30:36', '2025-09-22 17:37:33', NULL, NULL),
(215, 53, 1, '2.10', 39.95, NULL, NULL, 0, 0, '2025-09-15 23:30:36', '2025-09-22 17:37:33', NULL, NULL),
(216, 54, 25, '2.4', 9.95, NULL, NULL, 0, 0, '2025-09-16 15:44:04', '2025-09-16 15:44:04', NULL, NULL),
(217, 54, 25, '2.6', 9.95, NULL, NULL, 1, 0, '2025-09-16 15:44:04', '2025-09-16 15:44:04', NULL, NULL),
(218, 54, 25, '2.8', 9.95, NULL, NULL, 0, 0, '2025-09-16 15:44:04', '2025-09-16 15:44:04', NULL, NULL),
(219, 55, 1, '2.6', 9.95, NULL, NULL, 2, 0, '2025-09-16 15:48:04', '2025-09-16 15:48:04', NULL, NULL),
(220, 56, 1, '2.10', 39.95, NULL, NULL, 1, 0, '2025-09-16 15:51:29', '2025-09-16 15:51:29', NULL, NULL),
(221, 57, 9, '2.4', 59.95, NULL, NULL, 2, 0, '2025-09-16 15:58:37', '2025-09-16 15:58:37', NULL, NULL),
(222, 57, 9, '2.6', 59.95, NULL, NULL, 1, 0, '2025-09-16 15:58:37', '2025-09-16 15:58:37', NULL, NULL),
(223, 57, 9, '2.10', 59.95, NULL, NULL, 1, 0, '2025-09-16 15:58:37', '2025-09-16 15:58:37', NULL, NULL),
(224, 58, 5, '2.4', 59.95, NULL, NULL, 1, 0, '2025-09-16 16:03:02', '2025-09-16 16:03:02', NULL, NULL),
(225, 58, 5, '2.8', 59.95, NULL, NULL, 1, 0, '2025-09-16 16:03:02', '2025-09-16 16:03:02', NULL, NULL),
(226, 59, 27, '2.4', 9.95, NULL, NULL, 2, 0, '2025-09-16 16:49:36', '2025-09-16 16:49:36', NULL, NULL),
(227, 60, 1, '2.4', 39.95, NULL, NULL, 3, 0, '2025-09-16 16:58:03', '2025-09-27 15:58:16', NULL, NULL),
(228, 60, 1, '2.6', 39.95, NULL, NULL, 5, 0, '2025-09-16 16:58:03', '2025-09-16 16:58:03', NULL, NULL),
(229, 60, 1, '2.8', 39.95, NULL, NULL, 7, 0, '2025-09-16 16:58:03', '2025-09-16 16:58:03', NULL, NULL),
(230, 60, 1, '2.10', 39.95, NULL, NULL, 2, 0, '2025-09-16 16:58:03', '2025-09-16 16:58:03', NULL, NULL),
(232, 61, 6, '2.6', 59.95, NULL, NULL, 1, 0, '2025-09-16 17:02:08', '2025-09-16 17:02:08', NULL, NULL),
(233, 32, 22, '2.4', 59.95, NULL, NULL, 1, 0, '2025-09-16 17:09:32', '2025-09-16 17:09:32', NULL, NULL),
(234, 32, 22, '2.6', 59.95, NULL, NULL, 1, 0, '2025-09-16 17:09:32', '2025-09-16 17:09:32', NULL, NULL),
(245, 63, 14, '20\"', 8.95, NULL, NULL, 0, 0, '2025-09-16 19:54:45', '2025-09-16 19:54:45', NULL, NULL),
(246, 63, 9, '20\"', 8.95, NULL, NULL, 0, 0, '2025-09-16 19:54:45', '2025-09-16 19:54:45', NULL, NULL),
(248, 20, 3, '2.4', 59.95, NULL, NULL, 0, 0, '2025-09-16 20:15:49', '2025-09-16 20:15:49', NULL, NULL),
(249, 20, 3, '2.6', 59.95, NULL, NULL, 0, 0, '2025-09-16 20:15:49', '2025-09-16 20:15:49', NULL, NULL),
(250, 20, 3, '2.8', 59.95, NULL, NULL, 0, 0, '2025-09-16 20:15:49', '2025-09-16 20:15:49', NULL, NULL),
(251, 20, 3, '2.10', 59.95, NULL, NULL, 0, 0, '2025-09-16 20:15:49', '2025-09-16 20:15:49', NULL, NULL),
(256, 39, 1, '2.2', 59.95, NULL, NULL, 15, 0, '2025-09-17 16:22:26', '2025-09-17 16:22:26', NULL, NULL),
(257, 39, 1, '2.4', 59.95, NULL, NULL, 11, 0, '2025-09-17 16:22:26', '2025-09-17 16:22:26', NULL, NULL),
(258, 39, 1, '2.6', 59.93, NULL, NULL, 6, 0, '2025-09-17 16:22:26', '2025-09-17 16:22:26', NULL, NULL),
(259, 39, 1, '2.8', 59.95, NULL, NULL, 1, 0, '2025-09-17 16:22:26', '2025-09-17 16:22:26', NULL, NULL),
(260, 39, 1, '2.10', 59.95, NULL, NULL, 7, 0, '2025-09-17 16:22:26', '2025-09-17 16:22:26', NULL, NULL),
(261, 9, 1, '2.6', 39.95, NULL, NULL, 1, 0, '2025-09-17 16:22:39', '2025-09-27 15:58:16', NULL, NULL),
(262, 9, 1, '2.8', 39.95, NULL, NULL, 1, 0, '2025-09-17 16:22:39', '2025-09-27 15:58:16', NULL, NULL),
(263, 9, 1, '2.10', 39.95, NULL, NULL, 1, 0, '2025-09-17 16:22:39', '2025-09-27 15:58:16', NULL, NULL),
(265, 64, 1, '18', 294.95, NULL, NULL, 1, 0, '2025-09-17 16:23:59', '2025-09-17 16:23:59', NULL, NULL),
(266, 66, 1, '2.6', 100.00, NULL, NULL, 9, 0, '2025-09-30 17:49:47', '2025-09-30 17:53:32', NULL, NULL),
(267, 66, 3, '2.6', 90.00, NULL, NULL, 0, 0, '2025-09-30 17:49:47', '2025-09-30 17:49:47', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(255) NOT NULL DEFAULT 'material',
  `top_listed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `description`, `status`, `type`, `top_listed`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Testing Attr', 'testing-attr-68bde9614d087', 'This is testing attribute you can del from admin', 1, 'style', 0, '2025-09-07 20:14:56', '2025-09-09 18:59:45', '2025-09-09 18:59:45'),
(2, 'Gold-Plated:', 'gold-plated-68c0791a500cb', 'Durable base metal with a thin layer of real gold for a luxurious look.', 1, 'material', 0, '2025-09-09 18:59:38', '2025-09-09 18:59:38', NULL),
(3, 'Plastic', 'plastic-68c0793c6935a', 'Lightweight and versatile material, often used for everyday wear.', 1, 'material', 0, '2025-09-09 19:00:12', '2025-09-09 19:00:12', NULL),
(4, 'Silk', 'silk-68c07963af9cd', 'Soft, natural fabric prized for its smooth texture and elegant sheen', 1, 'material', 0, '2025-09-09 19:00:51', '2025-09-09 19:00:51', NULL),
(5, 'Other:', 'other-68c07980d0ecf', 'Unique materials outside standard categories, offering distinct style.', 1, 'material', 0, '2025-09-09 19:01:20', '2025-09-09 19:01:20', NULL),
(6, 'Glass', 'glass-68c0799ad164c', 'Smooth, polished surface with a glossy, transparent or colored finish.', 1, 'material', 0, '2025-09-09 19:01:46', '2025-09-09 19:01:46', NULL),
(7, 'Acrylic', 'acrylic-68c079b262ed8', 'Lightweight, durable plastic with a clear or colorful appearance.', 1, 'material', 0, '2025-09-09 19:02:10', '2025-09-09 19:02:10', NULL),
(8, 'Gold', 'gold-68c079cbe774b', 'Precious metal known for its timeless shine, purity, and value.', 1, 'material', 0, '2025-09-09 19:02:35', '2025-09-09 19:02:35', NULL),
(9, 'Silver', 'silver-68c07a11eabef', 'Classic precious metal with a bright, polished finish and durability.', 1, 'material', 0, '2025-09-09 19:03:45', '2025-09-09 19:03:45', NULL),
(10, 'Gold Plated', 'gold-plated-68c07eda7c8d7', 'Durable base metal with a thin layer of real gold for a luxurious look.', 1, 'material', 0, '2025-09-09 19:24:10', '2025-09-09 19:24:18', '2025-09-09 19:24:18'),
(11, 'Bridal', 'bridal-68c07f112dc9b', 'Jewelry designed for the bride across major rituals like Choora Ceremony, Saat Phere/Saptapadi, Anand Karaj, Reception, and Kanyadaan.', 1, 'style', 0, '2025-09-09 19:25:05', '2025-09-09 19:25:05', NULL),
(12, 'Bridesmaid', 'bridesmaid-68c07f2c9abe5', 'Coordinated looks for bridal parties, especially at Mehndi, Sangeet, Baraat, and Reception.', 1, 'style', 0, '2025-09-09 19:25:32', '2025-09-09 19:25:32', NULL),
(13, 'Everyday', 'everyday-68c07f8a532fe', 'Lightweight jewelry for casual use; sometimes worn at smaller pre-events like Shagun, Maiya, or Gharoli.', 1, 'style', 0, '2025-09-09 19:27:06', '2025-09-09 19:27:06', NULL),
(14, 'Festive', 'festive-68c07fb355f21', 'Vibrant, celebratory styles perfect for Haldi, Mehndi, Jaago, and wider cultural festivals.', 1, 'style', 0, '2025-09-09 19:27:47', '2025-09-09 19:27:47', NULL),
(15, 'Statement', 'statement-68c080d90d9e4', 'Bold jewelry made with stones, pearls, or kundan work, ideal for spotlight occasions', 1, 'style', 0, '2025-09-09 19:32:41', '2025-09-09 19:32:41', NULL),
(16, 'Subtle', 'subtle-68c080ede912f', 'Minimal and refined styles in silver, simple gold, or glass, suited for intimate gatherings or daily use.', 1, 'style', 0, '2025-09-09 19:33:01', '2025-09-09 19:33:01', NULL),
(17, 'Traditional', 'traditional-68c0810a7d92d', 'Heritage-inspired jewelry (kundan, pearls, stone bangles) tied to cultural or religious ceremonies like Anand Karaj or Mangalsutra rituals.', 1, 'style', 0, '2025-09-09 19:33:30', '2025-09-09 19:33:30', NULL),
(18, 'Contemporary', 'contemporary-68c08126c6672', 'Modern interpretations of bangles, necklaces, and earrings blending acrylic, gold-plated, or mixed materials for today’s fashion', 1, 'style', 0, '2025-09-09 19:33:58', '2025-09-09 19:33:58', NULL),
(19, 'Customizable', 'customizable-68c08141298b7', 'Personalized pieces such as the Build-Your-Own Bangle Box, adaptable for any wedding or festive look', 1, 'style', 0, '2025-09-09 19:34:25', '2025-09-09 19:34:25', NULL),
(20, 'Gift Set', 'gift-set-68c0815ca468c', 'Pre-packaged collections in bangle boxes or jewelry sets, perfect for Shagun, Engagement, or Griha Pravesam gifting.', 1, 'style', 0, '2025-09-09 19:34:52', '2025-09-09 19:34:52', NULL),
(21, 'Stackable', 'stackable-68c081856a0f7', 'Bangles designed for layering,', 1, 'style', 0, '2025-09-09 19:35:33', '2025-09-09 19:35:33', NULL),
(22, 'Kids', 'kids-68c0819eb9c48', 'Jewelry styled for children, lightweight and colorful, often gifted during family events.', 1, 'style', 0, '2025-09-09 19:35:58', '2025-09-09 19:35:58', NULL),
(23, 'Stone (zircon)', 'stone-zircon-68c872580c547', NULL, 1, 'material', 0, '2025-09-13 18:25:19', '2025-09-15 20:08:56', NULL),
(24, 'Metal', 'metal-68c5cbc1b548c', NULL, 1, 'material', 0, '2025-09-13 19:53:37', '2025-09-13 19:53:37', NULL),
(25, 'Bead Accents', 'bead-accents-68c5d7ee54dcb', NULL, 1, 'material', 0, '2025-09-13 20:45:34', '2025-09-13 20:45:34', NULL),
(26, 'Resin', 'resin-68c864965fcca', NULL, 1, 'material', 0, '2025-09-15 19:10:14', '2025-09-15 19:10:14', NULL),
(27, 'test', 'test-6931d3bd1a9d8', NULL, 1, 'style', 0, '2025-12-04 18:32:29', '2025-12-04 18:32:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `latitude` bigint(20) UNSIGNED DEFAULT NULL,
  `longitude` bigint(20) UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `total_points` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `total_shippings` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stripe_customer_id` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'user',
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `customer_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `address`, `country`, `latitude`, `longitude`, `email_verified_at`, `password`, `remember_token`, `total_points`, `total_shippings`, `stripe_customer_id`, `session_id`, `created_at`, `updated_at`, `type`, `is_guest`, `customer_id`) VALUES
(1, 'Admin', NULL, 'bangles@admin.com', NULL, NULL, NULL, NULL, NULL, '$2y$12$Yn/ZDQIDO.cOZVD3UcA0aenp4PJUsVphaqlcoH9c49/1efMSV1ONG', NULL, 1798, 39, 'cus_T2K2gFTcpafjpn', 'e191bd02-a091-468f-81bb-cf4083a44ad4', '2025-09-07 20:01:45', '2025-12-05 00:43:19', 'admin', 0, NULL),
(2, 'Tayyeb', 'Gondal', 'tayyebgondal5@gmail.com', 'Address', 'AF', NULL, NULL, NULL, '$2y$12$KKXDlJcJpYG4D4YymH7Eu.ueH5Hyl61uAwBaJV.EkISpkkyN29pYS', NULL, 10, 0, NULL, '9874a4e0-967e-424e-b0e0-7de1a5959c78', '2025-09-11 16:44:32', '2025-09-30 17:30:17', 'user', 0, 'CUST-001'),
(3, 'Test ', 'Customer', 'test@email.com', NULL, NULL, NULL, NULL, NULL, '$2y$12$hLC6HPSDLJVSkdc26wL8suOQ.SUhvxDapJClZvY51yLjgp/sTAB/q', NULL, 0, 0, NULL, NULL, '2025-09-30 17:53:32', '2025-09-30 17:53:32', 'user', 1, 'CUST-003'),
(4, 'Ismael', 'Akingbola Mujidat', 'ismael@growthtapdigital.com', '181, Bedford Road', 'AF', NULL, NULL, NULL, '$2y$12$o2KXZe2.8.7VKaiBOLj0AuHMMVkqbYNgfN9At4qAGYjLqnkGsCVS6', NULL, 0, 0, NULL, 'd64a3bfd-d7c9-4cbc-9d20-2f40fb62f9f0', '2025-12-04 20:42:20', '2025-12-04 20:42:27', 'user', 0, 'CUST-004'),
(5, 'Hassaan', 'Shahid', 'hassaandeveloperr@gmail.com', 'room no. 89, Sir Syed hall, Uet Lahore', 'AX', NULL, NULL, NULL, '$2y$12$M67nAanGHudc4RPTKkBXbeg8IRC912Y0RSk1mguEA8qERYAoY1y8S', NULL, 0, 0, NULL, NULL, '2026-02-07 17:30:56', '2026-02-07 17:30:56', 'user', 0, 'CUST-005'),
(6, 'Hassaan', 'Shahid', 'hassanbwp116@gmail.com', 'House No 3A Board of Intermediate and Secondary Education cheema town bahawalpur', 'AF', NULL, NULL, NULL, '$2y$12$jWn0Iy9vBBB9WFqoic7Lh.JLu7BVBTGShzEXtsdF0.8sSqOBQ4gBy', NULL, 0, 0, NULL, NULL, '2026-02-09 15:49:25', '2026-02-09 15:49:25', 'user', 0, 'CUST-006');

-- --------------------------------------------------------

--
-- Table structure for table `user_rewards`
--

CREATE TABLE `user_rewards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bundle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('shipping','points') NOT NULL,
  `type_value` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_rewards`
--

INSERT INTO `user_rewards` (`id`, `user_id`, `bundle_id`, `type`, `type_value`, `status`, `created_at`, `updated_at`) VALUES
(11, 1, 18, 'points', 1798, 'pending', '2025-12-04 21:28:17', '2025-12-04 21:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `session_id` char(36) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `session_id`, `product_id`, `variation_id`, `created_at`, `updated_at`) VALUES
(2, 1, NULL, 20, NULL, '2025-09-17 16:16:12', '2025-09-17 16:16:12'),
(3, 1, NULL, 9, 261, '2025-09-17 16:24:19', '2025-09-17 16:24:19'),
(10, 1, NULL, 12, NULL, '2025-09-23 18:19:55', '2025-09-23 18:19:55'),
(14, 2, NULL, 17, NULL, '2025-10-06 12:17:52', '2025-10-06 12:17:52'),
(15, 2, NULL, 18, NULL, '2025-10-06 12:17:56', '2025-10-06 12:17:56'),
(16, 2, NULL, 20, NULL, '2025-10-06 16:42:12', '2025-10-06 16:42:12'),
(18, 2, NULL, 12, NULL, '2025-10-06 16:42:38', '2025-10-06 16:42:38'),
(19, 1, NULL, 59, NULL, '2025-10-10 15:27:35', '2025-10-10 15:27:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bangle_box_colors`
--
ALTER TABLE `bangle_box_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bangle_box_colors_bangle_box_size_id_foreign` (`bangle_box_size_id`);

--
-- Indexes for table `bangle_box_sizes`
--
ALTER TABLE `bangle_box_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bangle_cart_colors`
--
ALTER TABLE `bangle_cart_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bangle_cart_colors_cart_id_foreign` (`cart_id`),
  ADD KEY `bangle_cart_colors_color_id_foreign` (`color_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`),
  ADD KEY `blogs_category_id_foreign` (`category_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `box_sizes`
--
ALTER TABLE `box_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bundles`
--
ALTER TABLE `bundles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bundles_user_id_foreign` (`user_id`);

--
-- Indexes for table `bundle_products`
--
ALTER TABLE `bundle_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bundle_products_bundle_id_foreign` (`bundle_id`),
  ADD KEY `bundle_products_product_id_foreign` (`product_id`),
  ADD KEY `bundle_products_variation_id_foreign` (`variation_id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cards_user_id_index` (`user_id`),
  ADD KEY `cards_stripe_pm_id_index` (`stripe_pm_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_variation_id_foreign` (`variation_id`),
  ADD KEY `carts_bangle_box_id_foreign` (`bangle_box_id`),
  ADD KEY `carts_bangle_size_id_foreign` (`bangle_size_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `category_boxes`
--
ALTER TABLE `category_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_boxes_category_id_foreign` (`category_id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collections_slug_unique` (`slug`);

--
-- Indexes for table `collection_products`
--
ALTER TABLE `collection_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collection_products_collection_id_product_id_unique` (`collection_id`,`product_id`),
  ADD KEY `collection_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gift_card_codes`
--
ALTER TABLE `gift_card_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gift_card_codes_code_unique` (`code`);

--
-- Indexes for table `gift_card_histories`
--
ALTER TABLE `gift_card_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gift_card_histories_gift_card_id_foreign` (`gift_card_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_id_unique` (`order_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `page_settings`
--
ALTER TABLE `page_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_category_box_id_foreign` (`category_box_id`),
  ADD KEY `products_color_id_foreign` (`color_id`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_notify`
--
ALTER TABLE `product_notify`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_notify_user_id_foreign` (`user_id`),
  ADD KEY `product_notify_product_id_foreign` (`product_id`),
  ADD KEY `product_notify_variation_id_foreign` (`variation_id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_tags_product_id_tag_id_unique` (`product_id`,`tag_id`),
  ADD KEY `product_tags_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_product_id_foreign` (`product_id`),
  ADD KEY `product_variations_color_id_foreign` (`color_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_customer_id_unique` (`customer_id`);

--
-- Indexes for table `user_rewards`
--
ALTER TABLE `user_rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_rewards_user_id_foreign` (`user_id`),
  ADD KEY `user_rewards_bundle_id_foreign` (`bundle_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bangle_box_colors`
--
ALTER TABLE `bangle_box_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `bangle_box_sizes`
--
ALTER TABLE `bangle_box_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bangle_cart_colors`
--
ALTER TABLE `bangle_cart_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `box_sizes`
--
ALTER TABLE `box_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bundles`
--
ALTER TABLE `bundles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `bundle_products`
--
ALTER TABLE `bundle_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `category_boxes`
--
ALTER TABLE `category_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `collection_products`
--
ALTER TABLE `collection_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_card_codes`
--
ALTER TABLE `gift_card_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gift_card_histories`
--
ALTER TABLE `gift_card_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `page_settings`
--
ALTER TABLE `page_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product_notify`
--
ALTER TABLE `product_notify`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=762;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_rewards`
--
ALTER TABLE `user_rewards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bangle_box_colors`
--
ALTER TABLE `bangle_box_colors`
  ADD CONSTRAINT `bangle_box_colors_bangle_box_size_id_foreign` FOREIGN KEY (`bangle_box_size_id`) REFERENCES `bangle_box_sizes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `bangle_cart_colors`
--
ALTER TABLE `bangle_cart_colors`
  ADD CONSTRAINT `bangle_cart_colors_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bangle_cart_colors_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `bangle_box_colors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bundles`
--
ALTER TABLE `bundles`
  ADD CONSTRAINT `bundles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bundle_products`
--
ALTER TABLE `bundle_products`
  ADD CONSTRAINT `bundle_products_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bundle_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bundle_products_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_bangle_box_id_foreign` FOREIGN KEY (`bangle_box_id`) REFERENCES `box_sizes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_bangle_size_id_foreign` FOREIGN KEY (`bangle_size_id`) REFERENCES `bangle_box_sizes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_boxes`
--
ALTER TABLE `category_boxes`
  ADD CONSTRAINT `category_boxes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `collection_products`
--
ALTER TABLE `collection_products`
  ADD CONSTRAINT `collection_products_collection_id_foreign` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collection_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gift_card_histories`
--
ALTER TABLE `gift_card_histories`
  ADD CONSTRAINT `gift_card_histories_gift_card_id_foreign` FOREIGN KEY (`gift_card_id`) REFERENCES `gift_card_codes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_box_id_foreign` FOREIGN KEY (`category_box_id`) REFERENCES `category_boxes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `product_colors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_notify`
--
ALTER TABLE `product_notify`
  ADD CONSTRAINT `product_notify_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_notify_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_notify_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `product_colors` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_rewards`
--
ALTER TABLE `user_rewards`
  ADD CONSTRAINT `user_rewards_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_rewards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
