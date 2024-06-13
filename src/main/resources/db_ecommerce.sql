-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2024 at 06:06 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `id` bigint(20) NOT NULL,
  `order_date` datetime(6) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `total_amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`id`, `order_date`, `order_number`, `user_id`, `total_amount`) VALUES
(1, '2024-06-13 11:16:35.000000', 'e42dbfee-a958-4831-af1f-f096b9f05894', 1, 339.94),
(2, '2024-06-13 11:24:50.000000', 'e42dbfee-a958-4831-af1f-f096b9f05895', 1, 349.94);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`id`, `quantity`, `order_id`, `product_id`) VALUES
(1, 3, 1, 2),
(2, 2, 1, 3),
(3, 1, 1, 4),
(4, 1, 2, 1),
(5, 2, 2, 2),
(6, 2, 2, 3),
(7, 1, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `id` bigint(20) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`id`, `brand`, `description`, `image`, `name`, `price`) VALUES
(1, 'Keychron', 'Compact 75% layout with RGB backlight', 'keychron_k2.png', 'Keychron K2', 79.99),
(2, 'Keychron', 'Compact 65% layout with hot-swappable switches', 'keychron_k6.png', 'Keychron K6', 69.99),
(3, 'Redragon', 'Tenkeyless mechanical gaming keyboard with red switches', 'redragon_k552.png', 'Redragon K552', 39.99),
(4, 'Redragon', 'RGB backlit mechanical gaming keyboard with brown switches', 'redragon_k556.png', 'Redragon K556', 49.99),
(5, 'SteelSeries', 'Adjustable mechanical switches with OLED display', 'steelseries_apex_pro.png', 'SteelSeries Apex Pro', 199.99),
(6, 'SteelSeries', 'Mechanical gaming keyboard with blue switches', 'steelseries_apex_7.png', 'SteelSeries Apex 7', 159.99),
(7, 'Logitech', 'Compact tenkeyless design with swappable switches', 'logitech_g_pro_x.png', 'Logitech G Pro X', 149.99),
(8, 'Logitech', 'Low-profile mechanical gaming keyboard with wireless connectivity', 'logitech_g915.png', 'Logitech G915', 249.99),
(9, 'Razer', 'Mechanical gaming keyboard with green switches', 'razer_blackwidow_elite.png', 'Razer BlackWidow Elite', 129.99),
(10, 'Razer', 'Opto-mechanical switches with customizable RGB lighting', 'razer_huntsman_elite.png', 'Razer Huntsman Elite', 199.99);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `email`, `password`, `username`) VALUES
(1, 'test@test.com', 'testtest', 'jchips12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpppim1yc9udwxeam99pmiarh3` (`user_id`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmnx4txdxqa543teh07f9b330m` (`order_id`),
  ADD KEY `FKipcbxu1wfklvtusvfrk8p7e9p` (`product_id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD CONSTRAINT `FKpppim1yc9udwxeam99pmiarh3` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`);

--
-- Constraints for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD CONSTRAINT `FKipcbxu1wfklvtusvfrk8p7e9p` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`),
  ADD CONSTRAINT `FKmnx4txdxqa543teh07f9b330m` FOREIGN KEY (`order_id`) REFERENCES `tbl_orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
