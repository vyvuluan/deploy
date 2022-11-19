-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 18, 2022 at 02:29 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectmnm`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_comment` (IN `maSP` INT(15), IN `maKH` INT(15), IN `comment` VARCHAR(255))   BEGIN

                INSERT INTO comments(product_id,customer_id,comment,created_at,updated_at) VALUES (maSP,maKH,comment,NOW(),NOW());
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_allcomment` (IN `id` INT(15))   BEGIN
                select product_id,customer_id,comment,comments.created_at,ten from comments,customers where comments.product_id = id and customers.id=comments.customer_id;
            END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `maKH` bigint(20) UNSIGNED NOT NULL,
  `maSP` bigint(20) UNSIGNED NOT NULL,
  `soLuongSP` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chuc_vus`
--

CREATE TABLE `chuc_vus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chuc_vus`
--

INSERT INTO `chuc_vus` (`id`, `ten`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'Thủ kho', NULL, NULL),
(3, 'Nhân viên bán hàng', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ct_phieu_nhaps`
--

CREATE TABLE `ct_phieu_nhaps` (
  `pn_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `soluong` int(11) NOT NULL,
  `gia` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ct_phieu_nhaps`
--

INSERT INTO `ct_phieu_nhaps` (`pn_id`, `product_id`, `soluong`, `gia`, `created_at`, `updated_at`) VALUES
(4, 1, 123, 123, '2022-11-18 09:30:17', '2022-11-18 09:30:17'),
(6, 17, 123, 10000000, '2022-11-18 10:39:23', '2022-11-18 10:39:23'),
(7, 15, 123, 1000000, '2022-11-18 11:51:22', '2022-11-18 11:51:22'),
(7, 3, 123, 10000000, '2022-11-18 11:51:39', '2022-11-18 11:51:39'),
(8, 12, 123, 1000000, '2022-11-18 12:33:14', '2022-11-18 12:33:14'),
(8, 11, 123, 1000000, '2022-11-18 12:33:22', '2022-11-18 12:33:22'),
(8, 14, 123, 1000000, '2022-11-18 12:33:32', '2022-11-18 12:33:32'),
(8, 2, 123, 1000000, '2022-11-18 12:33:41', '2022-11-18 12:33:41'),
(8, 18, 123, 1000000, '2022-11-18 12:33:49', '2022-11-18 12:33:49'),
(8, 13, 123, 1000000, '2022-11-18 12:34:06', '2022-11-18 12:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `ct_phieu_xuats`
--

CREATE TABLE `ct_phieu_xuats` (
  `px_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `soluong` int(11) NOT NULL,
  `gia` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ct_phieu_xuats`
--

INSERT INTO `ct_phieu_xuats` (`px_id`, `product_id`, `soluong`, `gia`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 53990000, '2022-11-18 09:57:39', '2022-11-18 09:57:39'),
(2, 17, 4, 26790000, '2022-11-18 10:40:13', '2022-11-18 10:40:13'),
(3, 1, 1, 53990000, '2022-11-18 11:45:06', '2022-11-18 11:45:06'),
(4, 17, 1, 26790000, '2022-11-18 11:53:54', '2022-11-18 11:53:54');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ten` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngaySinh` date DEFAULT NULL,
  `diaChi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gioiTinh` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `ten`, `ngaySinh`, `diaChi`, `sdt`, `gioiTinh`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'do manhaa', NULL, NULL, NULL, NULL, 5, '2022-11-18 09:42:18', '2022-11-18 09:42:18'),
(2, 'store l3m', NULL, NULL, NULL, NULL, 6, '2022-11-18 12:32:05', '2022-11-18 12:32:05'),
(3, 'Đình Mạnh', NULL, NULL, NULL, NULL, 7, '2022-11-18 12:53:47', '2022-11-18 12:53:47'),
(4, 'do manh', NULL, NULL, NULL, NULL, 8, '2022-11-18 13:05:17', '2022-11-18 13:05:17'),
(5, 'Manh Do', NULL, NULL, NULL, NULL, 9, '2022-11-18 13:07:43', '2022-11-18 13:07:43');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `discount_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phantram` int(11) NOT NULL,
  `dieukien` int(11) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaySinh` date DEFAULT NULL,
  `sdt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diaChi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioiTinh` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cv_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `ten`, `ngaySinh`, `sdt`, `diaChi`, `gioiTinh`, `user_id`, `cv_id`, `created_at`, `updated_at`) VALUES
(1, 'do manh kho', NULL, '0123456789', 'HCM', 1, 2, 2, '2022-11-18 08:23:53', '2022-11-18 08:24:17'),
(2, 'do manh nv', NULL, '0123456789', 'HCM', 1, 3, 3, '2022-11-18 08:24:55', '2022-11-18 08:25:23'),
(4, 'do manhđa', NULL, '0123456789', '1234567', 1, 4, 1, '2022-11-18 08:33:21', '2022-11-18 08:34:25');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loaisps`
--

CREATE TABLE `loaisps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenLoai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loaisps`
--

INSERT INTO `loaisps` (`id`, `tenLoai`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', '2022-11-18 08:40:23', '2022-11-18 08:40:23'),
(2, 'PC', '2022-11-18 08:40:32', '2022-11-18 10:05:51'),
(3, 'Workstation', '2022-11-18 10:06:12', '2022-11-18 10:06:18'),
(4, 'Mini PC', '2022-11-18 10:31:35', '2022-11-18 10:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_10_11_134617_create_nccs_table', 1),
(6, '2020_10_11_134627_create_nsxes_table', 1),
(7, '2020_10_11_135548_create_loaisps_table', 1),
(8, '2021_10_08_102212_create_chuc_vus_table', 1),
(9, '2021_10_11_092858_create_employees_table', 1),
(10, '2022_10_08_035532_create_providers_table', 1),
(11, '2022_10_11_081936_create_customers_table', 1),
(12, '2022_10_11_083108_create_contacts_table', 1),
(13, '2022_10_11_091256_create_products_table', 1),
(14, '2022_10_11_092242_create_phieu_xuats_table', 1),
(15, '2022_10_11_092622_create_ct_phieu_xuats_table', 1),
(16, '2022_10_11_140724_create_carts_table', 1),
(17, '2022_10_20_174536_create_phieu_nhaps_table', 1),
(18, '2022_10_20_174546_create_ct_phieu_nhaps_table', 1),
(19, '2022_10_26_125916_create_comments_table', 1),
(20, '2022_11_08_202605_create_discounts_table', 1),
(21, '2022_11_15_151317_create_procedure', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nccs`
--

CREATE TABLE `nccs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenNCC` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diaChi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nccs`
--

INSERT INTO `nccs` (`id`, `tenNCC`, `diaChi`, `sdt`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'HCM', '0123456789', '2022-11-18 08:42:08', '2022-11-18 08:42:08'),
(2, 'Gearvn', 'HCM', '0123456789', '2022-11-18 08:52:38', '2022-11-18 08:52:38');

-- --------------------------------------------------------

--
-- Table structure for table `nsxes`
--

CREATE TABLE `nsxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenNSX` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quocGia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nsxes`
--

INSERT INTO `nsxes` (`id`, `tenNSX`, `quocGia`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'Mỹ', '2022-11-18 08:42:51', '2022-11-18 08:42:51'),
(2, 'Asus', 'Mỹ', '2022-11-18 08:43:06', '2022-11-18 08:43:06'),
(3, 'Samsung', 'Trung Quốc', '2022-11-18 08:53:01', '2022-11-18 08:53:01'),
(4, 'HP', 'Canada', '2022-11-18 12:44:49', '2022-11-18 12:44:49');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(48, 'App\\Models\\User', 5, 'dinhmanh11@gmail.com_Token', '48a68ae34021c9466ce9821899a4dd680dcd006b56d66d581f6384dbe0f5f53f', '[\"\"]', '2022-11-18 13:28:00', NULL, '2022-11-18 13:23:53', '2022-11-18 13:28:00');

-- --------------------------------------------------------

--
-- Table structure for table `phieu_nhaps`
--

CREATE TABLE `phieu_nhaps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ncc_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `tongTien` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phieu_nhaps`
--

INSERT INTO `phieu_nhaps` (`id`, `employee_id`, `ncc_id`, `status`, `tongTien`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 0, '2022-11-18 08:54:51', '2022-11-18 09:58:41'),
(3, 1, 2, 1, 0, '2022-11-18 09:12:13', '2022-11-18 09:35:18'),
(4, 1, 2, 1, 30258, '2022-11-18 09:30:06', '2022-11-18 09:35:09'),
(5, 1, 2, 1, 1230000000, '2022-11-18 09:56:48', '2022-11-18 09:57:12'),
(6, 1, 2, 1, 1230000000, '2022-11-18 10:39:12', '2022-11-18 10:39:41'),
(7, 1, 1, 0, 1353000000, '2022-11-18 11:51:08', '2022-11-18 11:51:39'),
(8, 1, 2, 1, 738000000, '2022-11-18 12:32:59', '2022-11-18 12:34:24');

-- --------------------------------------------------------

--
-- Table structure for table `phieu_xuats`
--

CREATE TABLE `phieu_xuats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) NOT NULL,
  `pt_ThanhToan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenKH` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diaChi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int(11) NOT NULL DEFAULT 0,
  `tongTien` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phieu_xuats`
--

