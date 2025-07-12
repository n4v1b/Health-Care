-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2024 at 02:40 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_quan_ly_kham_benh`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` bigint(20) UNSIGNED DEFAULT NULL,
  `medical_service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date_booking` date DEFAULT NULL,
  `time_booking` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `doctor_id`, `patient_id`, `medical_service_id`, `date_booking`, `time_booking`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 9, 3, '2024-05-18', '7:30-8:00', NULL, 1, '2024-05-18 05:15:37', '2024-05-18 09:38:33'),
(5, 4, 9, 4, '2024-05-19', '9:00-9:30', NULL, 2, '2024-05-18 10:32:14', '2024-05-18 10:43:31'),
(6, 4, 9, 4, '2024-05-19', '11:00-11:30', NULL, 1, '2024-05-18 10:34:18', '2024-05-18 10:36:17');

-- --------------------------------------------------------

--
-- Table structure for table `consulting_rooms`
--

CREATE TABLE `consulting_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consulting_rooms`
--

INSERT INTO `consulting_rooms` (`id`, `code`, `name`, `address`, `created_at`, `updated_at`) VALUES
(2, 'PK000002', 'Phòng Tai Mũi Họng', 'Hà Nội', '2023-02-12 20:18:59', '2023-04-25 16:41:57'),
(3, 'PK000003', 'Phòng Nội Soi', 'Thái bình', '2023-02-12 20:19:10', '2023-04-25 16:41:48'),
(4, 'PK000004', 'Phòng Chụp X-Quang', 'Hà Nội', '2023-02-12 20:19:27', '2023-04-27 10:22:28'),
(5, 'PK000005', 'Phòng Cấp Cứu', NULL, '2023-02-12 20:19:44', '2023-02-12 20:19:44'),
(6, 'PK000006', 'Phòng Xét Nghiệm', 'Hà Nội', '2023-02-12 20:20:32', '2023-04-27 03:51:03'),
(7, 'PK000007', 'Phòng Siêu Âm', NULL, '2023-02-15 15:11:50', '2023-02-15 15:11:50'),
(8, 'PK000008', 'Phòng khám thần kinh', NULL, '2023-02-18 08:39:53', '2023-02-18 08:39:53'),
(9, 'PK000009', 'Phòng khám tim mạch', NULL, '2023-02-18 08:40:09', '2023-02-18 08:40:09'),
(10, 'PK000010', 'Phòng răng hàm mặt', NULL, '2023-02-18 08:40:25', '2023-02-18 08:40:25'),
(11, 'PK000011', 'Phòng tiếp nhận bệnh nhân ung thư', NULL, '2023-02-18 08:40:53', '2023-02-18 08:40:53'),
(12, 'PK000012', 'Phòng phẫu thuật tiểu phẫu', NULL, '2023-02-18 08:41:22', '2023-02-18 08:41:22'),
(13, 'PK000013', 'Phòng giải phẫu bằng laze', NULL, '2023-02-18 08:41:51', '2023-02-18 08:41:51');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_certifications`
--

CREATE TABLE `health_certifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `consulting_room_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `medical_service_id` int(11) DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL DEFAULT 0,
  `conclude` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `treatment_guide` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suggestion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int(11) NOT NULL,
  `total_money` double(24,2) DEFAULT NULL,
  `is_health_insurance_card` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `re_examination_date` date DEFAULT NULL,
  `diagnostic` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `health_certifications`
--

INSERT INTO `health_certifications` (`id`, `title`, `patient_id`, `consulting_room_id`, `user_id`, `medical_service_id`, `code`, `status`, `payment_status`, `conclude`, `treatment_guide`, `suggestion`, `number`, `total_money`, `is_health_insurance_card`, `start_date`, `end_date`, `re_examination_date`, `diagnostic`, `created_at`, `updated_at`) VALUES
(1, 'Tổng Quát', 2, 6, 2, NULL, 'GKB000001', 1, 1, '<p>bình thường</p>', '<p>đi bệnh viện</p>', NULL, 1, 300000.00, 0, NULL, NULL, NULL, NULL, '2023-02-13 18:14:36', '2023-02-13 18:19:19'),
(2, 'Cấp Cứu', 3, 5, 1, NULL, 'GKB000002', 1, 1, '<p>K việc gì</p>', '<p>Về nhà</p>', NULL, 1, 123000.00, 0, NULL, NULL, NULL, NULL, '2023-02-15 15:23:48', '2023-02-16 13:43:01'),
(3, 'Nội soi', 5, 2, 2, NULL, 'GKB000003', 1, 1, '<p>Bị ung thư</p>', '<p>K cứu được</p>', NULL, 2, 300000.00, 0, NULL, NULL, NULL, NULL, '2023-02-15 15:38:50', '2023-02-16 14:05:14'),
(4, 'Xét Nghiệm', 3, 3, 2, NULL, 'GKB000004', 1, 1, '<p>Bình thường</p>', '<p>Thể dục thể thao điều độ! Uống nhiều nước!</p>', '<p>6 tháng sau quay lại tái khám.</p>', 1, 2300000.00, 0, NULL, NULL, NULL, NULL, '2023-02-16 13:15:32', '2023-02-17 23:59:13'),
(6, 'Xét nghiệm máu', 8, 6, 2, NULL, 'GKB000006', 1, 1, '<p>Âm tính với các loại bệnh truyền nhiễm</p><p>Nồng độ axit uric trong máu cao</p>', '<p>Tăng cường hoạt động thể dục thể thao, uống nhiều nước và hạn chế ăn nhiều chất đạm</p>', '<p>6 tháng sau đi xét nghiệm lại</p>', 1, 500000.00, 0, NULL, NULL, NULL, NULL, '2023-02-17 23:04:53', '2023-03-01 07:48:45'),
(7, 'Đỗ Văn A', 2, 3, 2, NULL, 'GKB000007', 1, 1, 'Không vấn đề gì&nbsp;', '<p>Về nhà ăn uống ngủ nghỉ sinh hoạt điều độ</p>', '<p>6 tháng sau quay lại khám</p>', 1, 200000.00, 0, NULL, NULL, NULL, NULL, '2023-02-21 20:30:22', '2023-03-27 22:20:56'),
(8, NULL, 8, 4, 2, 8, 'GKB000008', 1, 1, '<p>Có triệu chứng nhẹ</p>', '<p>Có triệu chứng nhẹ<br></p>', '<p>Có triệu chứng nhẹ<br></p>', 1, 234.00, 0, '2023-04-27', '2023-04-29', NULL, NULL, '2023-03-06 05:01:13', '2023-04-27 10:07:20'),
(9, NULL, 5, 5, 3, 5, 'GKB000009', 1, 1, '<h4 class=\"card-title mb-3\">Kết quả khám</h4>', '<h4 class=\"card-title mb-3\">Kết quả khám</h4>', '<h4 class=\"card-title mb-3\">Kết quả khám</h4>', 1, 0.00, 0, '2023-04-29', '2023-05-02', '2023-04-29', NULL, '2023-03-25 00:53:37', '2023-04-27 10:18:04'),
(10, NULL, 3, 3, 4, 8, 'GKB000010', 1, 1, '<p><span style=\"color: rgb(73, 80, 87);\">Kết luận&nbsp;</span><span class=\"text-danger\">*</span><br></p>', '<p><span style=\"color: rgb(73, 80, 87);\">Kết luận&nbsp;</span><span class=\"text-danger\">*</span><br></p>', '<p><span style=\"color: rgb(73, 80, 87);\">Kết luận&nbsp;</span><span class=\"text-danger\">*</span><br></p>', 1, 0.00, 1, '2023-04-28', '2023-04-30', '2023-04-30', '<p>dfsdfsdfsdfsd</p>', '2023-04-27 03:12:25', '2023-04-27 15:37:59'),
(11, NULL, 7, 3, NULL, 8, 'GKB000011', 0, 0, NULL, NULL, NULL, 2, 234.00, 0, '2023-04-28', '2023-04-30', NULL, NULL, '2023-04-27 04:32:54', '2023-04-27 04:32:54'),
(12, NULL, 2, 4, 3, 8, 'GKB000012', 0, 0, NULL, NULL, NULL, 3, 234.00, 0, '2023-04-27', '2023-04-30', NULL, NULL, '2023-04-27 04:37:27', '2023-04-27 04:37:27'),
(13, NULL, 7, 4, 4, 8, 'GKB000013', 1, 1, '<p>ffgdf</p>', '<p>fgdfgdf</p>', '<p>dsdsfsd</p>', 1, 234.00, 0, '2023-10-08', '2023-10-08', '1970-01-01', '<p>nội dung khám</p>', '2023-10-07 12:23:02', '2023-10-07 12:24:35'),
(14, NULL, 7, 5, 4, 5, 'GKB000014', 0, 0, NULL, NULL, NULL, 1, 0.00, 0, '2023-12-11', '2023-12-12', NULL, NULL, '2023-12-10 08:04:59', '2023-12-10 08:04:59'),
(15, NULL, 3, 3, 2, 8, 'GKB000015', 1, 1, '<p>Kết quả khám</p>', '<p>điều trị</p>', '<p>đề nghi khám lại&nbsp;</p>', 1, 0.00, 1, '2024-03-28', '2024-03-29', '1970-01-01', '<p>thôn tin người bệnh bắt đầu khám</p><p>chiệu trứng gì&nbsp;</p>', '2024-03-26 14:04:07', '2024-03-26 14:09:28'),
(16, NULL, 7, 6, 4, 5, 'GKB000016', 2, 1, NULL, NULL, NULL, 2, 0.00, 0, '2024-03-27', '2024-03-28', NULL, '<p><span style=\"color: rgb(34, 34, 34); font-family: &quot;Times New Roman&quot;, Georgia, serif; font-size: 17px;\">Ngay cả khi bạn che tên họ và mã đặt chỗ nhưng không có nghĩa là bạn đã được an toàn. Tất cả thông tin đặt chỗ đều nằm ở phần mã vạch trên thẻ lên máy bay. Không chỉ nội bộ hãng hàng không mới có thể truy cập thông tin từ mã vạch này mà tất cả những ai có quyền truy cập Internet đều làm được. Chỉ cần chụp lại màn hình tấm ảnh check-in với thẻ lên máy bay sau đó tải nó lên một trang web chuyên đọc mã vạch là có thể thu được tất cả thông tin từ đó.</span><br></p>', '2024-03-26 14:26:30', '2024-04-18 03:28:49'),
(17, NULL, 3, 3, 2, 8, 'GKB000017', 1, 1, '<div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"margin: 0.5em 0px 0px; white-space-collapse: preserve; overflow-wrap: break-word; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\">Vợ là người vì yêu thương chồng mà h.y sinh mọi thứ, đừng xem vợ là k.ẻ thù, là đối tượng để nhất định phải chiến thắng, hơn thua!</div><div dir=\"auto\" style=\"font-family: inherit;\">Với đàn ông, có hai điều nhất định phải làm được, một là trách nhiệm làm trụ cột tài chính, mỗi tháng đều đưa tiền cho vợ, hai là trách nhiệm với cảm xúc của vợ mình.</div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"margin: 0.5em 0px 0px; white-space-collapse: preserve; overflow-wrap: break-word; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\">Nên <span style=\"font-family: inherit;\"><a tabindex=\"-1\" style=\"color: rgb(56, 88, 152); cursor: pointer; font-family: inherit;\"></a></span>nhớ, vợ là người vì yêu thương mình mà h.y s.inh cả thanh xuân, nhan sắc, tự do, tuyệt đối không phải đ.ố.i thủ. Đàn ông hơn thua với ai cũng được nhưng tuyệt đối đừng bao giờ tìm cách hơn thua với vợ.</div><div dir=\"auto\" style=\"font-family: inherit;\">Phụ nữ lấy chồng, thiệt thòi đủ đường, chồng có thấu?</div><div dir=\"auto\" style=\"font-family: inherit;\">Phụ nữ lấy chồng, trước tiên là một thân một mình rời xa cha mẹ, anh chị em, rời xa căn nhà thân yêu để đến với một thế giới hoàn toàn xa lạ, chỉ có một điểm tựa duy nhất, ấy là chồng. Cuộc sống hơn 20 năm, bỗng chốc bị thay đổi trong nháy mắt.</div><div dir=\"auto\" style=\"font-family: inherit;\">Ở đó, cô ấy phải cố gắng làm hài lòng người khác, phải miễn cưỡng gượng cười, miễn cưỡng vui vẻ. Từ một cô gái tự do vô ưu vô lo, được bố mẹ chiều chuộng như công chúa nay lại phải nhìn sắc mặt người khác mà sống.</div></div>', '<div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"margin: 0.5em 0px 0px; white-space-collapse: preserve; overflow-wrap: break-word; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\">Vợ là người vì yêu thương chồng mà h.y sinh mọi thứ, đừng xem vợ là k.ẻ thù, là đối tượng để nhất định phải chiến thắng, hơn thua!</div><div dir=\"auto\" style=\"font-family: inherit;\">Với đàn ông, có hai điều nhất định phải làm được, một là trách nhiệm làm trụ cột tài chính, mỗi tháng đều đưa tiền cho vợ, hai là trách nhiệm với cảm xúc của vợ mình.</div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"margin: 0.5em 0px 0px; white-space-collapse: preserve; overflow-wrap: break-word; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\">Nên <span style=\"font-family: inherit;\"><a tabindex=\"-1\" style=\"color: rgb(56, 88, 152); cursor: pointer; font-family: inherit;\"></a></span>nhớ, vợ là người vì yêu thương mình mà h.y s.inh cả thanh xuân, nhan sắc, tự do, tuyệt đối không phải đ.ố.i thủ. Đàn ông hơn thua với ai cũng được nhưng tuyệt đối đừng bao giờ tìm cách hơn thua với vợ.</div><div dir=\"auto\" style=\"font-family: inherit;\">Phụ nữ lấy chồng, thiệt thòi đủ đường, chồng có thấu?</div><div dir=\"auto\" style=\"font-family: inherit;\">Phụ nữ lấy chồng, trước tiên là một thân một mình rời xa cha mẹ, anh chị em, rời xa căn nhà thân yêu để đến với một thế giới hoàn toàn xa lạ, chỉ có một điểm tựa duy nhất, ấy là chồng. Cuộc sống hơn 20 năm, bỗng chốc bị thay đổi trong nháy mắt.</div><div dir=\"auto\" style=\"font-family: inherit;\">Ở đó, cô ấy phải cố gắng làm hài lòng người khác, phải miễn cưỡng gượng cười, miễn cưỡng vui vẻ. Từ một cô gái tự do vô ưu vô lo, được bố mẹ chiều chuộng như công chúa nay lại phải nhìn sắc mặt người khác mà sống.</div></div>', '<div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"margin: 0.5em 0px 0px; white-space-collapse: preserve; overflow-wrap: break-word; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\">Vợ là người vì yêu thương chồng mà h.y sinh mọi thứ, đừng xem vợ là k.ẻ thù, là đối tượng để nhất định phải chiến thắng, hơn thua!</div><div dir=\"auto\" style=\"font-family: inherit;\">Với đàn ông, có hai điều nhất định phải làm được, một là trách nhiệm làm trụ cột tài chính, mỗi tháng đều đưa tiền cho vợ, hai là trách nhiệm với cảm xúc của vợ mình.</div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"margin: 0.5em 0px 0px; white-space-collapse: preserve; overflow-wrap: break-word; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\">Nên <span style=\"font-family: inherit;\"><a tabindex=\"-1\" style=\"color: rgb(56, 88, 152); cursor: pointer; font-family: inherit;\"></a></span>nhớ, vợ là người vì yêu thương mình mà h.y s.inh cả thanh xuân, nhan sắc, tự do, tuyệt đối không phải đ.ố.i thủ. Đàn ông hơn thua với ai cũng được nhưng tuyệt đối đừng bao giờ tìm cách hơn thua với vợ.</div><div dir=\"auto\" style=\"font-family: inherit;\">Phụ nữ lấy chồng, thiệt thòi đủ đường, chồng có thấu?</div><div dir=\"auto\" style=\"font-family: inherit;\">Phụ nữ lấy chồng, trước tiên là một thân một mình rời xa cha mẹ, anh chị em, rời xa căn nhà thân yêu để đến với một thế giới hoàn toàn xa lạ, chỉ có một điểm tựa duy nhất, ấy là chồng. Cuộc sống hơn 20 năm, bỗng chốc bị thay đổi trong nháy mắt.</div><div dir=\"auto\" style=\"font-family: inherit;\">Ở đó, cô ấy phải cố gắng làm hài lòng người khác, phải miễn cưỡng gượng cười, miễn cưỡng vui vẻ. Từ một cô gái tự do vô ưu vô lo, được bố mẹ chiều chuộng như công chúa nay lại phải nhìn sắc mặt người khác mà sống.</div></div>', 1, 188.00, 1, '2024-03-30', '2024-03-30', '1970-01-01', '<ul class=\"list-unstyled clearfix box-new-old\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 14px; text-align: justify;\"><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/nhung-cach-tinh-thuong-doanh-thu-doanh-so-thu-thuat-danh-cho-phong-kham-nha-khoa-id32083.html\" title=\"Những cách tính thưởng doanh thu, doanh số, thủ thuật dành cho Phòng khám nha khoa\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Những cách tính thưởng doanh thu, doanh số, thủ thuật dành cho Phòng khám nha khoa</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/mau-ke-hoach-dieu-tri-benh-nhan-danh-cho-phong-kham-nha-khoa-id32082.html\" title=\"Mẫu kế hoạch điều trị bệnh nhân dành cho Phòng khám nha khoa\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Mẫu kế hoạch điều trị bệnh nhân dành cho Phòng khám nha khoa</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/huong-dan-cach-nhan-biet-rang-chom-bi-sau-de-xu-ly-kip-thoi-id32081.html\" title=\"Hướng dẫn cách nhận biết răng chớm bị sâu để xử lý kịp thời.\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Hướng dẫn cách nhận biết răng chớm bị sâu để xử lý kịp thời.</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/cac-phong-kham-nha-khoa-uy-tin-tai-bac-ninh-id32080.html\" title=\"Các phòng khám nha khoa uy tín tại Bắc Ninh\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Các phòng khám nha khoa uy tín tại Bắc Ninh</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/nhung-mau-tin-nhan-chuc-tet-khach-hang-cuc-hay-danh-cho-phong-kham-nha-khoa-id32079.html\" title=\"Những mẫu tin nhắn chúc tết khách hàng cực hay dành cho Phòng khám nha khoa\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Những mẫu tin nhắn chúc tết khách hàng cực hay dành cho Phòng khám nha khoa</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/nhung-ky-thuat-pham-vi-hoat-dong-chuyen-mon-doi-voi-nguoi-hanh-nghe-rang-ham-mat-id32078.html\" title=\"Những kỹ thuât, phạm vi hoạt động chuyên môn đối với người hành nghề Răng - Hàm - Mặt\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Những kỹ thuât, phạm vi hoạt động chuyên môn đối với người hành nghề Răng - Hàm - Mặt</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/phong-kham-nha-khoa-duoc-thuc-hien-nhung-ky-thuat-chuyen-mon-nao-id32077.html\" title=\"Phòng khám nha khoa được thực hiện những kỹ thuật chuyên môn nào?\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Phòng khám nha khoa được thực hiện những kỹ thuật chuyên môn nào?</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/nhung-mau-cau-tieng-anh-thong-dung-duoc-dung-tai-phong-kham-nha-khoa-id32076.html\" title=\"Những mẫu câu tiếng Anh thông dụng được dùng tại phòng khám nha khoa\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Những mẫu câu tiếng Anh thông dụng được dùng tại phòng khám nha khoa</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/10-cach-de-thu-hut-khach-hang-den-phong-kham-nha-khoa-cuc-don-gian-id32075.html\" title=\"10 Cách để thu hút khách hàng đến Phòng khám nha khoa cực đơn giản\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">10 Cách để thu hút khách hàng đến Phòng khám nha khoa cực đơn giản</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/muc-thue-khoan-khi-mo-phong-kham-nha-khoa-duoi-hinh-thuc-ho-kinh-doanh-ca-the-id32074.html\" title=\"Mức thuế khoán khi mở phòng khám nha khoa dưới hình thức hộ kinh doanh cá thể ?\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Mức thuế khoán khi mở phòng khám nha khoa dưới hình thức hộ kinh doanh cá thể ?</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/nhung-cach-tinh-thuong-doanh-thu-doanh-so-thu-thuat-danh-cho-phong-kham-nha-khoa-id32083.html\" title=\"Những cách tính thưởng doanh thu, doanh số, thủ thuật dành cho Phòng khám nha khoa\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Những cách tính thưởng doanh thu, doanh số, thủ thuật dành cho Phòng khám nha khoa</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/mau-ke-hoach-dieu-tri-benh-nhan-danh-cho-phong-kham-nha-khoa-id32082.html\" title=\"Mẫu kế hoạch điều trị bệnh nhân dành cho Phòng khám nha khoa\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Mẫu kế hoạch điều trị bệnh nhân dành cho Phòng khám nha khoa</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/huong-dan-cach-nhan-biet-rang-chom-bi-sau-de-xu-ly-kip-thoi-id32081.html\" title=\"Hướng dẫn cách nhận biết răng chớm bị sâu để xử lý kịp thời.\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Hướng dẫn cách nhận biết răng chớm bị sâu để xử lý kịp thời.</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/cac-phong-kham-nha-khoa-uy-tin-tai-bac-ninh-id32080.html\" title=\"Các phòng khám nha khoa uy tín tại Bắc Ninh\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Các phòng khám nha khoa uy tín tại Bắc Ninh</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/nhung-mau-tin-nhan-chuc-tet-khach-hang-cuc-hay-danh-cho-phong-kham-nha-khoa-id32079.html\" title=\"Những mẫu tin nhắn chúc tết khách hàng cực hay dành cho Phòng khám nha khoa\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Những mẫu tin nhắn chúc tết khách hàng cực hay dành cho Phòng khám nha khoa</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/nhung-ky-thuat-pham-vi-hoat-dong-chuyen-mon-doi-voi-nguoi-hanh-nghe-rang-ham-mat-id32078.html\" title=\"Những kỹ thuât, phạm vi hoạt động chuyên môn đối với người hành nghề Răng - Hàm - Mặt\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Những kỹ thuât, phạm vi hoạt động chuyên môn đối với người hành nghề Răng - Hàm - Mặt</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/phong-kham-nha-khoa-duoc-thuc-hien-nhung-ky-thuat-chuyen-mon-nao-id32077.html\" title=\"Phòng khám nha khoa được thực hiện những kỹ thuật chuyên môn nào?\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Phòng khám nha khoa được thực hiện những kỹ thuật chuyên môn nào?</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/nhung-mau-cau-tieng-anh-thong-dung-duoc-dung-tai-phong-kham-nha-khoa-id32076.html\" title=\"Những mẫu câu tiếng Anh thông dụng được dùng tại phòng khám nha khoa\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Những mẫu câu tiếng Anh thông dụng được dùng tại phòng khám nha khoa</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/10-cach-de-thu-hut-khach-hang-den-phong-kham-nha-khoa-cuc-don-gian-id32075.html\" title=\"10 Cách để thu hút khách hàng đến Phòng khám nha khoa cực đơn giản\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">10 Cách để thu hút khách hàng đến Phòng khám nha khoa cực đơn giản</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/muc-thue-khoan-khi-mo-phong-kham-nha-khoa-duoi-hinh-thuc-ho-kinh-doanh-ca-the-id32074.html\" title=\"Mức thuế khoán khi mở phòng khám nha khoa dưới hình thức hộ kinh doanh cá thể ?\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Mức thuế khoán khi mở phòng khám nha khoa dưới hình thức hộ kinh doanh cá thể ?</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/nhung-cach-tinh-thuong-doanh-thu-doanh-so-thu-thuat-danh-cho-phong-kham-nha-khoa-id32083.html\" title=\"Những cách tính thưởng doanh thu, doanh số, thủ thuật dành cho Phòng khám nha khoa\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Những cách tính thưởng doanh thu, doanh số, thủ thuật dành cho Phòng khám nha khoa</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/mau-ke-hoach-dieu-tri-benh-nhan-danh-cho-phong-kham-nha-khoa-id32082.html\" title=\"Mẫu kế hoạch điều trị bệnh nhân dành cho Phòng khám nha khoa\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Mẫu kế hoạch điều trị bệnh nhân dành cho Phòng khám nha khoa</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/huong-dan-cach-nhan-biet-rang-chom-bi-sau-de-xu-ly-kip-thoi-id32081.html\" title=\"Hướng dẫn cách nhận biết răng chớm bị sâu để xử lý kịp thời.\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Hướng dẫn cách nhận biết răng chớm bị sâu để xử lý kịp thời.</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/cac-phong-kham-nha-khoa-uy-tin-tai-bac-ninh-id32080.html\" title=\"Các phòng khám nha khoa uy tín tại Bắc Ninh\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Các phòng khám nha khoa uy tín tại Bắc Ninh</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/nhung-mau-tin-nhan-chuc-tet-khach-hang-cuc-hay-danh-cho-phong-kham-nha-khoa-id32079.html\" title=\"Những mẫu tin nhắn chúc tết khách hàng cực hay dành cho Phòng khám nha khoa\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Những mẫu tin nhắn chúc tết khách hàng cực hay dành cho Phòng khám nha khoa</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/nhung-ky-thuat-pham-vi-hoat-dong-chuyen-mon-doi-voi-nguoi-hanh-nghe-rang-ham-mat-id32078.html\" title=\"Những kỹ thuât, phạm vi hoạt động chuyên môn đối với người hành nghề Răng - Hàm - Mặt\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Những kỹ thuât, phạm vi hoạt động chuyên môn đối với người hành nghề Răng - Hàm - Mặt</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/phong-kham-nha-khoa-duoc-thuc-hien-nhung-ky-thuat-chuyen-mon-nao-id32077.html\" title=\"Phòng khám nha khoa được thực hiện những kỹ thuật chuyên môn nào?\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Phòng khám nha khoa được thực hiện những kỹ thuật chuyên môn nào?</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/nhung-mau-cau-tieng-anh-thong-dung-duoc-dung-tai-phong-kham-nha-khoa-id32076.html\" title=\"Những mẫu câu tiếng Anh thông dụng được dùng tại phòng khám nha khoa\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Những mẫu câu tiếng Anh thông dụng được dùng tại phòng khám nha khoa</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/10-cach-de-thu-hut-khach-hang-den-phong-kham-nha-khoa-cuc-don-gian-id32075.html\" title=\"10 Cách để thu hút khách hàng đến Phòng khám nha khoa cực đơn giản\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">10 Cách để thu hút khách hàng đến Phòng khám nha khoa cực đơn giản</a></li><li style=\"margin: 0px 0px 5px; padding: 0px 0px 0px 15px; position: relative;\"><a class=\"c_black\" href=\"https://bambufit.vn/muc-thue-khoan-khi-mo-phong-kham-nha-khoa-duoi-hinh-thuc-ho-kinh-doanh-ca-the-id32074.html\" title=\"Mức thuế khoán khi mở phòng khám nha khoa dưới hình thức hộ kinh doanh cá thể ?\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">Mức thuế khoán khi mở phòng khám nha khoa dưới hình thức hộ kinh doanh cá thể ?</a></li></ul>', '2024-03-29 15:07:35', '2024-04-11 15:42:26'),
(18, NULL, 9, 5, 4, 5, 'GKB000018', 0, 0, NULL, NULL, NULL, 1, 0.00, 0, '2024-05-02', '2024-05-22', NULL, NULL, '2024-05-17 19:54:43', '2024-05-17 19:54:43');

-- --------------------------------------------------------

--
-- Table structure for table `health_insurance_cards`
--

CREATE TABLE `health_insurance_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hospital` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `use_value` date NOT NULL,
  `id_card` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_issue` date NOT NULL,
  `issued_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `health_insurance_cards`
--

INSERT INTO `health_insurance_cards` (`id`, `patient_id`, `code`, `hospital`, `use_value`, `id_card`, `date_of_issue`, `issued_by`, `created_at`, `updated_at`) VALUES
(1, 3, 'BHYT000001', 'Bạch  Mai', '2025-11-20', '12300', '2023-02-01', 'HN', '2023-02-13 18:21:30', '2023-04-24 14:37:43');

-- --------------------------------------------------------

--
-- Table structure for table `medical_services`
--

CREATE TABLE `medical_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(24,2) DEFAULT NULL,
  `type` tinyint(4) DEFAULT 1,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medical_services`
--

INSERT INTO `medical_services` (`id`, `code`, `name`, `price`, `type`, `description`, `created_at`, `updated_at`) VALUES
(3, 'DV000003', 'Điện tâm đồ tim mạch', 500000.00, 2, NULL, '2023-02-14 16:32:02', '2023-04-25 17:30:30'),
(4, 'DV000004', 'Xét nghiệm máu', 200000.00, 2, NULL, '2023-02-14 16:32:40', '2023-04-25 17:30:39'),
(5, 'DV000005', 'Tổng Quát', 0.00, 1, NULL, '2023-02-15 15:13:06', '2023-02-15 15:13:06'),
(6, 'DV000006', 'sadsad', 435635345.00, 2, '<p>sadasdasdas</p>', '2023-04-25 16:24:51', '2023-04-25 16:24:51'),
(8, 'DV000008', 'asadasdas', 234.00, 1, '<p>đâsdsad</p>', '2023-04-25 16:57:41', '2023-04-25 16:57:41');

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(24,2) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`id`, `code`, `name`, `description`, `price`, `type_id`, `unit`, `created_at`, `updated_at`) VALUES
(4, 'T000004', 'abc11', '<p>Thuốc không có tác dụng</p>', 50000.00, 2, 'VNĐ', '2023-02-13 17:32:56', '2023-02-15 15:16:11'),
(6, 'T000006', 'abc11', NULL, 50000.00, 2, 'VNĐ', '2023-02-16 13:49:23', '2023-02-16 13:49:23'),
(7, 'T000007', 'abc11', NULL, 50000.00, 1, 'VNĐ', '2023-02-16 14:27:11', '2023-02-16 14:27:49'),
(8, 'T000008', 'Healing', NULL, 0.00, 2, 'VNĐ', '2023-02-16 14:29:15', '2023-02-16 14:29:15');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
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
(15, '2021_10_14_130327_create_permission_tables', 1),
(16, '2023_03_04_131004_change_column_integer_to_double', 2),
(17, '2023_04_25_233225_create_service_rooms_table', 2),
(19, '2023_04_25_233546_add_address_to_consulting_rooms_table', 3),
(20, '2023_04_26_220158_add_collum_to_service_vouchers_table', 4),
(21, '2023_04_26_222141_add_result_file_to_service_voucher_details_table', 5),
(22, '2023_04_26_232817_add_collum_to_health_certifications_table', 6),
(23, '2023_04_27_173050_create_departments_table', 7),
(25, '2023_04_27_225857_add_consulting_room_id_to_users_table', 8),
(26, '2024_05_17_012251_create_schedules_table', 9),
(27, '2024_05_17_012423_create_schedule_times_table', 9),
(29, '2024_05_18_082704_create_bookings_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 4),
(6, 'App\\Models\\User', 3),
(8, 'App\\Models\\User', 4),
(9, 'App\\Models\\User', 4),
(10, 'App\\Models\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `code`, `name`, `email`, `password`, `avatar`, `gender`, `address`, `birthday`, `phone`, `created_at`, `updated_at`) VALUES
(2, 'BN000002', 'Van A', NULL, NULL, '', 'Nam', '106 Hoàng Quốc Viêt, Cầu Giấy, Hà Nội', '2023-02-08', '1234567891', '2023-02-13 17:16:16', '2023-02-13 17:16:16'),
(3, 'BN000003', 'Anh Quỳnh', NULL, NULL, '', 'Nữ', '106 Hoàng Quốc Viêt, Cầu Giấy, Hà Nội', '2023-02-09', '0967034951', '2023-02-13 17:16:43', '2023-02-16 13:41:14'),
(5, 'BN000005', 'Quynh Anh Trinh', NULL, NULL, '', 'Nữ', '106 Hoàng Quốc Viêt, Cầu Giấy, Hà Nội', '2023-02-02', '0967034958', '2023-02-16 13:51:44', '2023-02-16 13:51:44'),
(7, 'BN000007', 'Quynh Anh Trinh', NULL, NULL, '', 'Nữ', '106 Hoàng Quốc Viêt, Cầu Giấy, Hà Nội', '2023-02-02', '0967034958', '2023-02-16 14:33:29', '2023-02-16 14:33:29'),
(8, 'BN000008', 'Nguyễn Văn B', 'nguyenvanb@gmail.com', NULL, 'uploads/avatar/patient/1676649823_Screenshot 2023-01-11 at 19.26.00.png', 'Nam', 'Ngõ 28D Nguyễn Lương Bằng', '2018-07-05', '0918361624', '2023-02-17 23:03:44', '2024-05-17 19:19:37'),
(9, 'BN000009', 'Nguyễn văn Dược', 'duocnvoitt@gmail.com', '12345678', 'uploads/avatar/patient/1715974325_Untitled-1.jpg', 'Nam', 'Hà nội', '2024-05-17', '0928817228', '2024-05-17 19:32:06', '2024-05-17 19:32:06'),
(10, 'BN000010', 'Nguyễn Văn A', 'nguyenvana@gmail.com', '12345678', '', 'Nam', 'Hà nội', '2024-05-01', '0928817558', '2024-05-17 19:45:24', '2024-05-17 19:45:24');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
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
(62, 'Xác nhận thanh toán phiếu dịch vụ', 'web', '2023-02-08 16:34:34', '2023-02-08 16:34:34'),
(63, 'Danh sách phòng ban', 'web', '2023-04-27 16:20:42', '2023-04-27 16:20:42'),
(64, 'Tạo mới phòng ban', 'web', '2023-04-27 16:20:42', '2023-04-27 16:20:42'),
(65, 'Chỉnh sửa phòng ban', 'web', '2023-04-27 16:20:42', '2023-04-27 16:20:42'),
(66, 'Xóa phòng ban', 'web', '2023-04-27 16:20:42', '2023-04-27 16:20:42'),
(67, 'Quản lý báo cáo', 'web', NULL, NULL),
(68, 'Danh sách lịch làm việc', 'web', '2024-05-17 18:39:50', '2024-05-17 18:39:50'),
(69, 'Thêm mới lịch làm việc', 'web', NULL, NULL),
(70, 'Chỉnh sửa lịch làm việc', 'web', '2024-05-17 18:40:39', '2024-05-17 18:40:39'),
(71, 'Xóa lịch làm việc', 'web', '2024-05-17 18:40:39', '2024-05-17 18:40:39'),
(72, 'Bắt đầu khám', 'web', '2024-05-17 19:56:55', '2024-05-17 19:56:55'),
(73, 'Danh sách lịch khám', 'web', '2024-05-18 05:08:05', '2024-05-18 05:08:05'),
(74, 'Thêm mới lịch khám', 'web', '2024-05-18 05:08:05', '2024-05-18 05:08:05'),
(75, 'Chỉnh sửa lịch khám', 'web', '2024-05-18 05:08:52', '2024-05-18 05:08:52'),
(76, 'Xóa lịch khám', 'web', '2024-05-18 05:08:52', '2024-05-18 05:08:52'),
(77, 'Danh sách lịch khám của bạn', 'web', '2024-05-18 09:28:22', '2024-05-18 09:28:22'),
(78, 'Cập nhật trạng thái lịch khám hẹn trước', 'web', '2024-05-18 09:34:07', '2024-05-18 09:34:07');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` int(11) NOT NULL,
  `health_certification_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `total_money` double(24,2) DEFAULT NULL,
  `is_health_insurance_card` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `code`, `patient_id`, `health_certification_id`, `user_id`, `total_money`, `is_health_insurance_card`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DT000001', 2, 1, 2, 50000.00, 0, '1', '2023-02-13 18:20:31', '2023-02-13 18:21:41'),
(2, 'DT000002', 3, NULL, 2, 300000.00, 0, '1', '2023-02-16 13:35:38', '2023-02-16 13:36:36'),
(3, 'DT000003', 3, 2, 1, 600000.00, 0, '0', '2023-02-16 13:43:32', '2023-02-16 13:43:32'),
(4, 'DT000004', 5, 3, 2, 1000000.00, 0, '1', '2023-02-16 14:05:51', '2024-04-18 03:49:09'),
(5, 'DT000005', 8, NULL, 2, 750000.00, 0, '1', '2023-02-18 04:13:14', '2023-02-18 05:12:42'),
(6, 'DT000006', 3, 4, 2, 80000.00, 1, '1', '2023-02-21 20:34:55', '2024-04-06 03:55:42'),
(7, 'DT000007', 7, 13, 4, 600000.00, 0, '1', '2023-10-07 12:25:09', '2024-03-29 15:32:38'),
(8, 'DT000008', 3, NULL, 2, 400000.00, 1, '1', '2024-03-29 15:38:35', '2024-03-29 15:40:12'),
(9, 'DT000009', 9, NULL, 4, 50000.00, 0, '0', '2024-05-17 19:59:10', '2024-05-17 19:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `prescription_details`
--

CREATE TABLE `prescription_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` double(24,2) DEFAULT NULL,
  `total_money` double(24,2) DEFAULT NULL,
  `use` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prescription_details`
