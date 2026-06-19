-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2026 at 09:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `virtual_marketplace`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `game_points` int(11) DEFAULT 0,
  `level` int(11) DEFAULT 1,
  `avatar_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `user_id`, `name`, `phone_number`, `address`, `city`, `postal_code`, `created_at`, `updated_at`, `game_points`, `level`, `avatar_id`) VALUES
(1, 1, 'tester01', NULL, NULL, NULL, NULL, '2025-12-05 02:43:22', '2025-12-05 02:43:22', 0, 1, 1),
(2, 7, 'tangmo', '0123456789', '11111', 'sdd', 'dd', '2026-01-11 14:47:48', '2026-01-11 14:47:48', 0, 1, 1),
(3, 8, 'custest2', NULL, NULL, NULL, NULL, '2026-01-11 16:00:39', '2026-01-11 16:00:39', 0, 1, 1),
(4, 9, 'mali la', '0123456789', '11/11', NULL, NULL, '2026-01-12 07:49:17', '2026-01-12 07:49:17', 0, 1, 1),
(5, 12, 'op', '0123456789', '3/3', NULL, NULL, '2026-01-12 07:53:07', '2026-01-12 07:53:07', 0, 1, 1),
(6, 13, 'iu', '0123456789', '55', NULL, NULL, '2026-01-12 07:53:45', '2026-01-12 07:53:45', 0, 1, 3),
(7, 16, 'lolo', '033333333', '2', NULL, NULL, '2026-01-12 08:02:26', '2026-01-12 08:02:26', 0, 1, 1),
(8, 17, '', '', '', NULL, NULL, '2026-01-12 08:16:42', '2026-01-12 08:16:42', 0, 1, 1),
(9, 23, '2', '5', '4', NULL, NULL, '2026-01-12 08:45:04', '2026-01-12 08:45:04', 0, 1, 1),
(10, 26, '2', '5', '4', NULL, NULL, '2026-01-12 08:45:32', '2026-01-12 08:45:32', 0, 1, 1),
(11, 29, '2', '5', '4', NULL, NULL, '2026-01-12 08:46:05', '2026-01-12 08:46:05', 0, 1, 1),
(12, 33, 'mo', '0123456789', '22', NULL, NULL, '2026-01-12 08:51:23', '2026-01-12 08:51:23', 0, 1, 1),
(13, 34, '[k', 'fds', 'sf', NULL, NULL, '2026-01-12 11:13:55', '2026-01-12 11:13:55', 0, 1, 1),
(14, 35, 'jk', 'fsf', 'sdfdsf', NULL, NULL, '2026-01-12 15:57:21', '2026-01-12 15:57:21', 0, 1, 1),
(15, 36, 'momo', NULL, NULL, NULL, NULL, '2026-01-12 18:08:01', '2026-01-12 18:08:01', 0, 1, 1),
(16, 37, 'momo2', NULL, NULL, NULL, NULL, '2026-01-12 18:55:02', '2026-01-12 18:55:02', 0, 1, 1),
(17, 44, 'momo45', NULL, NULL, NULL, NULL, '2026-01-12 18:55:55', '2026-01-12 18:55:55', 0, 1, 1),
(18, 45, 'tangmo', NULL, NULL, NULL, NULL, '2026-01-12 19:10:59', '2026-01-12 19:10:59', 0, 1, 1),
(19, 50, 'moo', NULL, NULL, NULL, NULL, '2026-02-16 14:51:33', '2026-02-16 14:51:33', 0, 1, 1),
(20, 53, 'Kantich chaaa', '0812407603', NULL, NULL, NULL, '2026-02-16 15:22:40', '2026-02-16 15:22:40', 0, 1, 1),
(21, 61, 'Test User', '0800000000', NULL, NULL, NULL, '2026-04-22 01:31:11', '2026-04-22 01:31:11', 0, 1, 1),
(22, 62, 'testmo', '095616512323', NULL, NULL, NULL, '2026-04-22 01:51:08', '2026-04-22 01:51:08', 0, 1, 1),
(23, 64, 'Test mo', '0800000000', NULL, NULL, NULL, '2026-04-22 01:56:46', '2026-04-22 01:56:46', 0, 1, 1),
(24, 65, 'testuser2', '', NULL, NULL, NULL, '2026-04-22 02:00:21', '2026-04-22 02:00:21', 0, 1, 1),
(25, 66, 'momotaro', '12312312312', NULL, NULL, NULL, '2026-04-22 02:05:26', '2026-04-22 02:05:26', 0, 1, 1),
(26, 67, 'testter20', '12345666', NULL, NULL, NULL, '2026-04-22 02:07:14', '2026-04-22 02:07:14', 0, 1, 1),
(27, 68, 'hohoho', '21351512', 'jjjjjjjj', NULL, NULL, '2026-04-22 21:34:33', '2026-04-22 21:34:33', 0, 1, 1),
(28, 69, 'namoo', '121546523', 'hohoho', NULL, NULL, '2026-04-22 21:57:29', '2026-04-22 21:57:29', 0, 1, 1),
(29, 70, 'ffff', 'ffffff', 'ffff', NULL, NULL, '2026-04-22 22:17:00', '2026-04-22 22:17:00', 0, 1, 1),
(30, 71, 'gg', 'gg', 'gg', NULL, NULL, '2026-04-22 22:23:07', '2026-04-22 22:23:07', 0, 1, 3),
(31, 72, 'mama', '12', '12', NULL, NULL, '2026-04-23 17:34:51', '2026-04-23 17:34:51', 0, 1, 1),
(32, 73, 'tomangg', '089111111', 'rmutt', NULL, NULL, '2026-04-23 17:44:22', '2026-04-23 17:44:22', 0, 1, 1),
(33, 74, 'ta', 'gdfgdf', 'gdfgdfg', NULL, NULL, '2026-04-24 04:37:59', '2026-04-24 04:37:59', 0, 1, 3),
(34, 75, 'raa', 'fdsfdsf', 'fdsfds', NULL, NULL, '2026-04-24 04:38:25', '2026-04-24 04:38:25', 0, 1, 3),
(35, 79, 'dodo', '1234', 'asda', NULL, NULL, '2026-04-24 08:58:17', '2026-04-24 08:58:17', 0, 1, 4),
(36, 81, 'imo', 'mm', 'ราชมงคล', NULL, NULL, '2026-04-24 10:45:10', '2026-04-24 10:45:10', 0, 1, 1),
(37, 82, 'oom03', '0812407603', '25 หมู่6 ต.คลองควาย อ.สามโคก', NULL, NULL, '2026-04-24 11:32:05', '2026-04-24 11:32:05', 0, 1, 1),
(38, 87, 'Tdn01', '0630899496', 'ราชมงคล', NULL, NULL, '2026-04-27 12:31:25', '2026-04-27 12:31:25', 0, 1, 1),
(39, 88, 'tangmoo', '0812407603', '52/3 คลองหลวง22', NULL, NULL, '2026-04-28 00:58:02', '2026-04-28 00:58:02', 0, 1, 1),
(40, 89, 'Testcus01', '09xxxxxxxx', 'xx/xx หมู่ x ตำบล xx อำเภอ xx', NULL, NULL, '2026-04-30 07:27:06', '2026-04-30 07:27:06', 0, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `market_stalls`
--

CREATE TABLE `market_stalls` (
  `stall_id` int(11) NOT NULL,
  `stall_number` int(11) NOT NULL,
  `zone` varchar(50) DEFAULT 'A',
  `price` int(11) DEFAULT 0,
  `status` enum('available','booked') DEFAULT 'available',
  `seller_id` int(11) DEFAULT NULL,
  `booked_at` datetime DEFAULT NULL,
  `expire_at` datetime DEFAULT NULL,
  `allowed_type` enum('ร้านอาหาร','ร้านเสื้อผ้า','ร้านของใช้') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `market_stalls`
--

INSERT INTO `market_stalls` (`stall_id`, `stall_number`, `zone`, `price`, `status`, `seller_id`, `booked_at`, `expire_at`, `allowed_type`) VALUES
(1, 1, 'top', 100, 'booked', 4, NULL, NULL, 'ร้านอาหาร'),
(2, 2, 'top', 100, 'available', NULL, NULL, NULL, 'ร้านเสื้อผ้า'),
(3, 3, 'top', 100, 'available', NULL, NULL, NULL, 'ร้านของใช้'),
(4, 4, 'top', 100, 'available', NULL, NULL, NULL, 'ร้านอาหาร'),
(5, 5, 'top', 100, 'available', NULL, NULL, NULL, 'ร้านเสื้อผ้า'),
(6, 6, 'top', 100, 'available', NULL, NULL, NULL, 'ร้านของใช้'),
(7, 7, 'top', 100, 'available', NULL, NULL, NULL, 'ร้านอาหาร'),
(8, 8, 'top', 100, 'available', NULL, NULL, NULL, 'ร้านเสื้อผ้า'),
(9, 9, 'bottom', 100, 'available', NULL, NULL, NULL, 'ร้านของใช้'),
(10, 10, 'bottom', 100, 'available', NULL, NULL, NULL, 'ร้านอาหาร'),
(11, 11, 'bottom', 100, 'available', NULL, NULL, NULL, 'ร้านเสื้อผ้า'),
(12, 12, 'bottom', 100, 'available', NULL, NULL, NULL, 'ร้านของใช้'),
(13, 13, 'bottom', 100, 'available', NULL, NULL, NULL, 'ร้านอาหาร'),
(14, 14, 'bottom', 100, 'available', NULL, NULL, NULL, 'ร้านเสื้อผ้า'),
(15, 15, 'bottom', 100, 'available', NULL, NULL, NULL, 'ร้านของใช้'),
(16, 16, 'bottom', 100, 'available', NULL, NULL, NULL, 'ร้านอาหาร'),
(17, 17, 'bottom', 100, 'available', NULL, NULL, NULL, 'ร้านเสื้อผ้า');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `seller_id`, `title`, `message`, `link`, `is_read`, `created_at`) VALUES
(1, 4, 'สินค้าถูกปฏิเสธ ❌', 'สินค้า \'น้ำ\' ไม่ผ่านการอนุมัติ: ', 'dashboard.html', 1, '2026-01-30 18:24:45'),
(2, 4, 'สินค้าถูกปฏิเสธ ❌', 'สินค้า \'ก\' ไม่ผ่านการอนุมัติ: ', 'dashboard.html', 1, '2026-01-30 18:31:36'),
(3, 4, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'water\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=24', 1, '2026-02-16 09:26:38'),
(4, 10, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'โออิชิชาเขียว\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=27', 0, '2026-02-16 09:26:52'),
(5, 10, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'อิชิตัน เก๊กฮวย\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=26', 0, '2026-02-16 09:27:06'),
(6, 11, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'กะเพรา\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=28', 0, '2026-02-16 10:43:04'),
(7, 5, 'สินค้าถูกปฏิเสธ ❌', 'สินค้า \'ขนม\' ไม่ผ่านการอนุมัติ: ', 'edit_product.html?id=16', 0, '2026-04-23 18:00:56'),
(8, 4, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'เสื้อกันหนาวววว\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=25', 1, '2026-04-23 18:02:51'),
(9, 4, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'มะขามป้อม\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=29', 1, '2026-04-23 19:05:39'),
(10, 12, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'ข้าวผัด 3 สี\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=30', 0, '2026-04-24 01:07:27'),
(11, 12, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'ข้าวหมูสามชั้นทอด ไข่ดาว\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=31', 0, '2026-04-24 01:07:32'),
(12, 12, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'กะเพราปลาหมึก\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=32', 0, '2026-04-24 01:07:37'),
(13, 12, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'ผัดเปรี้ยวหวาน\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=33', 0, '2026-04-24 01:07:41'),
(14, 12, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'ผัดขี้เมาทะเล\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=34', 0, '2026-04-24 01:07:44'),
(15, 13, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'เสื้อ Champion ฮาล์ฟซิป (Half-Zip)\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=35', 0, '2026-04-24 01:07:48'),
(16, 13, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'เสื้อผ้าฝ้ายมัดย้อม\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=36', 0, '2026-04-24 01:07:52'),
(17, 13, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'เสื้อเชิ้ตดีไซน์เก๋\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=37', 0, '2026-04-24 01:07:55'),
(18, 13, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'เดรสสั้นคอกะลาสี\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=38', 0, '2026-04-24 01:07:58'),
(19, 13, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'เสื้อยืดสีดำลายธงชาติ\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=39', 0, '2026-04-24 01:08:03'),
(20, 13, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'เสื้อยืดสตรีทลายด้านหลัง\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=40', 0, '2026-04-24 01:08:06'),
(21, 13, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'เสื้อยืดปักดอกไม้ 3D\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=41', 0, '2026-04-24 01:08:09'),
(22, 13, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'เดรสสั้นสีน้ำเงินเข้ม\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=42', 0, '2026-04-24 01:08:12'),
(23, 14, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'ผลไม้รวมคัดพิเศษ\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=43', 0, '2026-04-24 01:08:15'),
(24, 14, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'ผลไม้รวม\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=44', 0, '2026-04-24 01:08:17'),
(25, 14, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'ผลไม้รวมสุ่ม\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=45', 0, '2026-04-24 01:08:20'),
(26, 14, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'แตงโมหั่นเต๋า\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=46', 0, '2026-04-24 01:08:23'),
(27, 14, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'สับปะรดหั่น\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=47', 0, '2026-04-24 01:08:26'),
(28, 14, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'องุ่น & แอปเปิล\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=48', 0, '2026-04-24 01:08:30'),
(29, 14, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'แอปเปิลแดงหั่น\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=49', 0, '2026-04-24 01:08:33'),
(30, 15, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'น้ำ\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=50', 0, '2026-04-24 02:19:27'),
(31, 12, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'ข้าวไก่ทอดไข่ดาว\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=51', 0, '2026-04-24 02:41:43'),
(32, 12, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'ข้าวไก่ทอดไข่ดาว\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=52', 1, '2026-04-24 02:43:19'),
(33, 12, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'ตำหอยแครง\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=53', 0, '2026-04-24 03:29:08'),
(34, 12, 'สินค้าถูกปฏิเสธ ❌', 'สินค้า \'ตำหอยแครง\' ไม่ผ่านการอนุมัติ: กรุณาเขียนรายละเอียดสินค้าให้ครบถ้วน', 'edit_product.html?id=56', 0, '2026-04-24 03:30:14'),
(35, 16, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'ข้าวไก่ทอด\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=57', 0, '2026-04-24 04:39:51'),
(36, 12, 'สินค้าได้รับอนุมัติแล้ว ✨', 'สินค้า \'ตำปูปลาร้าหมูยอ\' ของคุณผ่านการตรวจสอบและออนไลน์แล้ว', 'edit_product.html?id=54', 0, '2026-04-27 05:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('รอการยืนยัน','กำลังจัดส่ง','จัดส่งสำเร็จ','ยกเลิกออเดอร์') DEFAULT 'รอการยืนยัน',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payment_status` enum('unpaid','paid','rejected') DEFAULT 'unpaid',
  `payment_slip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `total_amount`, `status`, `created_at`, `updated_at`, `payment_status`, `payment_slip`) VALUES
(4, 1, 1098.50, 'รอการยืนยัน', '2025-12-06 23:00:18', '2026-02-16 00:29:38', 'unpaid', NULL),
(5, 18, 1500.00, 'ยกเลิกออเดอร์', '2026-01-29 22:38:30', '2026-02-16 01:55:49', 'unpaid', NULL),
(6, 18, 329.00, 'จัดส่งสำเร็จ', '2026-01-29 22:39:17', '2026-02-16 01:57:16', 'unpaid', NULL),
(7, 18, 389.00, 'กำลังจัดส่ง', '2026-01-29 22:50:11', '2026-02-16 01:55:09', 'unpaid', NULL),
(8, 18, 748.00, 'จัดส่งสำเร็จ', '2026-02-04 22:02:11', '2026-02-16 01:54:06', 'unpaid', NULL),
(9, 18, 748.00, 'ยกเลิกออเดอร์', '2026-02-13 20:44:06', '2026-02-16 01:54:11', 'unpaid', NULL),
(10, 4, 1198.00, 'กำลังจัดส่ง', '2026-02-15 22:32:50', '2026-02-16 01:06:50', '', ''),
(11, 4, 1198.00, 'กำลังจัดส่ง', '2026-02-15 22:44:02', '2026-02-16 02:03:03', 'paid', 'sliptest1.jpg'),
(12, 4, 99.00, 'ยกเลิกออเดอร์', '2026-02-15 22:46:22', '2026-02-16 02:06:32', 'paid', 'sliptest1.jpg'),
(13, 4, 1198.00, 'จัดส่งสำเร็จ', '2026-02-15 22:48:07', '2026-04-21 21:48:55', '', NULL),
(14, 3, 99.00, 'ยกเลิกออเดอร์', '2026-02-15 22:48:28', '2026-02-16 01:10:34', '', NULL),
(15, 3, 99.00, 'จัดส่งสำเร็จ', '2026-02-15 23:30:32', '2026-02-16 01:10:25', 'unpaid', NULL),
(16, 3, 99.00, '', '2026-02-16 02:07:36', '2026-02-16 02:07:36', 'unpaid', NULL),
(17, 3, 99.00, '', '2026-02-16 02:07:37', '2026-02-16 02:07:37', 'unpaid', NULL),
(18, 3, 99.00, '', '2026-02-16 02:09:12', '2026-02-16 02:09:12', 'unpaid', NULL),
(19, 3, 99.00, '', '2026-02-16 02:13:50', '2026-02-16 02:13:50', 'unpaid', NULL),
(20, 3, 99.00, 'จัดส่งสำเร็จ', '2026-02-16 02:25:05', '2026-02-16 02:47:03', 'unpaid', NULL),
(21, 3, 99.00, 'จัดส่งสำเร็จ', '2026-02-16 02:32:30', '2026-02-16 02:46:48', 'unpaid', NULL),
(22, 3, 99.00, 'จัดส่งสำเร็จ', '2026-02-16 02:32:31', '2026-02-16 02:43:19', 'unpaid', NULL),
(23, 3, 99.00, 'จัดส่งสำเร็จ', '2026-02-16 02:49:02', '2026-02-16 02:51:23', 'unpaid', NULL),
(24, 3, 99.00, 'ยกเลิกออเดอร์', '2026-02-16 02:49:04', '2026-02-16 02:49:20', 'unpaid', NULL),
(25, 3, 99.00, 'จัดส่งสำเร็จ', '2026-02-16 02:49:05', '2026-03-13 02:56:36', 'unpaid', NULL),
(26, 3, 99.00, 'ยกเลิกออเดอร์', '2026-04-21 21:52:00', '2026-04-21 21:52:32', 'unpaid', NULL),
(27, 3, 99.00, 'กำลังจัดส่ง', '2026-04-21 21:52:41', '2026-04-21 21:52:47', 'unpaid', NULL),
(28, 3, 99.00, 'รอการยืนยัน', '2026-04-22 01:48:26', '2026-04-22 01:48:26', 'unpaid', NULL),
(29, 25, 50.00, 'รอการยืนยัน', '2026-04-23 03:35:00', '2026-04-23 03:35:00', 'unpaid', NULL),
(30, 25, 358.00, 'รอการยืนยัน', '2026-04-23 03:41:28', '2026-04-23 03:41:28', 'unpaid', NULL),
(31, 32, 116.00, 'จัดส่งสำเร็จ', '2026-04-23 18:01:11', '2026-04-23 18:01:56', 'unpaid', NULL),
(32, 25, 1198.00, 'รอการยืนยัน', '2026-04-24 01:44:56', '2026-04-24 01:44:56', 'unpaid', NULL),
(33, 25, 1567.00, 'รอการยืนยัน', '2026-04-24 02:25:00', '2026-04-24 02:25:00', 'unpaid', NULL),
(34, 25, 150.00, 'รอการยืนยัน', '2026-04-24 04:43:39', '2026-04-24 04:43:39', 'unpaid', NULL),
(35, 25, 345.00, 'รอการยืนยัน', '2026-04-24 07:29:51', '2026-04-24 07:29:51', 'unpaid', NULL),
(39, 25, 60.00, 'จัดส่งสำเร็จ', '2026-04-24 09:11:10', '2026-04-24 09:11:37', 'unpaid', NULL),
(40, 36, 140.00, 'รอการยืนยัน', '2026-04-24 10:46:54', '2026-04-24 10:46:54', 'unpaid', NULL),
(41, 37, 305.00, 'จัดส่งสำเร็จ', '2026-04-24 11:33:54', '2026-04-24 11:34:35', 'unpaid', NULL),
(42, 37, 100.00, 'รอการยืนยัน', '2026-04-24 11:40:16', '2026-04-24 11:40:16', 'unpaid', NULL),
(44, 38, 105.00, 'จัดส่งสำเร็จ', '2026-04-27 12:32:23', '2026-04-27 12:33:19', 'unpaid', NULL),
(45, 39, 125.00, 'จัดส่งสำเร็จ', '2026-04-28 00:59:11', '2026-04-28 00:59:58', 'unpaid', NULL),
(46, 40, 260.00, 'รอการยืนยัน', '2026-04-30 07:30:02', '2026-04-30 07:30:02', 'unpaid', NULL),
(47, 11, 65.00, 'รอการยืนยัน', '2026-05-06 05:40:00', '2026-05-06 05:40:00', 'unpaid', NULL),
(48, 11, 70.00, 'รอการยืนยัน', '2026-05-06 10:44:47', '2026-05-06 10:44:47', 'unpaid', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variation_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `order_id`, `product_id`, `variation_id`, `quantity`, `price`, `subtotal`) VALUES
(3, 4, 1, NULL, 1, 599.00, 599.00),
(4, 4, 2, NULL, 2, 249.75, 499.50),
(5, 5, 6, NULL, 1, 30.00, 30.00),
(6, 5, 7, NULL, 1, 299.00, 299.00),
(7, 6, 6, NULL, 1, 30.00, 30.00),
(8, 6, 7, NULL, 1, 299.00, 299.00),
(9, 7, 6, NULL, 3, 30.00, 90.00),
(10, 7, 7, NULL, 1, 299.00, 299.00),
(11, 8, 6, NULL, 5, 30.00, 150.00),
(12, 8, 7, NULL, 2, 299.00, 598.00),
(13, 9, 6, NULL, 5, 30.00, 150.00),
(14, 9, 7, NULL, 2, 299.00, 598.00),
(15, 10, 25, NULL, 2, 599.00, 1198.00),
(16, 11, 25, NULL, 2, 599.00, 1198.00),
(17, 12, 24, NULL, 1, 99.00, 99.00),
(18, 13, 25, NULL, 2, 599.00, 1198.00),
(19, 14, 24, NULL, 1, 99.00, 99.00),
(20, 15, 24, NULL, 1, 99.00, 99.00),
(21, 16, 24, NULL, 1, 99.00, 99.00),
(22, 17, 24, NULL, 1, 99.00, 99.00),
(23, 18, 24, NULL, 1, 99.00, 99.00),
(24, 19, 24, NULL, 1, 99.00, 99.00),
(25, 20, 24, NULL, 1, 99.00, 99.00),
(26, 21, 24, NULL, 1, 99.00, 99.00),
(27, 22, 24, NULL, 1, 99.00, 99.00),
(28, 23, 24, NULL, 1, 99.00, 99.00),
(29, 24, 24, NULL, 1, 99.00, 99.00),
(30, 25, 24, NULL, 1, 99.00, 99.00),
(31, 26, 24, NULL, 1, 99.00, 99.00),
(32, 27, 24, NULL, 1, 99.00, 99.00),
(33, 28, 24, NULL, 1, 99.00, 99.00),
(34, 29, 28, NULL, 1, 50.00, 50.00),
(35, 30, 24, NULL, 2, 99.00, 198.00),
(36, 30, 14, NULL, 2, 80.00, 160.00),
(37, 31, 15, NULL, 2, 18.00, 36.00),
(38, 31, 14, NULL, 1, 80.00, 80.00),
(39, 32, 25, NULL, 2, 599.00, 1198.00),
(40, 33, 29, NULL, 3, 123.00, 369.00),
(41, 33, 25, NULL, 2, 599.00, 1198.00),
(42, 34, 28, NULL, 3, 50.00, 150.00),
(43, 35, 29, NULL, 2, 123.00, 246.00),
(44, 35, 24, NULL, 1, 99.00, 99.00),
(45, 39, 30, NULL, 1, 60.00, 60.00),
(46, 40, 34, NULL, 2, 70.00, 140.00),
(47, 41, 34, NULL, 2, 70.00, 140.00),
(48, 41, 33, NULL, 3, 55.00, 165.00),
(49, 42, 57, NULL, 2, 50.00, 100.00),
(50, 44, 52, NULL, 1, 50.00, 50.00),
(51, 44, 33, NULL, 1, 55.00, 55.00),
(52, 45, 32, NULL, 1, 65.00, 65.00),
(53, 45, 54, NULL, 1, 60.00, 60.00),
(54, 46, 34, NULL, 2, 70.00, 140.00),
(55, 46, 33, NULL, 1, 55.00, 55.00),
(56, 46, 32, NULL, 1, 65.00, 65.00),
(57, 47, 32, NULL, 1, 65.00, 65.00),
(58, 48, 34, NULL, 1, 70.00, 70.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `model_3d` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `approval_status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `admin_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `seller_id`, `name`, `description`, `image`, `model_3d`, `created_at`, `updated_at`, `approval_status`, `admin_notes`) VALUES
(1, 1, 'product_test', 'test product description.', 'producttest.png', 'producttest.glb', '2025-12-05 04:53:16', '2025-12-05 05:40:25', 'approved', NULL),
(2, 1, 'รองเท้าผ้าใบ 3D', 'สินค้าใหม่สำหรับตลาดเสมือนจริง', 'thumb_1.png', '3d_model_1.glb', '2025-12-06 00:38:25', '2025-12-06 02:59:41', 'approved', NULL),
(4, 3, 'New Water Test', 'API Test', 'test.png', 'test.glb', '2025-12-08 21:38:26', '2025-12-09 22:52:27', 'approved', NULL),
(6, 4, 'water', '256256', 'water.png', 'water.glb', '2025-12-08 22:46:09', '2025-12-09 22:53:22', 'approved', NULL),
(7, 4, 'รองเท้า', 'สวยๆ', 'รองเท้า.png', 'shose.glb', '2025-12-08 23:19:43', '2025-12-09 22:52:53', 'approved', NULL),
(8, 4, 'ขนม', '5555', 'snack.png', 'snack.glb', '2025-12-09 23:02:36', '2025-12-09 23:05:16', 'rejected', 'Status set to rejected by Admin'),
(11, 4, 'หมูกรอบ', 'jlkk', '1.สูตรทอดหมูกรอบ.jpg', 'Battle Axe.glb', '2025-12-10 21:12:05', '2025-12-15 18:41:51', 'approved', ''),
(12, 4, 'หมูกรอบ', 'กดเก', '1.สูตรทอดหมูกรอบ.jpg', '', '2025-12-10 21:12:46', '2025-12-10 23:13:19', 'rejected', ''),
(13, 4, 'หมูกรอบ2', 'กดเกดเกดเเด', 'dFQROr7oWzulq5Fa4Vt7gR3MuTUR4dikqCOitAqj1SgiZfpfkpqJFQzY0CDwRre3Yzp.jpg', '', '2025-12-10 21:15:51', '2026-01-12 19:04:07', 'rejected', ''),
(14, 4, 'หมูกรอบ2', 'dfsdas', 'dFQROr7oWzulq5Fa4Vt7gR3MuTUR4dikqCOitAqj1SgiZfpfkpqJFQzY0CDwRre3Yzp.jpg', 'Shotgun Pump West.glb', '2025-12-10 21:17:26', '2025-12-10 22:57:35', 'approved', ''),
(15, 4, 'น้ำอัดลม', 'สดชื่น', '50_1.jpg', 'Duck.glb', '2025-12-10 21:57:23', '2025-12-10 23:04:28', 'approved', ''),
(16, 5, 'ขนม', '...', 'btbrkl.jpg', '', '2025-12-15 18:33:52', '2026-04-24 01:00:56', 'rejected', ''),
(17, 4, 'หมูสับคั่วพริกเกลือ', 'ไม่เผ็ดมาก อร่อยมาก', '615111196_2270856410068306_2064870601766184305_n.jpg', '', '2026-01-12 16:35:48', '2026-01-12 19:20:32', 'rejected', ''),
(18, 6, 'กะเพรา', 'ใส่ถั่วฝักยาว', '615221452_2270856596734954_7895793752992973075_n.jpg', '', '2026-01-12 19:19:01', '2026-01-12 19:19:43', 'rejected', ''),
(19, 6, 'น้ำเปล่า', 'เย็น', '615221452_2270856596734954_7895793752992973075_n.jpg', 'Duck.glb', '2026-01-12 19:21:26', '2026-01-12 19:21:58', 'approved', ''),
(21, 4, 'จ้า', '1', 'ChatGPT Image 30 ม.ค. 2569 18_32_49.png', '', '2026-01-31 01:10:38', '2026-01-31 01:15:20', 'rejected', ''),
(24, 4, 'water', 'กก22', 'Pokecut_1769771628750.jpg', '1771233998_Battle Axe.glb', '2026-01-31 01:24:28', '2026-02-16 16:26:38', 'approved', ''),
(25, 4, 'เสื้อกันหนาวววว', 'สวยมากใส่สบายมาก', 'istockphoto-1278802435-612x612.jpg', '', '2026-02-15 07:15:54', '2026-04-24 01:02:51', 'approved', ''),
(26, 10, 'อิชิตัน เก๊กฮวย', 'หวานหอมอร่อยอย่างสดชื่น', 'เหลือง.webp', '1771234026_Duck.glb', '2026-02-16 16:25:01', '2026-02-16 16:27:06', 'approved', ''),
(27, 10, 'โออิชิชาเขียว', 'ขวดแก้วแบบคลาสสิค สไตล์ไม่ซ้ำ', 'bottle_honey-lemon.png', '1771234012_Duck.glb', '2026-02-16 16:26:17', '2026-02-16 16:26:52', 'approved', ''),
(28, 11, 'กะเพรา', 'กะเพราพริกแห้ง', 'กะเพรา.png', '1771238584_Duck.glb', '2026-02-16 17:42:02', '2026-02-16 17:43:04', 'approved', ''),
(29, 4, 'มะขามป้อม', 'อร่อยหอม เปรี้ยวนิดหน่อย', 'IMG_1649.JPG', '', '2026-04-24 01:06:47', '2026-04-24 02:05:39', 'approved', ''),
(30, 12, 'ข้าวผัด 3 สี', 'ข้าวผัดหอม ๆ ผัดสดใหม่ทุกจาน ใช้ข้าวหอมมะลิคุณภาพดี คลุกเคล้ากับวัตถุดิบ 3 สี ได้แก่ แครอท ข้าวโพด และถั่วลันเตา เพิ่มความกรุบกรอบและสีสันน่ารับประทาน ปรุงรสกลมกล่อม หอมกระทะ เสิร์ฟพร้อมแตงกวาและมะนาว เหมาะสำหรับมื้อเร่งด่วนหรือมื้ออิ่มสบายท้อง', 'ข้าวผัด3สี.png', '', '2026-04-24 07:38:02', '2026-04-24 08:07:27', 'approved', ''),
(31, 12, 'ข้าวหมูสามชั้นทอด ไข่ดาว', 'หมูสามชั้นหมักสูตรพิเศษ ทอดจนเหลืองกรอบนอกนุ่มใน หอมกลิ่นกระเทียม เสิร์ฟพร้อมน้ำจิ้มแจ่วรสเด็ดและผักสด ทานคู่ข้าวสวยร้อน ๆ อร่อยลงตัว', 'หมูสามชั้นทอด.png', '', '2026-04-24 07:39:33', '2026-04-24 08:07:32', 'approved', ''),
(32, 12, 'กะเพราปลาหมึก', 'ปลาหมึกสดผัดกับใบกะเพราหอม ๆ รสชาติจัดจ้าน เผ็ดกำลังดี ผัดแบบแห้งหอมกระทะ เสิร์ฟพร้อมข้าวสวยร้อน ๆ', 'กะเพราหมึก.png', '', '2026-04-24 07:40:11', '2026-04-24 08:07:37', 'approved', ''),
(33, 12, 'ผัดเปรี้ยวหวาน', 'หมูชิ้นนุ่มผัดกับสับปะรด แตงกวา หอมใหญ่ และมะเขือเทศ รสชาติเปรี้ยวหวานลงตัว สีสันสดใส กินง่าย ถูกใจทุกวัย', 'ผัดเปรี้ยวหวาน.png', '', '2026-04-24 07:40:56', '2026-04-24 08:07:41', 'approved', ''),
(34, 12, 'ผัดขี้เมาทะเล', 'รวมมิตรทะเล (กุ้ง ปลาหมึก) ผัดกับพริก กระเทียม และสมุนไพรไทย รสชาติเผ็ดร้อนจัดจ้าน หอมเครื่องขี้เมาแบบถึงใจ เสิร์ฟร้อน ๆ อร่อยสะใจ', 'ผัดขี้เมาทะเล.png', '', '2026-04-24 07:41:29', '2026-04-24 08:07:44', 'approved', ''),
(35, 13, 'เสื้อ Champion ฮาล์ฟซิป (Half-Zip)', 'เสื้อแขนสั้นผ้ายืดโทนสีน้ำเงินเข้มฟอกเฟดสไตล์ Denim look ดีไซน์ซิปครึ่งตัวที่คอ เพิ่มความเท่กึ่งสปอร์ต ใส่สบาย ระบายอากาศดี เหมาะกับลุคลำลองและสตรีท', 'champion-ss-raglan-half-zip-tee-menrev-online-6967012-removebg-preview.png', '', '2026-04-24 07:48:56', '2026-04-24 08:07:48', 'approved', ''),
(36, 13, 'เสื้อผ้าฝ้ายมัดย้อม', 'เสื้อโอเวอร์ไซส์เนื้อผ้าฝ้ายบางเบา ใส่สบาย ลายมัดย้อมสีสันสดใส ไม่ซ้ำใคร เหมาะกับสายชิล สายคาเฟ่', 'i6pbdx-removebg-preview.png', '', '2026-04-24 07:49:42', '2026-04-24 08:07:52', 'approved', ''),
(37, 13, 'เสื้อเชิ้ตดีไซน์เก๋', 'เสื้อเชิ้ตลายทางฟ้า-ขาว ดีไซน์แปลกใหม่ มีแถบผ้าพันไขว้และผูกโบว์ช่วงเอว ช่วยเน้นทรงให้ดูมีสัดส่วน ใส่แล้วดูแฟชั่นโดดเด่น', 'images-removebg-preview.png', '', '2026-04-24 07:50:27', '2026-04-24 08:07:55', 'approved', ''),
(38, 13, 'เดรสสั้นคอกะลาสี', 'เดรสสั้นสีฟ้าเทา คอวี แต่งปกกะลาสีสีดำ ดีไซน์น่ารักสไตล์เกาหลี ใส่แล้วดูสดใส เหมาะกับวันสบาย ๆ', 'iqq9s9-removebg-preview.png', '', '2026-04-24 07:51:03', '2026-04-24 08:07:58', 'approved', ''),
(39, 13, 'เสื้อยืดสีดำลายธงชาติ', 'เสื้อยืดคอกลมสีดำ ดีไซน์เรียบ เท่ ตกแต่งลายธงชาติที่หน้าอกซ้าย และลายดาวที่แขน ใส่ได้ทุกวัน', 'O1CN01V1AkDe1xc6R4ydCXO_2208843376463-0-cib-1-removebg-preview.png', '', '2026-04-24 07:52:23', '2026-04-24 08:08:03', 'approved', ''),
(40, 13, 'เสื้อยืดสตรีทลายด้านหลัง', 'เสื้อยืดคอกลมสีดำ สไตล์สตรีท ด้านหลังสกรีนลายตัวอักษรขนาดใหญ่ โดดเด่น เหมาะกับสายแฟชั่น', 'shopping-removebg-preview.png', '', '2026-04-24 07:52:52', '2026-04-24 08:08:06', 'approved', ''),
(41, 13, 'เสื้อยืดปักดอกไม้ 3D', 'เสื้อยืดคอกลมแนวหวาน ตกแต่งด้วยงานปักและดอกไม้สามมิติช่วงไหล่และอก เพิ่มความน่ารัก ดูมีมิติ ใส่แล้วโดดเด่น', 'a5bf776c1599332f961d0d1116ad19f2-removebg-preview.png', '', '2026-04-24 07:53:42', '2026-04-24 08:08:09', 'approved', ''),
(42, 13, 'เดรสสั้นสีน้ำเงินเข้ม', 'เดรสคอวีแบบป้าย ผูกโบว์ที่เอว ช่วยเน้นรูปร่างให้ดูเพรียว แขนสั้น ใส่ได้ทั้งลุคสุภาพและลุคเที่ยว', '9272b05d94d42e8e2b98e257eb4b8b27.png', '', '2026-04-24 07:54:22', '2026-04-24 08:08:12', 'approved', ''),
(43, 14, 'ผลไม้รวมคัดพิเศษ', 'ผลไม้รวมสดคัดพิเศษ ประกอบด้วย แตงโม สตรอว์เบอร์รี สับปะรด และกีวี หั่นชิ้นพอดีคำ สีสันสดใส รสชาติหวานอมเปรี้ยว สดชื่น เหมาะสำหรับทานเล่นหรือเป็นของว่างระหว่างวัน', 'be1b709ba17b78be06c9d5022b1b978f-removebg-preview.png', '', '2026-04-24 08:01:43', '2026-04-24 08:08:15', 'approved', ''),
(44, 14, 'ผลไม้รวม', 'ผลไม้รวมจัดเรียงเป็นชั้นในแก้ว สวยงาม น่ารับประทาน ประกอบด้วย มะม่วงสุก มะละกอ บลูเบอร์รี และสตรอว์เบอร์รี รสชาติหวานสดชื่น ทานง่าย พกพาสะดวก', 'oEmYwECPPALA1r3zBZ9AIbAkAAssiiqDIzBC6_tplv-sdweummd6v-text-logo-v1_QGxvdWtudWNo_q75-removebg-preview.png', '', '2026-04-24 08:03:18', '2026-04-24 08:08:17', 'approved', ''),
(45, 14, 'ผลไม้รวมสุ่ม', 'ผลไม้รวมแบบสุ่ม คัดจากผลไม้สดประจำวัน เช่น ส้ม สตรอว์เบอร์รี องุ่น กีวี แอปเปิล และสับปะรด (อาจมีการเปลี่ยนแปลงตามฤดูกาล) หั่นพร้อมทาน สดใหม่ทุกวัน เหมาะสำหรับคนที่อยากลองหลายรสชาติในกล่องเดียว', 'oMCYLLZvAsdCCiiPksoAqwjBMAAIbZEIAIPBw_tplv-sdweummd6v-text-logo-v1_QGxvdWtudWNo_q75-removebg-preview.png', '', '2026-04-24 08:04:19', '2026-04-24 08:08:20', 'approved', ''),
(46, 14, 'แตงโมหั่นเต๋า', 'แตงโมแดงหวานฉ่ำ หั่นชิ้นสี่เหลี่ยมพอดีคำ เนื้อกรอบ สดใหม่ทุกวัน', 'unnamed (1).png', '', '2026-04-24 08:04:53', '2026-04-24 08:08:23', 'approved', ''),
(47, 14, 'สับปะรดหั่น', 'สับปะรดหวานอมเปรี้ยว หั่นชิ้นพอดีคำ บรรจุในแก้วทรงสูง สะอาด พร้อมทาน', 'unnamed (2).png', '', '2026-04-24 08:05:20', '2026-04-24 08:08:26', 'approved', ''),
(48, 14, 'องุ่น & แอปเปิล', 'ผลไม้รวม 2 อย่าง คัดสดใหม่ ประกอบด้วย องุ่นแดงไร้เมล็ด และแอปเปิลแดง หั่นชิ้นพอดีคำ ล้างสะอาดพร้อมทาน รสชาติหวานกรอบ สดชื่น เหมาะสำหรับทานเล่นหรือเป็นของว่างเพื่อสุขภาพ', 'unnamed (3).png', '', '2026-04-24 08:06:33', '2026-04-24 08:08:30', 'approved', ''),
(49, 14, 'แอปเปิลแดงหั่น', 'แอปเปิลแดงสด หั่นชิ้นสี่เหลี่ยมพร้อมเปลือก กรอบ หวานอมเปรี้ยว ล้างสะอาดพร้อมทาน', 'unnamed.png', '', '2026-04-24 08:07:07', '2026-04-24 08:08:33', 'approved', ''),
(50, 15, 'น้ำ', '12512', 'กะเพราหมึก.png', '', '2026-04-24 09:18:56', '2026-04-24 09:19:27', 'approved', ''),
(52, 12, 'ข้าวไก่ทอดไข่ดาว', 'ข้าวไก่ทอดไข่ดาวแสนอร่อย', 'ข้าวไก่ทอดไข่ดาว-removebg-preview.png', '', '2026-04-24 09:43:12', '2026-04-24 09:43:19', 'approved', ''),
(54, 12, 'ตำปูปลาร้าหมูยอ', 'ก', 'a9a76ec79383421ba4546f50cd23b267.png', '', '2026-04-24 10:27:19', '2026-04-27 12:12:11', 'approved', ''),
(55, 12, 'ยำวุ้นเส้น', 'หอมอร่ย รสชาติดี', '3.png', '', '2026-04-24 10:28:14', '2026-04-24 10:28:14', 'pending', NULL),
(56, 12, 'ตำหอยแครง', '.', '3791b1e23476491184b5d51b1e131896.png', '', '2026-04-24 10:29:52', '2026-04-24 10:30:14', 'rejected', 'กรุณาเขียนรายละเอียดสินค้าให้ครบถ้วน'),
(57, 16, 'ข้าวไก่ทอด', 'หอมอร่อย ทอดสดใหม่', 'ข้าวไก่ทอดไข่ดาว-removebg-preview.png', '', '2026-04-24 11:39:07', '2026-04-24 11:39:51', 'approved', ''),
(58, 17, 'ข้าวผัดกุ้ง', 'ข้าวผัดอร่อยมาก', 'ข้าวผัดกุ้ง.jpg', '', '2026-04-27 12:11:57', '2026-04-27 12:11:57', 'pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `type` enum('thumbnail','detail') DEFAULT 'detail'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`image_id`, `product_id`, `image_url`, `type`) VALUES
(1, 11, 'Dtbezn3nNUxytg04acy1YjAVR9ipWTNBkSNgmLvfxJ6See.jpg', 'detail'),
(2, 11, 'dFQROr7oWzulq5Fa4Vt7gR3MuTUR4dikqCOitAqj1SgiZfpfkpqJFQzY0CDwRre3Yzp.jpg', 'detail'),
(3, 11, '1.สูตรทอดหมูกรอบ.jpg', 'detail'),
(4, 12, 'Dtbezn3nNUxytg04acy1YjAVR9ipWTNBkSNgmLvfxJ6See.jpg', 'detail'),
(5, 12, 'dFQROr7oWzulq5Fa4Vt7gR3MuTUR4dikqCOitAqj1SgiZfpfkpqJFQzY0CDwRre3Yzp.jpg', 'detail'),
(6, 12, '1.สูตรทอดหมูกรอบ.jpg', 'detail'),
(7, 13, 'Dtbezn3nNUxytg04acy1YjAVR9ipWTNBkSNgmLvfxJ6See.jpg', 'detail'),
(8, 13, 'dFQROr7oWzulq5Fa4Vt7gR3MuTUR4dikqCOitAqj1SgiZfpfkpqJFQzY0CDwRre3Yzp.jpg', 'detail'),
(9, 13, '1.สูตรทอดหมูกรอบ.jpg', 'detail'),
(10, 14, 'Dtbezn3nNUxytg04acy1YjAVR9ipWTNBkSNgmLvfxJ6See.jpg', 'detail'),
(11, 14, 'dFQROr7oWzulq5Fa4Vt7gR3MuTUR4dikqCOitAqj1SgiZfpfkpqJFQzY0CDwRre3Yzp.jpg', 'detail'),
(12, 14, '1.สูตรทอดหมูกรอบ.jpg', 'detail'),
(13, 15, 'btbrkl.jpg', 'detail'),
(14, 15, '50_1.jpg', 'detail'),
(15, 15, '8851959149188_1-20240617153923-.webp', 'detail'),
(16, 16, 'ห้องสมุด2.jpg', 'detail'),
(17, 16, 'ห้องสมุด1.jpg', 'detail'),
(18, 16, 'หน้าห้อง2.jpg', 'detail'),
(19, 17, '615210325_2270855920068355_4367832104693776716_n.jpg', 'detail'),
(20, 18, '615210325_2270855920068355_4367832104693776716_n.jpg', 'detail'),
(21, 19, '615111196_2270856410068306_2064870601766184305_n.jpg', 'detail'),
(26, 21, 'Gemini_Generated_Image_xtc79uxtc79uxtc7.png', 'detail'),
(27, 21, 'Gemini_Generated_Image_4mmmbr4mmmbr4mmm.png', 'detail'),
(28, 21, 'Gemini_Generated_Image_71z5mz71z5mz71z5.png', 'detail'),
(29, 21, 'ChatGPT Image 30 ม.ค. 2569 18_13_56.png', 'detail'),
(32, 24, 'ChatGPT Image 30 ม.ค. 2569 18_32_49.png', 'detail'),
(33, 24, 'Gemini_Generated_Image_ppf83kppf83kppf8.png', 'detail'),
(34, 24, 'Pokecut_1769772197486.png', 'detail'),
(35, 24, 'Gemini_Generated_Image_xtc79uxtc79uxtc7.png', 'detail'),
(37, 26, '699941-01-allonline-sm.jpg', 'detail'),
(38, 26, 'images (2).jpg', 'detail'),
(39, 26, 'img-02.webp', 'detail'),
(40, 27, 'images (1).jpg', 'detail'),
(41, 27, 'images.jpg', 'detail'),
(42, 27, 'c3d745ae4d924534a9f616557b74d0c2.webp', 'detail'),
(43, 28, 'กะเพรา.png', 'detail'),
(44, 29, 'IMG_3057.JPG', 'detail'),
(45, 30, 'ข้าวผัด3สี.png', 'detail'),
(46, 31, 'หมูสามชั้นทอด.png', 'detail'),
(47, 32, 'กะเพราหมึก.png', 'detail'),
(48, 33, 'ผัดเปรี้ยวหวาน.png', 'detail'),
(49, 34, 'ผัดขี้เมาทะเล.png', 'detail'),
(50, 35, 'champion-ss-raglan-half-zip-tee-menrev-online-6967012-removebg-preview.png', 'detail'),
(51, 36, 'i6pbdx-removebg-preview.png', 'detail'),
(52, 37, 'images-removebg-preview.png', 'detail'),
(53, 38, 'iqq9s9-removebg-preview.png', 'detail'),
(54, 39, 'O1CN01V1AkDe1xc6R4ydCXO_2208843376463-0-cib-1-removebg-preview.png', 'detail'),
(55, 40, 'shopping-removebg-preview.png', 'detail'),
(56, 41, 'a5bf776c1599332f961d0d1116ad19f2-removebg-preview.png', 'detail'),
(57, 42, '9272b05d94d42e8e2b98e257eb4b8b27.png', 'detail'),
(58, 43, 'be1b709ba17b78be06c9d5022b1b978f-removebg-preview.png', 'detail'),
(59, 44, 'oEmYwECPPALA1r3zBZ9AIbAkAAssiiqDIzBC6_tplv-sdweummd6v-text-logo-v1_QGxvdWtudWNo_q75-removebg-preview.png', 'detail'),
(60, 45, 'oMCYLLZvAsdCCiiPksoAqwjBMAAIbZEIAIPBw_tplv-sdweummd6v-text-logo-v1_QGxvdWtudWNo_q75-removebg-preview.png', 'detail'),
(61, 46, 'unnamed (1).png', 'detail'),
(62, 47, 'unnamed (2).png', 'detail'),
(63, 48, 'unnamed (3).png', 'detail'),
(64, 49, 'unnamed.png', 'detail'),
(65, 50, 'mai3.png', 'detail'),
(67, 52, 'ข้าวไก่ทอดไข่ดาว-removebg-preview.png', 'detail'),
(69, 54, 'a9a76ec79383421ba4546f50cd23b267.png', 'detail'),
(70, 55, '3.png', 'detail'),
(71, 56, '3791b1e23476491184b5d51b1e131896.png', 'detail'),
(72, 57, 'ข้าวไก่ทอดไข่ดาว-removebg-preview.png', 'detail'),
(73, 58, 'ข้าวผัดกุ้ง.jpg', 'detail');

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `variation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`variation_id`, `product_id`, `color`, `size`, `price`, `stock`) VALUES
(1, 2, NULL, NULL, 599.00, 50),
(2, 4, NULL, NULL, 10.00, 25),
(4, 6, NULL, NULL, 30.00, 40),
(5, 7, NULL, NULL, 299.00, 301),
(6, 8, NULL, NULL, 20.00, 300),
(9, 11, NULL, NULL, 90.00, 75),
(10, 12, NULL, NULL, 75.00, 80),
(11, 13, NULL, NULL, 121.00, 200),
(12, 14, NULL, NULL, 80.00, 310),
(13, 15, NULL, NULL, 18.00, 236),
(14, 16, NULL, NULL, 20.00, 500),
(15, 17, NULL, NULL, 50.00, 20),
(16, 18, NULL, NULL, 100.00, 1),
(17, 19, NULL, NULL, 100.00, 1),
(19, 21, NULL, NULL, 3.00, 56),
(22, 24, NULL, NULL, 99.00, 120),
(23, 25, NULL, NULL, 599.00, 26),
(24, 26, NULL, NULL, 22.00, 200),
(25, 27, NULL, NULL, 20.00, 300),
(26, 28, NULL, NULL, 50.00, 1),
(27, 29, NULL, NULL, 123.00, 33),
(28, 30, NULL, NULL, 60.00, 20),
(29, 31, NULL, NULL, 70.00, 20),
(30, 32, NULL, NULL, 65.00, 7),
(31, 33, NULL, NULL, 55.00, 10),
(32, 34, NULL, NULL, 70.00, 20),
(33, 35, NULL, NULL, 328.98, 300),
(34, 36, NULL, NULL, 199.00, 30),
(35, 37, NULL, NULL, 309.00, 100),
(36, 38, NULL, NULL, 249.00, 31),
(37, 39, NULL, NULL, 269.00, 96),
(38, 40, NULL, NULL, 1099.00, 200),
(39, 41, NULL, NULL, 299.00, 233),
(40, 42, NULL, NULL, 1199.00, 99),
(41, 43, NULL, NULL, 40.00, 30),
(42, 44, NULL, NULL, 40.00, 10),
(43, 45, NULL, NULL, 59.00, 30),
(44, 46, NULL, NULL, 25.00, 30),
(45, 47, NULL, NULL, 25.00, 30),
(46, 48, NULL, NULL, 30.00, 20),
(47, 49, NULL, NULL, 25.00, 25),
(48, 50, NULL, NULL, 23.00, 21),
(50, 52, NULL, NULL, 50.00, 20),
(52, 54, NULL, NULL, 60.00, 30),
(53, 55, NULL, NULL, 65.00, 2),
(54, 56, NULL, NULL, 75.00, 21),
(55, 57, NULL, NULL, 50.00, 30),
(56, 58, NULL, NULL, 50.00, 30);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `seller_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `qr_code_image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `shop_model` tinyint(4) DEFAULT 1,
  `shop_type` enum('อาหาร','เครื่องแต่งกาย','ผลไม้') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`seller_id`, `user_id`, `shop_name`, `phone_number`, `address`, `description`, `city`, `postal_code`, `profile_image`, `qr_code_image`, `created_at`, `updated_at`, `shop_model`, `shop_type`) VALUES
