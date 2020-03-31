-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 31, 2020 at 10:48 AM
-- Server version: 5.7.28-0ubuntu0.16.04.2
-- PHP Version: 7.0.33-0ubuntu0.16.04.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brand`) VALUES
(1, 'Levis'),
(2, 'Nike'),
(3, 'Polo'),
(5, 'Sketchers'),
(6, 'adidas');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `items` text NOT NULL,
  `expire_date` datetime NOT NULL,
  `paid` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `parent`) VALUES
(1, 'Farm Equipment', 0),
(2, 'Fences ', 0),
(3, 'Dairy Equipment and Supplies ', 0),
(4, 'Farm Supplies ', 0),
(24, 'Tools', 0),
(29, 'shirt', 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `list_price` decimal(10,2) NOT NULL,
  `brand` int(11) NOT NULL,
  `categories` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `weight` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `list_price`, `brand`, `categories`, `image`, `description`, `featured`, `weight`, `deleted`) VALUES
(1, 'Levis Jeans', '29.99', '39.99', 1, '6', '/ecommerce/images/products/men4.png', 'These jeans are amazing. They are super comfy and sexy! Buy them.', 1, '28:3,32:5,36:1', 0),
(2, 'Beautiful Shirt', '19.99', '24.99', 1, '5', '/ecommerce/images/products/men1.png', 'What a beautiful blue colored polo-shirt.', 1, 'Small:3,Medium:6,Large:9', 0),
(3, 'Generic Shirt', '20.00', '15.00', 3, '13', '/ecommerce/images/products/fbc3afb68d2b1f3203f3c1056879d2d5.png', 'This is a generic polo shirt for boys.', 1, 'Small:2,Medium:4,Large:6,', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `charge_id` varchar(255) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(175) NOT NULL,
  `street` varchar(255) NOT NULL,
  `street2` varchar(255) NOT NULL,
  `city` varchar(175) NOT NULL,
  `state` varchar(175) NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `country` varchar(175) NOT NULL,
  `sub_total` decimal(10,0) NOT NULL,
  `tax` decimal(10,0) NOT NULL,
  `grand_total` decimal(10,0) NOT NULL,
  `description` text NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `txn_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(175) NOT NULL,
  `password` varchar(255) NOT NULL,
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `join_date`, `last_login`, `role`) VALUES
(1, 'Admin', 'admin7@gmail.com', '$2y$10$gW1rJIb5v2JZFtckocvh3eGbk87u05WFPsb2ctn3U4osAMweDWB3q', '2020-03-29 23:31:00', '2020-03-29 23:51:15', 'admin'),
(3, 'rahul', 'rahul@gmail.com', '$2y$10$RzJHABkUMeB6PtyXrVXg7eFcfDii81pB28wvSQr1Fv0S2uzCUKDC2', '2020-03-31 10:09:53', '2020-03-31 10:09:53', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
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
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