--

INSERT INTO `prescription_details` (`id`, `prescription_id`, `medicine_id`, `amount`, `price`, `total_money`, `use`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 1, 50000.00, 50000.00, '1v/ngày', '2023-02-13 18:20:31', '2023-02-13 18:20:31'),
(2, 2, 4, 2, 50000.00, 100000.00, '2v/ngày', '2023-02-16 13:35:38', '2023-02-16 13:35:38'),
(3, 2, 4, 1, 50000.00, 50000.00, '3v/ngày', '2023-02-16 13:35:38', '2023-02-16 13:35:38'),
(4, 2, 4, 3, 50000.00, 150000.00, '2v/ngày', '2023-02-16 13:35:38', '2023-02-16 13:35:38'),
(5, 3, 4, 12, 50000.00, 600000.00, '2v/ngày', '2023-02-16 13:43:32', '2023-02-16 13:43:32'),
(6, 4, 6, 20, 50000.00, 1000000.00, '10v/ngày', '2023-02-16 14:05:51', '2023-02-16 14:05:51'),
(7, 5, 8, 30, 0.00, 0.00, 'Uống ngày 2 viên sau ăn', '2023-02-18 04:13:14', '2023-02-18 04:13:14'),
(8, 5, 7, 15, 50000.00, 750000.00, 'Uống ngày 1 viên trước ăn', '2023-02-18 04:13:14', '2023-02-18 04:13:14'),
(10, 7, 6, 12, 50000.00, 600000.00, 'dsfsd', '2023-10-07 12:25:09', '2023-10-07 12:25:09'),
(11, 8, 7, 10, 50000.00, 500000.00, '2 viên/ngày', '2024-03-29 15:38:35', '2024-03-29 15:38:35'),
(12, 8, 8, 15, 0.00, 0.00, '2 viên/ngày', '2024-03-29 15:38:35', '2024-03-29 15:38:35'),
(13, 6, 4, 2, 50000.00, 100000.00, 'Ngay cả khi bạn che tên họ và mã đặt chỗ nhưng không có nghĩa là bạn đã được an toàn. Tất cả thông tin đặt chỗ đều nằm ở phần mã vạch trên thẻ lên máy bay. Không chỉ nội bộ hãng hàng không mới có thể truy cập thông tin từ m', '2024-04-06 03:53:57', '2024-04-06 03:53:57'),
(14, 9, 7, 1, 50000.00, 50000.00, 'ghjgjghj', '2024-05-17 19:59:10', '2024-05-17 19:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2023-02-08 16:34:26', '2023-02-08 16:34:26'),
(2, 'Bác sỹ phòng khám', 'web', '2023-02-11 13:58:11', '2023-02-12 20:07:37'),
(3, 'Bác sỹ phòng dịch vụ', 'web', '2023-02-12 20:08:15', '2023-02-12 20:08:15'),
(4, 'Dược sỹ', 'web', '2023-02-12 20:08:33', '2023-02-13 17:25:33'),
(5, 'Lễ tân', 'web', '2023-02-12 20:08:42', '2023-02-13 17:25:17'),
(6, 'Thu ngân', 'web', '2023-02-12 20:08:53', '2023-02-12 20:08:53'),
(8, 'Chuyên viên kỹ thuật', 'web', '2023-04-24 14:39:32', '2023-04-24 14:39:32'),
(9, 'Quản lý bác sĩ', 'web', '2023-10-07 12:21:59', '2023-10-07 12:21:59'),
(10, 'Bệnh nhân', 'web', '2024-05-17 19:10:34', '2024-05-17 19:10:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 5),
(1, 10),
(2, 1),
(2, 2),
(2, 10),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(4, 5),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(7, 5),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(9, 10),
(10, 1),
(10, 2),
(10, 5),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(14, 1),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(16, 10),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
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
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(68, 2),
(68, 3),
(69, 1),
(69, 2),
(69, 3),
(70, 1),
(70, 2),
(70, 3),
(71, 1),
(72, 1),
(72, 2),
(73, 1),
(73, 10),
(74, 1),
(74, 10),
(75, 1),
(75, 2),
(76, 1),
(77, 1),
(77, 2),
(78, 1),
(78, 2);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `current_number` int(11) DEFAULT 0,
  `max_number` int(11) DEFAULT 0,
  `date_schedule` date DEFAULT NULL,
  `time_type` tinyint(4) DEFAULT NULL,
  `jump` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `current_number`, `max_number`, `date_schedule`, `time_type`, `jump`, `status`, `doctor_id`, `created_at`, `updated_at`) VALUES
