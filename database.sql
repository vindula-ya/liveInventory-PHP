-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 21, 2018 at 01:50 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testing2`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `brand_name` varchar(250) NOT NULL,
  `brand_status` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `category_id`, `brand_name`, `brand_status`) VALUES
(1, 1, 'Finibus', 'active'),
(2, 1, 'Lorem', 'active'),
(3, 1, 'Ipsum', 'active'),
(4, 8, 'Dolor', 'active'),
(5, 8, 'Amet', 'active'),
(6, 11, 'XYZ', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(250) NOT NULL,
  `category_status` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_status`) VALUES
(1, 'LED Bulb', 'active'),
(2, 'LED Lights', 'active'),
(3, 'LED Down Lights', 'active'),
(4, 'LED Panel Light', 'active'),
(5, 'LED Lamp', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_order`
--

DROP TABLE IF EXISTS `inventory_order`;
CREATE TABLE IF NOT EXISTS `inventory_order` (
  `inventory_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `inventory_order_total` double(10,2) NOT NULL,
  `inventory_order_date` date NOT NULL,
  `inventory_order_name` varchar(255) NOT NULL,
  `inventory_order_address` text NOT NULL,
  `payment_status` enum('cash','credit') NOT NULL,
  `inventory_order_status` varchar(100) NOT NULL,
  `inventory_order_created_date` date NOT NULL,
  PRIMARY KEY (`inventory_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_order`
--

INSERT INTO `inventory_order` (`inventory_order_id`, `user_id`, `inventory_order_total`, `inventory_order_date`, `inventory_order_name`, `inventory_order_address`, `payment_status`, `inventory_order_status`, `inventory_order_created_date`) VALUES
(1, 2, 4939.20, '2018-05-08', 'David Kuper', '31A Straford Park, Colombo 01', 'credit', 'active', '2017-11-08'),
(2, 2, 1310.40, '2018-04-12', 'Saman Aravinda', '45/4, Nawam Mw, Col 04', 'cash', 'active', '2017-11-08'),
(3, 1, 265.65, '2018-03-21', 'Russell Ryan', '20/1A, Park Avenue, Colombo 11.', 'cash', 'active', '2017-11-08'),
(4, 2, 1546.80, '2018-04-15', 'Tenisn Kooray', '4A, Hill Street, Dehiwala', 'credit', 'active', '2017-11-08'),
(5, 2, 1409.00, '2018-02-16', 'Mahinda Sampath', '40A, Hospital Rd, Kalubowilla.', 'cash', 'active', '2017-11-08');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_order_product`
--

DROP TABLE IF EXISTS `inventory_order_product`;
CREATE TABLE IF NOT EXISTS `inventory_order_product` (
  `inventory_order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `tax` double(10,2) NOT NULL,
  PRIMARY KEY (`inventory_order_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_order_product`
--

INSERT INTO `inventory_order_product` (`inventory_order_product_id`, `inventory_order_id`, `product_id`, `quantity`, `price`, `tax`) VALUES
(1, 1, 1, 10, 141.00, 12.00),
(4, 1, 3, 4, 800.00, 5.00),
(5, 2, 2, 3, 350.00, 12.00),
(14, 4, 1, 5, 141.00, 12.00),
(15, 5, 4, 2, 550.00, 12.00),
(32, 12, 2, 4, 350.00, 12.00),
(34, 13, 18, 3, 90.00, 12.00),
(35, 13, 7, 1, 210.00, 12.00),
(36, 13, 8, 2, 15.00, 18.00),
(37, 14, 6, 2, 250.00, 15.00),
(38, 14, 13, 1, 200.00, 18.00),
(39, 14, 16, 1, 175.00, 5.00),
(40, 14, 17, 3, 60.00, 12.00),
(41, 15, 2, 5, 350.00, 12.00),
(42, 16, 4, 4, 550.00, 12.00),
(43, 16, 13, 1, 200.00, 18.00),
(46, 17, 21, 2, 500.00, 18.00),
(47, 17, 3, 5, 800.00, 5.00),
(48, 17, 7, 1, 210.00, 12.00),
(49, 0, 23, 5, 30.00, 12.00),
(50, 0, 12, 5, 60.00, 12.00),
(51, 0, 16, 5, 175.00, 5.00),
(52, 0, 6, 5, 250.00, 15.00),
(53, 0, 16, 5, 175.00, 5.00),
(54, 0, 7, 5, 210.00, 12.00),
(55, 0, 7, 5, 210.00, 12.00),
(56, 0, 7, 5, 210.00, 12.00),
(57, 25, 14, 5, 250.00, 18.00),
(58, 25, 11, 5, 85.00, 12.00),
(83, 26, 16, 6, 175.00, 5.00),
(84, 26, 11, 5, 85.00, 12.00);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_name` varchar(300) NOT NULL,
  `product_description` text NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_unit` varchar(150) NOT NULL,
  `product_base_price` double(10,2) NOT NULL,
  `product_tax` decimal(4,2) NOT NULL,
  `product_minimum_order` double(10,2) NOT NULL,
  `product_enter_by` int(11) NOT NULL,
  `product_status` enum('active','inactive') NOT NULL,
  `product_date` date NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `brand_id`, `product_name`, `product_description`, `product_quantity`, `product_unit`, `product_base_price`, `product_tax`, `product_minimum_order`, `product_enter_by`, `product_status`, `product_date`) VALUES
(1, 1, 1, '4W LED Bulb', 'Base Type	B22, E27\r\nBulb Material	Aluminium\r\nItem Width	5 (cm)\r\nItem Height	10 (cm)\r\nItem Weight	0.07 (kg)', 100, 'Nos', 141.00, '12.00', 0.00, 1, 'active', '2017-11-08'),
(2, 1, 3, '17W B22 LED Bulb', 'Item Height	14.2 (cm)\r\nColor Temperature (Kelvin)	6500\r\nItem Weight	0.19 (kg)\r\nBulb Material	Aluminium\r\nBase Color	Aluminium\r\nVoltage	240\r\nUsages	Household, Commercial, Kitchen', 150, 'Nos', 350.00, '12.00', 0.00, 1, 'active', '2017-11-08'),
(3, 8, 5, '18W LED Ceiling Light', 'Round Ceiling Light 18w', 75, 'Nos', 800.00, '5.00', 0.00, 1, 'active', '2017-11-08'),
(4, 8, 4, 'Round LED Ceiling Light', 'Relying on our expertise in this domain, we are into offering Round LED Ceiling Light.	', 50, 'Nos', 550.00, '12.00', 0.00, 1, 'active', '2017-11-08'),
(5, 6, 6, '7W LED Concealed Light', 'Dimension \'3\" \'\r\n50000 hours burning life\r\ncost effective\r\nhigh quality led', 85, 'Nos', 240.00, '15.00', 0.00, 1, 'active', '2017-11-08');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(200) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_type` enum('master','user') NOT NULL,
  `user_status` enum('Active','Inactive') NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `user_email`, `user_password`, `user_name`, `user_type`, `user_status`) VALUES
(1, 'test@gmail.com', '$2y$10$/EQJ08Enkfbp0DzEN4M00.rS6G1W2XggmCnPBP3MCwBzjrjZQLPty', 'Test ', 'master', 'Active'),
(2, 'samarasinghe@gmail.com', '$2y$10$cXJO6LIoWH5KrNgsIM.Gu.KU5Yjoo19C2HhstV/1sbLKrVSi2WTOu', 'Kuper Samarasinghe', 'user', 'Active');
COMMIT;

-- test@gmail.com test
-- samarasinghe@gmail.com password
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
