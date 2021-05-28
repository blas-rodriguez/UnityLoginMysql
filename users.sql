-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-05-2021 a las 22:49:16
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sislab`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nacimiento` date NOT NULL,
  `puntaje` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nuevo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actualizado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `equipo_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_equipo_id_foreign` (`equipo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `id_user`, `name`, `email`, `nacimiento`, `puntaje`, `fecha`, `email_verified_at`, `password`, `nuevo`, `actualizado`, `remember_token`, `created_at`, `updated_at`, `equipo_id`) VALUES
(1, NULL, 'Admin Admin', 'admin@admin.com', '2021-05-25', NULL, '2021-05-25', '2021-05-26 01:32:37', '$2y$10$Dd6W3AhHGI01OJt2nuPXNOK84nsJ431yjeK17TBRTvCefQVrWo/Ja', NULL, '', NULL, '2021-05-26 01:32:37', '2021-05-26 01:33:31', 1),
(2, 1, 'Admin', 'Admin@gmial.com', '2021-05-25', 45, '2021-05-25', NULL, '$2y$10$/RaDzCvGhkmwZIAJK2J59OfsaBbkVDV0HXPSxMiEJiwRum25h0KnC', NULL, 'si', NULL, '2021-05-26 01:32:57', '2021-05-26 01:36:28', 1),
(3, 2, 'Wiley1', 'Wiley1@gmial.com', '2021-05-25', 130, '2021-05-25', NULL, '$2y$10$Iq.NUrvFu8319Sd.T4Vj3uyLw2OFJtLaF3ySBMkzqgCs/5oVCCV6.', NULL, 'si', NULL, '2021-05-26 01:32:58', '2021-05-26 01:36:28', 1),
(4, 3, 'Coby1', 'Coby@gmial.com', '2021-05-25', 90, '2021-05-25', NULL, '$2y$10$ZezkuocTno7XnJiXvhXZN.prgnqEwpnI61uUdOFuFe1XLxKJIjahy', NULL, 'si', NULL, '2021-05-26 01:32:58', '2021-05-26 01:36:28', 2),
(5, 4, 'Candido1', 'Candido@gmial.com', '2021-05-25', 135, '2021-05-25', NULL, '$2y$10$J1VoAO4ezSDr0h0Vb13goOMdCYZ7JPFKgAiSqpnuK.d.JLIGxG1di', NULL, 'si', NULL, '2021-05-26 01:32:58', '2021-05-26 01:36:28', 1),
(6, 5, 'Kacie', 'Kacie@gmial.com', '2021-05-25', 50, '2021-05-25', NULL, '$2y$10$nqxeGoSHsp9WFP8H3dJ19eP7J12Mv9NWLXzscBwcp9yxKL0KNIDt.', NULL, 'si', NULL, '2021-05-26 01:32:58', '2021-05-26 01:36:28', 2),
(7, 6, 'flor', 'flor@gmial.com', '2021-05-25', 0, '2021-05-25', NULL, '$2y$10$eTYQtbqR8K40.Df8gOHReOfkvuZit3Ef.mSqOIKFk2eMzY/3GE1LC', NULL, 'si', NULL, '2021-05-26 01:32:58', '2021-05-26 01:36:29', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
