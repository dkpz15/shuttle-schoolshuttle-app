-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2024 at 06:27 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Car', 'Test Car', '2017-01-24 19:17:37', '30-01-2017 12:22:24 AM'),
(4, 'Travel', 'Test Travel', '2017-01-24 19:19:32', ''),
(5, 'Bus', 'Test Bus', '2017-01-24 19:19:54', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '3', 1, '2017-03-07 19:32:57', 'COD', NULL),
(3, 1, '4', 1, '2017-03-10 19:43:04', 'Debit / Credit card', 'Delivered'),
(4, 1, '17', 1, '2017-03-08 16:14:17', 'COD', 'in Process'),
(5, 1, '3', 1, '2017-03-08 19:21:38', 'COD', NULL),
(6, 1, '4', 1, '2017-03-08 19:21:38', 'COD', NULL),
(7, 4, '15', 1, '2024-01-17 16:31:49', 'COD', NULL),
(8, 4, '4', 1, '2024-01-18 05:15:58', 'COD', NULL),
(9, 4, '1', 1, '2024-01-18 10:52:30', 'COD', NULL),
(10, 4, '1', 1, '2024-01-18 10:53:38', 'Internet Banking', NULL),
(11, 4, '1', 1, '2024-01-18 10:57:44', 'COD', NULL),
(12, 4, '1', 1, '2024-01-18 11:15:46', 'COD', NULL),
(13, 4, '3', 1, '2024-01-18 11:30:35', 'COD', NULL),
(14, 4, '1', 1, '2024-01-18 15:27:29', 'COD', NULL),
(15, 4, '2', 1, '2024-01-18 16:01:31', 'COD', NULL),
(16, 4, '1', 1, '2024-01-18 16:05:39', 'COD', NULL),
(17, 4, '1', 1, '2024-01-18 16:05:48', 'COD', NULL),
(18, 6, '1', 1, '2024-01-18 16:24:05', 'COD', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2017-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2017-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(5, 1, 5, 5, 5, 'Darren Marcellino Setiawan', 'Kualitas', 'Bagus', '2024-01-18 15:26:41');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `seats`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 3, 'Toyota Avanza 1.3 E CVT', 'Toyota', 300000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Toyota Avanza 1.3 E CVT rental only covers Semarang City and surrounding areas.</div>', 'avanza.webp', 'avanza.webp', 'avanza.webp', 7, 'Available', '2017-01-30 16:54:35', ''),
(2, 3, 'Toyota Kijang Innova G M/T Gasoline', 'Toyota', 350000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Kijang Innova G M/T Gasoline rental only covers Yogyakarta City and surrounding areas.</div>', 'innova.webp', 'innova.webp', 'innova.webp', 7, 'Available', '2017-01-30 16:59:00', ''),
(3, 3, 'Daihatsu Sigra 1.0 D MT', 'Daihatsu', 275000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Daihatsu Sigra 1.0 D MT rental only covers Batang City and surrounding areas.</div>', 'sigra.webp', 'sigra.webp', 'sigra.webp', 6, 'Available', '2017-02-04 04:03:15', ''),
(4, 3, 'Isuzu MuX', 'Isuzu', 605000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Isuzu MuX rental only covers Samarinda City and surrounding areas.</div>', 'mux.webp', 'mux.webp', 'mux.webp', 7, 'Available', '2017-02-04 04:04:43', ''),
(5, 3, 'Honda BRV', 'Honda', 320000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Honda BRV rental only covers Malang City and surrounding areas.</div>', 'brv.webp', 'brv.webp', 'brv.webp', 6, 'Available', '2017-02-04 04:06:17', ''),
(6, 3, 'Hyundai Santa Fe ', 'Hyundai', 443000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Hyundai Santa Fe rental only covers Palembang City and surrounding areas.</div>', 'santa-fe.webp', 'santa-fe.webp', 'santa-fe.webp', 6, 'Available', '2017-02-04 04:08:07', ''),
(7, 3, 'Hyundai Palisade', 'Hyundai', 670000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Hyundai Palisade rental only covers Jakarta City and surrounding areas.</div>', 'palisade.webp', 'palisade.webp', 'palisade.webp', 7, 'Available', '2017-02-04 04:10:17', ''),
(8, 3, 'Nissan X Trail', 'Nissan', 498000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Nissan X Trail rental only covers Madiun City and surrounding areas.</div>', 'x-trail.webp', 'x-trail.webp', 'x-trail.webp', 7, 'Available', '2017-02-04 04:11:54', ''),
(9, 4, 'Toyota Hiace', 'Toyota', 405000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Toyota Hiace rental only covers Central Java Province.</div>', 'hiace.webp', 'hiace.webp', 'hiace.webp', 15, 'Available', '2017-02-04 04:17:03', ''),
(11, 4, 'Isuzu Elf Microbus', 'Isuzu', 689000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Isuzu Elf Microbus rental only covers West Java Province and Banten Province.</div>', 'elf.webp', 'elf.webp', 'elf.webp', 15, 'Available', '2017-02-04 04:26:17', ''),
(12, 4, 'Hyundai New H-1', 'Hyundai', 730000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Hyundai New H-1 rental only covers North Sulawesi Province and Gorontalo Province.</div>', 'h1.webp', 'h1.webp', 'h1.webp', 12, 'Available', '2017-02-04 04:28:17', ''),
(13, 5, 'Isuzu Elf NQR B', 'Isuzu', 806000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Isuzu Elf NQR B rental covers Java Island and Bali Island.</div>', 'nqr.webp', 'nqr.webp', 'nqr.webp', 25, 'Available', '2017-02-04 04:30:24', ''),
(14, 4, 'Toyota Dyna 110 ST', 'Toyota', 720000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Toyota Dyna 110 ST rental only covers West Sumatra Province.</div>', 'dyna.webp', 'dyna.webp', 'dyna.webp', 15, 'Available', '2017-02-04 04:32:15', ''),
(15, 5, 'Isuzu LT 134', 'Isuzu', 1000000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Isuzu LT 134 rental covers Sumatra Island.</div>', 'lt-134.webp', 'lt-134.webp', 'lt-134.webp', 40, 'Available', '2017-02-04 04:35:13', ''),
(16, 5, 'Volvo Coaches', 'Volvo', 1500000, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 15px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Volvo Coaches rental covers Kalimantan Island and Sulawesi Island.</div>', 'volvo.webp', 'volvo.webp', 'volvo.webp', 50, 'Available', '2017-02-04 04:36:23', '');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 15:00:23', '26-02-2017 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-06 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-08 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:20:36', '15-03-2017 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-16 01:13:57', '', 1),
(23, 'hgfhgf@gmass.com', 0x3a3a3100000000000000000000000000, '2018-04-29 09:30:40', '', 1),
(24, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-02-09 22:23:13', NULL, 1),
(25, 'amir@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-17 16:25:47', NULL, 0),
(26, 'darren@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-17 16:26:45', NULL, 1),
(27, 'darren@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-18 04:43:41', NULL, 1),
(28, 'darren@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-18 10:52:21', NULL, 1),
(29, 'darren2@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-18 15:14:15', '18-01-2024 08:50:56 PM', 1),
(30, 'darren@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-18 15:21:08', '18-01-2024 09:40:20 PM', 1),
(31, 'darren@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-18 16:10:39', '18-01-2024 09:50:47 PM', 1),
(32, 'darren@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-18 16:21:10', '18-01-2024 09:51:16 PM', 1),
(33, 'darren2@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-18 16:21:42', '18-01-2024 09:56:41 PM', 1),
(34, 'darren@gmail.com', 0x3a3a3100000000000000000000000000, '2024-01-18 16:26:55', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(4, 'Darren ', 'darren@gmail.com', 12345, '202cb962ac59075b964b07152d234b70', 'dww', 'wdwd', 'dwdw', 123, 'qwqwq', 'wqqw', 'wqwq', 23, '2024-01-17 16:26:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