(1, 2, 'shoptest01', '0123456789', 'dfvvmhm', NULL, 'jhgjh', '12120', NULL, NULL, '2025-12-05 04:49:55', '2025-12-05 04:49:55', 1, 'อาหาร'),
(2, 3, 'shoptest02', NULL, '...', NULL, NULL, NULL, NULL, NULL, '2025-12-05 23:50:49', '2025-12-05 23:50:49', 1, 'อาหาร'),
(3, 4, 'shoptest03', NULL, '...', NULL, NULL, NULL, NULL, NULL, '2025-12-08 18:41:50', '2025-12-08 18:41:50', 1, 'อาหาร'),
(4, 5, 'shoptest04', '1235', 'วอค คลองหก', 'อร่อย เข้าถึงง่ายมากกกกกกกกกกกกกกกกกกกกกdddddddd', 'ปทุมธานี', '12120', '1776961923_IMG_2044.JPG', NULL, '2025-12-08 21:50:26', '2026-04-23 23:33:04', 1, 'อาหาร'),
(5, 6, 'shoptest05', NULL, '...', NULL, NULL, NULL, NULL, NULL, '2025-12-15 18:32:45', '2025-12-15 18:32:45', 1, 'อาหาร'),
(6, 46, 'POdairy', NULL, '11คลอง6', NULL, NULL, NULL, NULL, NULL, '2026-01-12 19:17:40', '2026-01-12 19:17:40', 1, 'อาหาร'),
(7, 48, 'ร้านใหม่', NULL, 'กก', NULL, NULL, NULL, NULL, NULL, '2026-02-13 00:26:00', '2026-02-13 00:26:00', 1, 'อาหาร'),
(8, 49, 'ก', NULL, 'กไกๆ', NULL, NULL, NULL, NULL, NULL, '2026-02-13 00:47:06', '2026-02-13 00:47:06', 1, 'อาหาร'),
(10, 58, 'kantichaaaashop', NULL, 'หอพีโน่', NULL, NULL, NULL, NULL, NULL, '2026-02-16 16:21:04', '2026-02-16 16:21:04', 1, 'อาหาร'),
(11, 60, 'POdairy', NULL, 'ราชมลธัญะ', NULL, NULL, NULL, NULL, NULL, '2026-02-16 17:40:28', '2026-02-16 17:40:28', 1, 'อาหาร'),
(12, 76, 'ร้านข้าวบ้านมิน', '0889854704', '88/9 ซอยรามคำแหง 24 แขวงหัวหมาก เขตบางกะปิ กรุงเทพมหานคร 10240', '', '', '', '1777001618_maruzaki-removebg-preview.png', NULL, '2026-04-24 07:02:40', '2026-04-24 10:33:38', 1, 'อาหาร'),
(13, 77, 'Style Cool Shop', '092-456-7890', '99/12 ซอยสุขุมวิท 71 แขวงพระโขนงเหนือ เขตวัฒนา กรุงเทพมหานคร 10110', NULL, NULL, NULL, NULL, NULL, '2026-04-24 07:44:27', '2026-04-24 07:44:27', 1, 'เครื่องแต่งกาย'),
(14, 78, 'ร้านผลไม้สดบ้านสวน', '094-567-8890', '78/12 หมู่ 3 ถนนร่มเกล้า แขวงคลองสามประเวศ เขตลาดกระบัง กรุงเทพมหานคร 10520', NULL, NULL, NULL, NULL, NULL, '2026-04-24 07:58:25', '2026-04-24 07:58:25', 1, 'ผลไม้'),
(15, 80, 'mali', 'dsfsd', 'dsfsdf', NULL, NULL, NULL, NULL, NULL, '2026-04-24 09:15:51', '2026-04-24 09:15:51', 1, 'เครื่องแต่งกาย'),
(16, 84, 'podiry', '0630899497', 'ตลาดจักรมงคล ซอยคลองหกตะวันออก12 ต.คลองหก อ.คลองหลวง จ.ปทุมธานี', NULL, NULL, NULL, NULL, NULL, '2026-04-24 11:38:01', '2026-04-24 11:38:01', 1, 'อาหาร'),
(17, 86, 'POdairy1', '0630899497', 'หอพีโน่01', NULL, NULL, NULL, NULL, NULL, '2026-04-27 12:10:04', '2026-04-27 12:10:04', 1, 'อาหาร');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('customer','seller','admin') NOT NULL DEFAULT 'customer',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `role`, `created_at`, `updated_at`, `last_login`) VALUES
(1, 'tester01', 'test01@gmail.com', '$2y$10$lzVHRYVE6wgofWAuLbUpxOYvG5W9Mkm/kfi0WXJ4qVSogFoBscaHi', 'customer', '2025-12-05 02:43:22', '2025-12-05 02:43:22', NULL),
(2, 'sellertest01', 'sellertest01@gmail.com', 'fdkfsdfm,;dsldsovkidvnsudhviuw', 'seller', '2025-12-05 04:48:38', '2025-12-05 04:48:38', NULL),
(3, 'tester03', 'test03@gmail.com', '$2y$10$ijBrHyUUUdfZp9/FTqpa/./i5yOkhbA3JDm7neHZiUQthdTFPi00m', 'seller', '2025-12-05 23:50:49', '2025-12-05 23:50:49', NULL),
(4, 'sellertest02', 'sellertest02@gmail.com', '$2y$10$b26FaRaZwRsHwNoNWZvRu.J5bKmg/XS3NalXZtJ/Vhg0d3UT.fWlO', 'seller', '2025-12-08 18:41:50', '2025-12-08 18:41:50', NULL),
(5, 'seller_ok', 'test05@gmail.com', '$2y$10$W/YqcBodbvypo/y9XOIB4OUr5y485kMztMtI98HHEQcrR1csTdKbe', 'seller', '2025-12-08 21:50:26', '2025-12-08 21:50:26', NULL),
(6, 'sellertest03', 'sellertest03@gmail.com', '$2y$10$wq9OVqkf.0tcIDgwoId1dOjonLcfLb0jYs5OmKUP9G/0rYOxbpq8G', 'seller', '2025-12-15 18:32:45', '2025-12-15 18:32:45', NULL),
(7, 'custest1', 'ddewew', '$2y$10$8fGvK1N.vH8v8v8v8v8v8ueH8v8v8v8v8v8v8v8v8v8v8v8v8v8v8', 'customer', '2026-01-11 14:46:46', '2026-01-11 15:24:23', NULL),
(8, 'custest2', 'player@test.com', '$2y$10$3zS6EWoJgky8pEbuUXCmAOZS7/HIIetWiqLhXZIg7R7n0fG1YOrmG', 'customer', '2026-01-11 16:00:39', '2026-01-11 16:00:39', NULL),
(9, 'custest03', 'oo@oo.com', '$2y$10$4Cy/1oCsjWmlyVxN4kvlqOpA19aK00oNjulT/Thc/DJCXVnqClMT2', 'customer', '2026-01-12 07:49:17', '2026-01-12 07:49:17', NULL),
(12, 'custest04', 'oo@.com', '$2y$10$aj0iRi/tXXIUzolBoQy9C.z3QDRsRlzeI9GX31302tQrGGkgwtfVO', 'customer', '2026-01-12 07:53:07', '2026-01-12 07:53:07', NULL),
(13, 'custest05', 'iu@mail.com', '$2y$10$hS2y/m1Az0B0RizmYT5UT.TaX8bvB.sQlE8Ic.nacrvLMv0rLcmIC', 'customer', '2026-01-12 07:53:45', '2026-01-12 07:53:45', NULL),
(16, 'custest06', 'lo@mail.com', '$2y$10$aEQKKIDbK4/IK/kkbzpviuR/vuWXL1hx.xPqyazdgrdjDRTQdpP6O', 'customer', '2026-01-12 08:02:26', '2026-01-12 08:02:26', NULL),
(17, '', '', '$2y$10$yfVdM2Ws.Y710yBvPmbXK.WcvU7oIQbItOWSvu86miSsTn3B432DS', 'customer', '2026-01-12 08:16:42', '2026-01-12 08:16:42', NULL),
(23, '1', '3', '$2y$10$.5yUl2bGwseONVSZP7N4V.S3Ub6ka4Gzq8UA7LX.PCmkQ35iO3coq', 'customer', '2026-01-12 08:45:04', '2026-01-12 08:45:04', NULL),
(26, 'lo1', '3@mail.com', '$2y$10$BBQ4V4GEfmJTYBMLq6z3HuTYiYH7WezxX/OQAMUH43VBkUKM3MCIq', 'customer', '2026-01-12 08:45:32', '2026-01-12 08:45:32', NULL),
(29, 'custest07', 'malolo@mail.com', '$2y$10$VlxYBXG8EKO2KZ/.f3euJ.GfEr042qOGZVH3lIihLV7h7XLpaA6EO', 'customer', '2026-01-12 08:46:05', '2026-01-12 08:46:05', NULL),
(33, 'custest08', 'mail.com', '$2y$10$Sp9.dYSSzzdPF5GTvQR6H.KXo1vI9Y2VBTZAn15Ff31LBMRMF8yPu', 'customer', '2026-01-12 08:51:23', '2026-01-12 08:51:23', NULL),
(34, 'custest09', 'fsdfds', '$2y$10$BFK4q0SqnaKSdIFmdC1AkOb/FbA523.hb.TPrxkTOSkS7vZ7RiZ9G', 'customer', '2026-01-12 11:13:55', '2026-01-12 11:13:55', NULL),
(35, 'mo1', 'sgsdgs', '$2y$10$RCj/hRrVEumF6aXKikseJe15vk4Zyz5MzrbhMoNaombyn7ccWK8TG', 'customer', '2026-01-12 15:57:21', '2026-01-12 15:57:21', NULL),
(36, 'momo', 'dfdfds', '$2y$10$vQrrCdgx1rcaDAjdQK4Nj.3uG2CvBlfHC9PSmlz4xjDRUJEriI/pG', 'customer', '2026-01-12 18:08:01', '2026-01-12 18:08:01', NULL),
(37, 'momo2', '12', '$2y$10$xBO188wsG1BnAqhCnst/y.dYQ8ZW2bqNrH68gKFsT5KUh4rdaweHa', 'customer', '2026-01-12 18:55:02', '2026-01-12 18:55:02', NULL),
(44, 'momo45', '1112512', '$2y$10$dY8WK4OxOxO1rAH9EzSqvegrpt4wJgqJP/PIjVZm7GYGRoPifUZWm', 'customer', '2026-01-12 18:55:55', '2026-01-12 18:55:55', NULL),
(45, 'tangmo', 'tmkan@gmail..com', '$2y$10$3JEPPi9rJh0duTvVdsp92u/fsQZEIYnnw.gpTCl1OWX1Mgz7u5lBG', 'customer', '2026-01-12 19:10:59', '2026-01-12 19:10:59', NULL),
(46, 'thakdanai', 'oom0630899496', '$2y$10$Sr0KD8YhssCYf/ipxbJsvuXbSdwRv0DyTJopWy.CJfwejqZI.Xyme', 'seller', '2026-01-12 19:17:40', '2026-01-12 19:17:40', NULL),
(48, 'แตงโม', 'mo@gmail.com', '$2y$10$hbl6yjX7sl5GcnJ/0JYa6./UgICc7TtFUtsiyI.oRvSWIJmz3BWha', 'seller', '2026-02-13 00:26:00', '2026-02-13 00:26:00', NULL),
(49, 'แตแต', 'momo@gmail.com', '$2y$10$rnvna5rDtLMbzb52O0BPn.t/OQR1y/qeAaOwa2bi7v0lHXw7Y2hdS', 'seller', '2026-02-13 00:47:06', '2026-02-13 00:47:06', NULL),
(50, 'moo', 'Tmkantichaaaa@gmail.com', '$2y$10$uFcuYg1kTFoKFc4LFoBzbuM/U5HOaYRXcmU1tUqEirhQA6Iyk7lpO', 'customer', '2026-02-16 14:51:33', '2026-02-16 14:51:33', NULL),
(53, 'Kantichaa', 'Kanti@gmail.com', '$2y$10$faXV./p0mewEkT.DrRXzo.Iz5eA3Xi2wEeK2B/jv8qMocapli2fgO', 'customer', '2026-02-16 15:22:40', '2026-02-16 15:22:40', NULL),
(57, 'namo', 'fsdfdsfsdf@gmail.com', '$2y$10$.Doqblnb/yu/IxU/8X7av.xpdR2eyozFYl5R1UuPz9nJs1QmpmKFW', 'seller', '2026-02-16 16:20:05', '2026-02-16 16:20:05', NULL),
(58, 'kantichaaaa', 'momokanti@gmail.com', '$2y$10$EwvMYgDpwOXzfAnxhfTFreB2t7/sQ5PjLudC312JQduBMOynSswZq', 'seller', '2026-02-16 16:21:04', '2026-02-16 16:21:04', NULL),
(60, 'Oom', 'oom0630899496@gmail.com', '$2y$10$r3m1RZNF00fuzytwHxT2O.zNNRBgX8P0hn7kRwj3JGn2rQOBv7rUC', 'seller', '2026-02-16 17:40:28', '2026-02-16 17:40:28', NULL),
(61, 'testuser', 'test@email.com', '$2y$10$leHKVDWhE590Kys4UjrvPuKDYMsajO7IfFGGS60gZJy7HpKAF4iTG', 'customer', '2026-04-22 01:31:11', '2026-04-22 01:31:11', NULL),
(62, 'testmo', 'momo12@gmail.com', '$2y$10$JrBHqdhCD6xXKKWTjAci3OfrN5MoKHGkMmWU/S9BD86reXI.8M1v2', 'customer', '2026-04-22 01:51:08', '2026-04-22 01:51:08', NULL),
(64, 'testuser1', 'test555@email.com', '$2y$10$nDEI/k305k0SZ7dBfho2AOtOobQTKoKQD1Thi.7VnDhOCrqfsEe6m', 'customer', '2026-04-22 01:56:46', '2026-04-22 01:56:46', NULL),
(65, 'testuser2', 'test55@email.com', '$2y$10$38lOikR3bMJug5kGLvMMauo4rynrS56EKXQKZb6rO97C1yvDlNTjG', 'customer', '2026-04-22 02:00:21', '2026-04-22 02:00:21', NULL),
(66, 'momotaro', 'taro@gmail.com', '$2y$10$va3mUgZffYjIrRK4zUK2Euhy8VrXfm9.YMTwhF2wZliaWDbedtJfq', 'customer', '2026-04-22 02:05:25', '2026-04-22 02:05:25', NULL),
(67, 'testter20', '12@gmaul.com', '$2y$10$JybriiZ/N7Qw9Afds2u7.uDZoRrDC3ZqA/w0rVp7Q7acgtrTY0SSO', 'customer', '2026-04-22 02:07:14', '2026-04-22 02:07:14', NULL),
(68, 'hohoho', 'hjjhjhj', '$2y$10$k0NeAKDOguFdMTyfdv1Nvuz9dkf7KytbkaZ8qr/Uh1CE4/od21Yni', 'customer', '2026-04-22 21:34:33', '2026-04-22 21:34:33', NULL),
(69, 'namoo', 'namo@gamilc.om', '$2y$10$qhpWd7A4GaTxm8aEJzjq7O/6cCDflYaZW8s/AF2efc3Xau13SFR5W', 'customer', '2026-04-22 21:57:29', '2026-04-22 21:57:29', NULL),
(70, 'ffff', 'ffff', '$2y$10$jBDMx1osVroUP5ua5AJB7.JzcYeqJ.x6qxo.VblJYTloEyiQtE2G.', 'customer', '2026-04-22 22:17:00', '2026-04-22 22:17:00', NULL),
(71, 'gg', 'gg', '$2y$10$V55EQGGJW8XS/Nebgo.EWecd1vgpR9egw2tj0L6lqGs2kH81vJG62', 'customer', '2026-04-22 22:23:07', '2026-04-22 22:23:07', NULL),
(72, 'mama', 'ma', '$2y$10$Vl7lojMrxsj9gg61tYSd7OFpE.vUhduZtlqkoP8NsfVRk8Zxsh966', 'customer', '2026-04-23 17:34:51', '2026-04-23 17:34:51', NULL),
(73, 'tomangg', 'ta@gmail.com', '$2y$10$CNeNk7Oxbgc.egYMI.d0yu0FvenVl2Eg.Cu.bWHrHAaPniYn.E00m', 'customer', '2026-04-23 17:44:22', '2026-04-23 17:44:22', NULL),
(74, 'ta', 'fdgfgf', '$2y$10$SnbA2zNUcl8pdPvvHzhgr.59Ta/yKUwYz8EugJDwI3idF7LDI0lya', 'customer', '2026-04-24 04:37:59', '2026-04-24 04:37:59', NULL),
(75, 'raa', 'fsdfsd', '$2y$10$ym4SfUZsOAc4jPMqzr0oDuCv5ZPOCr1jGSU/cxz8VQHGyKZBYLNlC', 'customer', '2026-04-24 04:38:25', '2026-04-24 04:38:25', NULL),
(76, 'minshop03', 'khaobanmin.th@gmail.com', '$2y$10$r5yprHu/lZIpj6OsmxyRtO/05DU2GTdtNVQMxKJerA36LKkp7rdlu', 'seller', '2026-04-24 07:02:40', '2026-04-24 07:02:40', NULL),
(77, 'styleshop', 'stylecool.shop@gmail.com', '$2y$10$HNRXFxDeiFHl4xjhoMJ55.nTc8ZnHz8CoYbXystRwDG/Ux5Oy4SYe', 'seller', '2026-04-24 07:44:27', '2026-04-24 07:44:27', NULL),
(78, 'naff', 'ban-suan.fruit@gmail.com', '$2y$10$Xdesbu1zXHWeEWEDQuNUWuArvoTjUi/LhlH94AFwpvPY7UkENgUpK', 'seller', '2026-04-24 07:58:25', '2026-04-24 07:58:25', NULL),
(79, 'dodo', 'dodo', '$2y$10$4eRkuSErWDE/ly9bxp8U2.kZBUR318rJbl07TKdwRL0naPN1BtCOC', 'customer', '2026-04-24 08:58:17', '2026-04-24 08:58:17', NULL),
(80, 'malii', 'fsdfdfdf@gmail.com', '$2y$10$TWgWig31lVxiAuaxar6LNu7Qrf8ZsdVoiAXIcYtorbz3t8FZq/lhe', 'seller', '2026-04-24 09:15:51', '2026-04-24 09:15:51', NULL),
(81, 'imo', 'mmmmm', '$2y$10$aSILv2CdAZivinp4Jm2sLOeai4g7M4eD6DzyxmHFkNDyOCZ1WguxK', 'customer', '2026-04-24 10:45:10', '2026-04-24 10:45:10', NULL),
(82, 'oom03', 'oom03@gmail.com', '$2y$10$lL4MWdEQocmWRHGnj4PhnOAng4XZpeOOVH3zxse5QfHI1Amtb5Wp6', 'customer', '2026-04-24 11:32:05', '2026-04-24 11:32:05', NULL),
(84, 'mo01', 'oom0955907823@gmail.com', '$2y$10$LBq2B8OiN0DnXn4rS7GZmOKFC6u68DIdCvrz.sEupYaZ1HubiH/Fy', 'seller', '2026-04-24 11:38:01', '2026-04-24 11:38:01', NULL),
(86, 'tdn03', 'tmkanstichaaaa@gmail.com', '$2y$10$6HDJkM5051gjm9yOdQAxgu0C6kBSU3z7HMPL1QLbY/CQLEju/4wJ2', 'seller', '2026-04-27 12:10:04', '2026-04-27 12:10:04', NULL),
(87, 'Tdn01', 'adfdafdffdasf', '$2y$10$v.FfAHdLiHkXE48Ii8KVh.0dJ8VhFmLCPop5Z9QMDAqXpHos0t2Gu', 'customer', '2026-04-27 12:31:25', '2026-04-27 12:31:25', NULL),
(88, 'tangmoo', 'tmakntichaaaa@gmail.com', '$2y$10$mWq0bE5gKMYVDn9RWHD/7e8m4Q2cRjySiRcRq8TRr/LZ/1CgdAlkS', 'customer', '2026-04-28 00:58:02', '2026-04-28 00:58:02', NULL),
(89, 'Testcus01', 'Test@gmail.com', '$2y$10$4iH6jaMqeHakt2VdkfnbH.5ZrF6chiS3oDtFT0j/Eo4zbXCDi/dfG', 'customer', '2026-04-30 07:27:06', '2026-04-30 07:27:06', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `market_stalls`
--
ALTER TABLE `market_stalls`
  ADD PRIMARY KEY (`stall_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `variation_id` (`variation_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`variation_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `market_stalls`
--
ALTER TABLE `market_stalls`
  MODIFY `stall_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `variation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `market_stalls`
--
ALTER TABLE `market_stalls`
  ADD CONSTRAINT `market_stalls_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`variation_id`) REFERENCES `product_variations` (`variation_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `sellers`
--
ALTER TABLE `sellers`
  ADD CONSTRAINT `sellers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