(1, 0, 3, '2024-05-18', NULL, 30, 1, 2, '2024-05-17 16:41:24', '2024-05-17 16:41:24'),
(2, 0, 1, '2024-05-18', NULL, 30, 1, 4, '2024-05-17 16:49:39', '2024-05-17 16:49:39'),
(3, 0, 0, '2024-05-19', NULL, 30, 1, 4, '2024-05-18 09:56:10', '2024-05-18 10:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_times`
--

CREATE TABLE `schedule_times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `time_schedule` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedule_times`
--

INSERT INTO `schedule_times` (`id`, `schedule_id`, `time_schedule`, `created_at`, `updated_at`) VALUES
(1, 1, '7:00-7:30', NULL, NULL),
(2, 1, '7:30-8:00', NULL, NULL),
(3, 1, '8:00-8:30', NULL, NULL),
(4, 1, '8:30-9:00', NULL, NULL),
(5, 1, '9:00-9:30', NULL, NULL),
(6, 1, '9:30-10:00', NULL, NULL),
(7, 1, '10:00-10:30', NULL, NULL),
(8, 1, '10:30-11:00', NULL, NULL),
(9, 1, '11:00-11:30', NULL, NULL),
(10, 1, '11:30-12:00', NULL, NULL),
(11, 1, '13:30-14:00', NULL, NULL),
(12, 1, '14:00-14:30', NULL, NULL),
(13, 1, '14:30-15:00', NULL, NULL),
(14, 1, '15:00-15:30', NULL, NULL),
(15, 1, '15:30-16:00', NULL, NULL),
(16, 1, '16:00-16:30', NULL, NULL),
(17, 1, '16:30-17:00', NULL, NULL),
(32, 2, '7:00-7:30', NULL, NULL),
(33, 2, '7:30-8:00', NULL, NULL),
(34, 2, '8:00-8:30', NULL, NULL),
(35, 2, '8:30-9:00', NULL, NULL),
(36, 2, '9:00-9:30', NULL, NULL),
(37, 2, '9:30-10:00', NULL, NULL),
(38, 2, '10:00-10:30', NULL, NULL),
(39, 2, '10:30-11:00', NULL, NULL),
(40, 2, '11:00-11:30', NULL, NULL),
(41, 2, '11:30-12:00', NULL, NULL),
(42, 2, '13:30-14:00', NULL, NULL),
(54, 3, '7:00-7:30', NULL, NULL),
(55, 3, '7:30-8:00', NULL, NULL),
(56, 3, '8:00-8:30', NULL, NULL),
(57, 3, '8:30-9:00', NULL, NULL),
(58, 3, '9:00-9:30', NULL, NULL),
(59, 3, '9:30-10:00', NULL, NULL),
(60, 3, '10:00-10:30', NULL, NULL),
(61, 3, '10:30-11:00', NULL, NULL),
(62, 3, '11:00-11:30', NULL, NULL),
(63, 3, '11:30-12:00', NULL, NULL),
(64, 3, '13:30-14:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_rooms`
--

CREATE TABLE `service_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consulting_room_id` bigint(20) NOT NULL,
  `medical_service_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_rooms`
--

INSERT INTO `service_rooms` (`id`, `consulting_room_id`, `medical_service_id`, `created_at`, `updated_at`) VALUES
(3, 3, 8, NULL, NULL),
(4, 4, 8, NULL, NULL),
(5, 3, 6, NULL, NULL),
(6, 5, 6, NULL, NULL),
(10, 4, 3, NULL, NULL),
(11, 3, 4, NULL, NULL),
(12, 5, 5, NULL, NULL),
(13, 6, 5, NULL, NULL),
(14, 7, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_vouchers`
--

CREATE TABLE `service_vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` int(11) NOT NULL,
  `medical_service_id` int(11) NOT NULL,
  `is_health_insurance_card` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `health_certification_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_money` double(24,2) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_vouchers`
--

INSERT INTO `service_vouchers` (`id`, `code`, `patient_id`, `medical_service_id`, `is_health_insurance_card`, `user_id`, `health_certification_id`, `start_date`, `end_date`, `total_money`, `status`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 'PDV000001', 3, 5, 0, 2, NULL, '2023-02-03', '2023-02-15', 0.00, 1, 1, '2023-02-16 13:37:30', '2023-02-16 13:45:32'),
(2, 'PDV000002', 2, 5, 0, 1, NULL, '2023-02-01', '2023-02-02', 0.00, 0, 1, '2023-02-16 13:38:00', '2023-03-01 07:44:25'),
(3, 'PDV000003', 3, 5, 0, 2, NULL, '2023-02-12', '2023-02-13', 0.00, 1, 1, '2023-02-16 13:47:01', '2023-02-16 13:48:30'),
(4, 'PDV000004', 5, 4, 0, 2, NULL, '2023-03-06', '2023-03-17', 200000.00, 1, 1, '2023-03-06 05:06:44', '2024-04-09 18:47:09'),
(5, 'PDV000005', 2, 3, 0, 4, 1, '2023-04-26', '2023-04-30', 500000.00, 0, 0, '2023-04-26 17:08:45', '2023-04-28 03:27:36'),
(6, 'PDV000006', 9, 3, 0, 4, 1, '2024-05-14', '2024-05-19', 500000.00, 0, 0, '2024-05-17 20:00:07', '2024-05-17 20:00:07');

-- --------------------------------------------------------

--
-- Table structure for table `service_voucher_details`
--

CREATE TABLE `service_voucher_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_voucher_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `result` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `result_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_voucher_details`
--

INSERT INTO `service_voucher_details` (`id`, `service_voucher_id`, `date`, `result`, `result_file`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-02-09', 'Bình thường', NULL, '2023-02-16 13:45:28', '2023-02-16 13:45:28'),
(2, 3, '2023-02-13', 'Bình thường', NULL, '2023-02-16 13:48:25', '2023-02-16 13:48:25'),
(3, 2, '2023-02-02', 'Bình thường', '2023-04-26-22-47-05-update-254docxupdate 25.4.docx', '2023-04-26 15:47:05', '2023-04-26 15:47:05'),
(4, 4, '2023-03-16', 'Bình thường&nbsp;', '2023-04-26-22-56-34-update-254docxupdate 25.4.docx', '2023-04-26 15:56:34', '2023-04-26 15:56:34'),
(5, 4, '2023-03-17', 'bình thường', '2023-04-26-22-59-34-update-254docxdocx', '2023-04-26 15:59:34', '2023-04-26 15:59:34'),
(6, 4, '2023-03-09', 'dsfsf', '2023-04-26-23-03-29-update-254.docx', '2023-04-26 16:03:29', '2023-04-26 16:03:29'),
(7, 4, '2023-03-15', 'bình thường&nbsp;', '2023-04-26-23-04-26-bao-cao-phan-tich-thiet-ke-xay-dung-website-tim-thong-tin-bac-si-dieu-tri-do-an-quan-ly-dat-lich-kham.docx', '2023-04-26 16:04:26', '2023-04-26 16:04:26');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'LT000001', 'Thuốc tử', '2023-02-13 15:48:24', '2023-02-13 15:48:24'),
(2, 'LT000002', 'Kháng sinh', '2023-02-13 17:29:23', '2023-02-13 17:29:23'),
(3, 'LT000003', 'thuốc đau bụng', '2023-03-15 10:16:40', '2023-03-15 10:16:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consulting_room_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `consulting_room_id`, `name`, `code`, `email`, `email_verified_at`, `password`, `birthday`, `gender`, `address`, `phone`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Admin', 'ADMIN', 'vikhangksst@gmail.com', NULL, '$2y$10$pXiF9Y65kXEAaEgvM84RauX3gR0V60a7Bscin3haG32tzTRemAtYa', '1999-04-06', 'Nam', 'Thanh Xuân Hà Nội', '0398731623', NULL, NULL, '2023-02-08 16:34:26', '2023-02-08 16:34:26'),
(2, 4, 'Vũ Minh Công', 'TK000002', 'minhcong.vu99@gmail.com', NULL, '$2y$10$TXNZhwL6HTSGwQSiuDHMZOukNbWkJrQP9DDHGmGBD1Q7mVwgCY/ue', '1999-04-06', 'Nam', 'Ngõ 28D Lương ĐỊnh Của', '0918361623', 'uploads/avatar/user/1716024774_thuml_XDCTnTx2yky1iw1h.jpg', NULL, '2023-02-11 14:01:42', '2024-05-18 09:32:54'),
(3, NULL, 'Bùi Minh Ánh', 'TK000003', 'minhhanhh1709@gmail.com', NULL, '$2y$10$6AoDnDDl.VmHHLKjwah.SuyAJqgZR.aJO6N5eqefouXqRooXoacfm', '2000-09-17', 'Nữ', 'Long Biên, Hà Nội', '0918361623', '', NULL, '2023-03-15 07:33:15', '2023-03-15 07:33:15'),
(4, 3, 'Nguyễn Văn Dược', 'TK000004', 'duocnvoit@gmail.com', NULL, '$2y$10$O1rIR.pLjGneh1PcuZHKpuRiwrDLGUPTl.TSVg0RgOoRiydEnRpJ6', '1994-05-25', 'Nam', 'Thái bình', '0928817228', '', NULL, '2023-04-25 16:02:05', '2024-05-18 03:03:33'),
(5, 3, 'Nguyễn văn Dược', 'BN000009', 'duocnvoitt@gmail.com', NULL, '$2y$10$TXNZhwL6HTSGwQSiuDHMZOukNbWkJrQP9DDHGmGBD1Q7mVwgCY/ue', '2024-05-17', 'Nam', 'Hà nội', '0928817228', 'uploads/avatar/patient/1715974325_Untitled-1.jpg', NULL, '2024-05-17 19:43:05', '2024-05-18 02:42:15'),
(6, NULL, 'Nguyễn Văn A', 'BN000010', 'nguyenvana@gmail.com', NULL, '$2y$10$IP.E60SSUastPsJr8M1rxOCe8NlgJddQIiKFEnJUQAa2ibzKgVFUy', '2024-05-01', 'Nam', 'Hà nội', '0928817558', '', NULL, '2024-05-17 19:45:24', '2024-05-17 19:45:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_doctor_id_foreign` (`doctor_id`),
  ADD KEY `bookings_patient_id_foreign` (`patient_id`),
  ADD KEY `bookings_medical_service_id_foreign` (`medical_service_id`);

--
-- Indexes for table `consulting_rooms`
--
ALTER TABLE `consulting_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `health_certifications`
--
ALTER TABLE `health_certifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `health_insurance_cards`
--
ALTER TABLE `health_insurance_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_services`
--
ALTER TABLE `medical_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescription_details`
--
ALTER TABLE `prescription_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `schedule_times`
--
ALTER TABLE `schedule_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_times_schedule_id_foreign` (`schedule_id`);

--
-- Indexes for table `service_rooms`
--
ALTER TABLE `service_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_vouchers`
--
ALTER TABLE `service_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_voucher_details`
--
ALTER TABLE `service_voucher_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `consulting_rooms`
--
ALTER TABLE `consulting_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `health_certifications`
--
ALTER TABLE `health_certifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `health_insurance_cards`
--
ALTER TABLE `health_insurance_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medical_services`
--
ALTER TABLE `medical_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `prescription_details`
--
ALTER TABLE `prescription_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedule_times`
--
ALTER TABLE `schedule_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `service_rooms`
--
ALTER TABLE `service_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `service_vouchers`
--
ALTER TABLE `service_vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_voucher_details`
--
ALTER TABLE `service_voucher_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_medical_service_id_foreign` FOREIGN KEY (`medical_service_id`) REFERENCES `medical_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedule_times`
--
ALTER TABLE `schedule_times`
  ADD CONSTRAINT `schedule_times_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
