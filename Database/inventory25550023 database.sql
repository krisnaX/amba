-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2026 at 08:37 AM
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
-- Database: `inventory25550023`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `kd_kat` varchar(6) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `kd_kat`, `category_name`) VALUES
(1, 'K001', 'PC Gayming'),
(2, 'K002', 'Mambe mobil'),
(3, 'K003', 'Alutsista'),
(4, 'K004', 'Niga premium'),
(5, 'K005', 'Laptop gayming');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `min_stock` int(11) DEFAULT 5,
  `price` int(11) DEFAULT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_code`, `product_name`, `stock`, `min_stock`, `price`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 1, 'P001', 'GIGAGAY RTX 6069 Milos Edition', 5, 1, 19000000, 'f6646d7a122bd620f8f0e5dbcb41fc8e.jpeg', '2026-05-11 05:29:25', NULL),
(2, 2, 'P002', 'APFSDS', 12, 33, 2323, 'e9df4b3f8018c208bb28d21bc5a0d5e6.jpg', '2026-05-19 06:27:16', NULL),
(3, 1, 'P003', 'RTX 8090 Big', 13, 1, 80000000, '288c7f78708246b494dfed6d8a2b6a74.jpg', '2026-06-04 03:35:40', NULL),
(4, 1, 'P004', 'AC RTX 8090', 5, 1, 57000000, '60fb890d535313bdf61139a398d1c51e.jpg', '2026-06-04 03:38:45', NULL),
(5, 1, 'P005', 'CAT RTX', 5, 1, 12000000, '14d9f66e63a0e64557185f6e861fb3ac.jpeg', '2026-06-04 03:40:38', NULL),
(6, 1, 'P006', 'Palu VGA', 5, 1, 1000000, 'b791eb3f632cea3f1afe0a3395a54c00.jpg', '2026-06-04 03:44:49', NULL),
(7, 2, 'P007', 'Dababy car', 1, 1, 13000000, '59044b503df3be6e61dbf2fa1cf99a54.jpg', '2026-06-04 03:52:24', NULL),
(8, 2, 'P008', 'Kubelwagen', 5, 1, 1, '6ec683e6b4de21860c32a17cce45a814.jpg', '2026-06-04 03:55:54', NULL),
(9, 2, 'P009', 'car', 9, 1, 1000000, '163c99f2296a956f8eed2e82a0d1a49c.png', '2026-06-04 03:58:41', NULL),
(10, 2, 'P010', 'Mobil ESEMKA', 1000, 1, 1444440000, '41d215d078e3b25559870949604f890f.jpg', '2026-06-04 04:00:58', NULL),
(11, 3, 'P011', 'APFSDS', 90, 1, 900000, '6d17d102673e66ec117b289ca9861c1e.jpg', '2026-06-04 04:05:01', NULL),
(12, 3, 'P012', 'Hellcat', 2, 1, 2147483647, 'e80ab172f7454c03c0a6a7a820d68187.jpg', '2026-06-04 04:06:12', NULL),
(14, 3, 'P013', 'Tiger 1', 5, 1, 10000000, 'f23bce2376f7a16917e44778fb6052c4.jpg', '2026-06-04 04:08:16', NULL),
(15, 3, 'P014', 'Jackson ', 54, 1, 90000000, '34dcc2b32d717b6bf42a6695b0f79ffb.jpg', '2026-06-04 04:09:42', NULL),
(16, 3, 'P015', 'messerschmitt me 262', 450, 100, 250000000, '0d5ba75dceb001dd1eb658440ae577b0.jpg', '2026-06-04 04:10:50', NULL),
(17, 5, 'P016', 'Asus gaming tipis ', 1, 5, 10000, '3433ae58c8036103740ee912c69e52da.jpg', '2026-06-04 04:29:10', NULL),
(18, 5, 'P017', 'Asus gaming berat', 4, 1, 50000000, '61d49f4d5badd47752ff7dbf476c4744.jpg', '2026-06-04 04:29:53', NULL),
(19, 5, 'P018', 'IBM GAYMING KECIL', 4, 1, 1000000, 'c39b6e71ef5f6eeccceff5febab4fb16.jpg', '2026-06-04 04:31:04', NULL),
(20, 5, 'P019', 'LENOVO GAYMING TIPIS', 1, 1, 1000000, '80e82a102e837ce929339a11f56cf8f9.jpg', '2026-06-04 04:32:35', NULL),
(21, 5, 'P020', 'GIGAGAY AERO', 9, 1, 1990000000, '9a7424165cbe82104b21f8b479d1f046.jpg', '2026-06-04 04:33:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_logs`
--

CREATE TABLE `stock_logs` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `change_type` enum('ADD','EDIT','REDUCE') DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `stock_before` int(11) DEFAULT NULL,
  `stock_after` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `stock_logs`
--

INSERT INTO `stock_logs` (`id`, `product_id`, `change_type`, `qty`, `stock_before`, `stock_after`, `note`, `created_at`, `created_by`) VALUES
(1, 1, 'ADD', 44, 1, 45, '', '2026-05-21 04:51:32', 0),
(2, 1, 'REDUCE', 40, 45, 5, 'DIBORONG WOWOK', '2026-05-21 04:54:03', 0),
(3, 3, 'ADD', 5, 8, 13, 'Tambahan dari wowok', '2026-06-04 03:49:29', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','staff') DEFAULT 'staff',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `is_active`, `created_at`) VALUES
(1, 'Krisna PC STTR', 'krisnakuliahpcsttr@gmail.com', '$2y$10$IjSjYKaLFLzy4.dnsOra9.LdRk1bIsQ2rRUlX0vtl8JAy5L9L68Vi', 'admin', 1, '2026-05-21 04:37:41'),
(2, 'amba', 'AMBA@gmail.com', '$2y$10$c64vs0U5IlXtRMrSZnU5cexsDudKXSvy.hfpTylMAYZ3WmV/v05BS', 'staff', 1, '2026-05-21 05:22:34'),
(3, 'mbappe', 'mbappe@gmail.com', '$2y$10$YOZ8CWikLhJEYfYbkMAE/e2r8XIA56QLvPVMveSHs8hi1MNM1jWi6', 'admin', 1, '2026-05-21 05:38:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kd_kat` (`kd_kat`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_logs`
--
ALTER TABLE `stock_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `stock_logs`
--
ALTER TABLE `stock_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
