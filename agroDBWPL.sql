-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 18, 2020 at 06:20 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agroDB`
--
CREATE DATABASE IF NOT EXISTS `agroDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `agroDB`;

-- --------------------------------------------------------

--
-- Table structure for table `BrandsInfo`
--

CREATE TABLE `BrandsInfo` (
  `id` int(11) NOT NULL,
  `bName` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `BrandsInfo`
--

INSERT INTO `BrandsInfo` (`id`, `bName`) VALUES
(1, 'Levis'),
(2, 'Nike'),
(3, 'Polo'),
(5, 'Sketchers'),
(6, 'adidas');

-- --------------------------------------------------------

--
-- Table structure for table `CategoriesInfo`
--

CREATE TABLE `CategoriesInfo` (
  `id` int(11) NOT NULL,
  `category` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `CategoriesInfo`
--

INSERT INTO `CategoriesInfo` (`id`, `category`, `parent`) VALUES
(1, 'Farm Equipment', 0),
(2, 'Fences ', 0),
(3, 'Dairy Equipment and Supplies ', 0),
(4, 'Farm Supplies ', 0),
(24, 'Tools', 0),
(29, 'shirt', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `id` int(11) NOT NULL,
  `fullName` varchar(200) NOT NULL,
  `emailID` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastLogin` datetime NOT NULL,
  `cRole` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`id`, `fullName`, `emailID`, `password`, `joinDate`, `lastLogin`, `cRole`) VALUES
(1, 'Admin', 'admin7@gmail.com', '$2y$10$gW1rJIb5v2JZFtckocvh3eGbk87u05WFPsb2ctn3U4osAMweDWB3q', '2020-03-29 23:31:00', '2020-03-29 23:51:15', 'admin'),
(3, 'rahul', 'rahul@gmail.com', '$2y$10$RzJHABkUMeB6PtyXrVXg7eFcfDii81pB28wvSQr1Fv0S2uzCUKDC2', '2020-03-31 10:09:53', '2020-03-31 10:09:53', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `ProductsInfo`
--

CREATE TABLE `ProductsInfo` (
  `id` int(11) NOT NULL,
  `pName` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `pPrice` decimal(10,2) NOT NULL,
  `pListPrice` decimal(10,2) NOT NULL,
  `bName` int(11) NOT NULL,
  `pCategory` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `pImg` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pDetails` text COLLATE utf8_unicode_ci NOT NULL,
  `pFeatured` tinyint(4) NOT NULL DEFAULT '0',
  `weight` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ProductsInfo`
--

INSERT INTO `ProductsInfo` (`id`, `pName`, `pPrice`, `pListPrice`, `bName`, `pCategory`, `pImg`, `pDetails`, `pFeatured`, `weight`, `deleted`) VALUES
(1, 'Levis Jeans', '29.99', '39.99', 1, '6', '/ecommerce/images/products/men4.png', 'These jeans are amazing. They are super comfy and sexy! Buy them.', 1, '28:3,32:5,36:1', 0),
(2, 'Beautiful Shirt', '19.99', '24.99', 1, '5', '/ecommerce/images/products/men1.png', 'What a beautiful blue colored polo-shirt.', 1, 'Small:3,Medium:6,Large:9', 0),
(3, 'Generic Shirt', '20.00', '15.00', 3, '13', '/ecommerce/images/products/fbc3afb68d2b1f3203f3c1056879d2d5.png', 'This is a generic polo shirt for boys.', 1, 'Small:2,Medium:4,Large:6,', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ShoppingCart`
--

CREATE TABLE `ShoppingCart` (
  `id` int(11) NOT NULL,
  `iName` text NOT NULL,
  `expiryDate` datetime NOT NULL,
  `paid` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Transactions`
--

CREATE TABLE `Transactions` (
  `id` int(11) NOT NULL,
  `chargeID` varchar(255) NOT NULL,
  `cartID` int(11) NOT NULL,
  `fullName` varchar(200) NOT NULL,
  `emailID` varchar(200) NOT NULL,
  `addr1` varchar(255) NOT NULL,
  `addr2` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(15) NOT NULL,
  `country` varchar(100) NOT NULL,
  `subTotal` decimal(10,0) NOT NULL,
  `taxAmt` decimal(10,0) NOT NULL,
  `grandTotal` decimal(10,0) NOT NULL,
  `details` text NOT NULL,
  `trnType` varchar(255) NOT NULL,
  `trnDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BrandsInfo`
--
ALTER TABLE `BrandsInfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `CategoriesInfo`
--
ALTER TABLE `CategoriesInfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ProductsInfo`
--
ALTER TABLE `ProductsInfo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BrandsInfo`
--
ALTER TABLE `BrandsInfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `CategoriesInfo`
--
ALTER TABLE `CategoriesInfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ProductsInfo`
--
ALTER TABLE `ProductsInfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
