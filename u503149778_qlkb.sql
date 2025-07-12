-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th4 23, 2023 lúc 02:11 AM
-- Phiên bản máy phục vụ: 10.5.19-MariaDB-cll-lve
-- Phiên bản PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `u503149778_qlkb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `consulting_rooms`
--

CREATE TABLE `consulting_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `consulting_rooms`
--

INSERT INTO `consulting_rooms` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(2, 'PK000002', 'Phòng Tai Mũi Họng', '2023-02-12 20:18:59', '2023-02-12 20:18:59'),
(3, 'PK000003', 'Phòng Nội Soi', '2023-02-12 20:19:10', '2023-02-12 20:19:10'),
(4, 'PK000004', 'Phòng Chụp X-Quang', '2023-02-12 20:19:27', '2023-02-12 20:19:27'),
(5, 'PK000005', 'Phòng Cấp Cứu', '2023-02-12 20:19:44', '2023-02-12 20:19:44'),
(6, 'PK000006', 'Phòng Xét Nghiệm', '2023-02-12 20:20:32', '2023-02-12 20:20:32'),
(7, 'PK000007', 'Phòng Siêu Âm', '2023-02-15 15:11:50', '2023-02-15 15:11:50'),
(8, 'PK000008', 'Phòng khám thần kinh', '2023-02-18 08:39:53', '2023-02-18 08:39:53'),
(9, 'PK000009', 'Phòng khám tim mạch', '2023-02-18 08:40:09', '2023-02-18 08:40:09'),
(10, 'PK000010', 'Phòng răng hàm mặt', '2023-02-18 08:40:25', '2023-02-18 08:40:25'),
(11, 'PK000011', 'Phòng tiếp nhận bệnh nhân ung thư', '2023-02-18 08:40:53', '2023-02-18 08:40:53'),
(12, 'PK000012', 'Phòng phẫu thuật tiểu phẫu', '2023-02-18 08:41:22', '2023-02-18 08:41:22'),
(13, 'PK000013', 'Phòng giải phẫu bằng laze', '2023-02-18 08:41:51', '2023-02-18 08:41:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `health_certifications`
--

CREATE TABLE `health_certifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `consulting_room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(191) NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL DEFAULT 0,
  `conclude` varchar(191) DEFAULT NULL,
  `treatment_guide` varchar(191) DEFAULT NULL,
  `suggestion` varchar(191) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `total_money` int(11) NOT NULL,
  `is_health_insurance_card` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `health_certifications`
--

INSERT INTO `health_certifications` (`id`, `title`, `patient_id`, `consulting_room_id`, `user_id`, `code`, `status`, `payment_status`, `conclude`, `treatment_guide`, `suggestion`, `number`, `total_money`, `is_health_insurance_card`, `created_at`, `updated_at`) VALUES
(1, 'Tổng Quát', 2, 6, 2, 'GKB000001', 1, 1, '<p>bình thường</p>', '<p>đi bệnh viện</p>', NULL, 1, 300000, 0, '2023-02-13 18:14:36', '2023-02-13 18:19:19'),
(2, 'Cấp Cứu', 3, 5, 1, 'GKB000002', 1, 1, '<p>K việc gì</p>', '<p>Về nhà</p>', NULL, 1, 123000, 0, '2023-02-15 15:23:48', '2023-02-16 13:43:01'),
(3, 'Nội soi', 5, 2, 2, 'GKB000003', 1, 1, '<p>Bị ung thư</p>', '<p>K cứu được</p>', NULL, 2, 300000, 0, '2023-02-15 15:38:50', '2023-02-16 14:05:14'),
(4, 'Xét Nghiệm', 3, 3, 2, 'GKB000004', 1, 1, '<p>Bình thường</p>', '<p>Thể dục thể thao điều độ! Uống nhiều nước!</p>', '<p>6 tháng sau quay lại tái khám.</p>', 1, 2300000, 0, '2023-02-16 13:15:32', '2023-02-17 23:59:13'),
(6, 'Xét nghiệm máu', 8, 6, 2, 'GKB000006', 1, 1, '<p>Âm tính với các loại bệnh truyền nhiễm</p><p>Nồng độ axit uric trong máu cao</p>', '<p>Tăng cường hoạt động thể dục thể thao, uống nhiều nước và hạn chế ăn nhiều chất đạm</p>', '<p>6 tháng sau đi xét nghiệm lại</p>', 1, 500000, 0, '2023-02-17 23:04:53', '2023-03-01 07:48:45'),
(7, 'Đỗ Văn A', 2, 3, 2, 'GKB000007', 1, 1, 'Không vấn đề gì&nbsp;', '<p>Về nhà ăn uống ngủ nghỉ sinh hoạt điều độ</p>', '<p>6 tháng sau quay lại khám</p>', 1, 200000, 0, '2023-02-21 20:30:22', '2023-03-27 22:20:56'),
(8, 'Khám tiêu hoá', 8, 3, 2, 'GKB000008', 0, 0, NULL, NULL, NULL, 1, 230000, 0, '2023-03-06 05:01:13', '2023-03-06 05:01:13'),
(9, 'Tester1', 5, 3, 3, 'GKB000009', 0, 0, NULL, NULL, NULL, 1, 35, 0, '2023-03-25 00:53:37', '2023-03-25 00:53:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `health_insurance_cards`
--

CREATE TABLE `health_insurance_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` int(11) NOT NULL,
  `code` varchar(191) NOT NULL,
  `hospital` varchar(191) NOT NULL,
  `use_value` date NOT NULL,
  `id_card` varchar(191) NOT NULL,
  `date_of_issue` date NOT NULL,
  `issued_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `health_insurance_cards`
--

INSERT INTO `health_insurance_cards` (`id`, `patient_id`, `code`, `hospital`, `use_value`, `id_card`, `date_of_issue`, `issued_by`, `created_at`, `updated_at`) VALUES
(1, 3, 'BHYT000001', 'Bạch  Mai', '2023-02-01', '12300', '2023-02-01', 'HN', '2023-02-13 18:21:30', '2023-02-16 13:32:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `medical_services`
--

CREATE TABLE `medical_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `medical_services`
--

INSERT INTO `medical_services` (`id`, `code`, `name`, `price`, `created_at`, `updated_at`) VALUES
(3, 'DV000003', 'Điện tâm đồ tim mạch', 500000, '2023-02-14 16:32:02', '2023-02-14 16:32:02'),
(4, 'DV000004', 'Xét nghiệm máu', 200000, '2023-02-14 16:32:40', '2023-02-14 16:32:40'),
(5, 'DV000005', 'Tổng Quát', 0, '2023-02-15 15:13:06', '2023-02-15 15:13:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `medicines`
--

CREATE TABLE `medicines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `price` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `unit` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `medicines`
--

INSERT INTO `medicines` (`id`, `code`, `name`, `description`, `price`, `type_id`, `unit`, `created_at`, `updated_at`) VALUES
(4, 'T000004', 'abc11', '<p>Thuốc không có tác dụng</p>', 50000, 2, 'VNĐ', '2023-02-13 17:32:56', '2023-02-15 15:16:11'),
(6, 'T000006', 'abc11', NULL, 50000, 2, 'VNĐ', '2023-02-16 13:49:23', '2023-02-16 13:49:23'),
(7, 'T000007', 'abc11', NULL, 50000, 1, 'VNĐ', '2023-02-16 14:27:11', '2023-02-16 14:27:49'),
(8, 'T000008', 'Healing', NULL, 0, 2, 'VNĐ', '2023-02-16 14:29:15', '2023-02-16 14:29:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2021_09_15_133244_create_consulting_rooms_table', 1),
(5, '2021_09_15_133634_create_health_certifications_table', 1),
(6, '2021_09_15_133934_create_medical_services_table', 1),
(7, '2021_09_15_134205_create_health_insurance_cards_table', 1),
(8, '2021_09_16_132112_create_medicines_table', 1),
(9, '2021_09_28_140125_create_prescriptions_table', 1),
(10, '2021_10_03_074157_create_types_table', 1),
(11, '2021_10_03_074759_create_prescription_details_table', 1),
(12, '2021_10_05_121357_create_service_vouchers_table', 1),
(13, '2021_10_09_010227_create_patients_table', 1),
(14, '2021_10_09_010538_create_service_voucher_details_table', 1),
(15, '2021_10_14_130327_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 2),
(6, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `gender` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `birthday` date NOT NULL,
  `phone` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `patients`
--

INSERT INTO `patients` (`id`, `code`, `name`, `avatar`, `gender`, `address`, `birthday`, `phone`, `created_at`, `updated_at`) VALUES
(2, 'BN000002', 'Van A', '', 'Nam', '106 Hoàng Quốc Viêt, Cầu Giấy, Hà Nội', '2023-02-08', '1234567891', '2023-02-13 17:16:16', '2023-02-13 17:16:16'),
(3, 'BN000003', 'Anh Quỳnh', '', 'Nữ', '106 Hoàng Quốc Viêt, Cầu Giấy, Hà Nội', '2023-02-09', '0967034951', '2023-02-13 17:16:43', '2023-02-16 13:41:14'),
(5, 'BN000005', 'Quynh Anh Trinh', '', 'Nữ', '106 Hoàng Quốc Viêt, Cầu Giấy, Hà Nội', '2023-02-02', '0967034958', '2023-02-16 13:51:44', '2023-02-16 13:51:44'),
(7, 'BN000007', 'Quynh Anh Trinh', '', 'Nữ', '106 Hoàng Quốc Viêt, Cầu Giấy, Hà Nội', '2023-02-02', '0967034958', '2023-02-16 14:33:29', '2023-02-16 14:33:29'),
(8, 'BN000008', 'Nguyễn Văn B', 'uploads/avatar/patient/1676649823_Screenshot 2023-01-11 at 19.26.00.png', 'Nam', 'Ngõ 28D Nguyễn Lương Bằng', '2018-07-05', '0918361624', '2023-02-17 23:03:44', '2023-02-17 23:03:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Xem danh sách giấy khám bệnh', 'web', '2023-02-08 16:34:26', '2023-02-08 16:34:26'),
(2, 'Xem thông tin giấy khám bệnh', 'web', '2023-02-08 16:34:27', '2023-02-08 16:34:27'),
(3, 'Thêm giấy khám bệnh', 'web', '2023-02-08 16:34:27', '2023-02-08 16:34:27'),
(4, 'Chỉnh sửa giấy khám bệnh', 'web', '2023-02-08 16:34:27', '2023-02-08 16:34:27'),
(5, 'Xóa giấy khám bệnh', 'web', '2023-02-08 16:34:27', '2023-02-08 16:34:27'),
(6, 'Kết luận khám giấy khám bệnh', 'web', '2023-02-08 16:34:27', '2023-02-08 16:34:27'),
(7, 'In giấy khám bệnh', 'web', '2023-02-08 16:34:27', '2023-02-08 16:34:27'),
(8, 'Kê đơn thuốc', 'web', '2023-02-08 16:34:27', '2023-02-08 16:34:27'),
(9, 'Xem danh sách đơn thuốc', 'web', '2023-02-08 16:34:28', '2023-02-08 16:34:28'),
(10, 'Xem thông tin đơn thuốc', 'web', '2023-02-08 16:34:28', '2023-02-08 16:34:28'),
(11, 'Thêm đơn thuốc', 'web', '2023-02-08 16:34:28', '2023-02-08 16:34:28'),
(12, 'Chỉnh sửa đơn thuốc', 'web', '2023-02-08 16:34:28', '2023-02-08 16:34:28'),
(13, 'Xóa đơn thuốc', 'web', '2023-02-08 16:34:28', '2023-02-08 16:34:28'),
(14, 'Xác nhận thanh toán đơn thuốc', 'web', '2023-02-08 16:34:28', '2023-02-08 16:34:28'),
(15, 'In đơn thuốc', 'web', '2023-02-08 16:34:28', '2023-02-08 16:34:28'),
(16, 'Xem danh sách phiếu dịch vụ', 'web', '2023-02-08 16:34:29', '2023-02-08 16:34:29'),
(17, 'Xem thông tin phiếu dịch vụ', 'web', '2023-02-08 16:34:29', '2023-02-08 16:34:29'),
(18, 'Thêm phiếu dịch vụ', 'web', '2023-02-08 16:34:29', '2023-02-08 16:34:29'),
(19, 'Chỉnh sửa phiếu dịch vụ', 'web', '2023-02-08 16:34:29', '2023-02-08 16:34:29'),
(20, 'Xóa phiếu dịch vụ', 'web', '2023-02-08 16:34:29', '2023-02-08 16:34:29'),
(21, 'Hoàn thành khám phiếu dịch vụ', 'web', '2023-02-08 16:34:29', '2023-02-08 16:34:29'),
(22, 'Kết luận khám phiếu dịch vụ', 'web', '2023-02-08 16:34:29', '2023-02-08 16:34:29'),
(23, 'In phiếu dịch vụ', 'web', '2023-02-08 16:34:29', '2023-02-08 16:34:29'),
(24, 'Xem danh sách phòng khám', 'web', '2023-02-08 16:34:30', '2023-02-08 16:34:30'),
(25, 'Thêm phòng khám', 'web', '2023-02-08 16:34:30', '2023-02-08 16:34:30'),
(26, 'Chỉnh sửa phòng khám', 'web', '2023-02-08 16:34:30', '2023-02-08 16:34:30'),
(27, 'Xóa phòng khám', 'web', '2023-02-08 16:34:30', '2023-02-08 16:34:30'),
(28, 'Xem danh sách dịch vụ khám', 'web', '2023-02-08 16:34:30', '2023-02-08 16:34:30'),
(29, 'Thêm dịch vụ khám', 'web', '2023-02-08 16:34:30', '2023-02-08 16:34:30'),
(30, 'Chỉnh sửa dịch vụ khám', 'web', '2023-02-08 16:34:30', '2023-02-08 16:34:30'),
(31, 'Xóa dịch vụ khám', 'web', '2023-02-08 16:34:30', '2023-02-08 16:34:30'),
(32, 'Xem danh sách loại thuốc', 'web', '2023-02-08 16:34:31', '2023-02-08 16:34:31'),
(33, 'Thêm loại thuốc', 'web', '2023-02-08 16:34:31', '2023-02-08 16:34:31'),
(34, 'Chỉnh sửa loại thuốc', 'web', '2023-02-08 16:34:31', '2023-02-08 16:34:31'),
(35, 'Xóa loại thuốc', 'web', '2023-02-08 16:34:31', '2023-02-08 16:34:31'),
(36, 'Xem danh sách thuốc', 'web', '2023-02-08 16:34:31', '2023-02-08 16:34:31'),
(37, 'Thêm thuốc', 'web', '2023-02-08 16:34:31', '2023-02-08 16:34:31'),
(38, 'Chỉnh sửa thuốc', 'web', '2023-02-08 16:34:31', '2023-02-08 16:34:31'),
(39, 'Xóa thuốc', 'web', '2023-02-08 16:34:31', '2023-02-08 16:34:31'),
(40, 'Xem danh sách bệnh nhân', 'web', '2023-02-08 16:34:32', '2023-02-08 16:34:32'),
(41, 'Thêm bệnh nhân', 'web', '2023-02-08 16:34:32', '2023-02-08 16:34:32'),
(42, 'Chỉnh sửa bệnh nhân', 'web', '2023-02-08 16:34:32', '2023-02-08 16:34:32'),
(43, 'Xóa bệnh nhân', 'web', '2023-02-08 16:34:32', '2023-02-08 16:34:32'),
(44, 'Xem danh sách thẻ BHYT', 'web', '2023-02-08 16:34:32', '2023-02-08 16:34:32'),
(45, 'Thêm thẻ BHYT', 'web', '2023-02-08 16:34:32', '2023-02-08 16:34:32'),
(46, 'Chỉnh sửa thẻ BHYT', 'web', '2023-02-08 16:34:32', '2023-02-08 16:34:32'),
(47, 'Xóa thẻ BHYT', 'web', '2023-02-08 16:34:32', '2023-02-08 16:34:32'),
(48, 'Xem danh sách tài khoản', 'web', '2023-02-08 16:34:32', '2023-02-08 16:34:32'),
(49, 'Thêm tài khoản', 'web', '2023-02-08 16:34:32', '2023-02-08 16:34:32'),
(50, 'Chỉnh sửa tài khoản', 'web', '2023-02-08 16:34:33', '2023-02-08 16:34:33'),
(51, 'Xóa tài khoản', 'web', '2023-02-08 16:34:33', '2023-02-08 16:34:33'),
(52, 'Xem danh sách vai trò', 'web', '2023-02-08 16:34:33', '2023-02-08 16:34:33'),
(53, 'Thêm vai trò', 'web', '2023-02-08 16:34:33', '2023-02-08 16:34:33'),
(54, 'Chỉnh sửa vai trò', 'web', '2023-02-08 16:34:33', '2023-02-08 16:34:33'),
(55, 'Xóa vai trò', 'web', '2023-02-08 16:34:33', '2023-02-08 16:34:33'),
(56, 'Xem danh sách quyền', 'web', '2023-02-08 16:34:33', '2023-02-08 16:34:33'),
(57, 'Xem quyền', 'web', '2023-02-08 16:34:34', '2023-02-08 16:34:34'),
(58, 'Chỉnh sửa quyền', 'web', '2023-02-08 16:34:34', '2023-02-08 16:34:34'),
(59, 'Xem thu ngân giấy khám bệnh', 'web', '2023-02-08 16:34:34', '2023-02-08 16:34:34'),
(60, 'Xem thu ngân phiếu dịch vụ', 'web', '2023-02-08 16:34:34', '2023-02-08 16:34:34'),
(61, 'Xác nhận thanh toán giấy khám bệnh', 'web', '2023-02-08 16:34:34', '2023-02-08 16:34:34'),
(62, 'Xác nhận thanh toán phiếu dịch vụ', 'web', '2023-02-08 16:34:34', '2023-02-08 16:34:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `health_certification_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `total_money` int(11) NOT NULL,
  `is_health_insurance_card` int(11) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `code`, `patient_id`, `health_certification_id`, `user_id`, `total_money`, `is_health_insurance_card`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DT000001', 2, 1, 2, 50000, 0, '1', '2023-02-13 18:20:31', '2023-02-13 18:21:41'),
(2, 'DT000002', 3, NULL, 2, 300000, 0, '1', '2023-02-16 13:35:38', '2023-02-16 13:36:36'),
(3, 'DT000003', 3, 2, 1, 600000, 0, '0', '2023-02-16 13:43:32', '2023-02-16 13:43:32'),
(4, 'DT000004', 5, 3, 2, 1000000, 0, '0', '2023-02-16 14:05:51', '2023-02-16 14:05:51'),
(5, 'DT000005', 8, NULL, 2, 750000, 0, '1', '2023-02-18 04:13:14', '2023-02-18 05:12:42'),
(6, 'DT000006', 3, 4, 2, 100000, 0, '0', '2023-02-21 20:34:55', '2023-02-21 20:34:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `prescription_details`
--

CREATE TABLE `prescription_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total_money` int(11) NOT NULL,
  `use` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `prescription_details`
--

INSERT INTO `prescription_details` (`id`, `prescription_id`, `medicine_id`, `amount`, `price`, `total_money`, `use`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 1, 50000, 50000, '1v/ngày', '2023-02-13 18:20:31', '2023-02-13 18:20:31'),
(2, 2, 4, 2, 50000, 100000, '2v/ngày', '2023-02-16 13:35:38', '2023-02-16 13:35:38'),
(3, 2, 4, 1, 50000, 50000, '3v/ngày', '2023-02-16 13:35:38', '2023-02-16 13:35:38'),
(4, 2, 4, 3, 50000, 150000, '2v/ngày', '2023-02-16 13:35:38', '2023-02-16 13:35:38'),
(5, 3, 4, 12, 50000, 600000, '2v/ngày', '2023-02-16 13:43:32', '2023-02-16 13:43:32'),
(6, 4, 6, 20, 50000, 1000000, '10v/ngày', '2023-02-16 14:05:51', '2023-02-16 14:05:51'),
(7, 5, 8, 30, 0, 0, 'Uống ngày 2 viên sau ăn', '2023-02-18 04:13:14', '2023-02-18 04:13:14'),
(8, 5, 7, 15, 50000, 750000, 'Uống ngày 1 viên trước ăn', '2023-02-18 04:13:14', '2023-02-18 04:13:14'),
(9, 6, 4, 2, 50000, 100000, 'uống', '2023-02-21 20:34:55', '2023-02-21 20:34:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2023-02-08 16:34:26', '2023-02-08 16:34:26'),
(2, 'Bác sỹ phòng khám', 'web', '2023-02-11 13:58:11', '2023-02-12 20:07:37'),
(3, 'Bác sỹ phòng dịch vụ', 'web', '2023-02-12 20:08:15', '2023-02-12 20:08:15'),
(4, 'Dược sỹ', 'web', '2023-02-12 20:08:33', '2023-02-13 17:25:33'),
(5, 'Lễ tân', 'web', '2023-02-12 20:08:42', '2023-02-13 17:25:17'),
(6, 'Thu ngân', 'web', '2023-02-12 20:08:53', '2023-02-12 20:08:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(14, 1),
(15, 1),
(15, 2),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(30, 2),
(31, 1),
(32, 1),
(33, 1),
(33, 2),
(34, 1),
(35, 1),
(36, 1),
(36, 2),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(42, 2),
(43, 1),
(44, 1),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service_vouchers`
--

CREATE TABLE `service_vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `medical_service_id` int(11) NOT NULL,
  `is_health_insurance_card` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_money` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `service_vouchers`
--

INSERT INTO `service_vouchers` (`id`, `code`, `patient_id`, `medical_service_id`, `is_health_insurance_card`, `user_id`, `start_date`, `end_date`, `total_money`, `status`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 'PDV000001', 3, 5, 0, 2, '2023-02-03', '2023-02-15', 0, 1, 1, '2023-02-16 13:37:30', '2023-02-16 13:45:32'),
(2, 'PDV000002', 2, 5, 0, 1, '2023-02-01', '2023-02-02', 0, 0, 1, '2023-02-16 13:38:00', '2023-03-01 07:44:25'),
(3, 'PDV000003', 3, 5, 0, 2, '2023-02-12', '2023-02-13', 0, 1, 1, '2023-02-16 13:47:01', '2023-02-16 13:48:30'),
(4, 'PDV000004', 5, 4, 0, 2, '2023-03-06', '2023-03-17', 200000, 0, 0, '2023-03-06 05:06:44', '2023-03-06 05:06:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service_voucher_details`
--

CREATE TABLE `service_voucher_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_voucher_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `result` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `service_voucher_details`
--

INSERT INTO `service_voucher_details` (`id`, `service_voucher_id`, `date`, `result`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-02-09', 'Bình thường', '2023-02-16 13:45:28', '2023-02-16 13:45:28'),
(2, 3, '2023-02-13', 'Bình thường', '2023-02-16 13:48:25', '2023-02-16 13:48:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `types`
--

INSERT INTO `types` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'LT000001', 'Thuốc tử', '2023-02-13 15:48:24', '2023-02-13 15:48:24'),
(2, 'LT000002', 'Kháng sinh', '2023-02-13 17:29:23', '2023-02-13 17:29:23'),
(3, 'LT000003', 'thuốc đau bụng', '2023-03-15 10:16:40', '2023-03-15 10:16:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `code`, `email`, `email_verified_at`, `password`, `birthday`, `gender`, `address`, `phone`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'ADMIN', 'vikhangksst@gmail.com', NULL, '$10$XZvbtXmSJyOhcMrcOHcXr.WEk0Elw4tOJ2HkdfJJykzQJZIRPOp3u', '1999-04-06', 'Nam', 'Thanh Xuân Hà Nội', '0398731623', NULL, NULL, '2023-02-08 16:34:26', '2023-02-08 16:34:26'),
(2, 'Vũ Minh Công', 'TK000002', 'minhcong.vu99@gmail.com', NULL, '$2y$10$UjR/551VipbftWer9zLvKeRqQ1sc.LbfHfTMI4WObD.v3cFbaWgJq', '1999-04-06', 'Nam', 'Ngõ 28D Lương ĐỊnh Của', '0918361623', 'uploads/avatar/user/1676098902_z3463384499110_3ca05c1b1d031d3ddbebf645bfdb3938.jpg', NULL, '2023-02-11 14:01:42', '2023-03-23 23:57:41'),
(3, 'Bùi Minh Ánh', 'TK000003', 'minhhanhh1709@gmail.com', NULL, '$2y$10$6AoDnDDl.VmHHLKjwah.SuyAJqgZR.aJO6N5eqefouXqRooXoacfm', '2000-09-17', 'Nữ', 'Long Biên, Hà Nội', '0918361623', '', NULL, '2023-03-15 07:33:15', '2023-03-15 07:33:15');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `consulting_rooms`
--
ALTER TABLE `consulting_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `health_certifications`
--
ALTER TABLE `health_certifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `health_insurance_cards`
--
ALTER TABLE `health_insurance_cards`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `medical_services`
--
ALTER TABLE `medical_services`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `prescription_details`
--
ALTER TABLE `prescription_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `service_vouchers`
--
ALTER TABLE `service_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `service_voucher_details`
--
ALTER TABLE `service_voucher_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `consulting_rooms`
--
ALTER TABLE `consulting_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `health_certifications`
--
ALTER TABLE `health_certifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `health_insurance_cards`
--
ALTER TABLE `health_insurance_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `medical_services`
--
ALTER TABLE `medical_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `prescription_details`
--
ALTER TABLE `prescription_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `service_vouchers`
--
ALTER TABLE `service_vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `service_voucher_details`
--
ALTER TABLE `service_voucher_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
