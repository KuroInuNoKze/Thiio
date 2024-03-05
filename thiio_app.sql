-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 05-03-2024 a las 00:27:48
-- Versión del servidor: 8.0.36-0ubuntu0.22.04.1
-- Versión de PHP: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `thiio_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2024_02_28_000000_create_users_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', 'a303b3fd40286dfb695b6043df790ced295ea621bdff5ff04da6cc0bd6c912b2', '[\"*\"]', NULL, NULL, '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(2, 'App\\Models\\User', 1, 'token', '53950842c8d88ddcedd2f75692308f6288ebb4d8cc3569c3f93d367316670a3e', '[\"*\"]', '2024-02-29 04:07:52', NULL, '2024-02-29 04:05:22', '2024-02-29 04:07:52'),
(3, 'App\\Models\\User', 1, 'token', '30e2ec6612f3d2451c2315e8c769b36af4234edb871178a0ef07efb9663617ee', '[\"*\"]', '2024-03-05 11:17:03', NULL, '2024-03-05 10:42:29', '2024-03-05 11:17:03'),
(4, 'App\\Models\\User', 1, 'token', 'bd1290a8291479b314373d38d34e42454b4f3d911779d9946d83012f83e53816', '[\"*\"]', '2024-03-05 11:17:18', NULL, '2024-03-05 11:17:06', '2024-03-05 11:17:18'),
(5, 'App\\Models\\User', 1, 'token', 'da63bc8a49211efb37c714532fc5effce01a2da6ee1aba4a3d697093fa426693', '[\"*\"]', '2024-03-05 11:19:29', NULL, '2024-03-05 11:17:46', '2024-03-05 11:19:29'),
(6, 'App\\Models\\User', 1, 'token', 'c9b7ba8424fe9c88e0060e8bdf0be71465ccdbb9f8c04e18bd814bc0ea0822ea', '[\"*\"]', '2024-03-05 11:19:33', NULL, '2024-03-05 11:19:31', '2024-03-05 11:19:33'),
(7, 'App\\Models\\User', 3, 'token', 'a22750bedaa06d6453264c37f46a4349bdf77810a68974247c01ff563a2e2fb8', '[\"*\"]', '2024-03-05 11:26:41', NULL, '2024-03-05 11:19:37', '2024-03-05 11:26:41'),
(8, 'App\\Models\\User', 1, 'token', 'c6d0363902ae8542b4bd57e651af094c13b4fe0a8b7fd5da46469854594ad43d', '[\"*\"]', '2024-03-05 11:27:40', NULL, '2024-03-05 11:26:45', '2024-03-05 11:27:40'),
(9, 'App\\Models\\User', 123, 'token', 'a96b7a1ca8d91921863fc055170d44896273bce34f151dbefe71b4eca2aaee0c', '[\"*\"]', '2024-03-05 11:27:57', NULL, '2024-03-05 11:27:42', '2024-03-05 11:27:57'),
(10, 'App\\Models\\User', 123, 'token', 'ff038997dca62f66848dc3ae1aaa108c10d9cabbd964989a94d4e0cfcc49ca92', '[\"*\"]', '2024-03-05 11:31:30', NULL, '2024-03-05 11:28:02', '2024-03-05 11:31:30'),
(11, 'App\\Models\\User', 123, 'token', '35047610bf4f9aed9effad5ee92b2e06143b7cdae4bc1847ead57c34865d4bb9', '[\"*\"]', '2024-03-05 11:31:51', NULL, '2024-03-05 11:31:41', '2024-03-05 11:31:51'),
(12, 'App\\Models\\User', 3, 'token', '4820b203c5d1b2949262bd5031ec9124eb2bb70bab53667489f7b7636ff0d1de', '[\"*\"]', '2024-03-05 12:04:28', NULL, '2024-03-05 11:31:55', '2024-03-05 12:04:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `profile_picture`, `created_at`, `updated_at`) VALUES
(1, 'Estell Boyer', 'hauck.vincent@example.net', '$2y$12$Mm2eqqxL4WNs.xhtyUrqIO5/5BoJUheOlF5AoLljlsOOgAsAxz9.6', 'JzY6p3nPu7Jrp0hkNKh97qjdnCUkbWcPfLctHtEJ.webp', '2024-02-29 03:10:43', '2024-03-05 11:16:43'),
(3, 'Enrico Treutel II', 'makayla62@example.net', '$2y$12$Mm2eqqxL4WNs.xhtyUrqIO5/5BoJUheOlF5AoLljlsOOgAsAxz9.6', 'FWClQydz9w85GGvBQZLO1gfW2y5hz0WtnsrJMx2o.jpg', '2024-02-29 03:10:43', '2024-03-05 11:52:29'),
(4, 'Robyn Marks', 'milford.rau@example.com', '$2y$12$Mm2eqqxL4WNs.xhtyUrqIO5/5BoJUheOlF5AoLljlsOOgAsAxz9.6', '', '2024-02-29 03:10:43', '2024-02-29 03:10:43'),
(5, 'Dean Windler', 'arlene41@example.org', '$2y$12$Mm2eqqxL4WNs.xhtyUrqIO5/5BoJUheOlF5AoLljlsOOgAsAxz9.6', '', '2024-02-29 03:10:43', '2024-02-29 03:10:43'),
(6, 'Prof. Marlen Wilkinson II', 'dwuckert@example.com', '$2y$12$Mm2eqqxL4WNs.xhtyUrqIO5/5BoJUheOlF5AoLljlsOOgAsAxz9.6', '', '2024-02-29 03:10:43', '2024-02-29 03:10:43'),
(7, 'Haven Jast', 'pnikolaus@example.org', '$2y$12$Mm2eqqxL4WNs.xhtyUrqIO5/5BoJUheOlF5AoLljlsOOgAsAxz9.6', '', '2024-02-29 03:10:43', '2024-02-29 03:10:43'),
(8, 'Matilda Tromp', 'hassan.bednar@example.com', '$2y$12$Mm2eqqxL4WNs.xhtyUrqIO5/5BoJUheOlF5AoLljlsOOgAsAxz9.6', '', '2024-02-29 03:10:43', '2024-02-29 03:10:43'),
(9, 'Mrs. Trinity Christiansen II', 'rory.vandervort@example.com', '$2y$12$Mm2eqqxL4WNs.xhtyUrqIO5/5BoJUheOlF5AoLljlsOOgAsAxz9.6', '', '2024-02-29 03:10:43', '2024-02-29 03:10:43'),
(10, 'Ms. Enola Marvin', 'jolie77@example.com', '$2y$12$Mm2eqqxL4WNs.xhtyUrqIO5/5BoJUheOlF5AoLljlsOOgAsAxz9.6', '', '2024-02-29 03:10:43', '2024-02-29 03:10:43'),
(11, 'Mr. Dock O\'Hara', 'rogahn.maeve@example.net', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(12, 'Miracle McKenzie', 'vgrimes@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(13, 'Don Oberbrunner', 'king.skyla@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(14, 'Walker Pollich V', 'bfadel@example.net', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(15, 'Keegan Adams', 'hdooley@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(16, 'Neva Bernhard', 'rblock@example.net', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(17, 'Beulah Murphy', 'haley.dianna@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(18, 'Mr. Ethan Koepp', 'alverta.thiel@example.com', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(19, 'Miss Dora Kohler III', 'yundt.janie@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(20, 'Casimer Muller', 'ukuhlman@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(21, 'Maegan Labadie', 'schowalter.michele@example.net', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(22, 'Jalen Schumm', 'gdamore@example.net', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(23, 'Miss Alison Torphy', 'ischumm@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(24, 'Julie Bradtke Sr.', 'carolyne42@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(25, 'Marcelo Herman', 'hyatt.juanita@example.net', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(26, 'Raquel Ankunding', 'everardo49@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(27, 'Suzanne Goyette', 'waino.harvey@example.com', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(28, 'Guido Kunde', 'anais38@example.com', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(29, 'Mr. Jalen Hane', 'blehner@example.net', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(30, 'Alvina Kunze', 'ardella76@example.com', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:40', '2024-02-29 03:11:40'),
(31, 'Cullen Ratke', 'rbotsford@example.net', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(32, 'Fern Little', 'golda69@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(33, 'Victoria Harvey', 'daugherty.martine@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(34, 'Whitney Sawayn', 'presley.fritsch@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(35, 'Aurelia Bernier', 'jerel.hyatt@example.com', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(36, 'Araceli Quigley', 'mebert@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(37, 'Amiya Maggio', 'sledner@example.net', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(38, 'Grant Schoen', 'reanna53@example.com', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(39, 'Prof. Peyton Hansen', 'lowe.zakary@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(40, 'Verda Mante', 'jlesch@example.net', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(41, 'Prof. Octavia McCullough Jr.', 'nsmitham@example.com', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(42, 'Taurean Little', 'mhauck@example.net', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(43, 'Jerod Stehr', 'gust.christiansen@example.com', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(44, 'Rocio Marks', 'ari.damore@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(45, 'Craig Yost DVM', 'dominique38@example.com', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(46, 'Dena Schumm Jr.', 'emard.juliana@example.net', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(47, 'Ms. Allison Sanford', 'luettgen.sherman@example.net', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(48, 'Mr. Adolfo Kunde', 'feeney.isai@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(49, 'Keegan Rosenbaum Jr.', 'tessie25@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(50, 'Michaela Marvin', 'sister.barrows@example.org', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(51, 'Prof. Declan Hermiston I', 'rosalyn.roberts@example.net', '$2y$04$b4JMR529BHHgpbmWlWTx7uL2jKfWthMLYNaxJ6d38ca0igpCXgsz.', '', '2024-02-29 03:11:41', '2024-02-29 03:11:41'),
(52, 'Letitia Kertzmann', 'lesch.gilda@example.org', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(53, 'Dr. Waino Bashirian', 'wvon@example.com', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(54, 'Samson Corkery', 'beryl.collins@example.net', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(55, 'Kristopher Kiehn', 'jswift@example.com', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(56, 'Mr. Louisa Ferry', 'altenwerth.camilla@example.net', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(57, 'Reuben Daugherty', 'julien.spinka@example.com', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(58, 'Harmon Crona', 'dooley.shaun@example.com', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(59, 'Krystel Pfeffer', 'schamberger.elsie@example.net', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(60, 'Lina Douglas PhD', 'myrtis72@example.org', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(61, 'Christop Dickinson', 'americo.sporer@example.com', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(62, 'Dr. Everett Runolfsdottir DVM', 'bell.kertzmann@example.com', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(63, 'Dr. Ozella Cormier', 'katherine.durgan@example.org', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(64, 'Ephraim Littel', 'jeramie.schimmel@example.org', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(65, 'Catharine Predovic', 'dwisoky@example.com', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(66, 'Shaniya Prohaska', 'antonia.bartoletti@example.net', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(67, 'Dessie Lehner PhD', 'maybell27@example.org', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(68, 'Miss Evelyn Collins PhD', 'larson.perry@example.net', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(69, 'Dr. Ada Nolan', 'remington69@example.org', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(70, 'Tad Waelchi I', 'bethel.robel@example.com', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(71, 'Mr. Newell Wisoky DDS', 'alexzander33@example.net', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(72, 'Martine Osinski', 'klein.kaley@example.org', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(73, 'Janiya Greenfelder', 'sterling.blick@example.org', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(74, 'Kevon Bode', 'makenna43@example.net', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(75, 'Dr. Stan Wilkinson Jr.', 'zelma51@example.net', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(76, 'Dr. Ruben Fay Sr.', 'litzy.effertz@example.org', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(77, 'Cindy Ernser', 'maya91@example.com', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(78, 'Wilhelm Dickinson II', 'leopold.schuppe@example.org', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(79, 'Jannie Grady I', 'marc.ratke@example.org', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(80, 'Ernest Price Jr.', 'corwin.caitlyn@example.org', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(81, 'Efren Russel', 'mvolkman@example.net', '$2y$04$P37LkELi2uzMCJcpxgUAQuJdOvBGAFBLvOBzisZyNQUqcru.ClA3q', '', '2024-02-29 03:12:10', '2024-02-29 03:12:10'),
(82, 'Raleigh Cormier', 'jamel.stehr@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(83, 'Keyshawn Schuster I', 'reid83@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(84, 'Kasandra Bernier Sr.', 'hartmann.cara@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(85, 'Katelynn Ziemann', 'jules85@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(86, 'Miss Polly Mertz Sr.', 'thea.bernhard@example.org', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(87, 'Laurel Wisoky', 'mathias.bergnaum@example.org', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(88, 'Natalie Mayer', 'effertz.moriah@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(89, 'Ashlynn Greenfelder', 'bartell.cielo@example.org', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(90, 'Orlando Parisian', 'ypowlowski@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(91, 'Ramiro Volkman', 'jayme25@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(92, 'Geo Vandervort', 'alexzander42@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(93, 'Ervin Schmeler', 'lilian.bauch@example.org', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(94, 'Laron Cremin', 'xgoyette@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(95, 'Marina Cassin', 'lilla52@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(96, 'Mellie Pollich', 'ncollier@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(97, 'Sid Streich', 'vohara@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(98, 'Mrs. Tiana Botsford II', 'auer.lora@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(99, 'Alejandra Stokes', 'hprice@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(100, 'Tom Morissette', 'roberts.nickolas@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(101, 'Prof. Quinn Little', 'meda.sipes@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(102, 'Geo Lowe', 'hartmann.clara@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(103, 'Myrtie O\'Hara', 'ullrich.brad@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(104, 'Lucinda Prosacco', 'fabiola04@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(105, 'Wiley Abbott', 'vpacocha@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(106, 'Lindsey Rau', 'melvin74@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(107, 'Ashtyn Dooley', 'giovanny38@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(108, 'Mrs. Lucie Lynch', 'hermiston.kayley@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(109, 'Ms. Tiara Bernier MD', 'llewellyn14@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(110, 'Etha Ondricka', 'elwin.lubowitz@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(111, 'Brendan Pfeffer V', 'ansley46@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(112, 'Stacy Hoeger', 'salvatore60@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(113, 'Prof. Jennyfer Koch II', 'okon.merlin@example.org', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(114, 'Dangelo Boehm', 'juanita85@example.org', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(115, 'Jayme Muller', 'kwilliamson@example.com', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(116, 'Rosina Gusikowski', 'gwendolyn.price@example.org', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(117, 'Jimmie Friesen', 'lkilback@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(118, 'Leo Schuster', 'scot.sanford@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(119, 'Mr. Sidney Lakin DDS', 'augusta.watsica@example.org', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(120, 'Wendy Howe', 'ursula82@example.org', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(121, 'Zoie D\'Amore', 'alene.hills@example.net', '$2y$04$U2dCIx4hPs.labNjQ6T7Qez2X3vAI/CdkyfxvUwUIoluYRjh50HIq', '', '2024-02-29 03:12:59', '2024-02-29 03:12:59'),
(123, 'Admin', 'admin@admin.com', '$2y$12$SUhjc6j/U4A19WrsP9hyE.gWN/36eIX2nfpSnpzl3JMG43Kkp.qy2', 'YLuCxfFnb58BLt5mIyxPZv5uZseuTk0qNVXDo7Jp.webp', '2024-03-05 11:27:37', '2024-03-05 11:28:12');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
