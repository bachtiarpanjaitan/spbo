-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: sql6.freemysqlhosting.net
-- Generation Time: Jun 20, 2021 at 10:16 AM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql6419285`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, '2020-08-06 07:25:00'),
(2, 0, 11, 'Admin', 'fa-tasks', '', NULL, NULL, '2021-06-19 11:13:04'),
(3, 2, 12, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2021-06-19 11:13:04'),
(4, 2, 13, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2021-06-19 11:13:04'),
(5, 2, 14, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2021-06-19 11:13:04'),
(6, 2, 15, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2021-06-19 11:13:04'),
(7, 2, 16, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2021-06-19 11:13:04'),
(8, 0, 2, 'Manage Peserta Didik', 'fa-users', NULL, '*', '2020-08-06 07:24:32', '2020-08-06 07:25:19'),
(16, 8, 7, 'Daftar Kelas', 'fa-group', 'classes', '*', '2020-08-06 11:15:24', '2021-06-19 11:13:04'),
(10, 0, 17, 'Helpers', 'fa-gears', '', NULL, '2020-08-06 07:45:20', '2021-06-19 11:13:04'),
(11, 10, 18, 'Scaffold', 'fa-keyboard-o', 'helpers/scaffold', NULL, '2020-08-06 07:45:20', '2021-06-19 11:13:04'),
(12, 10, 19, 'Database terminal', 'fa-database', 'helpers/terminal/database', NULL, '2020-08-06 07:45:20', '2021-06-19 11:13:04'),
(13, 10, 20, 'Laravel artisan', 'fa-terminal', 'helpers/terminal/artisan', NULL, '2020-08-06 07:45:20', '2021-06-19 11:13:04'),
(14, 10, 21, 'Routes', 'fa-list-alt', 'helpers/routes', NULL, '2020-08-06 07:45:20', '2021-06-19 11:13:04'),
(15, 8, 6, 'Daftar Peserta Didik', 'fa-group', 'participants', '*', '2020-08-06 08:23:00', '2021-06-19 11:13:04'),
(17, 8, 5, 'Daftar Mentor', 'fa-bars', 'mentors', '*', '2020-08-07 05:43:47', '2021-06-19 11:13:04'),
(18, 0, 9, 'Jadwal', 'fa-book', NULL, '*', '2020-08-07 09:11:35', '2021-06-19 11:13:04'),
(19, 8, 8, 'Daftar Ruangan', 'fa-home', 'rooms', '*', '2020-08-07 09:12:58', '2021-06-19 11:13:04'),
(20, 18, 10, 'Daftar Jadwal', 'fa-bars', 'schedules', '*', '2020-08-07 09:26:34', '2021-06-19 11:13:04'),
(23, 8, 3, 'Matakuliah', 'fa-book', 'subjects', 'ext.helpers', '2021-06-19 04:42:28', '2021-06-19 11:13:04'),
(24, 8, 4, 'Matakuliah Per Kelas', 'fa-cubes', 'subject-classes', '*', '2021-06-19 11:12:46', '2021-06-19 11:13:04');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(665, 1, 'admin/auth/permissions', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:51:47', '2020-08-07 10:51:47'),
(666, 1, 'admin/auth/permissions/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:51:56', '2020-08-07 10:51:56'),
(667, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:52:05', '2020-08-07 10:52:05'),
(668, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:56:14', '2020-08-07 10:56:14'),
(669, 1, 'admin', 'GET', '::1', '[]', '2020-08-07 13:36:41', '2020-08-07 13:36:41'),
(670, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:25:45', '2020-08-07 14:25:45'),
(671, 1, 'admin/classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:25:50', '2020-08-07 14:25:50'),
(672, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:25:52', '2020-08-07 14:25:52'),
(673, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:25:54', '2020-08-07 14:25:54'),
(674, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:25:56', '2020-08-07 14:25:56'),
(675, 1, 'admin', 'GET', '::1', '[]', '2020-08-08 02:26:18', '2020-08-08 02:26:18'),
(676, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-08 02:26:37', '2020-08-08 02:26:37'),
(677, 1, 'admin/rooms/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-08 02:26:41', '2020-08-08 02:26:41'),
(678, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-08 02:26:51', '2020-08-08 02:26:51'),
(679, 1, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-08 02:27:06', '2020-08-08 02:27:06'),
(680, 1, 'admin', 'GET', '::1', '[]', '2020-08-09 06:14:59', '2020-08-09 06:14:59'),
(681, 1, 'admin', 'GET', '::1', '[]', '2020-08-09 06:14:59', '2020-08-09 06:14:59'),
(682, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 06:19:54', '2020-08-09 06:19:54'),
(683, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 06:20:13', '2020-08-09 06:20:13'),
(684, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 06:20:18', '2020-08-09 06:20:18'),
(685, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:38:35', '2020-08-09 06:38:35'),
(686, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 06:38:44', '2020-08-09 06:38:44'),
(687, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 06:38:46', '2020-08-09 06:38:46'),
(688, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:39:24', '2020-08-09 06:39:24'),
(689, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:39:37', '2020-08-09 06:39:37'),
(690, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:39:49', '2020-08-09 06:39:49'),
(691, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:39:56', '2020-08-09 06:39:56'),
(692, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:40:16', '2020-08-09 06:40:16'),
(693, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:40:29', '2020-08-09 06:40:29'),
(694, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:40:35', '2020-08-09 06:40:35'),
(695, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:41:11', '2020-08-09 06:41:11'),
(696, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:41:25', '2020-08-09 06:41:25'),
(697, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:41:35', '2020-08-09 06:41:35'),
(698, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:42:04', '2020-08-09 06:42:04'),
(699, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:42:12', '2020-08-09 06:42:12'),
(700, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:42:26', '2020-08-09 06:42:26'),
(701, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:42:41', '2020-08-09 06:42:41'),
(702, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:42:57', '2020-08-09 06:42:57'),
(703, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:43:03', '2020-08-09 06:43:03'),
(704, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:43:49', '2020-08-09 06:43:49'),
(705, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:44:08', '2020-08-09 06:44:08'),
(706, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:44:43', '2020-08-09 06:44:43'),
(707, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:46:55', '2020-08-09 06:46:55'),
(708, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:47:08', '2020-08-09 06:47:08'),
(709, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:47:59', '2020-08-09 06:47:59'),
(710, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:48:04', '2020-08-09 06:48:04'),
(711, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 06:48:18', '2020-08-09 06:48:18'),
(712, 1, 'admin/classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 06:48:47', '2020-08-09 06:48:47'),
(713, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 06:48:49', '2020-08-09 06:48:49'),
(714, 1, 'admin/classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 06:48:51', '2020-08-09 06:48:51'),
(715, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 06:48:52', '2020-08-09 06:48:52'),
(716, 1, 'admin/classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 06:48:54', '2020-08-09 06:48:54'),
(717, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 06:48:55', '2020-08-09 06:48:55'),
(718, 1, 'admin/rooms/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 06:48:59', '2020-08-09 06:48:59'),
(719, 1, 'admin/rooms', 'POST', '::1', '{\"name\":\"A21\",\"max_participant\":\"50\",\"description\":\"Test Room\",\"_token\":\"LIcwfujcybFshh7VkeEYMVqGfbb08pIRYThzUYK8\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/rooms\"}', '2020-08-09 06:49:11', '2020-08-09 06:49:11'),
(720, 1, 'admin/rooms', 'GET', '::1', '[]', '2020-08-09 06:49:11', '2020-08-09 06:49:11'),
(721, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 07:43:18', '2020-08-09 07:43:18'),
(722, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 12:12:34', '2020-08-09 12:12:34'),
(723, 1, 'admin/schedules/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 12:12:53', '2020-08-09 12:12:53'),
(724, 1, 'admin/schedules', 'POST', '::1', '{\"name\":\"Test Video Chat\",\"room_id\":\"2\",\"class_id\":\"1\",\"day\":\"6\",\"time\":\"08:30:00\",\"mentor_id\":null,\"session_long\":\"120\",\"description\":\"Testing Video Call\",\"_token\":\"3nON7DERDXTwnXhbf7fIJeCPYOJjxKzgHKPMj5Dw\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-08-09 12:13:31', '2020-08-09 12:13:31'),
(725, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:13:32', '2020-08-09 12:13:32'),
(726, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:14:26', '2020-08-09 12:14:26'),
(727, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:14:53', '2020-08-09 12:14:53'),
(728, 1, 'admin/schedules/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 12:14:59', '2020-08-09 12:14:59'),
(729, 1, 'admin/schedules/3', 'PUT', '::1', '{\"name\":\"Test Video Chat\",\"room_id\":\"2\",\"class_id\":\"1\",\"day\":\"6\",\"time\":\"08:30:00\",\"mentor_id\":\"3\",\"session_long\":\"120\",\"description\":\"Testing Video Call\",\"_token\":\"3nON7DERDXTwnXhbf7fIJeCPYOJjxKzgHKPMj5Dw\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-08-09 12:15:07', '2020-08-09 12:15:07'),
(730, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:15:07', '2020-08-09 12:15:07'),
(731, 1, 'admin/schedules/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 12:15:16', '2020-08-09 12:15:16'),
(732, 1, 'admin/schedules/3/edit', 'GET', '::1', '[]', '2020-08-09 12:15:40', '2020-08-09 12:15:40'),
(733, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 12:15:45', '2020-08-09 12:15:45'),
(734, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 12:15:47', '2020-08-09 12:15:47'),
(735, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:16:35', '2020-08-09 12:16:35'),
(736, 1, 'admin/schedules/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-09 12:16:51', '2020-08-09 12:16:51'),
(737, 1, 'admin/schedules/2', 'PUT', '::1', '{\"name\":\"Jadwal Matematika A1\",\"room_id\":\"1\",\"class_id\":\"1\",\"day\":\"3\",\"time\":\"10:00:00\",\"mentor_id\":\"3\",\"session_long\":\"60\",\"description\":\"test room\",\"_token\":\"3nON7DERDXTwnXhbf7fIJeCPYOJjxKzgHKPMj5Dw\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-08-09 12:16:56', '2020-08-09 12:16:56'),
(738, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:16:56', '2020-08-09 12:16:56'),
(739, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:16:59', '2020-08-09 12:16:59'),
(740, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:17:59', '2020-08-09 12:17:59'),
(741, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:18:26', '2020-08-09 12:18:26'),
(742, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:18:43', '2020-08-09 12:18:43'),
(743, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:19:20', '2020-08-09 12:19:20'),
(744, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:20:31', '2020-08-09 12:20:31'),
(745, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:21:08', '2020-08-09 12:21:08'),
(746, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:21:43', '2020-08-09 12:21:43'),
(747, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:22:55', '2020-08-09 12:22:55'),
(748, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:23:56', '2020-08-09 12:23:56'),
(749, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:24:08', '2020-08-09 12:24:08'),
(750, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:24:30', '2020-08-09 12:24:30'),
(751, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:24:58', '2020-08-09 12:24:58'),
(752, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:25:27', '2020-08-09 12:25:27'),
(753, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-09 12:25:59', '2020-08-09 12:25:59'),
(754, 1, 'admin', 'GET', '::1', '[]', '2020-08-10 11:49:09', '2020-08-10 11:49:09'),
(755, 1, 'admin', 'GET', '::1', '[]', '2020-08-11 08:38:22', '2020-08-11 08:38:22'),
(756, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-11 12:10:46', '2020-08-11 12:10:46'),
(757, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-11 12:11:23', '2020-08-11 12:11:23'),
(758, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-11 12:11:31', '2020-08-11 12:11:31'),
(759, 1, 'admin', 'GET', '::1', '[]', '2020-08-12 04:57:01', '2020-08-12 04:57:01'),
(760, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 04:57:15', '2020-08-12 04:57:15'),
(761, 1, 'admin/schedules/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 04:57:20', '2020-08-12 04:57:20'),
(762, 1, 'admin/schedules', 'POST', '::1', '{\"name\":\"Pengembangan DIri\",\"room_id\":\"2\",\"class_id\":\"1\",\"day\":\"5\",\"time\":\"10:30:00\",\"mentor_id\":\"3\",\"session_long\":\"60\",\"description\":\"test\",\"_token\":\"VoXdGTX5Tijb9Ro9J5GRNLJoA4enNUIpjG8AGDut\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-08-12 04:57:52', '2020-08-12 04:57:52'),
(763, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 04:57:52', '2020-08-12 04:57:52'),
(764, 1, 'admin/schedules/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 04:58:14', '2020-08-12 04:58:14'),
(765, 1, 'admin/schedules/4', 'PUT', '::1', '{\"name\":\"Pengembangan DIri\",\"room_id\":\"2\",\"class_id\":\"1\",\"day\":\"5\",\"time\":\"10:30:00\",\"mentor_id\":\"3\",\"session_long\":\"60\",\"description\":\"test\",\"_token\":\"VoXdGTX5Tijb9Ro9J5GRNLJoA4enNUIpjG8AGDut\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-08-12 04:58:20', '2020-08-12 04:58:20'),
(766, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 04:58:20', '2020-08-12 04:58:20'),
(767, 1, 'admin/schedules/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:01:50', '2020-08-12 05:01:50'),
(768, 1, 'admin/schedules/3/edit', 'GET', '::1', '[]', '2020-08-12 05:03:14', '2020-08-12 05:03:14'),
(769, 1, 'admin/schedules/3', 'PUT', '::1', '{\"name\":\"Test Video Chat\",\"room_id\":\"2\",\"class_id\":\"1\",\"day\":\"6\",\"time\":\"08:30:00\",\"mentor_id\":\"3\",\"session_long\":\"120\",\"description\":\"Testing Video Call\",\"_token\":\"VoXdGTX5Tijb9Ro9J5GRNLJoA4enNUIpjG8AGDut\",\"_method\":\"PUT\"}', '2020-08-12 05:03:21', '2020-08-12 05:03:21'),
(770, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 05:03:21', '2020-08-12 05:03:21'),
(771, 1, 'admin/schedules/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:03:30', '2020-08-12 05:03:30'),
(772, 1, 'admin/schedules/4', 'PUT', '::1', '{\"name\":\"Pengembangan DIri\",\"room_id\":\"2\",\"class_id\":\"1\",\"day\":\"5\",\"time\":\"10:30:00\",\"mentor_id\":\"2\",\"session_long\":\"60\",\"description\":\"test\",\"_token\":\"VoXdGTX5Tijb9Ro9J5GRNLJoA4enNUIpjG8AGDut\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-08-12 05:03:59', '2020-08-12 05:03:59'),
(773, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 05:03:59', '2020-08-12 05:03:59'),
(774, 1, 'admin/schedules/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:04:04', '2020-08-12 05:04:04'),
(775, 1, 'admin/schedules/4/edit', 'GET', '::1', '[]', '2020-08-12 05:04:29', '2020-08-12 05:04:29'),
(776, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:04:34', '2020-08-12 05:04:34'),
(777, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 05:04:47', '2020-08-12 05:04:47'),
(778, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:04:53', '2020-08-12 05:04:53'),
(779, 1, 'admin/rooms/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:04:57', '2020-08-12 05:04:57'),
(780, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:05:00', '2020-08-12 05:05:00'),
(781, 1, 'admin/classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:05:04', '2020-08-12 05:05:04'),
(782, 1, 'admin/classes/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:05:10', '2020-08-12 05:05:10'),
(783, 1, 'admin/classes/2', 'PUT', '::1', '{\"mentor_id\":\"4\",\"class_name\":\"VIII\",\"description\":null,\"_token\":\"VoXdGTX5Tijb9Ro9J5GRNLJoA4enNUIpjG8AGDut\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/classes\"}', '2020-08-12 05:05:19', '2020-08-12 05:05:19'),
(784, 1, 'admin/classes', 'GET', '::1', '[]', '2020-08-12 05:05:19', '2020-08-12 05:05:19'),
(785, 1, 'admin/classes/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:05:26', '2020-08-12 05:05:26'),
(786, 1, 'admin/classes/1', 'PUT', '::1', '{\"mentor_id\":\"4\",\"class_name\":\"IX\",\"description\":\"testt\",\"_token\":\"VoXdGTX5Tijb9Ro9J5GRNLJoA4enNUIpjG8AGDut\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/classes\"}', '2020-08-12 05:05:33', '2020-08-12 05:05:33'),
(787, 1, 'admin/classes', 'GET', '::1', '[]', '2020-08-12 05:05:33', '2020-08-12 05:05:33'),
(788, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:05:49', '2020-08-12 05:05:49'),
(789, 1, 'admin/schedules/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:05:53', '2020-08-12 05:05:53'),
(790, 1, 'admin/schedules/4', 'PUT', '::1', '{\"name\":\"Pengembangan DIri\",\"room_id\":\"1\",\"class_id\":\"1\",\"day\":\"5\",\"time\":\"10:30:00\",\"mentor_id\":\"2\",\"session_long\":\"60\",\"description\":\"test\",\"_token\":\"VoXdGTX5Tijb9Ro9J5GRNLJoA4enNUIpjG8AGDut\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-08-12 05:05:58', '2020-08-12 05:05:58'),
(791, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 05:05:58', '2020-08-12 05:05:58'),
(792, 1, 'admin/schedules/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:06:06', '2020-08-12 05:06:06'),
(793, 1, 'admin/schedules/4', 'PUT', '::1', '{\"name\":\"Pengembangan DIri\",\"room_id\":\"2\",\"class_id\":\"1\",\"day\":\"5\",\"time\":\"10:30:00\",\"mentor_id\":\"2\",\"session_long\":\"60\",\"description\":\"test\",\"_token\":\"VoXdGTX5Tijb9Ro9J5GRNLJoA4enNUIpjG8AGDut\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-08-12 05:06:09', '2020-08-12 05:06:09'),
(794, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 05:06:09', '2020-08-12 05:06:09'),
(795, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 05:07:43', '2020-08-12 05:07:43'),
(796, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 05:09:59', '2020-08-12 05:09:59'),
(797, 1, 'admin/schedules/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:10:04', '2020-08-12 05:10:04'),
(798, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 05:10:04', '2020-08-12 05:10:04'),
(799, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 05:10:26', '2020-08-12 05:10:26'),
(800, 1, 'admin/schedules/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:10:30', '2020-08-12 05:10:30'),
(801, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 05:10:30', '2020-08-12 05:10:30'),
(802, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 05:11:32', '2020-08-12 05:11:32'),
(803, 1, 'admin/schedules/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:11:35', '2020-08-12 05:11:35'),
(804, 1, 'admin/schedules/4/edit', 'GET', '::1', '[]', '2020-08-12 05:11:53', '2020-08-12 05:11:53'),
(805, 1, 'admin/schedules/4/edit', 'GET', '::1', '[]', '2020-08-12 05:11:58', '2020-08-12 05:11:58'),
(806, 1, 'admin/schedules/4', 'PUT', '::1', '{\"name\":\"Pengembangan DIri\",\"room_id\":\"2\",\"class_id\":\"1\",\"day\":\"5\",\"time\":\"10:30:00\",\"mentor_id\":\"4\",\"session_long\":\"60\",\"description\":\"test\",\"_token\":\"VoXdGTX5Tijb9Ro9J5GRNLJoA4enNUIpjG8AGDut\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-08-12 05:12:03', '2020-08-12 05:12:03'),
(807, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 05:12:04', '2020-08-12 05:12:04'),
(808, 1, 'admin/schedules/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 05:12:38', '2020-08-12 05:12:38'),
(809, 1, 'admin/schedules/3', 'PUT', '::1', '{\"name\":\"Test Video Chat\",\"room_id\":\"2\",\"class_id\":\"1\",\"day\":\"6\",\"time\":\"08:30:00\",\"mentor_id\":\"4\",\"session_long\":\"120\",\"description\":\"Testing Video Call\",\"_token\":\"VoXdGTX5Tijb9Ro9J5GRNLJoA4enNUIpjG8AGDut\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-08-12 05:12:42', '2020-08-12 05:12:42'),
(810, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-12 05:12:42', '2020-08-12 05:12:42'),
(811, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:15:57', '2020-08-12 06:15:57'),
(812, 1, 'admin/participants/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:16:00', '2020-08-12 06:16:00'),
(813, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 06:16:07', '2020-08-12 06:16:07'),
(814, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 06:16:40', '2020-08-12 06:16:40'),
(815, 1, 'admin/participants/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:16:43', '2020-08-12 06:16:43'),
(816, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 06:16:49', '2020-08-12 06:16:49'),
(817, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 06:17:12', '2020-08-12 06:17:12'),
(818, 1, 'admin/participants/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:17:14', '2020-08-12 06:17:14'),
(819, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:41:17', '2020-08-12 06:41:17'),
(820, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:41:23', '2020-08-12 06:41:23'),
(821, 1, 'admin/mentors/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:41:27', '2020-08-12 06:41:27'),
(822, 1, 'admin/mentors', 'POST', '::1', '{\"user_id\":\"1\",\"zoom_id\":null,\"zoom_firstname\":\"Guru\",\"zoom_lastname\":\"Mentor\",\"zoom_type\":\"1\",\"is_mentor\":\"1\",\"_token\":\"Y6zKh2FKLw3E9ccwcu5cCZtEmBizSPTUyuJsBKTZ\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/mentors\"}', '2020-08-12 06:41:45', '2020-08-12 06:41:45'),
(823, 1, 'admin/mentors/create', 'GET', '::1', '[]', '2020-08-12 06:41:45', '2020-08-12 06:41:45'),
(824, 1, 'admin/mentors', 'POST', '::1', '{\"user_id\":\"1\",\"zoom_id\":null,\"zoom_firstname\":\"Guru\",\"zoom_lastname\":\"Mentor\",\"zoom_type\":\"1\",\"is_mentor\":\"1\",\"_token\":\"Y6zKh2FKLw3E9ccwcu5cCZtEmBizSPTUyuJsBKTZ\"}', '2020-08-12 06:42:23', '2020-08-12 06:42:23'),
(825, 1, 'admin/mentors', 'GET', '::1', '[]', '2020-08-12 06:42:23', '2020-08-12 06:42:23'),
(826, 1, 'admin/mentors/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:42:28', '2020-08-12 06:42:28'),
(827, 1, 'admin/mentors/2', 'PUT', '::1', '{\"user_id\":\"3\",\"zoom_id\":\"187465\",\"zoom_firstname\":\"Siswa Dua\",\"zoom_lastname\":\"Zoom\",\"zoom_type\":\"2\",\"is_mentor\":\"0\",\"_token\":\"Y6zKh2FKLw3E9ccwcu5cCZtEmBizSPTUyuJsBKTZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/mentors\"}', '2020-08-12 06:42:31', '2020-08-12 06:42:31'),
(828, 1, 'admin/mentors', 'GET', '::1', '[]', '2020-08-12 06:42:31', '2020-08-12 06:42:31'),
(829, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:42:34', '2020-08-12 06:42:34'),
(830, 1, 'admin/participants/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:42:39', '2020-08-12 06:42:39'),
(831, 1, 'admin/participants', 'POST', '::1', '{\"user_id\":\"3\",\"class_id\":\"2\",\"zoom_id\":null,\"zoom_firstname\":null,\"zoom_lastname\":null,\"zoom_type\":\"1\",\"is_mentor\":\"0\",\"_token\":\"Y6zKh2FKLw3E9ccwcu5cCZtEmBizSPTUyuJsBKTZ\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/participants\"}', '2020-08-12 06:42:54', '2020-08-12 06:42:54'),
(832, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 06:42:54', '2020-08-12 06:42:54'),
(833, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:43:00', '2020-08-12 06:43:00'),
(834, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:43:27', '2020-08-12 06:43:27'),
(835, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:43:43', '2020-08-12 06:43:43'),
(836, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:43:45', '2020-08-12 06:43:45'),
(837, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:43:47', '2020-08-12 06:43:47'),
(838, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 06:43:59', '2020-08-12 06:43:59'),
(839, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 06:44:08', '2020-08-12 06:44:08'),
(840, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 06:44:17', '2020-08-12 06:44:17'),
(841, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 06:45:02', '2020-08-12 06:45:02'),
(842, 1, 'admin/participants/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:45:10', '2020-08-12 06:45:10'),
(843, 1, 'admin/participants/5', 'PUT', '::1', '{\"user_id\":\"3\",\"class_id\":\"2\",\"zoom_id\":null,\"zoom_firstname\":null,\"zoom_lastname\":null,\"zoom_type\":\"1\",\"is_mentor\":\"0\",\"_token\":\"Y6zKh2FKLw3E9ccwcu5cCZtEmBizSPTUyuJsBKTZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/participants\"}', '2020-08-12 06:45:17', '2020-08-12 06:45:17'),
(844, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 06:45:17', '2020-08-12 06:45:17'),
(845, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"5\",\"_model\":\"App_Models_Participant\",\"_token\":\"Y6zKh2FKLw3E9ccwcu5cCZtEmBizSPTUyuJsBKTZ\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-08-12 06:45:31', '2020-08-12 06:45:31'),
(846, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:45:32', '2020-08-12 06:45:32'),
(847, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:45:38', '2020-08-12 06:45:38'),
(848, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:45:44', '2020-08-12 06:45:44'),
(849, 1, 'admin/mentors', 'GET', '::1', '[]', '2020-08-12 06:46:35', '2020-08-12 06:46:35'),
(850, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 06:46:44', '2020-08-12 06:46:44'),
(851, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:46:21', '2020-08-12 07:46:21'),
(852, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:47:10', '2020-08-12 07:47:10'),
(853, 1, 'admin/participants/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 07:47:13', '2020-08-12 07:47:13'),
(854, 1, 'admin/participants', 'POST', '::1', '{\"user_id\":\"5\",\"class_id\":\"1\",\"zoom_id\":null,\"zoom_firstname\":null,\"zoom_lastname\":null,\"zoom_type\":\"1\",\"is_mentor\":\"0\",\"_token\":\"M2Fwa3mhxT62uojuykqyySFP0eWiB4qLsrxANvw9\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/participants\"}', '2020-08-12 07:47:24', '2020-08-12 07:47:24'),
(855, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:47:25', '2020-08-12 07:47:25'),
(856, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:47:50', '2020-08-12 07:47:50'),
(857, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:49:03', '2020-08-12 07:49:03'),
(858, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:49:19', '2020-08-12 07:49:19'),
(859, 1, 'admin/participants/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 07:49:26', '2020-08-12 07:49:26'),
(860, 1, 'admin/participants/6', 'PUT', '::1', '{\"user_id\":\"5\",\"class_id\":\"1\",\"zoom_id\":null,\"zoom_firstname\":\"Siswa 3\",\"zoom_lastname\":null,\"zoom_type\":\"1\",\"is_mentor\":\"0\",\"_token\":\"M2Fwa3mhxT62uojuykqyySFP0eWiB4qLsrxANvw9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/participants\"}', '2020-08-12 07:49:30', '2020-08-12 07:49:30'),
(861, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:49:30', '2020-08-12 07:49:30'),
(862, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:49:47', '2020-08-12 07:49:47'),
(863, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:49:56', '2020-08-12 07:49:56'),
(864, 1, 'admin/participants/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 07:50:36', '2020-08-12 07:50:36'),
(865, 1, 'admin/participants/2', 'PUT', '::1', '{\"user_id\":\"3\",\"class_id\":\"2\",\"zoom_id\":\"187465\",\"zoom_firstname\":\"Siswa Dua\",\"zoom_lastname\":\"Zoom\",\"zoom_type\":\"2\",\"is_mentor\":\"0\",\"_token\":\"M2Fwa3mhxT62uojuykqyySFP0eWiB4qLsrxANvw9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/participants\"}', '2020-08-12 07:50:42', '2020-08-12 07:50:42'),
(866, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:50:42', '2020-08-12 07:50:42'),
(867, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:51:17', '2020-08-12 07:51:17'),
(868, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:51:31', '2020-08-12 07:51:31'),
(869, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:52:17', '2020-08-12 07:52:17'),
(870, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:53:40', '2020-08-12 07:53:40'),
(871, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:53:50', '2020-08-12 07:53:50'),
(872, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:53:59', '2020-08-12 07:53:59'),
(873, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:54:17', '2020-08-12 07:54:17'),
(874, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:54:28', '2020-08-12 07:54:28'),
(875, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:54:39', '2020-08-12 07:54:39'),
(876, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:54:53', '2020-08-12 07:54:53'),
(877, 1, 'admin/participants/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 07:55:16', '2020-08-12 07:55:16'),
(878, 1, 'admin/participants/2', 'PUT', '::1', '{\"user_id\":\"3\",\"class_id\":\"1\",\"zoom_id\":\"187465\",\"zoom_firstname\":\"Siswa Dua\",\"zoom_lastname\":\"Zoom\",\"zoom_type\":\"2\",\"is_mentor\":\"0\",\"_token\":\"M2Fwa3mhxT62uojuykqyySFP0eWiB4qLsrxANvw9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/participants\"}', '2020-08-12 07:55:20', '2020-08-12 07:55:20'),
(879, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:55:21', '2020-08-12 07:55:21'),
(880, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:55:23', '2020-08-12 07:55:23'),
(881, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:55:51', '2020-08-12 07:55:51'),
(882, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:56:10', '2020-08-12 07:56:10'),
(883, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:56:28', '2020-08-12 07:56:28'),
(884, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:57:33', '2020-08-12 07:57:33'),
(885, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 07:59:28', '2020-08-12 07:59:28'),
(886, 1, 'admin/participants/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 07:59:34', '2020-08-12 07:59:34'),
(887, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:00:44', '2020-08-12 08:00:44'),
(888, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-12 08:01:33', '2020-08-12 08:01:33'),
(889, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:01:47', '2020-08-12 08:01:47'),
(890, 1, 'admin/classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:01:53', '2020-08-12 08:01:53'),
(891, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:01:57', '2020-08-12 08:01:57'),
(892, 1, 'admin/rooms/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:02:04', '2020-08-12 08:02:04'),
(893, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:02:07', '2020-08-12 08:02:07'),
(894, 1, 'admin/schedules/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:02:12', '2020-08-12 08:02:12'),
(895, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:02:22', '2020-08-12 08:02:22'),
(896, 1, 'admin/schedules/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:02:25', '2020-08-12 08:02:25'),
(897, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:02:37', '2020-08-12 08:02:37'),
(898, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:03:25', '2020-08-12 08:03:25'),
(899, 1, 'admin/auth/roles', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:03:31', '2020-08-12 08:03:31'),
(900, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:03:36', '2020-08-12 08:03:36'),
(901, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:03:40', '2020-08-12 08:03:40'),
(902, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:04:34', '2020-08-12 08:04:34'),
(903, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:04:38', '2020-08-12 08:04:38'),
(904, 1, 'admin/classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:04:48', '2020-08-12 08:04:48'),
(905, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:05:04', '2020-08-12 08:05:04'),
(906, 1, 'admin', 'GET', '::1', '[]', '2020-08-12 08:07:56', '2020-08-12 08:07:56'),
(907, 1, 'admin', 'GET', '::1', '[]', '2020-08-12 08:08:38', '2020-08-12 08:08:38'),
(908, 1, 'admin', 'GET', '::1', '[]', '2020-08-12 08:09:37', '2020-08-12 08:09:37'),
(909, 1, 'admin', 'GET', '::1', '[]', '2020-08-12 08:10:45', '2020-08-12 08:10:45'),
(910, 1, 'admin', 'GET', '::1', '[]', '2020-08-12 08:16:24', '2020-08-12 08:16:24'),
(911, 1, 'admin', 'GET', '::1', '[]', '2020-08-12 08:16:47', '2020-08-12 08:16:47'),
(912, 1, 'admin', 'GET', '::1', '[]', '2020-08-12 08:16:58', '2020-08-12 08:16:58'),
(913, 1, 'admin', 'GET', '::1', '[]', '2020-08-12 08:17:30', '2020-08-12 08:17:30'),
(914, 1, 'admin/auth/setting', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:17:41', '2020-08-12 08:17:41'),
(915, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:17:54', '2020-08-12 08:17:54'),
(916, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:17:58', '2020-08-12 08:17:58'),
(917, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:18:43', '2020-08-12 08:18:43'),
(918, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:19:08', '2020-08-12 08:19:08'),
(919, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:19:17', '2020-08-12 08:19:17'),
(920, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 08:19:25', '2020-08-12 08:19:25'),
(921, 1, 'admin/mentors', 'GET', '::1', '[]', '2020-08-12 08:37:52', '2020-08-12 08:37:52'),
(922, 1, 'admin', 'GET', '::1', '[]', '2020-08-21 00:32:03', '2020-08-21 00:32:03'),
(923, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:32:21', '2020-08-21 00:32:21'),
(924, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:37:22', '2020-08-21 00:37:22'),
(925, 1, 'admin', 'GET', '::1', '[]', '2020-08-21 00:43:15', '2020-08-21 00:43:15'),
(926, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:43:28', '2020-08-21 00:43:28'),
(927, 1, 'admin/participants/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:43:42', '2020-08-21 00:43:42'),
(928, 1, 'admin/participants/6', 'PUT', '::1', '{\"user_id\":\"5\",\"class_id\":\"1\",\"zoom_id\":null,\"zoom_firstname\":\"Siswa 3\",\"zoom_lastname\":null,\"zoom_type\":\"1\",\"is_mentor\":\"0\",\"_token\":\"yWRnMdAUhnp8QeZyn183xlJwNWfIiOtjxCUVYMn2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/participants\"}', '2020-08-21 00:43:49', '2020-08-21 00:43:49'),
(929, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-21 00:43:50', '2020-08-21 00:43:50'),
(930, 1, 'admin/classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:44:17', '2020-08-21 00:44:17'),
(931, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:44:27', '2020-08-21 00:44:27'),
(932, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:44:37', '2020-08-21 00:44:37'),
(933, 1, 'admin/participants/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:44:51', '2020-08-21 00:44:51'),
(934, 1, 'admin/auth/setting', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:49:06', '2020-08-21 00:49:06'),
(935, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:49:19', '2020-08-21 00:49:19'),
(936, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:50:44', '2020-08-21 00:50:44'),
(937, 1, 'admin/schedules/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:50:48', '2020-08-21 00:50:48'),
(938, 1, 'admin/schedules', 'POST', '::1', '{\"name\":\"Test Website\",\"room_id\":\"2\",\"class_id\":\"1\",\"day\":\"6\",\"time\":\"10:00:00\",\"mentor_id\":\"1\",\"session_long\":\"80\",\"description\":\"test\",\"_token\":\"yWRnMdAUhnp8QeZyn183xlJwNWfIiOtjxCUVYMn2\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-08-21 00:52:19', '2020-08-21 00:52:19'),
(939, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-21 00:52:19', '2020-08-21 00:52:19'),
(940, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:54:21', '2020-08-21 00:54:21'),
(941, 1, 'admin/participants/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:54:30', '2020-08-21 00:54:30'),
(942, 1, 'admin/participants/2', 'PUT', '::1', '{\"user_id\":\"3\",\"class_id\":\"2\",\"zoom_id\":\"187465\",\"zoom_firstname\":\"Siswa Dua\",\"zoom_lastname\":\"Zoom\",\"zoom_type\":\"2\",\"is_mentor\":\"0\",\"_token\":\"yWRnMdAUhnp8QeZyn183xlJwNWfIiOtjxCUVYMn2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/participants\"}', '2020-08-21 00:54:36', '2020-08-21 00:54:36'),
(943, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-21 00:54:37', '2020-08-21 00:54:37'),
(944, 1, 'admin/participants', 'GET', '::1', '[]', '2020-08-21 00:55:12', '2020-08-21 00:55:12'),
(945, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:57:20', '2020-08-21 00:57:20'),
(946, 1, 'admin/mentors/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 00:57:26', '2020-08-21 00:57:26'),
(947, 1, 'admin/mentors/3', 'PUT', '::1', '{\"user_id\":\"4\",\"zoom_id\":\"187465\",\"zoom_firstname\":\"Mardi Turnip, S.Kom, M.Kom\",\"zoom_lastname\":\"Satu\",\"zoom_type\":\"2\",\"is_mentor\":\"1\",\"_token\":\"yWRnMdAUhnp8QeZyn183xlJwNWfIiOtjxCUVYMn2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/mentors\"}', '2020-08-21 00:58:02', '2020-08-21 00:58:02'),
(948, 1, 'admin/mentors', 'GET', '::1', '[]', '2020-08-21 00:58:02', '2020-08-21 00:58:02'),
(949, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 01:00:32', '2020-08-21 01:00:32'),
(950, 1, 'admin/schedules/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 01:00:39', '2020-08-21 01:00:39'),
(951, 1, 'admin/schedules/3', 'PUT', '::1', '{\"name\":\"Test Video Chat 1\",\"room_id\":\"2\",\"class_id\":\"1\",\"day\":\"6\",\"time\":\"08:30:00\",\"mentor_id\":\"4\",\"session_long\":\"120\",\"description\":\"Testing Video Call\",\"_token\":\"yWRnMdAUhnp8QeZyn183xlJwNWfIiOtjxCUVYMn2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-08-21 01:00:47', '2020-08-21 01:00:47'),
(952, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-21 01:00:48', '2020-08-21 01:00:48'),
(953, 1, 'admin', 'GET', '::1', '[]', '2020-08-31 03:27:06', '2020-08-31 03:27:06'),
(954, 1, 'admin/classes', 'GET', '::1', '[]', '2020-08-31 03:54:04', '2020-08-31 03:54:04'),
(955, 1, 'admin/classes/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-31 03:54:19', '2020-08-31 03:54:19'),
(956, 1, 'admin/classes/create', 'GET', '::1', '[]', '2020-08-31 03:54:50', '2020-08-31 03:54:50'),
(957, 1, 'admin/classes', 'GET', '::1', '[]', '2020-08-31 03:54:57', '2020-08-31 03:54:57'),
(958, 1, 'admin/classes', 'GET', '::1', '[]', '2020-08-31 03:55:09', '2020-08-31 03:55:09'),
(959, 1, 'admin/classes/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-31 03:55:13', '2020-08-31 03:55:13'),
(960, 1, 'admin/classes', 'GET', '::1', '[]', '2020-08-31 03:55:29', '2020-08-31 03:55:29'),
(961, 1, 'admin/classes/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-31 03:55:47', '2020-08-31 03:55:47'),
(962, 1, 'admin/classes', 'GET', '::1', '[]', '2020-08-31 03:56:08', '2020-08-31 03:56:08'),
(963, 1, 'admin/classes', 'GET', '::1', '[]', '2020-08-31 03:57:16', '2020-08-31 03:57:16'),
(964, 1, 'admin/classes/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-31 03:57:20', '2020-08-31 03:57:20'),
(965, 1, 'admin/classes', 'POST', '::1', '{\"mentor_id\":\"1\",\"class_name\":\"XII\",\"description\":\"testing tambah kelas\",\"_token\":\"YrR3Fbf3cPeRwcCWrt1ZcHnUt0mnroqzcE7uQQh8\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/classes\"}', '2020-08-31 03:57:36', '2020-08-31 03:57:36'),
(966, 1, 'admin/classes', 'GET', '::1', '[]', '2020-08-31 03:57:37', '2020-08-31 03:57:37'),
(967, 1, 'admin/classes/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-31 03:57:46', '2020-08-31 03:57:46'),
(968, 1, 'admin/classes', 'POST', '::1', '{\"mentor_id\":\"4\",\"class_name\":\"Sistem Informasi\",\"description\":\"testing\",\"_token\":\"YrR3Fbf3cPeRwcCWrt1ZcHnUt0mnroqzcE7uQQh8\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/classes\"}', '2020-08-31 03:58:06', '2020-08-31 03:58:06'),
(969, 1, 'admin/classes', 'GET', '::1', '[]', '2020-08-31 03:58:07', '2020-08-31 03:58:07'),
(970, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-31 03:58:18', '2020-08-31 03:58:18'),
(971, 1, 'admin/schedules/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-31 03:58:21', '2020-08-31 03:58:21'),
(972, 1, 'admin/schedules', 'POST', '::1', '{\"name\":\"Belajar Web\",\"room_id\":\"2\",\"class_id\":\"4\",\"day\":\"3\",\"time\":\"08:30:00\",\"mentor_id\":\"4\",\"session_long\":\"60\",\"description\":\"testing\",\"_token\":\"YrR3Fbf3cPeRwcCWrt1ZcHnUt0mnroqzcE7uQQh8\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-08-31 03:59:22', '2020-08-31 03:59:22'),
(973, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-08-31 03:59:22', '2020-08-31 03:59:22'),
(974, 1, 'admin', 'GET', '::1', '[]', '2020-09-01 01:14:41', '2020-09-01 01:14:41'),
(975, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:16:50', '2020-09-01 01:16:50'),
(976, 1, 'admin/classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:16:58', '2020-09-01 01:16:58'),
(977, 1, 'admin', 'GET', '::1', '[]', '2020-09-01 01:23:52', '2020-09-01 01:23:52'),
(978, 1, 'admin', 'GET', '::1', '[]', '2020-09-01 01:24:09', '2020-09-01 01:24:09'),
(979, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:24:50', '2020-09-01 01:24:50'),
(980, 1, 'admin/schedules/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:25:00', '2020-09-01 01:25:00'),
(981, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:26:13', '2020-09-01 01:26:13'),
(982, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:26:14', '2020-09-01 01:26:14'),
(983, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:26:24', '2020-09-01 01:26:24'),
(984, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:26:32', '2020-09-01 01:26:32'),
(985, 1, 'admin/schedules/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:26:36', '2020-09-01 01:26:36'),
(986, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:26:45', '2020-09-01 01:26:45'),
(987, 1, 'admin/rooms/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:26:48', '2020-09-01 01:26:48'),
(988, 1, 'admin/rooms', 'POST', '::1', '{\"name\":\"S42\",\"max_participant\":\"50\",\"description\":null,\"_token\":\"92xVHFQ8KRZKKH6Kt84Q2KXvcU6fN1eofSsEkPIF\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/rooms\"}', '2020-09-01 01:27:24', '2020-09-01 01:27:24'),
(989, 1, 'admin/rooms', 'GET', '::1', '[]', '2020-09-01 01:27:25', '2020-09-01 01:27:25'),
(990, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:27:40', '2020-09-01 01:27:40'),
(991, 1, 'admin/schedules/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:27:45', '2020-09-01 01:27:45'),
(992, 1, 'admin/schedules', 'POST', '::1', '{\"name\":\"Pemograman\",\"room_id\":\"3\",\"class_id\":\"4\",\"day\":\"4\",\"time\":\"10:00:00\",\"mentor_id\":\"4\",\"session_long\":\"80\",\"description\":\"Belajar Web\",\"_token\":\"92xVHFQ8KRZKKH6Kt84Q2KXvcU6fN1eofSsEkPIF\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-09-01 01:28:53', '2020-09-01 01:28:53'),
(993, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-09-01 01:28:53', '2020-09-01 01:28:53'),
(994, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:35:28', '2020-09-01 01:35:28'),
(995, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:35:32', '2020-09-01 01:35:32'),
(996, 1, 'admin/schedules/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 01:35:56', '2020-09-01 01:35:56'),
(997, 1, 'admin', 'GET', '::1', '[]', '2020-09-01 02:10:58', '2020-09-01 02:10:58'),
(998, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:11:23', '2020-09-01 02:11:23'),
(999, 1, 'admin/rooms/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:11:29', '2020-09-01 02:11:29'),
(1000, 1, 'admin/rooms', 'POST', '::1', '{\"name\":\"S41\",\"max_participant\":\"50\",\"description\":\"Delphi\",\"_token\":\"TB4Ro683u78aXt8EzDxHJAiXSatBJ2Nkqr3a5xce\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/rooms\"}', '2020-09-01 02:12:06', '2020-09-01 02:12:06'),
(1001, 1, 'admin/rooms', 'GET', '::1', '[]', '2020-09-01 02:12:07', '2020-09-01 02:12:07'),
(1002, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:12:16', '2020-09-01 02:12:16'),
(1003, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-09-01 02:12:31', '2020-09-01 02:12:31'),
(1004, 1, 'admin/classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:12:37', '2020-09-01 02:12:37'),
(1005, 1, 'admin/classes/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:12:45', '2020-09-01 02:12:45'),
(1006, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:12:50', '2020-09-01 02:12:50'),
(1007, 1, 'admin/classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:12:56', '2020-09-01 02:12:56'),
(1008, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:13:05', '2020-09-01 02:13:05'),
(1009, 1, 'admin/schedules/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:13:12', '2020-09-01 02:13:12'),
(1010, 1, 'admin/schedules', 'POST', '::1', '{\"name\":\"Delpi\",\"room_id\":\"4\",\"class_id\":\"4\",\"day\":\"2\",\"time\":null,\"mentor_id\":\"4\",\"session_long\":\"60\",\"description\":\"Belajar Delpi\",\"_token\":\"TB4Ro683u78aXt8EzDxHJAiXSatBJ2Nkqr3a5xce\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/schedules\"}', '2020-09-01 02:14:10', '2020-09-01 02:14:10'),
(1011, 1, 'admin/schedules', 'GET', '::1', '[]', '2020-09-01 02:14:11', '2020-09-01 02:14:11'),
(1012, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:15:02', '2020-09-01 02:15:02'),
(1013, 1, 'admin', 'GET', '::1', '[]', '2020-09-01 02:16:24', '2020-09-01 02:16:24'),
(1014, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:17:14', '2020-09-01 02:17:14'),
(1015, 1, 'admin', 'GET', '::1', '[]', '2020-09-01 02:34:06', '2020-09-01 02:34:06'),
(1016, 1, 'admin/rooms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:35:29', '2020-09-01 02:35:29'),
(1017, 1, 'admin/classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:37:49', '2020-09-01 02:37:49'),
(1018, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:38:22', '2020-09-01 02:38:22'),
(1019, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:38:56', '2020-09-01 02:38:56'),
(1020, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:39:02', '2020-09-01 02:39:02'),
(1021, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:39:06', '2020-09-01 02:39:06'),
(1022, 1, 'admin/mentors', 'GET', '::1', '[]', '2020-09-01 02:39:45', '2020-09-01 02:39:45'),
(1023, 1, 'admin/mentors', 'GET', '::1', '[]', '2020-09-01 02:39:49', '2020-09-01 02:39:49'),
(1024, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:40:13', '2020-09-01 02:40:13'),
(1025, 1, 'admin/mentors', 'GET', '::1', '[]', '2020-09-01 02:40:30', '2020-09-01 02:40:30'),
(1026, 1, 'admin/mentors', 'GET', '::1', '[]', '2020-09-01 02:40:33', '2020-09-01 02:40:33'),
(1027, 1, 'admin/mentors', 'GET', '::1', '[]', '2020-09-01 02:40:50', '2020-09-01 02:40:50'),
(1028, 1, 'admin/mentors', 'GET', '::1', '[]', '2020-09-01 02:40:51', '2020-09-01 02:40:51'),
(1029, 1, 'admin/mentors', 'GET', '::1', '[]', '2020-09-01 02:40:55', '2020-09-01 02:40:55'),
(1030, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:44:20', '2020-09-01 02:44:20'),
(1031, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:44:20', '2020-09-01 02:44:20'),
(1032, 1, 'admin/classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:44:26', '2020-09-01 02:44:26'),
(1033, 1, 'admin/classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-01 02:44:26', '2020-09-01 02:44:26'),
(1034, 1, 'admin/classes', 'GET', '::1', '[]', '2020-09-01 02:45:02', '2020-09-01 02:45:02'),
(1035, 1, 'admin', 'GET', '::1', '[]', '2020-09-16 00:23:07', '2020-09-16 00:23:07'),
(1036, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-16 00:23:31', '2020-09-16 00:23:31');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1037, 1, 'admin/schedules/10', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-16 00:24:12', '2020-09-16 00:24:12'),
(1038, 1, 'admin/participants', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-16 00:24:28', '2020-09-16 00:24:28'),
(1039, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-16 00:24:43', '2020-09-16 00:24:43'),
(1040, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-09-16 00:24:54', '2020-09-16 00:24:54'),
(1041, 1, 'admin', 'GET', '::1', '[]', '2020-10-21 05:42:01', '2020-10-21 05:42:01'),
(1042, 1, 'admin/mentors', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-21 05:42:12', '2020-10-21 05:42:12'),
(1043, 1, 'admin/mentors/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-21 05:42:18', '2020-10-21 05:42:18'),
(1044, 1, 'admin/mentors', 'POST', '::1', '{\"user_id\":\"6\",\"zoom_id\":null,\"zoom_firstname\":\"mentor2\",\"zoom_lastname\":null,\"zoom_type\":\"1\",\"is_mentor\":\"1\",\"_token\":\"ZpudyRqtZh26UfQBSG6rQaYTQWCyCp8RjDGHwdme\",\"_previous_\":\"http:\\/\\/localhost\\/spbo\\/public\\/admin\\/mentors\"}', '2020-10-21 05:42:36', '2020-10-21 05:42:36'),
(1045, 1, 'admin/mentors', 'GET', '::1', '[]', '2020-10-21 05:42:37', '2020-10-21 05:42:37'),
(1046, 1, 'admin', 'GET', '::1', '[]', '2020-11-14 13:09:08', '2020-11-14 13:09:08'),
(1047, 1, 'admin', 'GET', '::1', '[]', '2020-11-14 13:17:07', '2020-11-14 13:17:07'),
(1048, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-14 13:17:25', '2020-11-14 13:17:25'),
(1049, 1, 'admin/schedules/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-14 13:18:13', '2020-11-14 13:18:13'),
(1050, 1, 'admin/schedules', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-14 13:18:47', '2020-11-14 13:18:47'),
(1051, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-06-19 04:18:20', '2021-06-19 04:18:20'),
(1052, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 04:18:43', '2021-06-19 04:18:43'),
(1053, 1, 'admin/auth/menu/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 04:21:19', '2021-06-19 04:21:19'),
(1054, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 04:21:27', '2021-06-19 04:21:27'),
(1055, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Matakuliah\",\"icon\":\"fa-book\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"jsRei2x0KAbAI6FQCHf3ZaDznCqIt9XODJX1AbHY\"}', '2021-06-19 04:23:05', '2021-06-19 04:23:05'),
(1056, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-06-19 04:23:05', '2021-06-19 04:23:05'),
(1057, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Matakuliah\",\"icon\":\"fa-book\",\"uri\":\"subjects\",\"roles\":[\"1\",null],\"permission\":\"auth.setting\",\"_token\":\"jsRei2x0KAbAI6FQCHf3ZaDznCqIt9XODJX1AbHY\"}', '2021-06-19 04:26:06', '2021-06-19 04:26:06'),
(1058, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-06-19 04:26:06', '2021-06-19 04:26:06'),
(1059, 1, 'admin/auth/menu/21', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"jsRei2x0KAbAI6FQCHf3ZaDznCqIt9XODJX1AbHY\"}', '2021-06-19 04:26:22', '2021-06-19 04:26:22'),
(1060, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 04:26:22', '2021-06-19 04:26:22'),
(1061, 1, 'admin/auth/menu/22', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"jsRei2x0KAbAI6FQCHf3ZaDznCqIt9XODJX1AbHY\"}', '2021-06-19 04:26:27', '2021-06-19 04:26:27'),
(1062, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 04:26:27', '2021-06-19 04:26:27'),
(1063, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"Matakuliah\",\"icon\":\"fa-book\",\"uri\":\"subjects\",\"roles\":[\"1\",null],\"permission\":\"ext.helpers\",\"_token\":\"jsRei2x0KAbAI6FQCHf3ZaDznCqIt9XODJX1AbHY\"}', '2021-06-19 04:42:27', '2021-06-19 04:42:27'),
(1064, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-06-19 04:42:28', '2021-06-19 04:42:28'),
(1065, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-06-19 04:43:26', '2021-06-19 04:43:26'),
(1066, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 04:43:32', '2021-06-19 04:43:32'),
(1067, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 04:43:54', '2021-06-19 04:43:54'),
(1068, 1, 'admin/subjects', 'POST', '127.0.0.1', '{\"code\":\"PKK-00001\",\"semester\":\"2\",\"sks\":\"3\",\"name\":\"Algoritma Pemrograman\",\"description\":null,\"_token\":\"jsRei2x0KAbAI6FQCHf3ZaDznCqIt9XODJX1AbHY\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/subjects\"}', '2021-06-19 04:47:03', '2021-06-19 04:47:03'),
(1069, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '[]', '2021-06-19 04:47:03', '2021-06-19 04:47:03'),
(1070, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 04:54:07', '2021-06-19 04:54:07'),
(1071, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 04:56:40', '2021-06-19 04:56:40'),
(1072, 1, 'admin/subjects/1', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"jsRei2x0KAbAI6FQCHf3ZaDznCqIt9XODJX1AbHY\"}', '2021-06-19 04:57:01', '2021-06-19 04:57:01'),
(1073, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 04:57:01', '2021-06-19 04:57:01'),
(1074, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 04:57:03', '2021-06-19 04:57:03'),
(1075, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 04:57:13', '2021-06-19 04:57:13'),
(1076, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 05:18:46', '2021-06-19 05:18:46'),
(1077, 1, 'admin/subjects', 'POST', '127.0.0.1', '{\"code\":\"PKK-00001\",\"semester\":\"1\",\"sks\":\"3\",\"name\":\"Algoritma Pemrograman\",\"description\":null,\"_token\":\"jsRei2x0KAbAI6FQCHf3ZaDznCqIt9XODJX1AbHY\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/subjects\"}', '2021-06-19 05:19:09', '2021-06-19 05:19:09'),
(1078, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '[]', '2021-06-19 05:19:10', '2021-06-19 05:19:10'),
(1079, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '[]', '2021-06-19 05:19:29', '2021-06-19 05:19:29'),
(1080, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 05:19:34', '2021-06-19 05:19:34'),
(1081, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 05:19:38', '2021-06-19 05:19:38'),
(1082, 1, 'admin/subjects/2', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"jsRei2x0KAbAI6FQCHf3ZaDznCqIt9XODJX1AbHY\"}', '2021-06-19 05:19:45', '2021-06-19 05:19:45'),
(1083, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 05:19:45', '2021-06-19 05:19:45'),
(1084, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 05:19:49', '2021-06-19 05:19:49'),
(1085, 1, 'admin/subjects', 'POST', '127.0.0.1', '{\"code\":\"PKK-00001\",\"semester\":\"1\",\"sks\":\"3\",\"name\":\"Algoritma Pemrograman\",\"description\":null,\"_token\":\"jsRei2x0KAbAI6FQCHf3ZaDznCqIt9XODJX1AbHY\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/subjects\"}', '2021-06-19 05:20:02', '2021-06-19 05:20:02'),
(1086, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '[]', '2021-06-19 05:20:03', '2021-06-19 05:20:03'),
(1087, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 05:20:13', '2021-06-19 05:20:13'),
(1088, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2021-06-19 07:53:24', '2021-06-19 07:53:24'),
(1089, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 08:48:06', '2021-06-19 08:48:06'),
(1090, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 08:48:57', '2021-06-19 08:48:57'),
(1091, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 08:49:00', '2021-06-19 08:49:00'),
(1092, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 08:49:03', '2021-06-19 08:49:03'),
(1093, 1, 'admin/subjects/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 08:49:07', '2021-06-19 08:49:07'),
(1094, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 08:49:43', '2021-06-19 08:49:43'),
(1095, 1, 'admin/classes', 'GET', '127.0.0.1', '[]', '2021-06-19 09:38:48', '2021-06-19 09:38:48'),
(1096, 1, 'admin/classes/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 09:38:57', '2021-06-19 09:38:57'),
(1097, 1, 'admin/classes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 09:39:05', '2021-06-19 09:39:05'),
(1098, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-06-19 09:53:53', '2021-06-19 09:53:53'),
(1099, 1, 'admin/schedules', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 09:53:58', '2021-06-19 09:53:58'),
(1100, 1, 'admin/schedules/2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"TslYZheXtkCY7yga9kqgyC9Cce0igSb5gfdpQQWw\"}', '2021-06-19 09:54:14', '2021-06-19 09:54:14'),
(1101, 1, 'admin/schedules', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 09:54:14', '2021-06-19 09:54:14'),
(1102, 1, 'admin/schedules', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 09:55:45', '2021-06-19 09:55:45'),
(1103, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 09:55:48', '2021-06-19 09:55:48'),
(1104, 1, 'admin/schedules', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 09:56:01', '2021-06-19 09:56:01'),
(1105, 1, 'admin/schedules/21/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 09:56:08', '2021-06-19 09:56:08'),
(1106, 1, 'admin/schedules', 'GET', '127.0.0.1', '[]', '2021-06-19 09:56:52', '2021-06-19 09:56:52'),
(1107, 1, 'admin/participants', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 10:58:32', '2021-06-19 10:58:32'),
(1108, 1, 'admin/participants/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 10:58:50', '2021-06-19 10:58:50'),
(1109, 1, 'admin/participants', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 10:58:57', '2021-06-19 10:58:57'),
(1110, 1, 'admin/schedules/21/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 10:58:57', '2021-06-19 10:58:57'),
(1111, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-06-19 11:07:06', '2021-06-19 11:07:06'),
(1112, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"subject_classes\",\"model_name\":\"App\\\\Models\\\\SubjectClass\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\SubjectClass\",\"create\":[\"migration\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"subject_id\",\"type\":\"integer\",\"key\":\"index\",\"default\":null,\"comment\":null},{\"name\":\"class_id\",\"type\":\"integer\",\"key\":\"index\",\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"UnfX8wbemdU7YgnFH7DRfRCRls97SfDQo3G891CL\"}', '2021-06-19 11:09:09', '2021-06-19 11:09:09'),
(1113, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-06-19 11:09:09', '2021-06-19 11:09:09'),
(1114, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"subject_classes\",\"model_name\":\"App\\\\Models\\\\SubjectClass\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\SubjectClassController\",\"create\":[\"migration\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"subject_id\",\"type\":\"integer\",\"key\":\"index\",\"default\":null,\"comment\":null},{\"name\":\"class_id\",\"type\":\"integer\",\"key\":\"index\",\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"UnfX8wbemdU7YgnFH7DRfRCRls97SfDQo3G891CL\"}', '2021-06-19 11:10:12', '2021-06-19 11:10:12'),
(1115, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-06-19 11:10:12', '2021-06-19 11:10:12'),
(1116, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"subject_classes\",\"model_name\":\"App\\\\Models\\\\SubjectClass\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\SubjectClassController\",\"create\":[\"migration\",\"model\",\"controller\"],\"fields\":[{\"name\":\"subject_id\",\"type\":\"integer\",\"key\":\"index\",\"default\":null,\"comment\":null},{\"name\":\"class_id\",\"type\":\"integer\",\"key\":\"index\",\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"UnfX8wbemdU7YgnFH7DRfRCRls97SfDQo3G891CL\"}', '2021-06-19 11:10:21', '2021-06-19 11:10:21'),
(1117, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-06-19 11:10:21', '2021-06-19 11:10:21'),
(1118, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"subject_classes\",\"model_name\":\"App\\\\Models\\\\SubjectClass\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\SubjectClassController\",\"create\":[\"migration\",\"controller\"],\"fields\":[{\"name\":\"subject_id\",\"type\":\"integer\",\"key\":\"index\",\"default\":null,\"comment\":null},{\"name\":\"class_id\",\"type\":\"integer\",\"key\":\"index\",\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"UnfX8wbemdU7YgnFH7DRfRCRls97SfDQo3G891CL\"}', '2021-06-19 11:10:30', '2021-06-19 11:10:30'),
(1119, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-06-19 11:10:30', '2021-06-19 11:10:30'),
(1120, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"subject_classes\",\"model_name\":\"App\\\\Models\\\\SubjectClass\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\SubjectClassController\",\"create\":[\"migration\"],\"fields\":[{\"name\":\"subject_id\",\"type\":\"integer\",\"key\":\"index\",\"default\":null,\"comment\":null},{\"name\":\"class_id\",\"type\":\"integer\",\"key\":\"index\",\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"UnfX8wbemdU7YgnFH7DRfRCRls97SfDQo3G891CL\"}', '2021-06-19 11:10:38', '2021-06-19 11:10:38'),
(1121, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2021-06-19 11:10:39', '2021-06-19 11:10:39'),
(1122, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:11:59', '2021-06-19 11:11:59'),
(1123, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Matakuliah Per Kelas\",\"icon\":\"fa-cubes\",\"uri\":\"subject-classes\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"UnfX8wbemdU7YgnFH7DRfRCRls97SfDQo3G891CL\"}', '2021-06-19 11:12:46', '2021-06-19 11:12:46'),
(1124, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-06-19 11:12:46', '2021-06-19 11:12:46'),
(1125, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-06-19 11:12:53', '2021-06-19 11:12:53'),
(1126, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"UnfX8wbemdU7YgnFH7DRfRCRls97SfDQo3G891CL\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":23},{\\\"id\\\":24},{\\\"id\\\":17},{\\\"id\\\":15},{\\\"id\\\":16},{\\\"id\\\":19}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":20}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":10,\\\"children\\\":[{\\\"id\\\":11},{\\\"id\\\":12},{\\\"id\\\":13},{\\\"id\\\":14}]}]\"}', '2021-06-19 11:13:04', '2021-06-19 11:13:04'),
(1127, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:13:05', '2021-06-19 11:13:05'),
(1128, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-06-19 11:13:10', '2021-06-19 11:13:10'),
(1129, 1, 'admin/subject-classes', 'GET', '127.0.0.1', '[]', '2021-06-19 11:13:33', '2021-06-19 11:13:33'),
(1130, 1, 'admin/subject-classes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:13:37', '2021-06-19 11:13:37'),
(1131, 1, 'admin/subject-classes/create', 'GET', '127.0.0.1', '[]', '2021-06-19 11:15:54', '2021-06-19 11:15:54'),
(1132, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:24:22', '2021-06-19 11:24:22'),
(1133, 1, 'admin/subject-classes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:24:26', '2021-06-19 11:24:26'),
(1134, 1, 'admin/subject-classes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:24:29', '2021-06-19 11:24:29'),
(1135, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:24:33', '2021-06-19 11:24:33'),
(1136, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:24:36', '2021-06-19 11:24:36'),
(1137, 1, 'admin/classes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:24:41', '2021-06-19 11:24:41'),
(1138, 1, 'admin/classes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:24:43', '2021-06-19 11:24:43'),
(1139, 1, 'admin/classes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:24:46', '2021-06-19 11:24:46'),
(1140, 1, 'admin/classes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:25:09', '2021-06-19 11:25:09'),
(1141, 1, 'admin/classes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:25:11', '2021-06-19 11:25:11'),
(1142, 1, 'admin/classes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:25:41', '2021-06-19 11:25:41'),
(1143, 1, 'admin/classes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:29:52', '2021-06-19 11:29:52'),
(1144, 1, 'admin/classes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:30:01', '2021-06-19 11:30:01'),
(1145, 1, 'admin/classes/create', 'GET', '127.0.0.1', '[]', '2021-06-19 11:33:27', '2021-06-19 11:33:27'),
(1146, 1, 'admin/classes/create', 'GET', '127.0.0.1', '[]', '2021-06-19 11:33:44', '2021-06-19 11:33:44'),
(1147, 1, 'admin/classes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:35:03', '2021-06-19 11:35:03'),
(1148, 1, 'admin/subject-classes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:35:09', '2021-06-19 11:35:09'),
(1149, 1, 'admin/subject-classes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:35:11', '2021-06-19 11:35:11'),
(1150, 1, 'admin/subject-classes', 'POST', '127.0.0.1', '{\"subject_id\":\"3\",\"class_id\":\"4\",\"_token\":\"UnfX8wbemdU7YgnFH7DRfRCRls97SfDQo3G891CL\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/subject-classes\"}', '2021-06-19 11:35:19', '2021-06-19 11:35:19'),
(1151, 1, 'admin/subject-classes', 'GET', '127.0.0.1', '[]', '2021-06-19 11:35:20', '2021-06-19 11:35:20'),
(1152, 1, 'admin/subject-classes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 11:35:21', '2021-06-19 11:35:21'),
(1153, 1, 'admin/subject-classes', 'POST', '127.0.0.1', '{\"subject_id\":\"3\",\"class_id\":\"1\",\"_token\":\"UnfX8wbemdU7YgnFH7DRfRCRls97SfDQo3G891CL\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/subject-classes\"}', '2021-06-19 11:35:26', '2021-06-19 11:35:26'),
(1154, 1, 'admin/subject-classes', 'GET', '127.0.0.1', '[]', '2021-06-19 11:35:27', '2021-06-19 11:35:27'),
(1155, 1, 'admin/auth/menu', 'GET', '36.71.136.226', '[]', '2021-06-19 20:17:06', '2021-06-19 20:17:06'),
(1156, 1, 'admin/auth/logout', 'GET', '36.71.136.226', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 20:17:43', '2021-06-19 20:17:43'),
(1157, 1, 'admin', 'GET', '36.71.136.226', '[]', '2021-06-19 20:17:57', '2021-06-19 20:17:57'),
(1158, 1, 'admin/schedules', 'GET', '36.71.136.226', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 20:18:20', '2021-06-19 20:18:20'),
(1159, 1, 'admin/schedules/create', 'GET', '36.71.136.226', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 20:18:32', '2021-06-19 20:18:32'),
(1160, 1, 'admin/subject-classes', 'GET', '36.71.136.226', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 20:18:51', '2021-06-19 20:18:51'),
(1161, 1, 'admin', 'GET', '114.122.45.167', '[]', '2021-06-19 21:45:30', '2021-06-19 21:45:30'),
(1162, 1, 'admin/subjects', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 21:45:49', '2021-06-19 21:45:49'),
(1163, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 21:46:05', '2021-06-19 21:46:05'),
(1164, 1, 'admin/subjects', 'POST', '114.122.45.167', '{\"code\":\"2\",\"semester\":\"7\",\"sks\":\"3\",\"name\":\"Pemrograman Web II (PHP, MYSQL)\",\"description\":null,\"_token\":\"3eUEe3xOxoau1iOox7ULynn7seJZ3nakWGER4SI3\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/spboonline20.great-site.net\\/admin\\/subjects\"}', '2021-06-19 21:48:48', '2021-06-19 21:48:48'),
(1165, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '[]', '2021-06-19 21:48:54', '2021-06-19 21:48:54'),
(1166, 1, 'admin/subject-classes', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 21:49:43', '2021-06-19 21:49:43'),
(1167, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 21:50:02', '2021-06-19 21:50:02'),
(1168, 1, 'admin/subjects', 'POST', '114.122.45.167', '{\"code\":\"3\",\"semester\":\"7\",\"sks\":\"11\",\"name\":\"SIstem Terdistribusi\",\"description\":null,\"_token\":\"3eUEe3xOxoau1iOox7ULynn7seJZ3nakWGER4SI3\",\"after-save\":\"2\"}', '2021-06-19 21:58:54', '2021-06-19 21:58:54'),
(1169, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '[]', '2021-06-19 21:59:00', '2021-06-19 21:59:00'),
(1170, 1, 'admin/schedules', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 21:59:22', '2021-06-19 21:59:22'),
(1171, 1, 'admin/subjects', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 22:45:00', '2021-06-19 22:45:00'),
(1172, 1, 'admin/subjects', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 22:45:00', '2021-06-19 22:45:00'),
(1173, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 22:45:25', '2021-06-19 22:45:25'),
(1174, 1, 'admin/subjects', 'POST', '114.122.45.167', '{\"code\":\"4\",\"semester\":\"7\",\"sks\":\"10\",\"name\":\"TESTING DAN IMPLEMENTASI SISTEM\",\"description\":null,\"_token\":\"3eUEe3xOxoau1iOox7ULynn7seJZ3nakWGER4SI3\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/spboonline20.great-site.net\\/admin\\/subjects\"}', '2021-06-19 22:47:20', '2021-06-19 22:47:20'),
(1175, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '[]', '2021-06-19 22:47:27', '2021-06-19 22:47:27'),
(1176, 1, 'admin/schedules', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 22:47:42', '2021-06-19 22:47:42'),
(1177, 1, 'admin/schedules', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 22:47:43', '2021-06-19 22:47:43'),
(1178, 1, 'admin/subject-classes', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 22:48:11', '2021-06-19 22:48:11'),
(1179, 1, 'admin/mentors', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 22:48:33', '2021-06-19 22:48:33'),
(1180, 1, 'admin/mentors', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 22:48:33', '2021-06-19 22:48:33'),
(1181, 1, 'admin/schedules', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 22:48:52', '2021-06-19 22:48:52'),
(1182, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 22:49:06', '2021-06-19 22:49:06'),
(1183, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 22:49:22', '2021-06-19 22:49:22'),
(1184, 1, 'admin/subjects', 'GET', '114.122.45.167', '[]', '2021-06-19 23:57:44', '2021-06-19 23:57:44'),
(1185, 1, 'admin/subjects/3', 'DELETE', '114.122.45.167', '{\"_method\":\"delete\",\"_token\":\"EHVeRx3XZPjufANXpasXE4AboQng6mjSS6AkQmSl\"}', '2021-06-19 23:58:22', '2021-06-19 23:58:22'),
(1186, 1, 'admin/subjects', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 23:58:28', '2021-06-19 23:58:28'),
(1187, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-19 23:59:09', '2021-06-19 23:59:09'),
(1188, 1, 'admin/subjects', 'POST', '114.122.45.167', '{\"code\":\"8\",\"semester\":\"7\",\"sks\":\"9\",\"name\":\"MANAJEMEN PROYEK SISTEM INFORMASI\",\"description\":null,\"_token\":\"EHVeRx3XZPjufANXpasXE4AboQng6mjSS6AkQmSl\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/spboonline20.great-site.net\\/admin\\/subjects\"}', '2021-06-20 00:00:13', '2021-06-20 00:00:13'),
(1189, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '[]', '2021-06-20 00:00:27', '2021-06-20 00:00:27'),
(1190, 1, 'admin/classes', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:01:09', '2021-06-20 00:01:09'),
(1191, 1, 'admin/classes', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:01:09', '2021-06-20 00:01:09'),
(1192, 1, 'admin/classes/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:01:32', '2021-06-20 00:01:32'),
(1193, 1, 'admin/classes/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:01:32', '2021-06-20 00:01:32'),
(1194, 1, 'admin/classes', 'POST', '114.122.45.167', '{\"mentor_id\":\"4\",\"class_name\":\"sistem informasi\",\"description\":null,\"_token\":\"EHVeRx3XZPjufANXpasXE4AboQng6mjSS6AkQmSl\",\"after-save\":\"2\"}', '2021-06-20 00:01:59', '2021-06-20 00:01:59'),
(1195, 1, 'admin/classes/create', 'GET', '114.122.45.167', '[]', '2021-06-20 00:02:06', '2021-06-20 00:02:06'),
(1196, 1, 'admin/rooms', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:02:25', '2021-06-20 00:02:25'),
(1197, 1, 'admin/rooms', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:02:25', '2021-06-20 00:02:25'),
(1198, 1, 'admin/rooms/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:02:44', '2021-06-20 00:02:44'),
(1199, 1, 'admin/rooms/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:02:44', '2021-06-20 00:02:44'),
(1200, 1, 'admin/rooms', 'POST', '114.122.45.167', '{\"name\":\"B41\",\"max_participant\":\"30\",\"description\":null,\"_token\":\"EHVeRx3XZPjufANXpasXE4AboQng6mjSS6AkQmSl\",\"after-save\":\"2\"}', '2021-06-20 00:04:03', '2021-06-20 00:04:03'),
(1201, 1, 'admin/rooms/create', 'GET', '114.122.45.167', '[]', '2021-06-20 00:04:09', '2021-06-20 00:04:09'),
(1202, 1, 'admin/rooms/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:05:30', '2021-06-20 00:05:30'),
(1203, 1, 'admin/rooms', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:05:33', '2021-06-20 00:05:33'),
(1204, 1, 'admin/rooms/3,5', 'DELETE', '114.122.45.167', '{\"_method\":\"delete\",\"_token\":\"EHVeRx3XZPjufANXpasXE4AboQng6mjSS6AkQmSl\"}', '2021-06-20 00:06:34', '2021-06-20 00:06:34'),
(1205, 1, 'admin/rooms', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:06:42', '2021-06-20 00:06:42'),
(1206, 1, 'admin/rooms/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:07:08', '2021-06-20 00:07:08'),
(1207, 1, 'admin/rooms/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:07:09', '2021-06-20 00:07:09'),
(1208, 1, 'admin/rooms', 'POST', '114.122.45.167', '{\"name\":\"B41\",\"max_participant\":\"30\",\"description\":\"Sistem Terdistribusi\",\"_token\":\"EHVeRx3XZPjufANXpasXE4AboQng6mjSS6AkQmSl\",\"after-save\":\"2\"}', '2021-06-20 00:08:23', '2021-06-20 00:08:23'),
(1209, 1, 'admin/rooms/create', 'GET', '114.122.45.167', '[]', '2021-06-20 00:08:29', '2021-06-20 00:08:29'),
(1210, 1, 'admin/rooms/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:08:47', '2021-06-20 00:08:47'),
(1211, 1, 'admin/subject-classes', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:09:04', '2021-06-20 00:09:04'),
(1212, 1, 'admin/schedules', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:09:25', '2021-06-20 00:09:25'),
(1213, 1, 'admin/schedules', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:09:25', '2021-06-20 00:09:25'),
(1214, 1, 'admin/subject-classes', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:09:59', '2021-06-20 00:09:59'),
(1215, 1, 'admin/rooms', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:27:26', '2021-06-20 00:27:26'),
(1216, 1, 'admin/rooms', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:28:28', '2021-06-20 00:28:28'),
(1217, 1, 'admin/classes/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:28:34', '2021-06-20 00:28:34'),
(1218, 1, 'admin/classes/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:28:35', '2021-06-20 00:28:35'),
(1219, 1, 'admin/classes', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:28:47', '2021-06-20 00:28:47'),
(1220, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:28:51', '2021-06-20 00:28:51'),
(1221, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:29:05', '2021-06-20 00:29:05'),
(1222, 1, 'admin/subjects', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:29:16', '2021-06-20 00:29:16'),
(1223, 1, 'admin/auth/login', 'GET', '114.122.45.167', '[]', '2021-06-20 00:30:37', '2021-06-20 00:30:37'),
(1224, 1, 'admin', 'GET', '114.122.45.167', '[]', '2021-06-20 00:30:41', '2021-06-20 00:30:41'),
(1225, 1, 'admin', 'GET', '36.71.136.226', '[]', '2021-06-20 00:35:21', '2021-06-20 00:35:21'),
(1226, 1, 'admin/subjects', 'GET', '36.71.136.226', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:35:33', '2021-06-20 00:35:33'),
(1227, 1, 'admin/schedules', 'GET', '114.122.45.167', '[]', '2021-06-20 00:53:02', '2021-06-20 00:53:02'),
(1228, 1, 'admin/schedules', 'GET', '114.122.45.167', '{\"_export_\":\"page:1\"}', '2021-06-20 00:53:44', '2021-06-20 00:53:44'),
(1229, 1, 'admin/subjects', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:54:10', '2021-06-20 00:54:10'),
(1230, 1, 'admin/subjects', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:54:10', '2021-06-20 00:54:10'),
(1231, 1, 'admin/schedules', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 00:54:27', '2021-06-20 00:54:27'),
(1232, 1, 'admin/schedules', 'GET', '114.122.45.167', '[]', '2021-06-20 00:54:29', '2021-06-20 00:54:29'),
(1233, 1, 'admin/schedules', 'GET', '114.122.45.167', '[]', '2021-06-20 00:54:36', '2021-06-20 00:54:36'),
(1234, 1, 'admin/schedules', 'GET', '114.122.45.167', '[]', '2021-06-20 00:54:38', '2021-06-20 00:54:38'),
(1235, 1, 'admin/subjects/create', 'GET', '36.71.136.226', '[]', '2021-06-20 00:59:50', '2021-06-20 00:59:50'),
(1236, 1, 'admin/subjects', 'GET', '36.71.136.226', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 01:15:03', '2021-06-20 01:15:03'),
(1237, 1, 'admin/subjects/create', 'GET', '36.71.136.226', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 01:15:12', '2021-06-20 01:15:12'),
(1238, 1, 'admin/subjects', 'POST', '36.71.136.226', '{\"code\":\"PKK-00001\",\"semester\":\"1\",\"sks\":\"2\",\"name\":\"Algoritma Pemrograman\",\"description\":null,\"_token\":\"Gk5b5ETcLOV27Sv8MjcxwQtQTDVzXd29lvxrcZoj\",\"_previous_\":\"http:\\/\\/spboonline20.great-site.net\\/admin\\/subjects\"}', '2021-06-20 01:15:28', '2021-06-20 01:15:28'),
(1239, 1, 'admin/subjects', 'GET', '36.71.136.226', '[]', '2021-06-20 01:15:41', '2021-06-20 01:15:41'),
(1240, 1, 'admin', 'GET', '114.122.45.167', '[]', '2021-06-20 14:03:23', '2021-06-20 14:03:23'),
(1241, 1, 'admin/subjects', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 14:03:42', '2021-06-20 14:03:42'),
(1242, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 14:03:58', '2021-06-20 14:03:58'),
(1243, 1, 'admin/subjects', 'POST', '114.122.45.167', '{\"code\":\"3\",\"semester\":\"7\",\"sks\":\"11\",\"name\":\"SIstem Terdistribusi\",\"description\":\"Sistem Terdistribusi\",\"_token\":\"1rJn9g8Dr817z0uwGxNUCsLeNSTwPHuFaoP0OUvs\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/spboonline20.great-site.net\\/admin\\/subjects\"}', '2021-06-20 14:04:52', '2021-06-20 14:04:52'),
(1244, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '[]', '2021-06-20 14:05:07', '2021-06-20 14:05:07'),
(1245, 1, 'admin/subjects', 'POST', '114.122.45.167', '{\"code\":\"4\",\"semester\":\"7\",\"sks\":\"10\",\"name\":\"Kewirausahaan\",\"description\":\"Kewirausahaan\",\"_token\":\"1rJn9g8Dr817z0uwGxNUCsLeNSTwPHuFaoP0OUvs\",\"after-save\":\"2\"}', '2021-06-20 14:06:27', '2021-06-20 14:06:27'),
(1246, 1, 'admin/subjects/create', 'GET', '114.122.45.167', '[]', '2021-06-20 14:06:41', '2021-06-20 14:06:41'),
(1247, 1, 'admin/classes', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 14:07:20', '2021-06-20 14:07:20'),
(1248, 1, 'admin/classes', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 14:07:20', '2021-06-20 14:07:20'),
(1249, 1, 'admin/rooms', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 14:07:55', '2021-06-20 14:07:55'),
(1250, 1, 'admin/rooms', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 14:07:55', '2021-06-20 14:07:55'),
(1251, 1, 'admin/rooms/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 14:08:23', '2021-06-20 14:08:23'),
(1252, 1, 'admin/rooms', 'POST', '114.122.45.167', '{\"name\":\"SIstem Terdistribusi\",\"max_participant\":\"30\",\"description\":\"Sistem Terdistribusi\",\"_token\":\"1rJn9g8Dr817z0uwGxNUCsLeNSTwPHuFaoP0OUvs\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/spboonline20.great-site.net\\/admin\\/rooms\"}', '2021-06-20 14:09:08', '2021-06-20 14:09:08'),
(1253, 1, 'admin/rooms/create', 'GET', '114.122.45.167', '[]', '2021-06-20 14:09:15', '2021-06-20 14:09:15'),
(1254, 1, 'admin/rooms', 'POST', '114.122.45.167', '{\"name\":\"A44\",\"max_participant\":\"30\",\"description\":\"Kewirausahaan\",\"_token\":\"1rJn9g8Dr817z0uwGxNUCsLeNSTwPHuFaoP0OUvs\",\"after-save\":\"2\"}', '2021-06-20 14:10:57', '2021-06-20 14:10:57'),
(1255, 1, 'admin/rooms/create', 'GET', '114.122.45.167', '[]', '2021-06-20 14:11:03', '2021-06-20 14:11:03'),
(1256, 1, 'admin/rooms/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 14:11:34', '2021-06-20 14:11:34'),
(1257, 1, 'admin/schedules', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 14:11:48', '2021-06-20 14:11:48'),
(1258, 1, 'admin/schedules/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 14:12:14', '2021-06-20 14:12:14'),
(1259, 1, 'admin/schedules', 'POST', '114.122.45.167', '{\"name\":\"SIstem Terdistribusi\",\"room_id\":\"4\",\"class_id\":\"4\",\"subject_id\":\"9\",\"day\":\"4\",\"time\":\"13:00:00\",\"mentor_id\":\"4\",\"session_long\":\"80\",\"description\":\"Sistem Terdistribusi\",\"_token\":\"1rJn9g8Dr817z0uwGxNUCsLeNSTwPHuFaoP0OUvs\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/spboonline20.great-site.net\\/admin\\/schedules\"}', '2021-06-20 14:14:18', '2021-06-20 14:14:18'),
(1260, 1, 'admin/schedules/create', 'GET', '114.122.45.167', '[]', '2021-06-20 14:14:27', '2021-06-20 14:14:27'),
(1261, 1, 'admin/schedules', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 14:14:53', '2021-06-20 14:14:53'),
(1262, 1, 'admin/schedules/create', 'GET', '114.122.45.167', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 14:15:18', '2021-06-20 14:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL),
(6, 'Admin helpers', 'ext.helpers', '', '/helpers/*', '2020-08-06 07:45:20', '2020-08-06 07:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2020-08-05 02:57:32', '2020-08-05 02:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 8, NULL, NULL),
(1, 15, NULL, NULL),
(1, 16, NULL, NULL),
(1, 17, NULL, NULL),
(1, 18, NULL, NULL),
(1, 19, NULL, NULL),
(1, 20, NULL, NULL),
(1, 23, NULL, NULL),
(1, 24, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$.Am8AsDqUa8Xcv1IvEfVvO5xiRvWklqRnkegXA0GaDeF3/e71h3QK', 'Administrator', NULL, 'CYGj479ASfE4NMXYHWgSFjYKA3VApy87KJRqAsLKbh5n6CJRJ8N9yT50O76p', '2020-08-05 02:57:32', '2020-08-05 02:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_08_06_160512_create_participant_classes_table', 2),
(6, '2020_08_06_151925_create_participants_table', 2),
(7, '2020_08_07_163141_create_rooms_table', 3),
(9, '2020_08_07_170252_create_schedules_table', 4),
(10, '2020_08_09_140458_create_schedule_views_table', 4),
(11, '2020_08_11_155124_create_participant_presents_table', 5),
(12, '2020_08_11_164809_create_participant_present_views_table', 5),
(13, '2020_08_11_171110_create_tasks_table', 6),
(19, '2020_08_12_110408_create_task_views_table', 10),
(17, '2020_08_12_125322_create_user_information_table', 8),
(18, '2020_10_15_141602_create_topics_table', 9),
(20, '2020_11_18_024922_create_theories_table', 11),
(21, '2020_11_18_030516_create_subjects_table', 11),
(22, '2020_11_18_031721_create_subject_classes_table', 11),
(23, '2020_12_21_120422_create_quizzes_table', 11),
(24, '2020_12_21_134120_create_quiz_questions_table', 11),
(25, '2020_12_25_163354_create_quiz_answers_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `zoom_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'zoom user id',
  `zoom_firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoom_lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoom_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoom_type` int(11) NOT NULL,
  `is_mentor` tinyint(4) NOT NULL,
  `live_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `user_id`, `class_id`, `zoom_id`, `zoom_firstname`, `zoom_lastname`, `zoom_email`, `zoom_type`, `is_mentor`, `live_status`, `created_at`, `updated_at`) VALUES
(1, 2, 4, '1233sfs', 'Siswa Update 2', 'Zoom', 'siswa1@gmail.com', 1, 0, 0, '2020-08-05 17:00:00', '2021-06-19 09:47:10'),
(2, 3, 4, '187465', 'Siswa 2', 'Zoom', 'siswa2@gmail.com', 2, 0, 1, '2020-08-06 10:58:17', '2021-06-19 23:44:12'),
(3, 4, NULL, '187465', 'Mardi Turnip, S.Kom, M.Kom', 'Satu', 'mentor@gmail.com', 2, 1, 1, '2020-08-06 10:58:17', '2021-06-20 13:58:58'),
(4, 1, NULL, NULL, 'GURU Terlanjur', 'Mentor', 'guru@gmail.com', 1, 1, 0, '2020-08-12 06:42:23', '2020-08-12 07:39:41'),
(6, 5, 1, NULL, 'Siswa 3', NULL, 'siswa3@gmail.com', 1, 0, 0, '2020-08-12 07:47:24', '2020-08-21 00:43:49'),
(7, 6, NULL, NULL, 'mentor2', NULL, NULL, 1, 1, 0, '2020-10-21 05:42:37', '2020-10-21 05:42:58');

-- --------------------------------------------------------

--
-- Table structure for table `participant_classes`
--

CREATE TABLE `participant_classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `class_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mentor_id` tinyint(4) DEFAULT NULL COMMENT 'user  id as mentor',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participant_classes`
--

INSERT INTO `participant_classes` (`id`, `class_name`, `mentor_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'IX', 4, 'testt', '2020-08-05 17:00:00', '2020-08-12 05:05:33'),
(2, 'VIII', 4, NULL, '2020-08-06 17:00:00', '2020-08-12 05:05:19'),
(3, 'XII', 1, 'testing tambah kelas', '2020-08-31 03:57:36', '2020-08-31 03:57:36'),
(4, 'Sistem Informasi', 4, 'testing', '2020-08-31 03:58:06', '2020-08-31 03:58:06'),
(5, 'sistem informasi', 4, NULL, '2021-06-20 00:02:02', '2021-06-20 00:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `participant_presents`
--

CREATE TABLE `participant_presents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `present` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participant_presents`
--

INSERT INTO `participant_presents` (`id`, `schedule_id`, `participant_id`, `datetime`, `present`) VALUES
(1, 3, 1, '2020-08-31 10:49:56', 0),
(2, 3, 2, NULL, 0),
(3, 4, 1, '2020-09-01 08:33:46', 0),
(4, 4, 2, NULL, 0),
(5, 2, 6, '2020-08-12 16:05:30', 0),
(6, 7, 1, '2020-09-01 10:04:58', 0),
(7, 10, 1, '2021-06-19 16:27:46', 1),
(8, 12, 1, '2021-06-19 16:30:41', 1),
(9, 6, 1, '2021-06-19 16:31:19', 1),
(10, 8, 1, '2021-06-19 16:37:44', 1),
(11, 16, 1, NULL, 0),
(12, 19, 3, NULL, 0),
(13, 19, 4, NULL, 0),
(14, 19, 7, NULL, 0),
(15, 20, 6, NULL, 0),
(16, 21, 1, NULL, 0),
(17, 21, 2, '2021-06-19 17:39:23', 1),
(18, 23, 1, NULL, 0),
(19, 23, 2, NULL, 0),
(20, 22, 6, NULL, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `participant_present_views`
-- (See below for the actual view)
--
CREATE TABLE `participant_present_views` (
`id` bigint(20) unsigned
,`schedule_id` int(11)
,`participant_id` int(11)
,`datetime` datetime
,`present` tinyint(4)
,`user_id` int(11)
,`user_name` varchar(100)
,`email` varchar(100)
,`schedule_name` varchar(255)
,`mentor_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `maximum_quiz` int(11) NOT NULL DEFAULT '50',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `title`, `subject_id`, `topic_id`, `created_by`, `maximum_quiz`, `description`, `created_at`, `updated_at`) VALUES
(11, '12.1 Pre Test', 9, 60, 4, 5, 'Sistem Terdistribusi', '2021-06-20 14:32:21', '2021-06-20 14:32:21'),
(10, 'Test', 8, 33, 4, 10, NULL, '2021-06-20 01:17:05', '2021-06-20 01:17:05');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_answers`
--

CREATE TABLE `quiz_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_type` tinyint(4) NOT NULL DEFAULT '1',
  `quiz_id` int(11) NOT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_a` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_b` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_c` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_d` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `question_type`, `quiz_id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `answer`, `point`) VALUES
(171, 1, 11, '', '', '', '', '', '', 1),
(172, 1, 11, '', '', '', '', '', '', 1),
(173, 1, 11, '', '', '', '', '', '', 1),
(174, 1, 11, '', '', '', '', '', '', 1),
(175, 1, 11, '', '', '', '', '', '', 1),
(170, 1, 10, 'test1', 'a', 'b', NULL, NULL, 'A', 1),
(169, 1, 10, 'test2', 'a', 'b', NULL, NULL, 'A', 1),
(168, 1, 10, 'test3', 'a', 'b', NULL, NULL, 'A', 1),
(167, 1, 10, 'test4', 'a', 'b', NULL, NULL, 'A', 1),
(166, 1, 10, 'test5', 'a', 'b', NULL, NULL, 'A', 1),
(165, 1, 10, 'test6', 'a', 'b', NULL, NULL, 'A', 1),
(164, 1, 10, 'test7', 'a', 'b', NULL, NULL, 'A', 1),
(163, 1, 10, 'test8', 'a', 'b', NULL, NULL, 'A', 1),
(162, 1, 10, 'test9', 'a', 'b', NULL, NULL, 'A', 1),
(161, 1, 10, 'test10', 'a', 'b', NULL, NULL, 'A', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_participant` int(11) NOT NULL,
  `is_occupied` tinyint(4) NOT NULL DEFAULT '0',
  `occupied_by_id` int(11) DEFAULT NULL,
  `occupied_start` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `max_participant`, `is_occupied`, `occupied_by_id`, `occupied_start`, `description`, `created_at`, `updated_at`) VALUES
(1, 'B11', 50, 1, 4, '2021-06-19 23:52:04', 'Test Ruangan', '2020-08-07 09:38:33', '2021-06-19 23:52:04'),
(2, 'A21', 50, 0, NULL, NULL, 'Test Room', '2020-08-09 06:49:11', '2020-10-14 08:56:47'),
(4, 'S41', 50, 0, NULL, NULL, 'Delphi', '2020-09-01 02:12:06', '2021-06-19 23:51:24'),
(6, 'B41', 30, 0, NULL, NULL, 'Sistem Terdistribusi', '2021-06-20 00:08:25', '2021-06-20 00:08:25'),
(7, 'SIstem Terdistribusi', 30, 0, NULL, NULL, 'Sistem Terdistribusi', '2021-06-20 14:09:10', '2021-06-20 14:09:10'),
(8, 'A44', 30, 0, NULL, NULL, 'Kewirausahaan', '2021-06-20 14:10:59', '2021-06-20 14:10:59');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `room_api_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_url` text COLLATE utf8mb4_unicode_ci,
  `room_privacy` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `time` time DEFAULT NULL,
  `mentor_id` int(11) DEFAULT NULL,
  `session_long` int(11) DEFAULT NULL COMMENT 'lama waktu pertemuan',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `name`, `room_id`, `class_id`, `room_api_id`, `room_url`, `room_privacy`, `subject_id`, `day`, `time`, `mentor_id`, `session_long`, `description`, `created_at`, `updated_at`) VALUES
(25, 'Kewirausahaan', 4, 4, NULL, NULL, NULL, 10, 3, '12:00:00', 4, 80, 'Kewirausahaan', '2021-06-20 14:41:41', '2021-06-20 14:41:41'),
(24, 'SIstem Terdistribusi', 4, 4, NULL, NULL, NULL, 9, 4, '13:00:00', 4, 80, 'Sistem Terdistribusi', '2021-06-20 14:14:23', '2021-06-20 14:14:23');

-- --------------------------------------------------------

--
-- Stand-in structure for view `schedule_views`
-- (See below for the actual view)
--
CREATE TABLE `schedule_views` (
`id` int(10) unsigned
,`name` varchar(255)
,`room_id` int(11)
,`class_id` int(11)
,`room_api_id` varchar(50)
,`room_url` text
,`room_privacy` varchar(10)
,`day` int(11)
,`time` time
,`mentor_id` int(11)
,`session_long` int(11)
,`description` text
,`created_at` timestamp
,`updated_at` timestamp
,`class_name` varchar(255)
,`room_name` varchar(255)
,`room_max_participant` int(11)
,`room_description` text
,`is_occupied` tinyint(4)
,`occupied_by_id` int(11)
,`occupied_start` datetime
,`occupied_by_name` varchar(100)
,`mentor_name` varchar(100)
,`mentor_email` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` int(11) NOT NULL,
  `sks` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `code`, `semester`, `sks`, `name`, `description`) VALUES
(10, '4', 7, 10, 'Kewirausahaan', 'Kewirausahaan'),
(9, '3', 7, 11, 'SIstem Terdistribusi', 'Sistem Terdistribusi'),
(8, 'PKK-00001', 1, 2, 'Algoritma Pemrograman', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject_classes`
--

CREATE TABLE `subject_classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subject_classes`
--

INSERT INTO `subject_classes` (`id`, `subject_id`, `class_id`) VALUES
(1, 3, 4),
(2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task` longtext COLLATE utf8mb4_unicode_ci,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `schedule_id`, `class_id`, `topic_id`, `name`, `task`, `file`, `created_by`, `created_at`, `updated_at`) VALUES
(39, 24, NULL, 15, 'Tugas SIstem Terdistribusi', '<h2>12.2 Object Reference</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </em></strong><strong><em>OBJECT REFERENCE (OR)</em></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Object Reference</em> <em>(OR)</em> merupakan informasi yang dibutuhkan untuk menentukan sebuah obyek dalam <em>ORB</em>. <em>Client</em> dan <em>Object Implementation</em> <em>(OI)</em> memiliki bagian yang tertutup dari <em>OR</em> dengan <em>language</em> <em>mapping</em>, yang kemudian disekat dari representasi aktualnya. Dua implementasi <em>ORB</em> dapat memiliki <em>representasi</em> <em>OR</em> yang berbeda. <em>Representasi</em> <em>OR</em> pada sisi <em>client</em> hanya <em>valid</em> selama masa hidup <em>client </em>tersebut.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Semua <em>ORB</em> harus menyediakan <em>language mapping</em> yang sama untuk sebuah <em>OR</em> (umumnya disebut obyek) untuk sebuah bahasa pemrograman tertentu. Hal ini memungkinkan sebuah program ditulis dalam bahasa apapun untuk mengakses <em>OR</em> secara <em>independen</em> terhadap <em>ORB</em> tertentu.</p>\r\n\r\n<p>&nbsp;</p>', NULL, 4, '2021-06-20 14:29:39', '2021-06-20 14:29:39');

-- --------------------------------------------------------

--
-- Stand-in structure for view `task_views`
-- (See below for the actual view)
--
CREATE TABLE `task_views` (
`id` bigint(20) unsigned
,`schedule_id` int(11)
,`class_id` int(11)
,`topic_id` int(11)
,`name` varchar(255)
,`task` longtext
,`file` varchar(255)
,`created_by` int(11)
,`created_at` timestamp
,`updated_at` timestamp
,`room_id` int(11)
,`schedule_class_id` int(11)
,`class_name` varchar(255)
,`schedule_name` varchar(255)
,`room_name` varchar(255)
,`participant_class_name` varchar(255)
,`user_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `theories`
--

CREATE TABLE `theories` (
  `id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `topic_index` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `topic_index`, `name`, `subject_id`, `description`) VALUES
(64, 16, 'Topic 16', 9, NULL),
(63, 15, 'Topic 15', 9, NULL),
(62, 14, 'Topic 14', 9, NULL),
(61, 13, 'Topic 13', 9, NULL),
(60, 12, 'Topic 12', 9, NULL),
(59, 11, 'Topic 11', 9, NULL),
(58, 10, 'Topic 10', 9, NULL),
(57, 9, 'Topic 9', 9, NULL),
(56, 8, 'Topic 8', 9, NULL),
(55, 7, 'Topic 7', 9, NULL),
(54, 6, 'Topic 6', 9, NULL),
(53, 5, 'Topic 5', 9, NULL),
(52, 4, 'Topic 4', 9, NULL),
(51, 3, 'Topic 3', 9, NULL),
(50, 2, 'Topic 2', 9, NULL),
(49, 1, 'Topic 1', 9, NULL),
(48, 16, 'Topic 16', 8, NULL),
(47, 15, 'Topic 15', 8, NULL),
(46, 14, 'Topic 14', 8, NULL),
(45, 13, 'Topic 13', 8, NULL),
(44, 12, 'Topic 12', 8, NULL),
(43, 11, 'Topic 11', 8, NULL),
(42, 10, 'Topic 10', 8, NULL),
(41, 9, 'Topic 9', 8, NULL),
(40, 8, 'Topic 8', 8, NULL),
(39, 7, 'Topic 7', 8, NULL),
(38, 6, 'Topic 6', 8, NULL),
(37, 5, 'Topic 5', 8, NULL),
(36, 4, 'Topic 4', 8, NULL),
(35, 3, 'Topic 3', 8, NULL),
(34, 2, 'Topic 2', 8, NULL),
(33, 1, 'Topic 1', 8, NULL),
(65, 1, 'Topic 1', 10, NULL),
(66, 2, 'Topic 2', 10, NULL),
(67, 3, 'Topic 3', 10, NULL),
(68, 4, 'Topic 4', 10, NULL),
(69, 5, 'Topic 5', 10, NULL),
(70, 6, 'Topic 6', 10, NULL),
(71, 7, 'Topic 7', 10, NULL),
(72, 8, 'Topic 8', 10, NULL),
(73, 9, 'Topic 9', 10, NULL),
(74, 10, 'Topic 10', 10, NULL),
(75, 11, 'Topic 11', 10, NULL),
(76, 12, 'Topic 12', 10, NULL),
(77, 13, 'Topic 13', 10, NULL),
(78, 14, 'Topic 14', 10, NULL),
(79, 15, 'Topic 15', 10, NULL),
(80, 16, 'Topic 16', 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nim` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `nim`, `created_at`, `updated_at`) VALUES
(1, 'GURU Terlanjur', 'guru@gmail.com', '2020-08-05 10:00:00', '$2y$10$1s0Vtl0D6k1ZkIQFKM0SaerBmhFxq1E1klXrtw4syp5KmjWj92aKC', NULL, '6984635411', '2020-08-05 10:00:00', '2020-08-12 00:41:10'),
(2, 'Siswa Update 2', 'siswa1@gmail.com', '2020-08-05 10:00:00', '$2y$10$3ae41OJZu3iR7eF/djP0DehaeRghUiVkOSHeJ9EXkflRRZnFPFlie', NULL, '565555555675', '2020-08-05 10:00:00', '2020-09-01 01:59:19'),
(3, 'Siswa 2', 'siswa2@gmail.com', '2020-08-06 10:00:00', '$2y$10$nT.gZ15mvCiSjLJsBHM3F.1/YNxA.hjZqaB1kO4endgnph8N7KFX6', NULL, '123412342134', '2020-08-06 10:00:00', '2021-06-19 09:54:45'),
(4, 'Mardi Turnip, S.Kom, M.Kom', 'mentor@gmail.com', '2020-08-06 10:00:00', '$2y$10$3ae41OJZu3iR7eF/djP0DehaeRghUiVkOSHeJ9EXkflRRZnFPFlie', NULL, '4451222', '2020-08-06 10:00:00', '2020-08-21 00:58:44'),
(5, 'Siswa 3', 'siswa3@gmail.com', NULL, '$2y$10$3ae41OJZu3iR7eF/djP0DehaeRghUiVkOSHeJ9EXkflRRZnFPFlie', NULL, '6845254685', '2020-08-12 00:46:55', '2020-08-12 01:42:17'),
(6, 'mentor2', 'mentor2@gmail.com', NULL, '$2y$10$4p1lb.m32l.gv3KgR7tKO.oNp3/2q8LOq6QN/pMbbAE.1KGET2gv6', NULL, NULL, '2020-10-21 05:30:04', '2020-10-21 05:30:04');

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_informations`
-- (See below for the actual view)
--
CREATE TABLE `user_informations` (
`id` bigint(11) unsigned
,`name` varchar(100)
,`email` varchar(100)
,`email_verified_at` timestamp
,`password` varchar(200)
,`remember_token` varchar(100)
,`nim` varchar(50)
,`created_at` timestamp
,`updated_at` timestamp
,`is_mentor` tinyint(4)
,`class_id` int(11)
,`class_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `participant_present_views`
--
DROP TABLE IF EXISTS `participant_present_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sql6419285`@`%` SQL SECURITY DEFINER VIEW `participant_present_views`  AS  select `participant_presents`.`id` AS `id`,`participant_presents`.`schedule_id` AS `schedule_id`,`participant_presents`.`participant_id` AS `participant_id`,`participant_presents`.`datetime` AS `datetime`,`participant_presents`.`present` AS `present`,`participants`.`user_id` AS `user_id`,`users`.`name` AS `user_name`,`users`.`email` AS `email`,`schedules`.`name` AS `schedule_name`,`schedules`.`mentor_id` AS `mentor_id` from (((`participant_presents` join `participants` on((`participants`.`id` = `participant_presents`.`participant_id`))) join `users` on((`users`.`id` = `participants`.`user_id`))) join `schedules` on((`schedules`.`id` = `participant_presents`.`schedule_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `schedule_views`
--
DROP TABLE IF EXISTS `schedule_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sql6419285`@`%` SQL SECURITY DEFINER VIEW `schedule_views`  AS  select `schedules`.`id` AS `id`,`schedules`.`name` AS `name`,`schedules`.`room_id` AS `room_id`,`schedules`.`class_id` AS `class_id`,`schedules`.`room_api_id` AS `room_api_id`,`schedules`.`room_url` AS `room_url`,`schedules`.`room_privacy` AS `room_privacy`,`schedules`.`day` AS `day`,`schedules`.`time` AS `time`,`schedules`.`mentor_id` AS `mentor_id`,`schedules`.`session_long` AS `session_long`,`schedules`.`description` AS `description`,`schedules`.`created_at` AS `created_at`,`schedules`.`updated_at` AS `updated_at`,`participant_classes`.`class_name` AS `class_name`,`rooms`.`name` AS `room_name`,`rooms`.`max_participant` AS `room_max_participant`,`rooms`.`description` AS `room_description`,`rooms`.`is_occupied` AS `is_occupied`,`rooms`.`occupied_by_id` AS `occupied_by_id`,`rooms`.`occupied_start` AS `occupied_start`,`user_o`.`name` AS `occupied_by_name`,`users`.`name` AS `mentor_name`,`users`.`email` AS `mentor_email` from ((((`schedules` left join `participant_classes` on((`participant_classes`.`id` = `schedules`.`class_id`))) left join `rooms` on((`rooms`.`id` = `schedules`.`room_id`))) left join `users` `user_o` on((`user_o`.`id` = `rooms`.`occupied_by_id`))) left join `users` on((`users`.`id` = `schedules`.`mentor_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `task_views`
--
DROP TABLE IF EXISTS `task_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sql6419285`@`%` SQL SECURITY DEFINER VIEW `task_views`  AS  select `tasks`.`id` AS `id`,`tasks`.`schedule_id` AS `schedule_id`,`tasks`.`class_id` AS `class_id`,`tasks`.`topic_id` AS `topic_id`,`tasks`.`name` AS `name`,`tasks`.`task` AS `task`,`tasks`.`file` AS `file`,`tasks`.`created_by` AS `created_by`,`tasks`.`created_at` AS `created_at`,`tasks`.`updated_at` AS `updated_at`,`schedules`.`room_id` AS `room_id`,`schedules`.`class_id` AS `schedule_class_id`,`class`.`class_name` AS `class_name`,`schedules`.`name` AS `schedule_name`,`rooms`.`name` AS `room_name`,`class`.`class_name` AS `participant_class_name`,`users`.`name` AS `user_name` from ((((`tasks` left join `schedules` on((`schedules`.`id` = `tasks`.`schedule_id`))) left join `rooms` on((`rooms`.`id` = `schedules`.`room_id`))) left join `participant_classes` `class` on((`class`.`id` = `schedules`.`class_id`))) join `users` on((`users`.`id` = `tasks`.`created_by`))) ;

-- --------------------------------------------------------

--
-- Structure for view `user_informations`
--
DROP TABLE IF EXISTS `user_informations`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sql6419285`@`%` SQL SECURITY DEFINER VIEW `user_informations`  AS  select `users`.`id` AS `id`,`users`.`name` AS `name`,`users`.`email` AS `email`,`users`.`email_verified_at` AS `email_verified_at`,`users`.`password` AS `password`,`users`.`remember_token` AS `remember_token`,`users`.`nim` AS `nim`,`users`.`created_at` AS `created_at`,`users`.`updated_at` AS `updated_at`,`participants`.`is_mentor` AS `is_mentor`,`participants`.`class_id` AS `class_id`,`participant_classes`.`class_name` AS `class_name` from ((`users` join `participants` on((`participants`.`user_id` = `users`.`id`))) left join `participant_classes` on((`participant_classes`.`id` = `participants`.`class_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participants_user_id_index` (`user_id`),
  ADD KEY `participants_class_id_index` (`class_id`);

--
-- Indexes for table `participant_classes`
--
ALTER TABLE `participant_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant_presents`
--
ALTER TABLE `participant_presents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participant_presents_schedule_id_index` (`schedule_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(250));

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quizzes_subject_id_index` (`subject_id`),
  ADD KEY `quizzes_topic_id_index` (`topic_id`),
  ADD KEY `quizzes_created_by_index` (`created_by`);

--
-- Indexes for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_answers_question_id_index` (`question_id`),
  ADD KEY `quiz_answers_user_id_index` (`user_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_questions_quiz_id_index` (`quiz_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_classes`
--
ALTER TABLE `subject_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theories`
--
ALTER TABLE `theories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theories_topic_id_index` (`topic_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1263;
--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `participant_classes`
--
ALTER TABLE `participant_classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `participant_presents`
--
ALTER TABLE `participant_presents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;
--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `subject_classes`
--
ALTER TABLE `subject_classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `theories`
--
ALTER TABLE `theories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