INSERT INTO `phieu_xuats` (`id`, `employee_id`, `customer_id`, `status`, `pt_ThanhToan`, `tenKH`, `sdt`, `diaChi`, `payment_id`, `discount`, `tongTien`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 4, 'Tại quầy', 'manh', '0123456789', 'HCM', NULL, 0, 107980000, '2022-11-18 09:57:26', '2022-11-18 09:57:58'),
(2, 1, NULL, 4, 'Tại quầy', 'manh2', '0123456789', 'HCM', NULL, 0, 107160000, '2022-11-18 10:40:01', '2022-11-18 10:40:23'),
(3, NULL, NULL, 0, 'Tại quầy', 'long', '0123456789', 'HCM', NULL, 0, 53990000, '2022-11-18 11:44:50', '2022-11-18 11:45:06'),
(4, NULL, 1, 0, 'COD', 'do manh', '0971233811', 'saigon', NULL, 0, 26790000, '2022-11-18 11:53:54', '2022-11-18 11:53:54');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenSP` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia` int(11) NOT NULL,
  `soLuongSP` int(11) NOT NULL DEFAULT 0,
  `moTa` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctSanPham` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hinh` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maLoai` bigint(20) UNSIGNED NOT NULL,
  `baoHanh` int(11) NOT NULL,
  `maNCC` bigint(20) UNSIGNED NOT NULL,
  `maNSX` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `tenSP`, `gia`, `soLuongSP`, `moTa`, `ctSanPham`, `hinh`, `maLoai`, `baoHanh`, `maNCC`, `maNSX`, `created_at`, `updated_at`) VALUES
(1, 'Laptop MacBook Pro 14 M1 Pro 2021', 53990000, 122, '<h3><a title=\"Laptop Apple MacBook Air M1 2020 đang b&aacute;n tại thegioididong.com\" href=\"https://www.thegioididong.com/laptop/apple-macbook-air-m1-2020-z124000de\" target=\"_blank\" rel=\"noopener\">Laptop Apple Air M1 2020</a>&nbsp;c&oacute; thiết kế đẹp, sang trọng với CPU M1 độc quyền từ Apple cho hiệu năng đồ họa cao, m&agrave;n h&igrave;nh Retina hiển thị si&ecirc;u n&eacute;t c&ugrave;ng với hệ thống bảo mật tối ưu.</h3>\r\n<h3>Hiệu năng ấn tượng đến từ chip M1</h3>\r\n<p><a title=\"T&igrave;m hiểu về chip Apple M1: Con chip ARM 5nm đầu ti&ecirc;n d&agrave;nh cho m&aacute;y Mac\" href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-chip-apple-m1-con-chip-arm-5nm-dau-tien-danh-1305955\" target=\"_blank\" rel=\"noopener\">Chip M1</a>&nbsp;được Apple thiết kế d&agrave;nh ri&ecirc;ng cho&nbsp;<a title=\"Xem th&ecirc;m một số mẫu MacBook đang được b&aacute;n tại Thegioididong.com\" href=\"https://www.thegioididong.com/laptop-apple-macbook\" target=\"_blank\" rel=\"noopener\">MacBook</a>&nbsp;mang đến hiệu năng vượt trội. Thực hiện tốt c&aacute;c t&aacute;c vụ văn ph&ograve;ng tr&ecirc;n c&aacute;c phần mềm như Word, Excel, Powerpoint,... Thiết kế đồ hoạ cũng chuy&ecirc;n nghiệp kh&ocirc;ng k&eacute;m, cho ph&eacute;p bạn chỉnh sửa h&igrave;nh ảnh với dung lượng lớn, kết xuất 2D mượt m&agrave; tr&ecirc;n c&aacute;c phần mềm Photoshop, AI, Figma,...</p>\r\n<p>Card đồ họa&nbsp;<strong>GPU 7 nh&acirc;n</strong>&nbsp;đem lại hiệu suất cao đ&aacute;ng kinh ngạc, đồ họa cao hơn gấp&nbsp;<strong>5 lần</strong>, thoả sức s&aacute;ng tạo nội dung, kết xuất 3D ổn định, render video, ph&aacute;t trực tiếp với chất lượng cao với chất ảnh sắc n&eacute;t c&ugrave;ng độ ph&acirc;n giải l&ecirc;n đến&nbsp;<strong>4K</strong>.</p>\r\n<p><a title=\"Xem th&ecirc;m một số laptop RAM 16 GB đang được b&aacute;n tại Thegioididong.com\" href=\"https://www.thegioididong.com/laptop?g=16-gb\" target=\"_blank\" rel=\"noopener\">Laptop RAM 16 GB</a>&nbsp;cho ph&eacute;p bạn sử dụng đa nhiệm, bạn c&oacute; thể thao t&aacute;c nhiều ứng dụng c&ugrave;ng một l&uacute;c thoải m&aacute;i với những t&aacute;c vụ như lướt web, soạn thảo văn bản, xem video hay thiết kế h&igrave;nh ảnh bằng Photoshop, Adobe Illustrator,...</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-4-1-1.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - Cấu h&igrave;nh\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-4-1-1.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - Cấu h&igrave;nh\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-4-1-1.jpg\"></a></p>\r\n<p><strong>Ổ cứng SSD 256 GB</strong>&nbsp;gi&uacute;p m&aacute;y c&oacute; tốc độ đọc ghi nhanh ch&oacute;ng đồng thời mang lại kh&ocirc;ng gian bộ nhớ đủ lớn phục vụ cho nhu cầu lưu trữ của bạn như t&agrave;i liệu trong học tập, dữ liệu trong c&ocirc;ng việc, c&aacute;c bộ phim hoặc bản nhạc trong giải tr&iacute;. Đồng thời, tiết kiệm được thời gian khởi động m&aacute;y hoặc mở c&aacute;c ứng dụng nặng, cải thiện được thời gian mở nhanh ch&oacute;ng hơn.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-5-1.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - SSD\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-5-1.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - SSD\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-5-1.jpg\"></a></p>\r\n<h3>M&agrave;n h&igrave;nh Retina hiển thị sắc n&eacute;t, m&agrave;u sắc ch&iacute;nh x&aacute;c</h3>\r\n<p><strong>M&agrave;n h&igrave;nh 13.3 inch Retina</strong>&nbsp;cho h&igrave;nh ảnh chi tiết, sắc n&eacute;t với độ ph&acirc;n giải&nbsp;<strong>2560 &times; 1600</strong>, m&agrave;n h&igrave;nh mới n&agrave;y c&oacute; gam m&agrave;u rộng P3 v&agrave; độ phủ m&agrave;u&nbsp;<strong>125% sRGB</strong>&nbsp;cho những m&agrave;u sắc ch&acirc;n thật v&agrave; ch&iacute;nh x&aacute;c nhất. C&ugrave;ng với đ&oacute; l&agrave; độ s&aacute;ng l&ecirc;n đến&nbsp;<strong>400 nits</strong>&nbsp;đem đến khung h&igrave;nh rực rỡ, tươi s&aacute;ng, hiển thị tốt kể cả khi sử dụng ở nơi c&oacute; cường độ &aacute;nh s&aacute;ng cao.</p>\r\n<p>C&ocirc;ng nghệ&nbsp;<strong>True Tone Technology</strong>&nbsp;tr&ecirc;n&nbsp;<a title=\"Xem th&ecirc;m c&aacute;c mẫu MacBook Air hiện đang kinh doanh tại thegioididong.com\" href=\"https://www.thegioididong.com/laptop-apple-macbook-air\" target=\"_blank\" rel=\"noopener\">MacBook Air</a>&nbsp;tự điều chỉnh điểm trắng, &aacute;nh s&aacute;ng v&agrave; m&agrave;u sắc của m&agrave;n h&igrave;nh theo nhiệt độ, &aacute;nh s&aacute;ng của m&ocirc;i trường để c&oacute; trải nghiệm h&igrave;nh ảnh tự nhi&ecirc;n hơn.&nbsp;</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-7.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - H&igrave;nh ảnh\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-7.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - H&igrave;nh ảnh\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-7.jpg\"></a></p>\r\n<p>Hệ thống<strong>&nbsp;loa k&eacute;p</strong>&nbsp;cho &acirc;m thanh to r&otilde;, sống động để bạn c&oacute; trải nghiệm nghe nhạc, xem phim v&agrave; gọi điện trực tuyến thoải m&aacute;i với &acirc;m thanh chất lượng cao. Tạo cho bạn cảm gi&aacute;c đắm ch&igrave;m trong những chương tr&igrave;nh giải tr&iacute; hấp dẫn.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-8.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - &Acirc;m thanh\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-8.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - &Acirc;m thanh\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-8.jpg\"></a></p>\r\n<p><strong>FaceTime Camera&nbsp;</strong>cho h&igrave;nh ảnh r&otilde; n&eacute;t kết hợp với&nbsp;<strong>3 microphone</strong>&nbsp;thuận tiện cho nhu cầu họp hoặc học online hay hội đ&agrave;m trực tuyến, giải quyết hiệu quả c&ocirc;ng việc từ xa qua c&aacute;c phần mềm Zoom, Google Meet,...</p>\r\n<h3>Vẻ ngo&agrave;i sang trọng, đẳng cấp</h3>\r\n<p><a title=\"MacBook Air 13 inch M1 2020 16GB/256GB hiện đang kinh doanh tại Topzone.vn\" href=\"https://www.topzone.vn/mac/apple-macbook-air-m1-2020-z124000de\" target=\"_blank\" rel=\"noopener\">MacBook Air&nbsp;M1 16 GB</a>&nbsp;được bao bọc bởi lớp vỏ kim loại nguy&ecirc;n khối từ nguy&ecirc;n liệu t&aacute;i chế gi&uacute;p th&acirc;n m&aacute;y tr&ocirc;ng cứng c&aacute;p v&agrave; sang trọng, nhưng vẫn mang đến sự gọn nhẹ để thoả m&atilde;n được nhu cầu di chuyển linh hoạt của người d&ugrave;ng c&ugrave;ng độ d&agrave;y mỏng&nbsp;<strong>16.1 mm&nbsp;</strong>v&agrave; khối lượng chỉ&nbsp;<strong>1.29 kg</strong>&nbsp;thoả sức mang m&aacute;y đi khắp mọi nơi m&agrave; kh&ocirc;ng lo ngại như đi học, đi c&ocirc;ng t&aacute;c,...</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-2-1.jpg\"><img class=\" lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - Thiết kế\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-2-1.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - Thiết kế\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-2-1.jpg\"></a></p>\r\n<p>Apple sử dụng b&agrave;n ph&iacute;m&nbsp;<strong>Magic Key</strong>&nbsp;g&otilde; ph&iacute;m &ecirc;m &aacute;i, y&ecirc;n tĩnh v&agrave; &iacute;t tiếng ồn. Ngo&agrave;i ra b&agrave;n ph&iacute;m c&ograve;n trang bị đ&egrave;n nền gi&uacute;p dễ d&agrave;ng thao t&aacute;c, soạn thảo văn bản trong điều kiện thiếu s&aacute;ng.</p>\r\n<p><strong>Chip bảo mật T2</strong>&nbsp;m&atilde; h&oacute;a dữ liệu ổ cứng c&ugrave;ng gi&uacute;p mọi th&ocirc;ng tin tr&ecirc;n&nbsp;<a title=\"Xem th&ecirc;m c&aacute;c sản phẩm Macbook M1 đang kinh doanh tại thegioididong.com\" href=\"https://www.thegioididong.com/laptop-apple-m1\" target=\"_blank\" rel=\"noopener\">MacBook M1</a>&nbsp;đều được bảo mật. Mở kh&oacute;a bằng&nbsp;<strong>cảm biến v&acirc;n tay</strong>&nbsp;gi&uacute;p người d&ugrave;ng mở kh&oacute;a x&aacute;c thực hoặc đăng nhập t&agrave;i khoản nhanh ch&oacute;ng, đảm bảo th&ocirc;ng tin c&aacute; nh&acirc;n v&agrave; dữ liệu trong c&ocirc;ng việc lu&ocirc;n được bảo mật cao.&nbsp;</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-6.jpg\"><img class=\" lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - V&acirc;n tay\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-6.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - V&acirc;n tay\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-6.jpg\"></a></p>\r\n<p><a title=\"Xem th&ecirc;m một số laptop đang được b&aacute;n tại Thegioididong.com\" href=\"https://www.thegioididong.com/laptop\" target=\"_blank\" rel=\"noopener\">Laptop</a>&nbsp;trang bị 2 cổng&nbsp;<strong>Thunderbolt 3 (USB-C)</strong>&nbsp;c&oacute; băng th&ocirc;ng kết nối l&ecirc;n tới 40 Gbps cho ph&eacute;p xuất ra m&agrave;n h&igrave;nh với chất lượng h&igrave;nh ảnh cao, đồng thời hỗ trợ khả năng truyền tải dữ liệu, cải thiện được thời gian sạc nhanh hơn.</p>\r\n<p>Khả năng kết nối kh&ocirc;ng d&acirc;y tr&ecirc;n d&ograve;ng Macbook Air n&agrave;y lu&ocirc;n được đảm bảo tốt nhờ chuẩn&nbsp;<strong>Wi-Fi 6 (802.11ax)</strong>&nbsp;c&ugrave;ng<strong>&nbsp;Bluetooth 5.0</strong>. Từ đ&oacute;, n&acirc;ng cao hiệu suất c&ocirc;ng việc, n&acirc;ng cấp đường truyền lu&ocirc;n được ổn định, tr&aacute;nh xảy ra lỗi khi thao t&aacute;c.&nbsp;</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de9.jpg\"><img class=\" lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - Cổng kết nối\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de9.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - Cổng kết nối\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de9.jpg\"></a></p>\r\n<p>Laptop Apple MacBook Air M1 2020 (Z124000DE) l&agrave; chiếc&nbsp;<a title=\"Xem th&ecirc;m một số mẫu laptop Mỏng nhẹ đang được b&aacute;n tại Thegioididong.com\" href=\"https://www.thegioididong.com/laptop?g=mong-nhe-thoi-trang\" target=\"_blank\" rel=\"noopener\">laptop mỏng nhẹ</a>&nbsp;nhưng c&oacute; cấu h&igrave;nh mạnh mẽ, nhiều t&iacute;nh năng hiện đại đ&aacute;ng để sở hữu trong ph&acirc;n kh&uacute;c, th&iacute;ch hợp cho c&aacute;c t&aacute;c vụ văn ph&ograve;ng thường ng&agrave;y v&agrave; thiết kế đồ hoạ.</p>', '<p>CPU: Apple M1 8-core</p>\r\n<p>Ram: 16Gb</p>\r\n<p>GPU: Card rời - NVIDIA GeForce GTX 1650 4 GB</p>\r\n<p>M&agrave;n h&igrave;nh: 15.6 inch</p>\r\n<p>Bộ nhớ: 512 GB SSD&nbsp;</p>\r\n<p>Khối lượng: &nbsp;2.3 kg</p>', '1668761035_apple-macbook-pro-14-m1-pro-2021-600x600.jpg', 1, 12, 1, 1, '2022-11-18 08:43:55', '2022-11-18 12:37:10'),
(2, 'MacBook Pro 16 inch M1 Pro 2021', 57490000, 123, '<h3><a title=\"Laptop Apple MacBook Air M1 2020 đang b&aacute;n tại thegioididong.com\" href=\"https://www.thegioididong.com/laptop/apple-macbook-air-m1-2020-z124000de\" target=\"_blank\" rel=\"noopener\">Laptop Apple Air M1 2020</a>&nbsp;c&oacute; thiết kế đẹp, sang trọng với CPU M1 độc quyền từ Apple cho hiệu năng đồ họa cao, m&agrave;n h&igrave;nh Retina hiển thị si&ecirc;u n&eacute;t c&ugrave;ng với hệ thống bảo mật tối ưu.</h3>\r\n<h3>Hiệu năng ấn tượng đến từ chip M1</h3>\r\n<p><a title=\"T&igrave;m hiểu về chip Apple M1: Con chip ARM 5nm đầu ti&ecirc;n d&agrave;nh cho m&aacute;y Mac\" href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-chip-apple-m1-con-chip-arm-5nm-dau-tien-danh-1305955\" target=\"_blank\" rel=\"noopener\">Chip M1</a>&nbsp;được Apple thiết kế d&agrave;nh ri&ecirc;ng cho&nbsp;<a title=\"Xem th&ecirc;m một số mẫu MacBook đang được b&aacute;n tại Thegioididong.com\" href=\"https://www.thegioididong.com/laptop-apple-macbook\" target=\"_blank\" rel=\"noopener\">MacBook</a>&nbsp;mang đến hiệu năng vượt trội. Thực hiện tốt c&aacute;c t&aacute;c vụ văn ph&ograve;ng tr&ecirc;n c&aacute;c phần mềm như Word, Excel, Powerpoint,... Thiết kế đồ hoạ cũng chuy&ecirc;n nghiệp kh&ocirc;ng k&eacute;m, cho ph&eacute;p bạn chỉnh sửa h&igrave;nh ảnh với dung lượng lớn, kết xuất 2D mượt m&agrave; tr&ecirc;n c&aacute;c phần mềm Photoshop, AI, Figma,...</p>\r\n<p>Card đồ họa&nbsp;<strong>GPU 7 nh&acirc;n</strong>&nbsp;đem lại hiệu suất cao đ&aacute;ng kinh ngạc, đồ họa cao hơn gấp&nbsp;<strong>5 lần</strong>, thoả sức s&aacute;ng tạo nội dung, kết xuất 3D ổn định, render video, ph&aacute;t trực tiếp với chất lượng cao với chất ảnh sắc n&eacute;t c&ugrave;ng độ ph&acirc;n giải l&ecirc;n đến&nbsp;<strong>4K</strong>.</p>\r\n<p><a title=\"Xem th&ecirc;m một số laptop RAM 16 GB đang được b&aacute;n tại Thegioididong.com\" href=\"https://www.thegioididong.com/laptop?g=16-gb\" target=\"_blank\" rel=\"noopener\">Laptop RAM 16 GB</a>&nbsp;cho ph&eacute;p bạn sử dụng đa nhiệm, bạn c&oacute; thể thao t&aacute;c nhiều ứng dụng c&ugrave;ng một l&uacute;c thoải m&aacute;i với những t&aacute;c vụ như lướt web, soạn thảo văn bản, xem video hay thiết kế h&igrave;nh ảnh bằng Photoshop, Adobe Illustrator,...</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-4-1-1.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - Cấu h&igrave;nh\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-4-1-1.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - Cấu h&igrave;nh\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-4-1-1.jpg\"></a></p>\r\n<p><strong>Ổ cứng SSD 256 GB</strong>&nbsp;gi&uacute;p m&aacute;y c&oacute; tốc độ đọc ghi nhanh ch&oacute;ng đồng thời mang lại kh&ocirc;ng gian bộ nhớ đủ lớn phục vụ cho nhu cầu lưu trữ của bạn như t&agrave;i liệu trong học tập, dữ liệu trong c&ocirc;ng việc, c&aacute;c bộ phim hoặc bản nhạc trong giải tr&iacute;. Đồng thời, tiết kiệm được thời gian khởi động m&aacute;y hoặc mở c&aacute;c ứng dụng nặng, cải thiện được thời gian mở nhanh ch&oacute;ng hơn.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-5-1.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - SSD\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-5-1.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - SSD\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-5-1.jpg\"></a></p>\r\n<h3>M&agrave;n h&igrave;nh Retina hiển thị sắc n&eacute;t, m&agrave;u sắc ch&iacute;nh x&aacute;c</h3>\r\n<p><strong>M&agrave;n h&igrave;nh 13.3 inch Retina</strong>&nbsp;cho h&igrave;nh ảnh chi tiết, sắc n&eacute;t với độ ph&acirc;n giải&nbsp;<strong>2560 &times; 1600</strong>, m&agrave;n h&igrave;nh mới n&agrave;y c&oacute; gam m&agrave;u rộng P3 v&agrave; độ phủ m&agrave;u&nbsp;<strong>125% sRGB</strong>&nbsp;cho những m&agrave;u sắc ch&acirc;n thật v&agrave; ch&iacute;nh x&aacute;c nhất. C&ugrave;ng với đ&oacute; l&agrave; độ s&aacute;ng l&ecirc;n đến&nbsp;<strong>400 nits</strong>&nbsp;đem đến khung h&igrave;nh rực rỡ, tươi s&aacute;ng, hiển thị tốt kể cả khi sử dụng ở nơi c&oacute; cường độ &aacute;nh s&aacute;ng cao.</p>\r\n<p>C&ocirc;ng nghệ&nbsp;<strong>True Tone Technology</strong>&nbsp;tr&ecirc;n&nbsp;<a title=\"Xem th&ecirc;m c&aacute;c mẫu MacBook Air hiện đang kinh doanh tại thegioididong.com\" href=\"https://www.thegioididong.com/laptop-apple-macbook-air\" target=\"_blank\" rel=\"noopener\">MacBook Air</a>&nbsp;tự điều chỉnh điểm trắng, &aacute;nh s&aacute;ng v&agrave; m&agrave;u sắc của m&agrave;n h&igrave;nh theo nhiệt độ, &aacute;nh s&aacute;ng của m&ocirc;i trường để c&oacute; trải nghiệm h&igrave;nh ảnh tự nhi&ecirc;n hơn.&nbsp;</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-7.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - H&igrave;nh ảnh\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-7.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - H&igrave;nh ảnh\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-7.jpg\"></a></p>\r\n<p>Hệ thống<strong>&nbsp;loa k&eacute;p</strong>&nbsp;cho &acirc;m thanh to r&otilde;, sống động để bạn c&oacute; trải nghiệm nghe nhạc, xem phim v&agrave; gọi điện trực tuyến thoải m&aacute;i với &acirc;m thanh chất lượng cao. Tạo cho bạn cảm gi&aacute;c đắm ch&igrave;m trong những chương tr&igrave;nh giải tr&iacute; hấp dẫn.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-8.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - &Acirc;m thanh\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-8.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - &Acirc;m thanh\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-8.jpg\"></a></p>\r\n<p><strong>FaceTime Camera&nbsp;</strong>cho h&igrave;nh ảnh r&otilde; n&eacute;t kết hợp với&nbsp;<strong>3 microphone</strong>&nbsp;thuận tiện cho nhu cầu họp hoặc học online hay hội đ&agrave;m trực tuyến, giải quyết hiệu quả c&ocirc;ng việc từ xa qua c&aacute;c phần mềm Zoom, Google Meet,...</p>\r\n<h3>Vẻ ngo&agrave;i sang trọng, đẳng cấp</h3>\r\n<p><a title=\"MacBook Air 13 inch M1 2020 16GB/256GB hiện đang kinh doanh tại Topzone.vn\" href=\"https://www.topzone.vn/mac/apple-macbook-air-m1-2020-z124000de\" target=\"_blank\" rel=\"noopener\">MacBook Air&nbsp;M1 16 GB</a>&nbsp;được bao bọc bởi lớp vỏ kim loại nguy&ecirc;n khối từ nguy&ecirc;n liệu t&aacute;i chế gi&uacute;p th&acirc;n m&aacute;y tr&ocirc;ng cứng c&aacute;p v&agrave; sang trọng, nhưng vẫn mang đến sự gọn nhẹ để thoả m&atilde;n được nhu cầu di chuyển linh hoạt của người d&ugrave;ng c&ugrave;ng độ d&agrave;y mỏng&nbsp;<strong>16.1 mm&nbsp;</strong>v&agrave; khối lượng chỉ&nbsp;<strong>1.29 kg</strong>&nbsp;thoả sức mang m&aacute;y đi khắp mọi nơi m&agrave; kh&ocirc;ng lo ngại như đi học, đi c&ocirc;ng t&aacute;c,...</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-2-1.jpg\"><img class=\" lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - Thiết kế\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-2-1.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - Thiết kế\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-2-1.jpg\"></a></p>\r\n<p>Apple sử dụng b&agrave;n ph&iacute;m&nbsp;<strong>Magic Key</strong>&nbsp;g&otilde; ph&iacute;m &ecirc;m &aacute;i, y&ecirc;n tĩnh v&agrave; &iacute;t tiếng ồn. Ngo&agrave;i ra b&agrave;n ph&iacute;m c&ograve;n trang bị đ&egrave;n nền gi&uacute;p dễ d&agrave;ng thao t&aacute;c, soạn thảo văn bản trong điều kiện thiếu s&aacute;ng.</p>\r\n<p><strong>Chip bảo mật T2</strong>&nbsp;m&atilde; h&oacute;a dữ liệu ổ cứng c&ugrave;ng gi&uacute;p mọi th&ocirc;ng tin tr&ecirc;n&nbsp;<a title=\"Xem th&ecirc;m c&aacute;c sản phẩm Macbook M1 đang kinh doanh tại thegioididong.com\" href=\"https://www.thegioididong.com/laptop-apple-m1\" target=\"_blank\" rel=\"noopener\">MacBook M1</a>&nbsp;đều được bảo mật. Mở kh&oacute;a bằng&nbsp;<strong>cảm biến v&acirc;n tay</strong>&nbsp;gi&uacute;p người d&ugrave;ng mở kh&oacute;a x&aacute;c thực hoặc đăng nhập t&agrave;i khoản nhanh ch&oacute;ng, đảm bảo th&ocirc;ng tin c&aacute; nh&acirc;n v&agrave; dữ liệu trong c&ocirc;ng việc lu&ocirc;n được bảo mật cao.&nbsp;</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-6.jpg\"><img class=\" lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - V&acirc;n tay\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-6.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - V&acirc;n tay\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-6.jpg\"></a></p>\r\n<p><a title=\"Xem th&ecirc;m một số laptop đang được b&aacute;n tại Thegioididong.com\" href=\"https://www.thegioididong.com/laptop\" target=\"_blank\" rel=\"noopener\">Laptop</a>&nbsp;trang bị 2 cổng&nbsp;<strong>Thunderbolt 3 (USB-C)</strong>&nbsp;c&oacute; băng th&ocirc;ng kết nối l&ecirc;n tới 40 Gbps cho ph&eacute;p xuất ra m&agrave;n h&igrave;nh với chất lượng h&igrave;nh ảnh cao, đồng thời hỗ trợ khả năng truyền tải dữ liệu, cải thiện được thời gian sạc nhanh hơn.</p>\r\n<p>Khả năng kết nối kh&ocirc;ng d&acirc;y tr&ecirc;n d&ograve;ng Macbook Air n&agrave;y lu&ocirc;n được đảm bảo tốt nhờ chuẩn&nbsp;<strong>Wi-Fi 6 (802.11ax)</strong>&nbsp;c&ugrave;ng<strong>&nbsp;Bluetooth 5.0</strong>. Từ đ&oacute;, n&acirc;ng cao hiệu suất c&ocirc;ng việc, n&acirc;ng cấp đường truyền lu&ocirc;n được ổn định, tr&aacute;nh xảy ra lỗi khi thao t&aacute;c.&nbsp;</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de9.jpg\"><img class=\" lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - Cổng kết nối\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de9.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - Cổng kết nối\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de9.jpg\"></a></p>\r\n<p>Laptop Apple MacBook Air M1 2020 (Z124000DE) l&agrave; chiếc&nbsp;<a title=\"Xem th&ecirc;m một số mẫu laptop Mỏng nhẹ đang được b&aacute;n tại Thegioididong.com\" href=\"https://www.thegioididong.com/laptop?g=mong-nhe-thoi-trang\" target=\"_blank\" rel=\"noopener\">laptop mỏng nhẹ</a>&nbsp;nhưng c&oacute; cấu h&igrave;nh mạnh mẽ, nhiều t&iacute;nh năng hiện đại đ&aacute;ng để sở hữu trong ph&acirc;n kh&uacute;c, th&iacute;ch hợp cho c&aacute;c t&aacute;c vụ văn ph&ograve;ng thường ng&agrave;y v&agrave; thiết kế đồ hoạ.</p>', '<p>CPU: Apple M1 8-core</p>\r\n<p>Ram: 16Gb</p>\r\n<p>GPU: Card rời - NVIDIA GeForce GTX 1650 4 GB</p>\r\n<p>M&agrave;n h&igrave;nh: 15.6 inch</p>\r\n<p>Bộ nhớ: 512 GB SSD&nbsp;</p>\r\n<p>Khối lượng: &nbsp;2.3 kg</p>', '1668761070_apple-macbook-pro-16-m1-max-2021-600x600.jpg', 1, 12, 1, 1, '2022-11-18 08:44:30', '2022-11-18 12:37:54'),
(3, 'MacBook Pro M2 2022 10-core GPU', 38490000, 123, '<h3><a title=\"iMac 24 inch 2021 4.5K Retina M1 đang b&aacute;n tại thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban/imac-24-inch-45k-retina-m1-mgpl3saa\">iMac 24 inch 2021 4.5K Retina M1 8-core</a>&nbsp;được cải tiến thiết kế mới mẻ, trẻ trung n&acirc;ng tầm mọi kh&ocirc;ng gian c&ugrave;ng với hiệu năng vượt trội từ bộ vi xử l&yacute; (CPU) M1 8-core v&agrave; m&agrave;n h&igrave;nh Retina 4.5K hiển thị ảnh tươi mới, rực rỡ.</h3>\r\n<h3>Tạo cảm hứng cho kh&ocirc;ng gian l&agrave;m việc năng động</h3>\r\n<p><a title=\"C&aacute;c sản phẩm imac hiện đang b&aacute;n tại thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban-apple-imac\" target=\"_blank\" rel=\"noopener\">iMac</a>&nbsp;c&oacute; thiết kế tối giản v&agrave; nhỏ gọn hơn, bắt mắt ở mọi g&oacute;c độ. M&agrave;n h&igrave;nh chỉ mỏng&nbsp;<strong>11.5 mm</strong>, to&agrave;n bộ m&aacute;y c&oacute; trọng lượng<strong>&nbsp;4.48 kg</strong>&nbsp;với ch&acirc;n đế&nbsp;<strong>147 mm</strong>&nbsp;gi&uacute;p tối ưu h&oacute;a kh&ocirc;ng gian học tập v&agrave; giải tr&iacute;.&nbsp;Vỏ m&aacute;y được l&agrave;m từ chất liệu nh&ocirc;m t&aacute;i chế&nbsp;<strong>100%</strong>&nbsp;bền bỉ v&agrave; c&oacute; m&agrave;u t&ocirc;ng xanh dương đậm - nhạt phối một c&aacute;ch tinh tế l&agrave;m nổi bật hơn g&oacute;c l&agrave;m việc đầy cảm hứng.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-2-5.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Thiết kế\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-2-5.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Thiết kế\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-2-5.jpg\"></a></p>\r\n<p>Đi k&egrave;m với chiếc&nbsp;<a title=\"Xem th&ecirc;m c&aacute;c mẫu m&aacute;y t&iacute;nh để b&agrave;n đang b&aacute;n tại thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban\" target=\"_blank\" rel=\"noopener\">m&aacute;y t&iacute;nh để b&agrave;n</a>&nbsp;l&agrave; chuột v&agrave; b&agrave;n ph&iacute;m c&ugrave;ng t&ocirc;ng m&agrave;u tạo điểm nhấn cho m&aacute;y. Đặc biệt, b&agrave;n ph&iacute;m nay đ&atilde; c&oacute; t&iacute;ch hợp&nbsp;<strong>Touch ID</strong>&nbsp;mở kh&oacute;a nhanh ch&oacute;ng, thanh to&aacute;n trực tuyến an to&agrave;n bảo mật chỉ với 1 chạm.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-6.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Touch ID\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-6.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Touch ID\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-6.jpg\"></a></p>\r\n<p>Ngo&agrave;i ra,&nbsp;<a title=\"M&aacute;y t&iacute;nh để b&agrave;n văn ph&ograve;ng, sinh vi&ecirc;n ch&iacute;nh h&atilde;ng, trả g&oacute;p 0% đang kinh doanh ch&iacute;nh h&atilde;ng tại Thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban-hoc-tap-van-phong\" target=\"_blank\" rel=\"noopener\">m&aacute;y t&iacute;nh để b&agrave;n học tập - văn ph&ograve;ng</a>&nbsp;n&agrave;y c&ograve;n được trang bị đầy đủ c&aacute;c cổng kết nối đa dạng như cổng Thunderbolt, cổng USB 3 v&agrave; Jack tai nghe 3.5 mm hỗ trợ kết nối dễ d&agrave;ng v&agrave; nhanh ch&oacute;ng. C&ugrave;ng kết nối kh&ocirc;ng d&acirc;y&nbsp;<strong>Wi-Fi 6 AX201</strong>,&nbsp;<strong>Bluetooth 5.0&nbsp;</strong>cho đường truyền mạng ổn định, kh&ocirc;ng lo bị ngắt t&iacute;nh hiệu.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-11.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Cổng kết nối\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-11.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Cổng kết nối\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-11.jpg\"></a></p>\r\n<h3><a title=\"T&igrave;m hiểu th&ecirc;m về chip M1\" href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-chip-apple-m1-con-chip-arm-5nm-dau-tien-danh-1305955\" target=\"_blank\" rel=\"noopener\">Chip Apple M1</a>&nbsp;mạnh mẽ, đa nhiệm mượt m&agrave; c&aacute;c t&aacute;c vụ chuy&ecirc;n nghiệp</h3>\r\n<p>M&aacute;y chạy bằng hệ điều h&agrave;nh&nbsp;<strong>Mac OS Big Sur</strong>&nbsp;c&ugrave;ng với sức mạnh từ con chip<strong>&nbsp;Apple M1 8-core</strong>&nbsp;mang đến hiệu năng v&ocirc; c&ugrave;ng mạnh mẽ nhanh hơn đến&nbsp;<strong>85%</strong>&nbsp;v&agrave; hiệu suất đồ họa hơn&nbsp;<strong>2 lần</strong>&nbsp;so với c&aacute;c mẫu iMac 21.5 trước đ&acirc;y.</p>\r\n<p><a title=\"Xem th&ecirc;m c&aacute;c sản phẩm iMac đang kinh doanh tại TopZone - thương hiệu của Thế Giới Di Động\" href=\"https://www.topzone.vn/imac\" target=\"_blank\" rel=\"noopener\">iMac</a>&nbsp;c&ograve;n được trang bị&nbsp;<strong>card đồ họa t&iacute;ch hợp 8 nh&acirc;n GPU</strong>&nbsp;cho khả năng hiển thị sắc n&eacute;t, chạy mượt m&agrave; c&aacute;c phần mềm thiết kế, lập tr&igrave;nh như Photoshop, Final Cut, iMovie, Xcode,...&nbsp;<a title=\"M&aacute;y t&iacute;nh để b&agrave;n chip Apple M1 ch&iacute;nh h&atilde;ng đang kinh doanh tại Thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban-apple-m1\" target=\"_blank\" rel=\"noopener\">M&aacute;y t&iacute;nh để b&agrave;n Apple M1</a>&nbsp;c&oacute; RAM 8 GB cho khả năng đọc ghi dữ liệu tốt, đa nhiệm mượt nhiều t&aacute;c vụ văn ph&ograve;ng chuy&ecirc;n nghiệp c&ugrave;ng l&uacute;c với c&aacute;c ứng dụng giải tr&iacute;.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-4-1.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Cấu h&igrave;nh\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-4-1.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Cấu h&igrave;nh\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-4-1.jpg\"></a></p>\r\n<p><strong>Ổ cứng SSD 512 GB&nbsp;</strong>tr&ecirc;n chiếc<strong>&nbsp;</strong><a title=\"M&aacute;y t&iacute;nh để b&agrave;n đồ họa, kỹ thuật ch&iacute;nh h&atilde;ng đang kinh doanh tại Thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban-do-hoa-ky-thuat\" target=\"_blank\" rel=\"noopener\">m&aacute;y t&iacute;nh để b&agrave;n đồ hoạ - kỹ thuật</a>&nbsp;n&agrave;y&nbsp;mang lại kh&ocirc;ng gian lưu trữ đủ d&ugrave;ng, tốc độ khởi động m&aacute;y v&agrave; truy xuất dữ liệu nhanh ch&oacute;ng đ&aacute;p ứng tốt cho nhu cầu c&ocirc;ng việc.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-5.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - SSD\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-5.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - SSD\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-5.jpg\"></a></p>\r\n<h3>Đắm ch&igrave;m trong m&agrave;n ảnh&nbsp;<strong>4.5K</strong>&nbsp;hiển thị sắc n&eacute;t, ch&acirc;n thật nhất</h3>\r\n<p><a title=\"Xem th&ecirc;m m&aacute;y t&iacute;nh để b&agrave;n m&agrave;n h&igrave;nh 24 inch tại Thế giới di động\" href=\"https://www.thegioididong.com/may-tinh-de-ban-24-inch\" target=\"_blank\" rel=\"noopener\">M&agrave;n h&igrave;nh 24 inch</a><strong>&nbsp;</strong><a title=\"T&igrave;m hiểu th&ecirc;m về m&agrave;n h&igrave;nh Retina\" href=\"https://www.thegioididong.com/hoi-dap/man-hinh-retina-la-gi-905780\" target=\"_blank\" rel=\"noopener\">Retina</a>&nbsp;chất lượng cao với khả năng hỗ trợ dải m&agrave;u&nbsp;<strong>DCI-P3</strong>&nbsp;hơn&nbsp;<strong>1 tỷ</strong>&nbsp;m&agrave;u sắc kh&aacute;c nhau tr&ecirc;n&nbsp;<strong>11.3 triệu</strong>&nbsp;điểm ảnh, th&ecirc;m điểm cộng l&agrave; độ s&aacute;ng&nbsp;<strong>500 nits</strong>&nbsp;mang lại trải nghiệm h&igrave;nh ảnh rực rỡ v&agrave; sống động qua từng khung h&igrave;nh phim ảnh.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-7.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - H&igrave;nh ảnh\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-7.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - H&igrave;nh ảnh\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-7.jpg\"></a></p>\r\n<p>C&ocirc;ng nghệ&nbsp;<a title=\"T&igrave;m hiểu th&ecirc;m về c&ocirc;ng nghệ True Tone\" href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-cong-nghe-man-hinh-true-tone-992705\" target=\"_blank\" rel=\"noopener\">True Tone</a><strong>&nbsp;</strong>tự động điều chỉnh nhiệt độ m&agrave;u sắc của m&agrave;n h&igrave;nh gi&uacute;p m&agrave;u sắc lu&ocirc;n được nhất qu&aacute;n ph&ugrave; hợp điều kiện m&ocirc;i trường thay đổi. M&agrave;n h&igrave;nh c&ograve;n được phủ lớp chống phản chiếu ho&agrave;n hảo, bạn c&oacute; thể thoải m&aacute;i l&agrave;m việc hay giải tr&iacute; dưới &aacute;nh s&aacute;ng gắt.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-08.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Độ s&aacute;ng\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-08.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Độ s&aacute;ng\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-08.jpg\"></a></p>\r\n<h3>Dễ d&agrave;ng học tập, l&agrave;m việc từ xa qua webcam chất lượng cao</h3>\r\n<p><strong>Camera FaceTime 1080p</strong>&nbsp;lần đầu ti&ecirc;n xuất hiện tr&ecirc;n m&aacute;y Mac với khả năng giảm nhiễu tốt hơn, dải động lớn hơn, c&acirc;n bằng trắng tự động v&agrave;&nbsp;<strong>3 micro</strong>&nbsp;chất lượng ph&ograve;ng thu gi&uacute;p thu giọng n&oacute;i r&otilde; r&agrave;ng hơn, loại bỏ tiếng ồn tối ưu hỗ trợ tốt cho c&aacute;c cuộc gọi video gia đ&igrave;nh hay họp với đối t&aacute;c từ xa.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-10.jpg\"><img class=\" lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Webcam\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-10.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Webcam\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-10.jpg\"></a></p>\r\n<p><strong>C&ocirc;ng nghệ &acirc;m thanh</strong><a title=\"T&igrave;m hiểu th&ecirc;m về c&ocirc;ng nghệ Dolby Atmos\" href=\"https://www.thegioididong.com/hoi-dap/cong-nghe-am-thanh-dolby-altmos-la-gi-co-nhung-gi-noi-bat-1280672\" target=\"_blank\" rel=\"noopener\">&nbsp;Dolby Atmos</a><strong>&nbsp;</strong>tr&ecirc;n nền tảng 6 loa bao gồm&nbsp;<strong>4 loa trầm</strong>&nbsp;s&acirc;u v&agrave;&nbsp;<strong>2 loa tweeter</strong>&nbsp;hiệu suất cao nằm ở cạnh dưới t&aacute;i hiện &acirc;m thanh s&acirc;n khấu sống động ngập tr&agrave;n khắp căn ph&ograve;ng.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-9.jpg\"><img class=\" lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - &Acirc;m thanh\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-9.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - &Acirc;m thanh\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238056/imac-24-inch-45k-retina-m1-mgpl3saa-9.jpg\"></a></p>\r\n<p>iMac 24 inch 2021 4.5K Retina M1 l&agrave; một trong những chiếc&nbsp;<a title=\"C&aacute;c sản phẩm m&aacute;y t&iacute;nh để b&agrave;n Apple hiện đang b&aacute;n tại thegioididong.com\" href=\"https://https//www.thegioididong.com/may-tinh-de-ban-apple\" target=\"_blank\" rel=\"noopener\">m&aacute;y t&iacute;nh để b&agrave;n&nbsp;Apple&nbsp;</a>đạt y&ecirc;u cầu cả về t&iacute;nh thẩm mỹ v&agrave; cấu h&igrave;nh hiện đại, ti&ecirc;n tiến bật nhất thế giới phục vụ tốt cho như cầu học tập, l&agrave;m việc cũng như giải tr&iacute; một c&aacute;ch gần như ho&agrave;n hảo.</p>', '<p>CPU: Apple M1 8-core</p>\r\n<p>Ram: 16Gb</p>\r\n<p>GPU: Card rời - NVIDIA GeForce GTX 1650 4 GB</p>\r\n<p>M&agrave;n h&igrave;nh: 15.6 inch</p>\r\n<p>Bộ nhớ: 512 GB SSD&nbsp;</p>\r\n<p>Khối lượng: &nbsp;2.3 kg</p>', '1668761117_macbook-air-m1-2020-silver-600x600.jpg', 1, 12, 1, 1, '2022-11-18 08:45:17', '2022-11-18 12:38:26'),
(11, 'Asus TUF Gaming FX506LHB i5 10300H (HN188W)', 18990000, 123, '<p>Nếu bạn đang t&igrave;m kiếm một chiếc laptop gaming nhưng vẫn sở hữu một mức gi&aacute; phải chăng th&igrave; laptop Asus TUF Gaming FX506LHB i5 (HN188W) sẽ l&agrave; sự lựa chọn đ&aacute;ng c&acirc;n nhắc với card đồ họa rời NVIDIA GeForce GTX mạnh mẽ c&ugrave;ng phong c&aacute;ch thiết kế cứng c&aacute;p, độc đ&aacute;o.&nbsp;<br>&bull; Chạy mượt m&agrave; c&aacute;c ứng dụng văn ph&ograve;ng tr&ecirc;n Word, Excel, PowerPoint,... đến chiến những con game đ&igrave;nh đ&aacute;m nhờ bộ vi xử l&yacute; Intel Core i5 10300H kết hợp với card đồ họa rời NVIDIA GeForce GTX 1650 4 GB mạnh mẽ.&nbsp;</p>\r\n<p>&bull; Laptop Asus đa nhiệm mượt m&agrave; tr&ecirc;n nhiều cửa sổ Chrome c&ugrave;ng l&uacute;c nhờ bộ nhớ RAM 8 GB, b&ecirc;n cạnh đ&oacute; c&ograve;n mang đến tốc độ khởi động m&aacute;y v&agrave; ứng dụng nhanh ch&oacute;ng với ổ cứng SSD 512 GB. &nbsp;&nbsp;</p>\r\n<p>&bull; Laptop c&oacute; k&iacute;ch thước m&agrave;n h&igrave;nh 15.6 inch c&ugrave;ng tần số qu&eacute;t 144 Hz mang đến những trải nghiệm chiến game cực đỉnh, kh&ocirc;ng bị giật lag hay x&eacute; h&igrave;nh khi chơi những tựa game c&oacute; tốc độ cao.</p>\r\n<p>&bull; Laptop Asus TUF Gaming được bao bọc bởi lớp vỏ nhựa m&agrave;u đen huyền b&iacute;, khối lượng 2.3 kg cho ph&eacute;p bạn chiến game ở mọi kh&ocirc;ng gian.</p>\r\n<p>&bull; M&aacute;y được trang bị đ&egrave;n b&agrave;n ph&iacute;m chuyển m&agrave;u RGB độc đ&aacute;o, tăng độ hăng h&aacute;i cho game thủ mỗi khi chiến game.</p>', '<p>CPU: Intel Core i5 Alder Lake - 12450H</p>\r\n<p>Ram: 16Gb</p>\r\n<p>GPU: Card rời - NVIDIA GeForce GTX 1650 4 GB</p>\r\n<p>M&agrave;n h&igrave;nh: 15.6 inch</p>\r\n<p>Bộ nhớ: 512 GB SSD&nbsp;</p>\r\n<p>Pin: 58.75 Wh</p>\r\n<p>Khối lượng: &nbsp;2.3 kg</p>', '1668766722_asus-tuf-gaming-fx506lhb-i5-hn188w-600x600.jpeg', 1, 12, 2, 2, '2022-11-18 10:18:42', '2022-11-18 12:39:26'),
(12, 'Laptop Asus VivoBook 15X', 19690000, 123, '<p>Nếu bạn đang t&igrave;m kiếm một chiếc laptop gaming nhưng vẫn sở hữu một mức gi&aacute; phải chăng th&igrave; laptop Asus TUF Gaming FX506LHB i5 (HN188W) sẽ l&agrave; sự lựa chọn đ&aacute;ng c&acirc;n nhắc với card đồ họa rời NVIDIA GeForce GTX mạnh mẽ c&ugrave;ng phong c&aacute;ch thiết kế cứng c&aacute;p, độc đ&aacute;o.&nbsp;<br>&bull; Chạy mượt m&agrave; c&aacute;c ứng dụng văn ph&ograve;ng tr&ecirc;n Word, Excel, PowerPoint,... đến chiến những con game đ&igrave;nh đ&aacute;m nhờ bộ vi xử l&yacute; Intel Core i5 10300H kết hợp với card đồ họa rời NVIDIA GeForce GTX 1650 4 GB mạnh mẽ.&nbsp;</p>\r\n<p>&bull; Laptop Asus đa nhiệm mượt m&agrave; tr&ecirc;n nhiều cửa sổ Chrome c&ugrave;ng l&uacute;c nhờ bộ nhớ RAM 8 GB, b&ecirc;n cạnh đ&oacute; c&ograve;n mang đến tốc độ khởi động m&aacute;y v&agrave; ứng dụng nhanh ch&oacute;ng với ổ cứng SSD 512 GB. &nbsp;&nbsp;</p>\r\n<p>&bull; Laptop c&oacute; k&iacute;ch thước m&agrave;n h&igrave;nh 15.6 inch c&ugrave;ng tần số qu&eacute;t 144 Hz mang đến những trải nghiệm chiến game cực đỉnh, kh&ocirc;ng bị giật lag hay x&eacute; h&igrave;nh khi chơi những tựa game c&oacute; tốc độ cao.</p>\r\n<p>&bull; Laptop Asus TUF Gaming được bao bọc bởi lớp vỏ nhựa m&agrave;u đen huyền b&iacute;, khối lượng 2.3 kg cho ph&eacute;p bạn chiến game ở mọi kh&ocirc;ng gian.</p>\r\n<p>&bull; M&aacute;y được trang bị đ&egrave;n b&agrave;n ph&iacute;m chuyển m&agrave;u RGB độc đ&aacute;o, tăng độ hăng h&aacute;i cho game thủ mỗi khi chiến game.</p>', '<p>CPU: Intel Core i5 Alder Lake - 12450H</p>\r\n<p>Ram: 16Gb</p>\r\n<p>GPU: Card rời - NVIDIA GeForce GTX 1650 4 GB</p>\r\n<p>M&agrave;n h&igrave;nh: 15.6 inch</p>\r\n<p>Bộ nhớ: 512 GB SSD&nbsp;</p>\r\n<p>Pin: 58.75 Wh</p>\r\n<p>Khối lượng: &nbsp;2.3 kg</p>', '1668766974_asus-tuf-gaming-fx506lhb-i5-hn188w-600x600.jpeg', 1, 12, 2, 2, '2022-11-18 10:22:54', '2022-11-18 12:39:58'),
(13, 'PC Gaming Asus ROG Strix G35DX-VN003W R7', 44990000, 123, '<p>PC Gaming Asus ROG Strix G35DX-VN003W R7 chinh phục mọi game thủ chuy&ecirc;n nghiệp hay người d&ugrave;ng s&aacute;ng tạo với cấu h&igrave;nh mạnh mẽ từ chip Intel Gen 12, card rời GeForce RTX 3070 8 GB c&ugrave;ng một ngoại h&igrave;nh ki&ecirc;u kỳ chuẩn phong th&aacute;i gaming.<br>&bull; Sẵn s&agrave;ng đương đầu mọi thử th&aacute;ch kh&oacute; nhằn từ chiến c&aacute;c tựa game đ&igrave;nh đ&aacute;m như LOL, GTA V, Tomb of Raider, DOTA 2,... đến chỉnh sửa, thiết kế chuy&ecirc;n nghiệp tr&ecirc;n c&aacute;c ứng dụng đồ họa AutoCAD, Premiere, Illustrator,... nhờ sức mạnh b&ugrave;ng nổ của chip AMD Ryzen 7 5800X kết hợp c&ugrave;ng card rời NVIDIA GeForce RTX 3070 8 GB, đảm bảo sự h&agrave;i l&ograve;ng cho người ti&ecirc;u d&ugrave;ng.</p>\r\n<p>&bull; Những họa tiết vắt ch&eacute;o ở mặt trước th&ugrave;ng m&aacute;y được lấy cảm hứng từ l&agrave;n gi&oacute; gi&uacute;p luồng kh&iacute; b&ecirc;n trong m&aacute;y được hoạt động hiệu quả hơn đ&aacute;ng kể, đặc biệt lu&ocirc;n giữ cho tiếng ồn của m&aacute;y dưới 40 dB cho bạn thưởng thức trọn vẹn &acirc;m thanh khi chiến game hay xem phim ảnh cũng như hạn chế tối đa việc ảnh hưởng đến những người xung quanh.&nbsp;</p>\r\n<p>&bull; Một mặt b&ecirc;n của m&aacute;y t&iacute;nh để b&agrave;n Asus được trang bị mặt k&iacute;nh c&ugrave;ng dải đ&egrave;n RGB cho ph&eacute;p bạn nh&igrave;n r&otilde; c&aacute;c chi tiết b&ecirc;n trong m&aacute;y một c&aacute;ch đẹp mắt, l&ocirc;i cuốn. Quai cầm được t&iacute;ch hợp trực tiếp b&ecirc;n tr&ecirc;n vỏ m&aacute;y dễ d&agrave;ng di chuyển được ở nhiều nơi.</p>\r\n<p>&bull; Khả năng đa nhiệm cũng như kh&ocirc;ng gian lưu trữ được n&acirc;ng cấp l&ecirc;n một tầm cao mới với bộ nhớ RAM 16 GB kh&ocirc;ng giới hạn dung lượng n&acirc;ng cấp c&ugrave;ng ổ cứng SSD 1 TB, cực kỳ ph&ugrave; hợp với c&aacute;c game thủ thường xuy&ecirc;n vừa chiến game vừa tương t&aacute;c trực tiếp với mọi người tr&ecirc;n c&aacute;c nền tảng mạng x&atilde; hội kh&aacute;c nhau m&agrave; kh&ocirc;ng lo hiện tượng gi&aacute;n đoạn giữa chừng.</p>\r\n<p>&bull; Bộ tản nhiệt nước 240 m cho ph&eacute;p c&aacute;c linh kiện trong m&aacute;y được hoạt động &ecirc;m &aacute;i hơn, hỗ trợ tối đa qu&aacute; tr&igrave;nh l&agrave;m m&aacute;t cho CPU v&agrave; đảm bảo lu&ocirc;n duy tr&igrave; được xung nhịp cao nhất c&oacute; thể trong mọi t&aacute;c vụ d&ugrave; bạn ngồi h&agrave;ng giờ đồng hồ nhưng vẫn lu&ocirc;n trong trạng th&aacute;i m&aacute;t mẻ.</p>\r\n<p>&bull; PC Gaming được trang bị h&agrave;ng loạt c&aacute;c cổng kết nối được trang bị ở cả mặt trước v&agrave; mặt sau của m&aacute;y t&iacute;nh để b&agrave;n như Display port, LAN (RJ45), HDMI, USB Type-C, Đầu ra loa, Line-in, S/PIDF-Out, Mic-in, USB 3.2,...&nbsp;</p>\r\n<p>&bull; C&aacute;c c&ocirc;ng nghệ &acirc;m thanh SupremeFX S1220A CODEC, Armoury Crate, Sonic Studio mang đến chất lượng &acirc;m thanh tr&ecirc;n cả tuyệt vời, gi&uacute;p bạn h&ograve;a m&igrave;nh v&agrave;o ch&iacute;nh những nh&acirc;n vật trong game để đương đầu trong những trận chiến khốc liệt.</p>', '<p>CPU: Intel Core i5 Alder Lake - 12450H</p>\r\n<p>Ram: 16Gb</p>\r\n<p>GPU: Card rời - NVIDIA GeForce GTX 1650 4 GB</p>\r\n<p>M&agrave;n h&igrave;nh: 15.6 inch</p>\r\n<p>Bộ nhớ: 512 GB SSD&nbsp;</p>\r\n<p>Khối lượng: &nbsp;2.3 kg</p>', '1668767125_asus-rog-strix-g35dx-vn003w-thumb-600x600.jpg', 2, 12, 2, 2, '2022-11-18 10:25:25', '2022-11-18 12:40:46');
INSERT INTO `products` (`id`, `tenSP`, `gia`, `soLuongSP`, `moTa`, `ctSanPham`, `hinh`, `maLoai`, `baoHanh`, `maNCC`, `maNSX`, `created_at`, `updated_at`) VALUES
(14, 'iMac 24-inch 2021', 32400000, 123, '<h3>M&aacute;y t&iacute;nh để b&agrave;n&nbsp;<a title=\"iMac 24 inch 2021 4.5K Retina M1 8-core/256GB/8GB/7-core GPU/B&agrave;n ph&iacute;m&amp;Chuột  hiện đang b&aacute;n tại thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban/imac-24-inch-45k-retina-m1-mgtf3saa\" target=\"_blank\" rel=\"noopener\">iMac 24 inch 2021 4.5K Retina M1 (MGTF3SA/A)</a>&nbsp;của Apple ra mắt đầu qu&yacute; 2 năm 2021 g&acirc;y x&ocirc;n xao bởi diện mạo lột x&aacute;c mới mẻ, c&aacute; t&iacute;nh, đồng thời thừa hưởng sức mạnh từ chip xử l&yacute; M1 v&agrave; m&agrave;n h&igrave;nh 4.5K Retina, đ&aacute;p ứng mọi nhu cầu từ văn ph&ograve;ng đến xử l&yacute; h&igrave;nh ảnh, video chuy&ecirc;n nghiệp.</h3>\r\n<h3>Thiết kế thời thượng, thể hiện đẳng cấp</h3>\r\n<p>Với bảng m&agrave;u sắc rực rỡ đa dạng, thiết kế&nbsp;<a title=\"C&aacute;c sản phẩm imac hiện đang b&aacute;n tại thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban-apple-imac\" target=\"_blank\" rel=\"noopener\">iMac</a>&nbsp;mới hướng tới c&aacute; nh&acirc;n h&oacute;a, n&acirc;ng tầm mọi kh&ocirc;ng gian, để bạn thỏa sức thể hiện phong c&aacute;ch của bản th&acirc;n. Phi&ecirc;n bản iMac mang đến sự sang trọng, tinh tế lu&ocirc;n l&agrave; sự lựa chọn kh&ocirc;ng tồi để n&acirc;ng cấp kh&ocirc;ng gian l&agrave;m việc v&agrave; đặc biệt d&agrave;nh cho những người th&iacute;ch sự tối giản.</p>\r\n<p>Thiết kế phẳng 2 mặt, đường viền vu&ocirc;ng vức v&agrave; độ mỏng m&agrave;n h&igrave;nh đ&aacute;ng kinh ngạc&nbsp;<strong>11.5 mm</strong>, mang đến cho chiếc iMac một ngoại h&igrave;nh gọn nhẹ, tuyệt đẹp kh&ocirc;ng g&oacute;c chết.</p>\r\n<p>Apple cung cấp cho&nbsp;<a title=\"Xem th&ecirc;m c&aacute;c sản phẩm m&aacute;y t&iacute;nh để b&agrave;n đang được kinh doanh tại thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban\" target=\"_blank\" rel=\"noopener\">m&aacute;y t&iacute;nh để b&agrave;n</a>&nbsp;n&agrave;y 1 b&agrave;n ph&iacute;m v&agrave; chuột được phối m&agrave;u đồng bộ, mang lại t&iacute;nh thẩm mỹ v&agrave; chuy&ecirc;n nghiệp.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-2-1.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - Thiết kế\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-2-1.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - Thiết kế\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-2-1.jpg\"></a></p>\r\n<p>Kết nối kh&ocirc;ng d&acirc;y hiện đại gồm chuẩn&nbsp;<a title=\"Wi-Fi chuẩn 802.11ax l&agrave; g&igrave;? T&igrave;m hiểu về Wi-Fi thế hệ thứ 6\" href=\"https://www.thegioididong.com/hoi-dap/wi-fi-chuan-80211ax-la-gi-tim-hieu-ve-wi-fi-the-he-thu-6-1187524\" target=\"_blank\" rel=\"noopener\">Wi-Fi 6 AX201</a>&nbsp;cho độ trễ cực thấp cũng như tốc độ truyền tải dữ liệu nhanh hơn l&ecirc;n đến hơn&nbsp;<strong>10.000 Mbps</strong>&nbsp;v&agrave;&nbsp;<a title=\"Bluetooth 5.0 chuẩn Bluetooth d&agrave;nh cho thời đại kh&ocirc;ng d&acirc;y\" href=\"https://www.thegioididong.com/hoi-dap/bluetooth-50-chuan-bluetooth-danh-cho-thoi-dai-kho-1113891\" target=\"_blank\" rel=\"noopener\">Bluetooth v5.0</a>&nbsp;với tốc độ cao nhất đạt được l&agrave;&nbsp;<strong>50 Mbps</strong>, bạn c&oacute; thể dễ d&agrave;ng kết nối với c&aacute;c thiết bị ngoại vi nhanh ch&oacute;ng.</p>\r\n<p>Chiếc&nbsp;<a title=\"C&aacute;c sản phẩm m&aacute;y t&iacute;nh để b&agrave;n Apple hiện đang b&aacute;n tại thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban-apple\" target=\"_blank\" rel=\"noopener\">m&aacute;y t&iacute;nh để b&agrave;n Apple</a>&nbsp;n&agrave;y cũng được trang bị 2 cổng Thunderbolt tốc độ truyền dữ liệu si&ecirc;u nhanh đến&nbsp;<strong>40 Gbps</strong>, hỗ trợ xuất m&agrave;n h&igrave;nh rời l&ecirc;n đến 6K.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-10.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - Cổng kết nối\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-10.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - Cổng kết nối\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-10.jpg\"></a></p>\r\n<h3>M&agrave;n h&igrave;nh Retina đẹp h&uacute;t hồn</h3>\r\n<p><a title=\"M&aacute;y t&iacute;nh để b&agrave;n văn ph&ograve;ng, sinh vi&ecirc;n ch&iacute;nh h&atilde;ng đang kinh doanh tại Thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban-hoc-tap-van-phong\" target=\"_blank\" rel=\"noopener\">M&aacute;y t&iacute;nh để b&agrave;n học tập - văn ph&ograve;ng</a>&nbsp;n&agrave;y sở hữu m&agrave;n h&igrave;nh&nbsp;<strong>Retina&nbsp;<a title=\"Xem th&ecirc;m m&aacute;y t&iacute;nh để b&agrave;n m&agrave;n h&igrave;nh 24 inch tại Thế giới di động\" href=\"https://www.thegioididong.com/may-tinh-de-ban-24-inch\" target=\"_blank\" rel=\"noopener\">24 inch</a></strong>&nbsp;độ ph&acirc;n giải&nbsp;<strong>4.5K (4480 x 2520)</strong>&nbsp;cho mật độ điểm ảnh d&agrave;y đặc với khả năng hiển thị đến&nbsp;<strong>11.3 triệu</strong>&nbsp;điểm ảnh. Dải m&agrave;u rộng (P3) hơn&nbsp;<strong>1 tỷ</strong>&nbsp;m&agrave;u cộng với độ s&aacute;ng&nbsp;<strong>500 nits</strong>&nbsp;cho h&igrave;nh ảnh sống động v&agrave; rực rỡ hơn.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-6.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - H&igrave;nh ảnh\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-6.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - H&igrave;nh ảnh\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-6.jpg\"></a></p>\r\n<p>M&agrave;n h&igrave;nh thế hệ mới n&agrave;y cũng được trang bị&nbsp;<a title=\"C&ocirc;ng nghệ True Tone l&agrave; g&igrave;\" href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-cong-nghe-man-hinh-true-tone-992705\" target=\"_blank\" rel=\"noopener\">c&ocirc;ng nghệ True Tone</a>, tự động điều chỉnh nhiệt độ m&agrave;u khi m&ocirc;i trường thay đổi để c&oacute; trải nghiệm xem tự nhi&ecirc;n hơn.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-07.jpg\"><img class=\" lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - Độ s&aacute;ng\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-07.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - Độ s&aacute;ng\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-07.jpg\"></a></p>\r\n<p>Nhờ hệ thống &acirc;m thanh&nbsp;<strong>6 loa</strong>&nbsp;v&agrave; c&aacute;c thuật to&aacute;n n&acirc;ng cao cho ph&eacute;p chiếc&nbsp;<a title=\"M&aacute;y t&iacute;nh để b&agrave;n đồ họa, kỹ thuật ch&iacute;nh h&atilde;ng đang kinh doanh tại Thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban-do-hoa-ky-thuat\" target=\"_blank\" rel=\"noopener\">m&aacute;y t&iacute;nh để b&agrave;n đồ hoạ - kỹ thuật</a>&nbsp;n&agrave;y c&oacute; thể sử dụng trơn tru c&ocirc;ng nghệ Dolby Atmos. Trong đ&oacute;,&nbsp;<strong>2 cặp loa trầm</strong>&nbsp;triệt ti&ecirc;u lực tạo ra &acirc;m trầm s&acirc;u, d&agrave;y m&agrave; kh&ocirc;ng bị rung,&nbsp;<strong>2 loa tweeter</strong>&nbsp;hiệu suất cao, t&aacute;i tạo chất &acirc;m mạnh mẽ, trong trẻo lấp đầy mọi kh&ocirc;ng gian.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-8.jpg\"><img class=\" lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - &Acirc;m thanh\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-8.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - &Acirc;m thanh\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-8.jpg\"></a></p>\r\n<p>Khi nhu cầu họp, học trực tuyến tăng cao, Apple lần đầu trang bị Full HD webcam tr&ecirc;n m&aacute;y Mac của m&igrave;nh c&ugrave;ng với&nbsp;<strong>3 microphone</strong>&nbsp;chất lượng ph&ograve;ng thu gi&uacute;p lọc tạp &acirc;m, cho ph&eacute;p người d&ugrave;ng ghi lại những &acirc;m thanh chất lượng cao hơn.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-9.jpg\"><img class=\" lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - Webcam\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-9.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - Webcam\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-9.jpg\"></a></p>\r\n<h3>Hiệu năng cao, bền bỉ đến từ con chip ti&ecirc;n tiến M1</h3>\r\n<p><a title=\"M&aacute;y t&iacute;nh để b&agrave;n chip Apple M1 ch&iacute;nh h&atilde;ng đang kinh doanh tại Thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban-apple-m1\" target=\"_blank\" rel=\"noopener\">M&aacute;y t&iacute;nh để b&agrave;n Apple M1</a>&nbsp;<strong>8 nh&acirc;n</strong>&nbsp;trong đ&oacute; c&oacute; 4 nh&acirc;n tốc độ cao v&agrave; 4 nh&acirc;n hiệu suất thấp tiết kiệm điện cho iMac mới sức mạnh rất khủng khiếp. N&oacute; c&oacute; thể đảm nhận một khối lượng c&ocirc;ng việc phức tạp v&agrave; nặng nề như render video 4K hay thiết kế 3D một c&aacute;ch mượt m&agrave;.</p>\r\n<p>iMac 2021 được trang bị&nbsp;<a title=\"Xem th&ecirc;m m&aacute;y t&iacute;nh RAM 8 GB đang kinh doanh tại Thế giới di động\" href=\"https://www.thegioididong.com/hoi-dap/ram-lap-top-la-gi-dung-luong-bao-nhieu-la-du-1172167\" target=\"_blank\" rel=\"noopener\">RAM 8 GB</a>&nbsp;hoạt động mạnh mẽ, đảm bảo t&aacute;c vụ đa nhiệm hoạt động tr&ocirc;i chảy, kh&ocirc;ng lo ngại m&aacute;y giật, lag khi mở nhiều ứng dụng c&ugrave;ng l&uacute;c.</p>\r\n<p>M&aacute;y c&ograve;n được trang bị card đồ họa t&iacute;ch hợp&nbsp;<strong>7 nh&acirc;n</strong>&nbsp;GPU cho chất lượng h&igrave;nh ảnh hiển thị sắc n&eacute;t, bạn c&oacute; thể thoải m&aacute;i sử dụng c&aacute;c phần mềm nặng để thiết kế đồ họa như Photoshop, Final Cut, iMovie, Xcode,...&nbsp;</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-4-1.jpg\"><img class=\" lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - Cấu h&igrave;nh\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-4-1.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - Cấu h&igrave;nh\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-4-1.jpg\"></a></p>\r\n<p>Sử dụng ổ cứng&nbsp;<a title=\"Ổ cứng SSD l&agrave; g&igrave;? C&oacute; những loại n&agrave;o? Trường hợp n&agrave;o n&ecirc;n sử dụng SSD?\" href=\"https://www.thegioididong.com/hoi-dap/o-cung-ssd-la-gi-923073\" target=\"_blank\" rel=\"noopener\">SSD 256 GB</a>&nbsp;gi&uacute;p c&aacute;c&nbsp;ứng dụng khởi chạy trong nh&aacute;y mắt v&agrave; to&agrave;n bộ hệ thống hoạt động trơn tru, mượt m&agrave; v&agrave; linh hoạt.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-5.jpg\"><img class=\" lazyloaded\" title=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - SSD\" src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-5.jpg\" alt=\"iMac 24 inch 2021 4.5K M1 7GPU (MGTF3SA/A) Silver - SSD\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/238061/imac-24-inch-45k-retina-m1-mgtf3saa-5.jpg\"></a></p>\r\n<p>Với phi&ecirc;n bản iMac 24 inch 4.5K Retina Apple được n&acirc;ng cấp to&agrave;n diện n&agrave;y, bạn c&oacute; thể l&agrave;m tất cả c&aacute;c c&ocirc;ng việc từ t&aacute;c vụ văn ph&ograve;ng đến xử l&yacute; đồ họa hay giải tr&iacute; cực đỉnh nhờ sở hữu hiệu năng v&ocirc; c&ugrave;ng ấn tượng, b&ecirc;n cạnh ngoại h&igrave;nh phong c&aacute;ch, thời thượng cũng như m&agrave;n h&igrave;nh sắc n&eacute;t đến từng chi tiết.</p>', '<p>CPU: Apple M1 8-core</p>\r\n<p>Ram: 16Gb</p>\r\n<p>GPU: Card rời - NVIDIA GeForce GTX 1650 4 GB</p>\r\n<p>M&agrave;n h&igrave;nh: 15.6 inch</p>\r\n<p>Bộ nhớ: 512 GB SSD&nbsp;</p>\r\n<p>Khối lượng: &nbsp;2.3 kg</p>', '1668767394_imac-24-icnh-2021-m1-thumb-bac-1-600x600.jpg', 2, 12, 2, 1, '2022-11-18 10:29:54', '2022-11-18 12:33:32'),
(15, 'Mac Mini 2020 M1', 19990000, 123, '<h3><a title=\"Mac Mini 2020 M1 (MGNR3SA/A) \" href=\"https://www.thegioididong.com/may-tinh-de-ban/mac-mini-m1-mgnr3saa\" target=\"_blank\" rel=\"noopener\">Mac mini 2020 M1 (MGNR3SA/A)</a>&nbsp;l&agrave; d&ograve;ng Mac nhỏ gọn, linh hoạt v&agrave; đa năng khi c&oacute; thể đ&aacute;p ứng cả c&aacute;c nhu cầu giải tr&iacute; v&agrave; l&agrave;m đồ họa mạnh mẽ với hiệu năng đột ph&aacute; từ chip M1.</h3>\r\n<h3>Bộ vi xử l&yacute; M1 mạnh mẽ vượt trội</h3>\r\n<p><a title=\"C&aacute;c sản phẩm Mac mini hiện đang b&aacute;n tại thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban-apple-mac-mini\" target=\"_blank\" rel=\"noopener\">Apple Mac mini</a>&nbsp;M1 sở hữu<strong>&nbsp;</strong><a title=\"T&igrave;m hiểu về chip Apple M1: Con chip ARM 5nm đầu ti&ecirc;n d&agrave;nh cho m&aacute;y Mac\" href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-chip-apple-m1-con-chip-arm-5nm-dau-tien-danh-1305955\" target=\"_blank\" rel=\"noopener\">chip M1</a>&nbsp;được ch&iacute;nh Apple thiết kế, mang đến hiệu năng vượt trội với&nbsp;<strong>8 nh&acirc;n CPU</strong>&nbsp;mang đến tốc độ xử l&yacute;&nbsp;<strong>gấp 3 lần</strong>&nbsp;v&agrave;&nbsp;<strong>8 nh&acirc;n GPU</strong>&nbsp;cho khả năng thiết kế đồ họa mạnh mẽ, phục vụ tốt cho việc chỉnh sửa ảnh, l&agrave;m video tr&ecirc;n c&aacute;c phần mềm như Photoshop, AI, Pr,...&nbsp;</p>\r\n<p>Apple M1 c&ograve;n mang đến&nbsp;<strong>16 nh&acirc;n Neural Engine</strong>&nbsp;v&agrave; đầy đủ c&aacute;c c&ocirc;ng nghệ m&aacute;y học ti&ecirc;n tiến cho khả năng xử l&yacute; c&aacute;c t&aacute;c vụ về t&iacute;nh to&aacute;n, ph&acirc;n t&iacute;ch video, nhận dạng giọng n&oacute;i v&agrave; nhiều hơn nữa.</p>\r\n<p>Bộ nhớ&nbsp;<a title=\"RAM laptop l&agrave; g&igrave;? Dung lượng bao nhi&ecirc;u l&agrave; đủ?\" href=\"https://www.thegioididong.com/hoi-dap/ram-lap-top-la-gi-dung-luong-bao-nhieu-la-du-1172167\" target=\"_blank\" rel=\"noopener\">RAM 8 GB</a>&nbsp;độ trễ thấp gi&uacute;p đa nhiệm mượt m&agrave;, cho ph&eacute;p c&aacute;c ứng dụng chia sẻ dữ liệu giữa CPU, GPU v&agrave; Neural Engine một c&aacute;ch hiệu quả, l&agrave;m việc đa t&aacute;c vụ c&ugrave;ng l&uacute;c m&agrave; kh&ocirc;ng lo đơ m&aacute;y, đứng m&aacute;y.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-04.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - Cấu h&igrave;nh\" src=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-04.jpg\" alt=\"Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - Cấu h&igrave;nh\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-04.jpg\"></a></p>\r\n<p><a title=\"Ổ cứng SSD l&agrave; g&igrave;?\" href=\"https://www.thegioididong.com/hoi-dap/o-cung-ssd-la-gi-923073\" target=\"_blank\" rel=\"noopener\">Ổ cứng SSD 256 GB</a><strong>&nbsp;</strong>mang đến&nbsp;khả năng xử l&yacute; nhanh ch&oacute;ng v&agrave; kh&ocirc;ng gian lưu trữ dữ liệu, bạn c&oacute; thể tải được nhiều ứng dụng, t&agrave;i liệu, phục vụ nhu cầu học tập, l&agrave;m việc hằng ng&agrave;y hay c&aacute;c file &acirc;m nhạc, phim ảnh giải tr&iacute;.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-05.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - SSD\" src=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-05.jpg\" alt=\"Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - SSD\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-05.jpg\"></a></p>\r\n<h3>K&iacute;ch thước nhỏ gọn, tối giản v&agrave; bảo mật tối ưu</h3>\r\n<p>Mac mini M1 2020 sở hữu thiết kế khối vu&ocirc;ng v&ocirc; c&ugrave;ng nhỏ gọn với độ d&agrave;y chỉ&nbsp;<strong>36 mm</strong>&nbsp;v&agrave; nhẹ&nbsp;<strong>1.2 kg&nbsp;</strong>tiện lợi di chuyển v&agrave;<strong>&nbsp;</strong>gi&uacute;p tiết kiệm điện năng ti&ecirc;u thụ l&ecirc;n đến&nbsp;<strong>60%</strong>&nbsp;so với thế hệ trước đ&oacute;.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-02.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - Thiết kế\" src=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-02.jpg\" alt=\"Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - Thiết kế\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-02.jpg\"></a></p>\r\n<p><a title=\"C&aacute;c sản phẩm m&aacute;y t&iacute;nh để b&agrave;n Apple hiện đang b&aacute;n tại thegioididong.com\" href=\"https://www.thegioididong.com/may-tinh-de-ban-apple\" target=\"_blank\" rel=\"noopener\">M&aacute;y t&iacute;nh để b&agrave;n Apple</a>&nbsp;c&oacute; kiểu d&aacute;ng sang trọng được chế t&aacute;c ho&agrave;n to&agrave;n 100% từ hợp kim nh&ocirc;m t&aacute;i chế, t&ocirc;ng m&agrave;u bạc kim loại cao cấp với logo Apple nổi bật tr&ecirc;n mặt lưng.&nbsp;</p>\r\n<p>Sử dụng một bộ vi xử l&yacute; ri&ecirc;ng cho bảo mật mang t&ecirc;n&nbsp;<strong>Secure Enclave</strong>, cơ chế m&atilde; h&oacute;a dữ liệu&nbsp;<strong>AES</strong>&nbsp;tr&ecirc;n ổ cứng v&agrave; định danh t&agrave;i khoản với&nbsp;<strong>Apple ID</strong>&nbsp;mang đến khả năng bảo mật gần như ho&agrave;n hảo.</p>\r\n<p>Hệ điều h&agrave;nh&nbsp;<strong>macOS Big Sur&nbsp;</strong>mang lại trải nghiệm th&uacute; vị cho người d&ugrave;ng với thiết kế giao diện v&agrave; những t&iacute;nh năng v&ocirc; c&ugrave;ng hữu &iacute;ch, tương th&iacute;ch tốt với chip Apple M1, gi&uacute;p n&acirc;ng cao hiệu quả c&ocirc;ng việc.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-06.jpg\"><img class=\" lazyloaded\" title=\"Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - macOS Big Sur\" src=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-06.jpg\" alt=\"Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - macOS Big Sur\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-06.jpg\"></a></p>\r\n<h3>Hỗ trợ kết nối hiện đại, nhanh ch&oacute;ng</h3>\r\n<p>Trang bị 2 cổng&nbsp;<strong>Thunderbolt 4</strong>&nbsp;cho tốc độ truyền tải dữ liệu l&ecirc;n đến&nbsp;<strong>40 Gbps</strong>, hỗ trợ xuất h&igrave;nh ảnh s&aacute;ng m&agrave;n h&igrave;nh 6K sắc n&eacute;t v&agrave; c&aacute;c cổng USB-A, HDMI 2.0, Wi-Fi 6, LAN (RJ45) đ&aacute;p ứng mọi nhu cầu kết nối đa dạng với nhiều thiết bị th&ocirc;ng dụng hiện nay như m&aacute;y chiếu, tivi, m&agrave;n h&igrave;nh rời,...</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-07.jpg\"><img class=\" lazyloaded\" title=\"Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - Cổng kết nối\" src=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-07.jpg\" alt=\"Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - Cổng kết nối\" data-src=\"https://cdn.tgdd.vn/Products/Images/5698/240277/mac-mini-m1-mgnr3saa-07.jpg\"></a></p>\r\n<p><a title=\"Xem th&ecirc;m c&aacute;c sản phẩm Mac mini đang kinh doanh tại TopZone\" href=\"https://www.topzone.vn/mac-mini\" target=\"_blank\" rel=\"noopener\">Mac mini</a>&nbsp;sử dụng giao tiếp mạng chuẩn&nbsp;Bluetooth 5.0&nbsp;v&agrave;&nbsp;<a title=\"T&igrave;m hiểu th&ecirc;m về Wifi 6\" href=\"https://www.thegioididong.com/hoi-dap/wifi-6-la-gi-toc-do-nhanh-nhu-the-nao-1341982\" target=\"_blank\" rel=\"noopener\">Wi-Fi 6 AX201</a>&nbsp;cho băng th&ocirc;ng l&ecirc;n đến&nbsp;<strong>10.000 Mbps&nbsp;</strong>gi&uacute;p đường truyền<strong>&nbsp;</strong>mạng lu&ocirc;n ổn định, hạn chế giật lag, tốc độ lưu tải dữ liệu l&ecirc;n đến&nbsp;<strong>1.2 GB/s</strong>.</p>\r\n<p>Mac mini M1 (MGNR3SA/A) l&agrave; chiếc&nbsp;<a title=\"Xem th&ecirc;m một số mẫu m&aacute;y t&iacute;nh để b&agrave;n\" href=\"https://www.thegioididong.com/may-tinh-de-ban\" target=\"_blank\" rel=\"noopener\">m&aacute;y t&iacute;nh để b&agrave;n</a>&nbsp;nhỏ gọn, c&oacute; cấu h&igrave;nh mạnh mẽ v&agrave; bảo mật tốt, ph&ugrave; hợp với d&acirc;n thiết kế đồ họa chuy&ecirc;n nghiệp.</p>', '<p>CPU: Apple M1 8-core</p>\r\n<p>Ram: 16Gb</p>\r\n<p>GPU: Card rời - NVIDIA GeForce GTX 1650 4 GB</p>\r\n<p>M&agrave;n h&igrave;nh: 15.6 inch</p>\r\n<p>Bộ nhớ: 512 GB SSD&nbsp;</p>\r\n<p>Khối lượng: &nbsp;2.3 kg</p>', '1668767582_mac-mini-m1-mgnr3saa-thumb-600x600.jpg', 4, 12, 2, 1, '2022-11-18 10:33:02', '2022-11-18 11:51:22'),
(17, 'Laptop Asus TUF Gaming FX517ZC', 26790000, 122, '<p>Sở hữu ngoại h&igrave;nh ấn tượng thu h&uacute;t mọi &aacute;nh nh&igrave;n c&ugrave;ng hiệu năng mạnh mẽ đến từ laptop CPU thế hệ 12 mới nhất, Asus TUF Gaming FX517ZC i5 12450H (HN077W) l&agrave; lựa chọn xứng tầm cho mọi nhu cầu chiến game giải tr&iacute; hay đồ hoạ - kỹ thuật của người d&ugrave;ng.<br>&bull; Laptop Asus TUF mang hiệu năng vượt trội cho khả năng giải quyết trơn tru c&aacute;c t&aacute;c vụ phức tạp như thiết kế h&igrave;nh ảnh, render video,... tr&ecirc;n c&aacute;c ứng dụng nh&agrave; Adobe hay thoả sức chiến c&aacute;c tựa game hot như CS:GO, GTA V,... nhờ trang bị chip Intel Core i5 Alder Lake 12450H c&ugrave;ng card rời NVIDIA RTX 3050, 4 GB.</p>\r\n<p>&bull; RAM 8 GB chuẩn DDR5 ti&ecirc;n tiến, mang đến khả năng đa nhiệm mượt m&agrave;. SSD 512 GB hỗ trợ truy xuất dữ liệu nhanh, r&uacute;t ngắn thời gian chờ. Ngo&agrave;i ra, m&aacute;y n&agrave;y cũng hỗ trợ n&acirc;ng cấp để gia tăng năng suất l&agrave;m việc của bạn.</p>\r\n<p>&bull; M&agrave;n h&igrave;nh 15.6 inch phủ tấm nền IPS c&oacute; khả năng t&aacute;i tạo m&agrave;u tốt, mở rộng g&oacute;c nh&igrave;n l&ecirc;n đến 178 độ. C&ocirc;ng nghệ Anti Glare hỗ trợ chống ch&oacute;i, lo&aacute; mờ tr&ecirc;n m&agrave;n h&igrave;nh, bảo vệ thị gi&aacute;c người d&ugrave;ng.</p>\r\n<p>&bull; L&agrave;m chủ mọi trận game, giảm độ trễ nhờ tần số qu&eacute;t 144 Hz kết hợp c&ocirc;ng nghệ Adaptive-Sync tr&ecirc;n laptop Asus gi&uacute;p loại bỏ những vấn đề như giật, x&eacute; h&igrave;nh mang lại cho bạn trải nghiệm giải tr&iacute;, chơi game ổn định hơn bao giờ hết.</p>\r\n<p>&bull; Được chế t&aacute;c từ vỏ nhựa cứng c&aacute;p đi k&egrave;m l&agrave; sắc x&aacute;m hiện đại với những đường cắt tinh xảo, khơi nguồn cảm hứng chiến game. Khối lượng chỉ 2 kg sẵn s&agrave;ng b&ecirc;n cạnh phục vụ bạn mọi l&uacute;c, tr&ecirc;n mọi chiến trường ảo.</p>\r\n<p>&bull; HD Webcam hỗ trợ c&aacute;c cuộc gọi video hay học trực tuyến dễ d&agrave;ng hơn nhờ chất lượng h&igrave;nh ảnh ổn định. Đ&egrave;n nền đơn sắc cũng được t&iacute;ch hợp tr&ecirc;n b&agrave;n ph&iacute;m laptop.</p>\r\n<p>&bull; Đạt chuẩn Hi-Res Audio c&ugrave;ng c&ocirc;ng nghệ &acirc;m v&ograve;m Dolby Atmos cung cấp &acirc;m thanh sống động từ mọi hướng, lấp đầy kh&ocirc;ng gian với độ r&otilde;, chi tiết v&agrave; chiều s&acirc;u đ&aacute;ng kinh ngạc.</p>\r\n<p>&bull; Truyền tải dữ liệu, kết nối nhanh với c&aacute;c thiết bị ngoại vi nhờ c&aacute;c cổng giao tiếp: USB 3.2 Gen 2 Type-C, 2 x USB 3.2, HDMI, LAN (RJ45), Thunderbolt 4.</p>', '<p>CPU: Intel Core i5 Alder Lake - 12450H</p>\r\n<p>Ram: 16Gb</p>\r\n<p>GPU: Card rời - NVIDIA GeForce GTX 1650 4 GB</p>\r\n<p>M&agrave;n h&igrave;nh: 15.6 inch</p>\r\n<p>Bộ nhớ: 512 GB SSD&nbsp;</p>\r\n<p>Pin: 58.75 Wh</p>\r\n<p>Khối lượng: &nbsp;2.3 kg</p>', '1668767922_asus-tuf-gaming-fx517zc-i5-hn077w-190322-114627-600x600.jpg', 1, 12, 2, 2, '2022-11-18 10:38:42', '2022-11-18 11:53:54'),
(18, 'iMac 24 inch 2021 4.5K', 49900000, 123, '<p>iMac 24 inch 2021 4.5K Retina M1 8-core được cải tiến thiết kế mới mẻ, trẻ trung n&acirc;ng tầm mọi kh&ocirc;ng gian c&ugrave;ng với hiệu năng vượt trội từ bộ vi xử l&yacute; (CPU) M1 8-core v&agrave; m&agrave;n h&igrave;nh Retina 4.5K hiển thị ảnh tươi mới, rực rỡ.<br>Tạo cảm hứng cho kh&ocirc;ng gian l&agrave;m việc năng động<br>iMac c&oacute; thiết kế tối giản v&agrave; nhỏ gọn hơn, bắt mắt ở mọi g&oacute;c độ. M&agrave;n h&igrave;nh chỉ mỏng 11.5 mm, to&agrave;n bộ m&aacute;y c&oacute; trọng lượng 4.48 kg với ch&acirc;n đế 147 mm gi&uacute;p tối ưu h&oacute;a kh&ocirc;ng gian học tập v&agrave; giải tr&iacute;. Vỏ m&aacute;y được l&agrave;m từ chất liệu nh&ocirc;m t&aacute;i chế 100% bền bỉ v&agrave; c&oacute; m&agrave;u t&ocirc;ng xanh dương đậm - nhạt phối một c&aacute;ch tinh tế l&agrave;m nổi bật hơn g&oacute;c l&agrave;m việc đầy cảm hứng.</p>\r\n<p>iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Thiết kế</p>\r\n<p>Đi k&egrave;m với chiếc m&aacute;y t&iacute;nh để b&agrave;n l&agrave; chuột v&agrave; b&agrave;n ph&iacute;m c&ugrave;ng t&ocirc;ng m&agrave;u tạo điểm nhấn cho m&aacute;y. Đặc biệt, b&agrave;n ph&iacute;m nay đ&atilde; c&oacute; t&iacute;ch hợp Touch ID mở kh&oacute;a nhanh ch&oacute;ng, thanh to&aacute;n trực tuyến an to&agrave;n bảo mật chỉ với 1 chạm.</p>\r\n<p>iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Touch ID</p>\r\n<p>Ngo&agrave;i ra, m&aacute;y t&iacute;nh để b&agrave;n học tập - văn ph&ograve;ng n&agrave;y c&ograve;n được trang bị đầy đủ c&aacute;c cổng kết nối đa dạng như cổng Thunderbolt, cổng USB 3 v&agrave; Jack tai nghe 3.5 mm hỗ trợ kết nối dễ d&agrave;ng v&agrave; nhanh ch&oacute;ng. C&ugrave;ng kết nối kh&ocirc;ng d&acirc;y Wi-Fi 6 AX201, Bluetooth 5.0 cho đường truyền mạng ổn định, kh&ocirc;ng lo bị ngắt t&iacute;nh hiệu.</p>\r\n<p>iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Cổng kết nối</p>\r\n<p>Chip Apple M1 mạnh mẽ, đa nhiệm mượt m&agrave; c&aacute;c t&aacute;c vụ chuy&ecirc;n nghiệp<br>M&aacute;y chạy bằng hệ điều h&agrave;nh Mac OS Big Sur c&ugrave;ng với sức mạnh từ con chip Apple M1 8-core mang đến hiệu năng v&ocirc; c&ugrave;ng mạnh mẽ nhanh hơn đến 85% v&agrave; hiệu suất đồ họa hơn 2 lần so với c&aacute;c mẫu iMac 21.5 trước đ&acirc;y.</p>\r\n<p>iMac c&ograve;n được trang bị card đồ họa t&iacute;ch hợp 8 nh&acirc;n GPU cho khả năng hiển thị sắc n&eacute;t, chạy mượt m&agrave; c&aacute;c phần mềm thiết kế, lập tr&igrave;nh như Photoshop, Final Cut, iMovie, Xcode,... M&aacute;y t&iacute;nh để b&agrave;n Apple M1 c&oacute; RAM 8 GB cho khả năng đọc ghi dữ liệu tốt, đa nhiệm mượt nhiều t&aacute;c vụ văn ph&ograve;ng chuy&ecirc;n nghiệp c&ugrave;ng l&uacute;c với c&aacute;c ứng dụng giải tr&iacute;.</p>\r\n<p>iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Cấu h&igrave;nh</p>\r\n<p>Ổ cứng SSD 512 GB tr&ecirc;n chiếc m&aacute;y t&iacute;nh để b&agrave;n đồ hoạ - kỹ thuật n&agrave;y mang lại kh&ocirc;ng gian lưu trữ đủ d&ugrave;ng, tốc độ khởi động m&aacute;y v&agrave; truy xuất dữ liệu nhanh ch&oacute;ng đ&aacute;p ứng tốt cho nhu cầu c&ocirc;ng việc.</p>\r\n<p>iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - SSD</p>\r\n<p>Đắm ch&igrave;m trong m&agrave;n ảnh 4.5K hiển thị sắc n&eacute;t, ch&acirc;n thật nhất<br>M&agrave;n h&igrave;nh 24 inch Retina chất lượng cao với khả năng hỗ trợ dải m&agrave;u DCI-P3 hơn 1 tỷ m&agrave;u sắc kh&aacute;c nhau tr&ecirc;n 11.3 triệu điểm ảnh, th&ecirc;m điểm cộng l&agrave; độ s&aacute;ng 500 nits mang lại trải nghiệm h&igrave;nh ảnh rực rỡ v&agrave; sống động qua từng khung h&igrave;nh phim ảnh.</p>\r\n<p>iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - H&igrave;nh ảnh</p>\r\n<p>C&ocirc;ng nghệ True Tone tự động điều chỉnh nhiệt độ m&agrave;u sắc của m&agrave;n h&igrave;nh gi&uacute;p m&agrave;u sắc lu&ocirc;n được nhất qu&aacute;n ph&ugrave; hợp điều kiện m&ocirc;i trường thay đổi. M&agrave;n h&igrave;nh c&ograve;n được phủ lớp chống phản chiếu ho&agrave;n hảo, bạn c&oacute; thể thoải m&aacute;i l&agrave;m việc hay giải tr&iacute; dưới &aacute;nh s&aacute;ng gắt.</p>\r\n<p>iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Độ s&aacute;ng</p>\r\n<p>Dễ d&agrave;ng học tập, l&agrave;m việc từ xa qua webcam chất lượng cao<br>Camera FaceTime 1080p lần đầu ti&ecirc;n xuất hiện tr&ecirc;n m&aacute;y Mac với khả năng giảm nhiễu tốt hơn, dải động lớn hơn, c&acirc;n bằng trắng tự động v&agrave; 3 micro chất lượng ph&ograve;ng thu gi&uacute;p thu giọng n&oacute;i r&otilde; r&agrave;ng hơn, loại bỏ tiếng ồn tối ưu hỗ trợ tốt cho c&aacute;c cuộc gọi video gia đ&igrave;nh hay họp với đối t&aacute;c từ xa.</p>\r\n<p>iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - Webcam</p>\r\n<p>C&ocirc;ng nghệ &acirc;m thanh Dolby Atmos tr&ecirc;n nền tảng 6 loa bao gồm 4 loa trầm s&acirc;u v&agrave; 2 loa tweeter hiệu suất cao nằm ở cạnh dưới t&aacute;i hiện &acirc;m thanh s&acirc;n khấu sống động ngập tr&agrave;n khắp căn ph&ograve;ng.</p>\r\n<p>iMac 24 inch 2021 4.5K M1 8GPU (MGPL3SA/A) Blue - &Acirc;m thanh</p>\r\n<p>iMac 24 inch 2021 4.5K Retina M1 l&agrave; một trong những chiếc m&aacute;y t&iacute;nh để b&agrave;n Apple đạt y&ecirc;u cầu cả về t&iacute;nh thẩm mỹ v&agrave; cấu h&igrave;nh hiện đại, ti&ecirc;n tiến bật nhất thế giới phục vụ tốt cho như cầu học tập, l&agrave;m việc cũng như giải tr&iacute; một c&aacute;ch gần như ho&agrave;n hảo.</p>', '<p>CPU: Apple M1 8-core</p>\r\n<p>Ram: 16Gb</p>\r\n<p>GPU: Card rời - NVIDIA GeForce GTX 1650 4 GB</p>\r\n<p>M&agrave;n h&igrave;nh: 15.6 inch</p>\r\n<p>Bộ nhớ: 512 GB SSD&nbsp;</p>\r\n<p>Khối lượng: &nbsp;2.3 kg</p>', '1668773959_imac-24-icnh-2021-m1-thumb-xanh-la-2-600x600.jpg', 2, 12, 1, 1, '2022-11-18 12:19:19', '2022-11-18 12:33:49'),
(19, 'HP Workstation Z420', 10000000, 0, '<p>D&ugrave; l&agrave; d&ograve;ng m&aacute;y t&iacute;nh c&oacute; trọng lượng kh&aacute; khủng, th&acirc;n h&igrave;nh to lớn nhưng HP Workstation Z420 V2 ho&agrave;n to&agrave;n thỏa m&atilde;n d&acirc;n c&ocirc;ng nghệ, lập tr&igrave;nh đồ họa, hay thiết kế game về sức mạnh l&agrave;m việc. C&aacute;c bạn h&atilde;y tin ch&uacute;ng t&ocirc;i, bạn chỉ cần một HP Workstation Z420 V2 th&igrave; bạn ho&agrave;n to&agrave;n chiến đấu với mọi c&ocirc;ng việc n&agrave;y mấy ng&agrave;y li&ecirc;n tiếp.</p>\r\n<p>M&aacute;y trạm HP Z420 V2 workstation d&agrave;nh cho những nh&agrave; thiết kế đồ họa chuy&ecirc;n nghiệp, những c&ocirc;ng việc t&iacute;nh to&aacute;n, render h&igrave;nh ảnh, video, chơi game chuy&ecirc;n nghiệp, n&oacute;i chung l&agrave; ch&uacute;ng cần một hệ thống phần cứng c&oacute; cấu h&igrave;nh khủng, ổn định, v&agrave; m&aacute;y trạm workstation đ&aacute;p ứng được tất cả điều đ&oacute;.</p>\r\n<p>&nbsp;</p>\r\n<p><img title=\"Thiết kế tản nhiệt th&ocirc;ng minh, kh&ocirc;ng tạo ồn &agrave;o\" src=\"https://maytinhtram.vn/picture/file/pc-hp/HP-Workstation-Z420-V2-3.jpg\" alt=\"Thiết kế tản nhiệt th&ocirc;ng minh, kh&ocirc;ng tạo ồn &agrave;o\"></p>\r\n<p><em>Thiết kế tản nhiệt th&ocirc;ng minh, kh&ocirc;ng tạo ồn &agrave;o</em></p>\r\n<p>Cấu h&igrave;nh hiện đại l&agrave; một trong những ưu điểm được nhắc đến nhiều của d&ograve;ng m&aacute;y HP Workstation Z420 V2 một trong bộ sản phẩm Workstation cao cấp của h&atilde;ng HP. Chuy&ecirc;n biệt trong sử dụng c&aacute;c bộ vi xử l&yacute; cao cấp, hoạt động với xung nhịp cực lớn từ cơ bản l&agrave; 3.7GHz Turbo up to đạt khoảng 3.9Ghz qua bộ xử l&yacute; nhanh ch&oacute;ng v&agrave; hiện đại CPU h&agrave;ng d&ograve;ng thế hệ 3th Gen được h&atilde;ng Intel của d&ograve;ng cao cấp nhất Xeon E5-1620 V2. Ch&uacute;ng ta c&oacute; thể thấy một nh&acirc;n chip 4 loại, 8 luồng xử l&yacute; nhanh ch&oacute;ng, cao cấp đặc sắc với hơn 10Mb đệm trong bộ nhớ nhanh ch&oacute;ng nhất.</p>\r\n<p>&nbsp;</p>\r\n<p><img title=\"Tận hưởng hiệu suất si&ecirc;u nhanh với SSD tốc độ cao\" src=\"https://maytinhtram.vn/picture/file/pc-hp/HP-Workstation-Z420-V2-1.jpg\" alt=\"Tận hưởng hiệu suất si&ecirc;u nhanh với SSD tốc độ cao\"></p>\r\n<p><em>Tận hưởng hiệu suất si&ecirc;u nhanh với SSD tốc độ cao</em></p>\r\n<p>Card đồ họa đồng h&agrave;nh c&ugrave;ng chip Cpu h&agrave;ng cao cấp HP Workstation Z420 V2 đ&oacute; l&agrave; d&ograve;ng Nvidia Quadro K620 nhớ trong tức th&igrave; l&agrave; bộ nhớ 2GB d&ograve;ng 128 bit GDDR3 thế hệ kh&ocirc;ng qu&aacute; cao cấp nhưng đủ để c&aacute;c bạn d&ugrave;ng l&agrave;m c&ocirc;ng t&aacute;c đ&ocirc; họa ph&ugrave; hợp.</p>\r\n<p>RAM bộ nhớ đạt mức 16GB trong đ&oacute; bạn c&oacute; thể chạy th&ecirc;m khoảng 2 thanh RAM 4GB nữa v&igrave; m&aacute;y cho khe cắm c&oacute; sắn m&agrave; bạn muốn l&agrave;m quen. DDR3 l&agrave; thế hệ thứ 3 trong c&aacute;c d&ograve;ng Ram cao cấp 1600MHz tăng tốc độ đọc v&agrave; l&agrave;m việc r&otilde; r&agrave;ng.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><img title=\"Tốc độ xử l&yacute; tuyệt vời của HP Z240\" src=\"https://maytinhtram.vn/picture/file/pc-hp/HP-Workstation-Z420-V2-2.jpg\" alt=\"Tốc độ xử l&yacute; tuyệt vời của HP Z240\"></p>\r\n<p><em>Tốc độ xử l&yacute; tuyệt vời của HP Z240</em></p>\r\n<p>Ch&uacute;ng ta c&oacute; trong HP Workstation Z420 V2 l&agrave; bộ ổ đĩa cứng song song hoạt động giữa SSD 128GB v&agrave; HDD 1TB, c&aacute;c bạn sẽ thấy hoạt động của ch&uacute;ng giống như bổ sung ho&agrave;n thiện với nhau tốt hơn. Ch&uacute;ng ta c&oacute; một m&agrave;n khởi động win cũng như c&aacute;c chương tr&igrave;nh c&oacute; tốc độ đạt chuẩn trong t&iacute;c tắc. Ho&agrave;n thiện hơn về tr&igrave;nh tự lưu trữ v&agrave; t&aacute;c động kh&ocirc;ng ngừng nghỉ đến việc vận h&agrave;nh bộ nhớ của m&aacute;y t&iacute;nh để b&agrave;n.</p>\r\n<p>Trong thiết kế, m&aacute;y kh&aacute; hiện đại khi trang bị c&aacute;c thanh c&ocirc;ng cụ hỗ trợ như ổ đĩa DVD, CD, c&aacute;c khe cắm thẻ nhớ từ loại micro đến loại SD, to nhỏ đầy đủ v&agrave; hoạt động của c&aacute;c cổng kết nối đầy đủ l&agrave;m bạn ho&agrave;n th&agrave;nh được c&ocirc;ng việc như chụp ảnh lấy ngay, shop h&igrave;nh ảnh.</p>\r\n<p>&nbsp;</p>\r\n<p><img title=\"N&acirc;ng cấp linh hoạt khi cần thiết đối với HP Z240\" src=\"https://maytinhtram.vn/picture/file/pc-hp/HP-Workstation-Z420-V2.jpg\" alt=\"N&acirc;ng cấp linh hoạt khi cần thiết đối với HP Z240\"></p>\r\n<p><em>N&acirc;ng cấp linh hoạt khi cần thiết đối với HP Z240</em></p>\r\n<p>Bạn sẽ ho&agrave;n to&agrave;n thấy m&aacute;y t&iacute;nh để b&agrave;n HP Workstation Z420 V2 ph&ugrave; hợp với kh&ocirc;ng gian l&agrave;m việc văn ph&ograve;ng, gia đ&igrave;nh cơ bản hoặc trong c&aacute;c căn ph&ograve;ng cho thu&ecirc; v&igrave; k&iacute;ch thước của n&oacute; kh&ocirc;ng qu&aacute; lớn. C&aacute;c qu&yacute; vị c&ograve;n c&oacute; thể d&ugrave;ng m&aacute;y t&iacute;nh để b&agrave;n HP Workstation Z420 V2 trong ph&ograve;ng l&agrave;m việc hiện đại hơn.</p>\r\n<p>Vẫn sang trong lại cao cấp với bộ nhớ khủng hơn bao giờ hết, bạn ho&agrave;n to&aacute;n trải nghiệm tốt nhất với hệ thống m&aacute;y t&iacute;nh để b&agrave;n cao cấp n&agrave;y.</p>\r\n<p>Bảo h&agrave;nh tại cửa h&agrave;ng HP Workstation Z420 V2 l&ecirc;n tới 12 Th&aacute;ng li&ecirc;n tiếp.</p>', '<p>CPU: 3th Gen - Intel&reg; Xeon E5-1620 V2</p>\r\n<p>Ram: 16GB ECC REG DDR3 1600MHz</p>\r\n<p>GPU: &nbsp;Nvidia Quadro K600 ( 1GB 128 bit GDDR5 )</p>\r\n<p>Bộ nhớ: SSD - 120GB</p>\r\n<p>Khối lượng:12.5 kg</p>', '1668775723_may-tinh-de-ban-cu-gia-re.jpg', 3, 12, 2, 4, '2022-11-18 12:48:43', '2022-11-18 12:48:43');

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `provider`, `provider_id`, `user_id`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 'google', '109737444515911376366', 6, 'https://lh3.googleusercontent.com/a/ALm5wu3HxS1nw3zYZy2sH9Z1SlWvooKwvoAIB3C4VvXu=s96-c', '2022-11-18 12:32:05', '2022-11-18 12:32:05'),
(2, 'facebook', '3357442887870031', 7, 'https://graph.facebook.com/v3.3/3357442887870031/picture?type=normal', '2022-11-18 12:53:47', '2022-11-18 12:53:47'),
(3, 'google', '114118667206498480993', 8, 'https://lh3.googleusercontent.com/a/ALm5wu3ubOr4C_rHBo-yosVWAKh-fcsPeumYQIgqpR8Hgw=s96-c', '2022-11-18 13:05:17', '2022-11-18 13:05:17'),
(4, 'google', '117926680728524836317', 9, 'https://lh3.googleusercontent.com/a/ALm5wu0mgbq6PozUupakm-zUmw1M9QpBF_vMIcNUJWQu=s96-c', '2022-11-18 13:07:43', '2022-11-18 13:07:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin113', 'admin113@gmail.com', NULL, '$2y$10$mstkCcT0sj4Qd4Sx/9NBn.X807653glr9ZdUH9TNaBLljXYpQePf2', 1, 2, NULL, NULL, NULL),
(2, 'manh_kho', 'dodinhmanh75@gmail.com', NULL, '$2y$10$iIuNvYNh.gEvHWiAvwn.3uqM9q3cCgcPn5nwCCxEc7OovLvBTfy1W', 1, 3, NULL, '2022-11-18 08:24:17', '2022-11-18 08:24:17'),
(3, 'manh_nhanvien', 'dodinhmanh757575@gmail.com', NULL, '$2y$10$IYG7i2qGgv0Qx347ahA83eH46QrtZ17HfApBUk3c/piiu.kfUT3fW', 1, 4, NULL, '2022-11-18 08:25:23', '2022-11-18 08:25:23'),
(4, 'tédasdasdas', 'manh4444@yahoo.com', NULL, '$2y$10$me0JZT4P92tntPatW4jXWOVdqCJn3LEe1PqJW8z6ScJcgt2.ZNVQO', 1, 3, NULL, '2022-11-18 08:34:25', '2022-11-18 08:34:25'),
(5, 'do manhaa', 'dinhmanh11@gmail.com', NULL, '$2y$10$bfFj0yhwC7CAhRUHnq9mnuhNlCpnxThMEKm07R5liroeSdKicQ2dy', 1, 1, NULL, '2022-11-18 09:42:18', '2022-11-18 09:42:18'),
(6, NULL, 'hotrol3m@gmail.com', NULL, NULL, 1, 1, NULL, '2022-11-18 12:32:05', '2022-11-18 12:32:05'),
(7, NULL, NULL, NULL, NULL, 1, 1, NULL, '2022-11-18 12:53:47', '2022-11-18 12:53:47'),
(8, NULL, 'manhnagato2001@gmail.com', NULL, NULL, 1, 1, NULL, '2022-11-18 13:05:17', '2022-11-18 13:05:17'),
(9, NULL, 'dodinhmanh.study@gmail.com', NULL, NULL, 1, 1, NULL, '2022-11-18 13:07:43', '2022-11-18 13:07:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_makh_foreign` (`maKH`),
  ADD KEY `carts_masp_foreign` (`maSP`);

