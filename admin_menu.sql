-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Jun 19, 2021 at 05:43 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spbo_ta`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE IF NOT EXISTS `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, '2020-08-06 07:25:00'),
(2, 0, 8, 'Admin', 'fa-tasks', '', NULL, NULL, '2020-08-07 09:15:59'),
(3, 2, 9, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2020-08-07 09:15:59'),
(4, 2, 10, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2020-08-07 09:15:59'),
(5, 2, 11, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2020-08-07 09:15:59'),
(6, 2, 12, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2020-08-07 09:15:59'),
(7, 2, 13, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2020-08-07 09:15:59'),
(8, 0, 2, 'Manage Peserta Didik', 'fa-users', NULL, '*', '2020-08-06 07:24:32', '2020-08-06 07:25:19'),
(16, 8, 5, 'Daftar Kelas', 'fa-group', 'classes', '*', '2020-08-06 11:15:24', '2020-08-07 09:11:48'),
(10, 0, 14, 'Helpers', 'fa-gears', '', NULL, '2020-08-06 07:45:20', '2020-08-07 09:15:59'),
(11, 10, 15, 'Scaffold', 'fa-keyboard-o', 'helpers/scaffold', NULL, '2020-08-06 07:45:20', '2020-08-07 09:15:59'),
(12, 10, 16, 'Database terminal', 'fa-database', 'helpers/terminal/database', NULL, '2020-08-06 07:45:20', '2020-08-07 09:15:59'),
(13, 10, 17, 'Laravel artisan', 'fa-terminal', 'helpers/terminal/artisan', NULL, '2020-08-06 07:45:20', '2020-08-07 09:15:59'),
(14, 10, 18, 'Routes', 'fa-list-alt', 'helpers/routes', NULL, '2020-08-06 07:45:20', '2020-08-07 09:15:59'),
(15, 8, 4, 'Daftar Peserta Didik', 'fa-group', 'participants', '*', '2020-08-06 08:23:00', '2020-08-07 09:11:48'),
(17, 8, 3, 'Daftar Mentor', 'fa-bars', 'mentors', '*', '2020-08-07 05:43:47', '2020-08-07 09:11:48'),
(18, 0, 7, 'Jadwal', 'fa-book', NULL, '*', '2020-08-07 09:11:35', '2020-08-07 09:15:59'),
(19, 8, 6, 'Daftar Ruangan', 'fa-home', 'rooms', '*', '2020-08-07 09:12:58', '2020-08-07 09:16:26'),
(20, 18, 0, 'Daftar Jadwal', 'fa-bars', 'schedules', '*', '2020-08-07 09:26:34', '2020-08-07 09:26:34'),
(23, 8, 0, 'Matakuliah', 'fa-book', 'subjects', 'ext.helpers', '2021-06-19 04:42:28', '2021-06-19 04:42:28');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