--
-- Indexes for table `chuc_vus`
--
ALTER TABLE `chuc_vus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD KEY `comments_customer_id_foreign` (`customer_id`),
  ADD KEY `comments_product_id_foreign` (`product_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `ct_phieu_nhaps`
--
ALTER TABLE `ct_phieu_nhaps`
  ADD KEY `ct_phieu_nhaps_pn_id_foreign` (`pn_id`),
  ADD KEY `ct_phieu_nhaps_product_id_foreign` (`product_id`);

--
-- Indexes for table `ct_phieu_xuats`
--
ALTER TABLE `ct_phieu_xuats`
  ADD KEY `ct_phieu_xuats_product_id_foreign` (`product_id`),
  ADD KEY `ct_phieu_xuats_px_id_foreign` (`px_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discount_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_user_id_foreign` (`user_id`),
  ADD KEY `employees_cv_id_foreign` (`cv_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `loaisps`
--
ALTER TABLE `loaisps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nccs`
--
ALTER TABLE `nccs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nsxes`
--
ALTER TABLE `nsxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phieu_nhaps`
--
ALTER TABLE `phieu_nhaps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phieu_nhaps_employee_id_foreign` (`employee_id`),
  ADD KEY `phieu_nhaps_ncc_id_foreign` (`ncc_id`);

--
-- Indexes for table `phieu_xuats`
--
ALTER TABLE `phieu_xuats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phieu_xuats_employee_id_foreign` (`employee_id`),
  ADD KEY `phieu_xuats_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_mancc_foreign` (`maNCC`),
  ADD KEY `products_maloai_foreign` (`maLoai`),
  ADD KEY `products_mansx_foreign` (`maNSX`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `providers_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chuc_vus`
--
ALTER TABLE `chuc_vus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loaisps`
--
ALTER TABLE `loaisps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `nccs`
--
ALTER TABLE `nccs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nsxes`
--
ALTER TABLE `nsxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `phieu_nhaps`
--
ALTER TABLE `phieu_nhaps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `phieu_xuats`
--
ALTER TABLE `phieu_xuats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_makh_foreign` FOREIGN KEY (`maKH`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_masp_foreign` FOREIGN KEY (`maSP`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ct_phieu_nhaps`
--
ALTER TABLE `ct_phieu_nhaps`
  ADD CONSTRAINT `ct_phieu_nhaps_pn_id_foreign` FOREIGN KEY (`pn_id`) REFERENCES `phieu_nhaps` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ct_phieu_nhaps_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ct_phieu_xuats`
--
ALTER TABLE `ct_phieu_xuats`
  ADD CONSTRAINT `ct_phieu_xuats_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ct_phieu_xuats_px_id_foreign` FOREIGN KEY (`px_id`) REFERENCES `phieu_xuats` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_cv_id_foreign` FOREIGN KEY (`cv_id`) REFERENCES `chuc_vus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `phieu_nhaps`
--
ALTER TABLE `phieu_nhaps`
  ADD CONSTRAINT `phieu_nhaps_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phieu_nhaps_ncc_id_foreign` FOREIGN KEY (`ncc_id`) REFERENCES `nccs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `phieu_xuats`
--
ALTER TABLE `phieu_xuats`
  ADD CONSTRAINT `phieu_xuats_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phieu_xuats_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_maloai_foreign` FOREIGN KEY (`maLoai`) REFERENCES `loaisps` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_mancc_foreign` FOREIGN KEY (`maNCC`) REFERENCES `nccs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_mansx_foreign` FOREIGN KEY (`maNSX`) REFERENCES `nsxes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `providers`
--
ALTER TABLE `providers`
  ADD CONSTRAINT `providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
