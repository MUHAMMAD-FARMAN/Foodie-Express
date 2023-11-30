-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2023 at 07:29 PM
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
-- Database: `foodie_express`
--

-- --------------------------------------------------------

--
-- Table structure for table `cartitems`
--

CREATE TABLE `cartitems` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `CreatedAt` datetime NOT NULL,
  `UpdatedAt` datetime NOT NULL,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `cartitems`
--
DELIMITER $$
CREATE TRIGGER `cartitems_after_delete` AFTER DELETE ON `cartitems` FOR EACH ROW BEGIN
  INSERT INTO cartitems_audit (action, cart_item_id, prev_data, new_data)
  VALUES ('DELETE', OLD.cart_item_id, JSON_OBJECT('cart_id', OLD.cart_id, 'product_id', OLD.product_id, 'quantity', OLD.quantity, 'CreatedAt', OLD.CreatedAt, 'UpdatedAt', OLD.UpdatedAt, 'Active', OLD.Active), NULL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cartitems_after_insert` AFTER INSERT ON `cartitems` FOR EACH ROW BEGIN
  INSERT INTO cartitems_audit (action, cart_item_id, prev_data, new_data)
  VALUES ('INSERT', NEW.cart_item_id, NULL, JSON_OBJECT('cart_id', NEW.cart_id, 'product_id', NEW.product_id, 'quantity', NEW.quantity, 'CreatedAt', NEW.CreatedAt, 'UpdatedAt', NEW.UpdatedAt, 'Active', NEW.Active));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cartitems_after_update` AFTER UPDATE ON `cartitems` FOR EACH ROW BEGIN
  INSERT INTO cartitems_audit (action, cart_item_id, prev_data, new_data)
  VALUES ('UPDATE', NEW.cart_item_id, JSON_OBJECT('cart_id', OLD.cart_id, 'product_id', OLD.product_id, 'quantity', OLD.quantity, 'CreatedAt', OLD.CreatedAt, 'UpdatedAt', OLD.UpdatedAt, 'Active', OLD.Active), JSON_OBJECT('cart_id', NEW.cart_id, 'product_id', NEW.product_id, 'quantity', NEW.quantity, 'CreatedAt', NEW.CreatedAt, 'UpdatedAt', NEW.UpdatedAt, 'Active', NEW.Active));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cartitems_audit`
--

CREATE TABLE `cartitems_audit` (
  `audit_id` int(11) NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `cart_item_id` int(11) DEFAULT NULL,
  `prev_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`prev_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_data`)),
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cartitems_audit`
--

INSERT INTO `cartitems_audit` (`audit_id`, `action`, `cart_item_id`, `prev_data`, `new_data`, `timestamp`) VALUES
(1, 'UPDATE', 8, '{\"cart_id\": 1, \"product_id\": 6, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '{\"cart_id\": 1, \"product_id\": 6, \"quantity\": 2, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 06:24:52'),
(2, 'DELETE', 8, '{\"cart_id\": 1, \"product_id\": 6, \"quantity\": 2, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 06:26:28'),
(3, 'DELETE', 9, '{\"cart_id\": 1, \"product_id\": 1, \"quantity\": 3, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 06:26:28'),
(4, 'DELETE', 10, '{\"cart_id\": 1, \"product_id\": 3, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 06:26:28'),
(5, 'INSERT', 11, NULL, '{\"cart_id\": 1, \"product_id\": 0, \"quantity\": 3, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 06:38:55'),
(6, 'DELETE', 11, '{\"cart_id\": 1, \"product_id\": 0, \"quantity\": 3, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 06:40:23'),
(7, 'INSERT', 12, NULL, '{\"cart_id\": 1, \"product_id\": 1, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 06:41:05'),
(8, 'DELETE', 12, '{\"cart_id\": 1, \"product_id\": 1, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 06:41:21'),
(9, 'INSERT', 13, NULL, '{\"cart_id\": 1, \"product_id\": 6, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 06:42:12'),
(10, 'DELETE', 13, '{\"cart_id\": 1, \"product_id\": 6, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 10:11:09'),
(11, 'INSERT', 14, NULL, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 14:16:10'),
(12, 'DELETE', 14, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 14:16:29'),
(13, 'INSERT', 15, NULL, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 15:28:05'),
(14, 'DELETE', 15, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 15:28:54'),
(15, 'INSERT', 16, NULL, '{\"cart_id\": 1, \"product_id\": 0, \"quantity\": 8, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 15:32:07'),
(16, 'DELETE', 16, '{\"cart_id\": 1, \"product_id\": 0, \"quantity\": 8, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 15:32:47'),
(17, 'INSERT', 17, NULL, '{\"cart_id\": 1, \"product_id\": 0, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 15:33:44'),
(18, 'DELETE', 17, '{\"cart_id\": 1, \"product_id\": 0, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 15:36:04'),
(19, 'INSERT', 18, NULL, '{\"cart_id\": 1, \"product_id\": 3, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 17:16:50'),
(20, 'DELETE', 18, '{\"cart_id\": 1, \"product_id\": 3, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 17:17:10'),
(21, 'INSERT', 19, NULL, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 17:22:17'),
(22, 'DELETE', 19, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 17:22:31'),
(23, 'INSERT', 20, NULL, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 17:26:01'),
(24, 'DELETE', 20, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 17:26:15'),
(25, 'INSERT', 21, NULL, '{\"cart_id\": 1, \"product_id\": 2, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 17:27:58'),
(26, 'INSERT', 22, NULL, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 17:28:07'),
(27, 'DELETE', 21, '{\"cart_id\": 1, \"product_id\": 2, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 17:28:28'),
(28, 'DELETE', 22, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 17:28:28'),
(29, 'INSERT', 23, NULL, '{\"cart_id\": 1, \"product_id\": 7, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 17:29:52'),
(30, 'INSERT', 24, NULL, '{\"cart_id\": 1, \"product_id\": 0, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 17:30:08'),
(31, 'DELETE', 23, '{\"cart_id\": 1, \"product_id\": 7, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 17:30:41'),
(32, 'DELETE', 24, '{\"cart_id\": 1, \"product_id\": 0, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 17:30:41'),
(33, 'INSERT', 25, NULL, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 5, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 17:35:00'),
(34, 'DELETE', 25, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 5, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 17:35:14'),
(35, 'INSERT', 26, NULL, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 5, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 17:36:51'),
(36, 'DELETE', 26, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 5, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 17:37:07'),
(37, 'INSERT', 27, NULL, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 3, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 17:39:39'),
(38, 'DELETE', 27, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 3, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 17:40:15'),
(39, 'INSERT', 28, NULL, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 4, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 17:41:08'),
(40, 'DELETE', 28, '{\"cart_id\": 1, \"product_id\": 4, \"quantity\": 4, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 17:41:26'),
(41, 'INSERT', 29, NULL, '{\"cart_id\": 1, \"product_id\": 0, \"quantity\": 4, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 17:43:54'),
(42, 'INSERT', 30, NULL, '{\"cart_id\": 1, \"product_id\": 2, \"quantity\": 7, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 17:44:08'),
(43, 'DELETE', 29, '{\"cart_id\": 1, \"product_id\": 0, \"quantity\": 4, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 17:47:47'),
(44, 'DELETE', 30, '{\"cart_id\": 1, \"product_id\": 2, \"quantity\": 7, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 17:47:47'),
(45, 'INSERT', 31, NULL, '{\"cart_id\": 1, \"product_id\": 1, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 17:55:45'),
(46, 'INSERT', 32, NULL, '{\"cart_id\": 1, \"product_id\": 0, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', '2023-11-30 18:04:51'),
(47, 'DELETE', 31, '{\"cart_id\": 1, \"product_id\": 1, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 18:05:18'),
(48, 'DELETE', 32, '{\"cart_id\": 1, \"product_id\": 0, \"quantity\": 1, \"CreatedAt\": \"0000-00-00 00:00:00\", \"UpdatedAt\": \"0000-00-00 00:00:00\", \"Active\": 0}', NULL, '2023-11-30 18:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `CreatedAt` datetime NOT NULL,
  `UpdatedAt` datetime NOT NULL,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `user_id`, `CreatedAt`, `UpdatedAt`, `Active`) VALUES
(1, 1, '2023-11-28 18:36:52', '2023-11-28 18:36:52', 1);

--
-- Triggers `carts`
--
DELIMITER $$
CREATE TRIGGER `carts_after_delete` AFTER DELETE ON `carts` FOR EACH ROW BEGIN
  INSERT INTO carts_audit (action, cart_id, prev_data, new_data)
  VALUES ('DELETE', OLD.cart_id, JSON_OBJECT('user_id', OLD.user_id, 'CreatedAt', OLD.CreatedAt, 'UpdatedAt', OLD.UpdatedAt, 'Active', OLD.Active), NULL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `carts_after_insert` AFTER INSERT ON `carts` FOR EACH ROW BEGIN
  INSERT INTO carts_audit (action, cart_id, prev_data, new_data)
  VALUES ('INSERT', NEW.cart_id, NULL, JSON_OBJECT('user_id', NEW.user_id, 'CreatedAt', NEW.CreatedAt, 'UpdatedAt', NEW.UpdatedAt, 'Active', NEW.Active));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `carts_after_update` AFTER UPDATE ON `carts` FOR EACH ROW BEGIN
  INSERT INTO carts_audit (action, cart_id, prev_data, new_data)
  VALUES ('UPDATE', NEW.cart_id, JSON_OBJECT('user_id', OLD.user_id, 'CreatedAt', OLD.CreatedAt, 'UpdatedAt', OLD.UpdatedAt, 'Active', OLD.Active), JSON_OBJECT('user_id', NEW.user_id, 'CreatedAt', NEW.CreatedAt, 'UpdatedAt', NEW.UpdatedAt, 'Active', NEW.Active));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `carts_audit`
--

CREATE TABLE `carts_audit` (
  `audit_id` int(11) NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `prev_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`prev_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_data`)),
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime NOT NULL,
  `UpdatedAt` datetime NOT NULL,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `username`, `email`, `phone_number`, `address`, `CreatedAt`, `UpdatedAt`, `Active`) VALUES
(1, '1', '1', '1', '1', '2023-11-28 18:36:28', '2023-11-28 18:36:28', 1);

--
-- Triggers `customers`
--
DELIMITER $$
CREATE TRIGGER `customers_after_delete` AFTER DELETE ON `customers` FOR EACH ROW BEGIN
  INSERT INTO customers_audit (action, customer_id, prev_data, new_data)
  VALUES ('DELETE', OLD.customer_id, JSON_OBJECT('username', OLD.username, 'email', OLD.email, 'phone_number', OLD.phone_number, 'address', OLD.address, 'CreatedAt', OLD.CreatedAt, 'UpdatedAt', OLD.UpdatedAt, 'Active', OLD.Active), NULL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `customers_after_insert` AFTER INSERT ON `customers` FOR EACH ROW BEGIN
  INSERT INTO customers_audit (action, customer_id, prev_data, new_data)
  VALUES ('INSERT', NEW.customer_id, NULL, JSON_OBJECT('username', NEW.username, 'email', NEW.email, 'phone_number', NEW.phone_number, 'address', NEW.address, 'CreatedAt', NEW.CreatedAt, 'UpdatedAt', NEW.UpdatedAt, 'Active', NEW.Active));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `customers_after_update` AFTER UPDATE ON `customers` FOR EACH ROW BEGIN
  INSERT INTO customers_audit (action, customer_id, prev_data, new_data)
  VALUES ('UPDATE', NEW.customer_id, JSON_OBJECT('username', OLD.username, 'email', OLD.email, 'phone_number', OLD.phone_number, 'address', OLD.address, 'CreatedAt', OLD.CreatedAt, 'UpdatedAt', OLD.UpdatedAt, 'Active', OLD.Active), JSON_OBJECT('username', NEW.username, 'email', NEW.email, 'phone_number', NEW.phone_number, 'address', NEW.address, 'CreatedAt', NEW.CreatedAt, 'UpdatedAt', NEW.UpdatedAt, 'Active', NEW.Active));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customers_audit`
--

CREATE TABLE `customers_audit` (
  `audit_id` int(11) NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `prev_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`prev_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_data`)),
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryassignments`
--

CREATE TABLE `deliveryassignments` (
  `assignment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `assign_date` datetime DEFAULT NULL,
  `delivery_status` varchar(50) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deliverydrivers`
--

CREATE TABLE `deliverydrivers` (
  `driver_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `vehicle_number` varchar(20) DEFAULT NULL,
  `CreatedAt` datetime NOT NULL,
  `UpdatedAt` datetime NOT NULL,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliverydrivers`
--

INSERT INTO `deliverydrivers` (`driver_id`, `first_name`, `last_name`, `phone_number`, `vehicle_number`, `CreatedAt`, `UpdatedAt`, `Active`) VALUES
(1, 'Affan', 'Ali', '33', '33', '2023-11-29 18:33:38', '2023-11-29 18:33:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `Employee_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `hire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`Employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `salary`, `role`, `hire_date`) VALUES
(2, 'Umer ', 'Farooq', 'uf@gmail.com', '3333', '30000.00', 'Driver', '2023-11-29 16:40:28');

-- --------------------------------------------------------

--
-- Table structure for table `error_logs`
--

CREATE TABLE `error_logs` (
  `log_id` int(11) NOT NULL,
  `error_message` text DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `action_type` enum('INSERT','UPDATE','DELETE') DEFAULT NULL,
  `affected_row_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `menuitems`
--

CREATE TABLE `menuitems` (
  `item_id` int(11) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `isFav` tinyint(1) DEFAULT NULL,
  `CreatedAt` datetime NOT NULL,
  `UpdatedAt` datetime NOT NULL,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menuitems`
--

INSERT INTO `menuitems` (`item_id`, `restaurant_id`, `name`, `description`, `rating`, `isFav`, `CreatedAt`, `UpdatedAt`, `Active`) VALUES
(1, 1, 'burger', 'Delicious burger description', 4, 1, '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1),
(2, 1, 'pizza', 'Tasty pizza description', 5, 1, '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1),
(3, 1, 'pasta', 'Yummy pasta description', 4, 1, '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1),
(4, 1, 'BBQ', 'Savory BBQ description', 5, 1, '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1),
(5, 1, 'daal', 'Tempting daal description', 4, 1, '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1),
(6, 1, 'rice', 'Delicious rice description', 4, 1, '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1),
(7, 1, 'salad', 'Healthy salad description', 5, 1, '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1),
(8, 1, 'shake', 'Refreshing shake description', 4, 1, '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1);

--
-- Triggers `menuitems`
--
DELIMITER $$
CREATE TRIGGER `menuitems_after_delete` AFTER DELETE ON `menuitems` FOR EACH ROW BEGIN
  INSERT INTO menuitems_audit (action, item_id, prev_data, new_data)
  VALUES ('DELETE', OLD.item_id, JSON_OBJECT('restaurant_id', OLD.restaurant_id, 'name', OLD.name, 'description', OLD.description, 'rating', OLD.rating, 'isFav', OLD.isFav, 'CreatedAt', OLD.CreatedAt, 'UpdatedAt', OLD.UpdatedAt, 'Active', OLD.Active), NULL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `menuitems_after_insert` AFTER INSERT ON `menuitems` FOR EACH ROW BEGIN
  INSERT INTO menuitems_audit (action, item_id, prev_data, new_data)
  VALUES ('INSERT', NEW.item_id, NULL, JSON_OBJECT('restaurant_id', NEW.restaurant_id, 'name', NEW.name, 'description', NEW.description, 'rating', NEW.rating, 'isFav', NEW.isFav, 'CreatedAt', NEW.CreatedAt, 'UpdatedAt', NEW.UpdatedAt, 'Active', NEW.Active));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `menuitems_after_update` AFTER UPDATE ON `menuitems` FOR EACH ROW BEGIN
  INSERT INTO menuitems_audit (action, item_id, prev_data, new_data)
  VALUES ('UPDATE', NEW.item_id, JSON_OBJECT('restaurant_id', OLD.restaurant_id, 'name', OLD.name, 'description', OLD.description, 'rating', OLD.rating, 'isFav', OLD.isFav, 'CreatedAt', OLD.CreatedAt, 'UpdatedAt', OLD.UpdatedAt, 'Active', OLD.Active), JSON_OBJECT('restaurant_id', NEW.restaurant_id, 'name', NEW.name, 'description', NEW.description, 'rating', NEW.rating, 'isFav', NEW.isFav, 'CreatedAt', NEW.CreatedAt, 'UpdatedAt', NEW.UpdatedAt, 'Active', NEW.Active));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `menuitems_audit`
--

CREATE TABLE `menuitems_audit` (
  `audit_id` int(11) NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `prev_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`prev_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_data`)),
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `order_type` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `pickup_time` datetime DEFAULT NULL,
  `table_number` int(11) DEFAULT NULL,
  `CreatedAt` datetime NOT NULL,
  `UpdatedAt` datetime NOT NULL,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `cart_id`, `restaurant_id`, `order_date`, `order_type`, `status`, `total_price`, `discount`, `delivery_address`, `pickup_time`, `table_number`, `CreatedAt`, `UpdatedAt`, `Active`) VALUES
(14, 1, 1, '2023-11-30 14:59:23', 'Dine-in', 'Inactive', '0.00', '0.00', '', NULL, NULL, '2023-11-30 14:59:23', '2023-11-30 14:59:23', 1),
(15, 1, 1, '2023-11-30 15:04:55', 'Dine-in', 'Inactive', '18.50', '0.00', NULL, NULL, NULL, '2023-11-30 15:04:55', '2023-11-30 15:04:55', 1),
(16, 1, 1, '2023-11-30 15:10:25', 'Dine-in', 'Inactive', '18.50', '0.00', NULL, NULL, NULL, '2023-11-30 15:10:25', '2023-11-30 15:10:25', 1),
(17, 1, 1, '2023-11-30 15:11:08', 'Delivery', 'Inactive', '18.50', '0.00', 'H#5, St#8, Mehran Park', NULL, NULL, '2023-11-30 15:11:08', '2023-11-30 15:11:08', 1),
(18, 1, 1, '2023-11-30 19:16:29', 'Dine-in', 'Inactive', '23.50', '0.00', NULL, NULL, NULL, '2023-11-30 19:16:29', '2023-11-30 19:16:29', 1),
(19, 1, 1, '2023-11-30 20:28:54', 'Dine-in', 'Inactive', '23.50', '0.00', NULL, NULL, NULL, '2023-11-30 20:28:54', '2023-11-30 20:28:54', 1),
(20, 1, 1, '2023-11-30 20:32:47', 'Delivery', 'Inactive', '107.42', '0.00', 'H#5, St#8, Mehran Park', NULL, NULL, '2023-11-30 20:32:47', '2023-11-30 20:32:47', 1),
(21, 1, 1, '2023-11-30 20:36:03', 'Dine-in', 'Inactive', '16.49', '0.00', NULL, NULL, NULL, '2023-11-30 20:36:03', '2023-11-30 20:36:03', 1),
(22, 1, 1, '2023-11-30 22:17:10', 'Dine-in', 'Inactive', '14.49', '0.00', NULL, NULL, NULL, '2023-11-30 22:17:10', '2023-11-30 22:17:10', 1),
(23, 1, 1, '2023-11-30 22:22:31', 'Dine-in', 'Inactive', '23.50', '0.00', NULL, NULL, NULL, '2023-11-30 22:22:31', '2023-11-30 22:22:31', 1),
(24, 1, 1, '2023-11-30 22:26:15', 'Dine-in', 'Inactive', '23.50', '0.00', NULL, NULL, NULL, '2023-11-30 22:26:15', '2023-11-30 22:26:15', 1),
(25, 1, 1, '2023-11-30 22:28:28', 'Dine-in', 'Inactive', '30.49', '0.00', NULL, NULL, NULL, '2023-11-30 22:28:28', '2023-11-30 22:28:28', 1),
(26, 1, 1, '2023-11-30 22:30:41', 'Dine-in', 'Inactive', '81.49', '0.00', NULL, NULL, NULL, '2023-11-30 22:30:41', '2023-11-30 22:30:41', 1),
(27, 1, 1, '2023-11-30 22:35:14', 'Dine-in', 'Inactive', '103.50', '0.00', NULL, NULL, NULL, '2023-11-30 22:35:14', '2023-11-30 22:35:14', 1),
(28, 1, 1, '2023-11-30 22:37:07', 'Dine-in', 'Inactive', '103.50', '0.00', NULL, NULL, NULL, '2023-11-30 22:37:07', '2023-11-30 22:37:07', 1),
(29, 1, 1, '2023-11-30 22:39:53', 'Dine-in', 'Inactive', '63.50', '0.00', NULL, NULL, NULL, '2023-11-30 22:39:53', '2023-11-30 22:39:53', 1),
(30, 1, 1, '2023-11-30 22:40:15', 'Dine-in', 'Inactive', '63.50', '0.00', NULL, NULL, NULL, '2023-11-30 22:40:15', '2023-11-30 22:40:15', 1),
(31, 1, 1, '2023-11-30 22:41:26', 'Dine-in', 'Inactive', '83.50', '0.00', NULL, NULL, NULL, '2023-11-30 22:41:26', '2023-11-30 22:41:26', 1),
(32, 1, 1, '2023-11-30 22:44:23', 'Dine-in', 'Inactive', '104.39', '0.00', NULL, NULL, NULL, '2023-11-30 22:44:23', '2023-11-30 22:44:23', 1),
(33, 1, 1, '2023-11-30 22:47:47', 'Dine-in', 'Inactive', '104.39', '0.00', NULL, NULL, NULL, '2023-11-30 22:47:47', '2023-11-30 22:47:47', 1),
(34, 1, 1, '2023-11-30 23:05:17', 'Delivery', 'Inactive', '25.48', '0.00', 'H#5, St#8, Mehran Park', NULL, NULL, '2023-11-30 23:05:17', '2023-11-30 23:05:17', 1);

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `orders_after_delete` AFTER DELETE ON `orders` FOR EACH ROW BEGIN
  INSERT INTO orders_audit (action, order_id, prev_data, new_data)
  VALUES ('DELETE', OLD.order_id, JSON_OBJECT('cart_id', OLD.cart_id, 'restaurant_id', OLD.restaurant_id, 'order_date', OLD.order_date, 'order_type', OLD.order_type, 'status', OLD.status, 'total_price', OLD.total_price, 'discount', OLD.discount, 'delivery_address', OLD.delivery_address, 'pickup_time', OLD.pickup_time, 'table_number', OLD.table_number, 'CreatedAt', OLD.CreatedAt, 'UpdatedAt', OLD.UpdatedAt, 'Active', OLD.Active), NULL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `orders_after_insert` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
  INSERT INTO orders_audit (action, order_id, prev_data, new_data)
  VALUES ('INSERT', NEW.order_id, NULL, JSON_OBJECT('cart_id', NEW.cart_id, 'restaurant_id', NEW.restaurant_id, 'order_date', NEW.order_date, 'order_type', NEW.order_type, 'status', NEW.status, 'total_price', NEW.total_price, 'discount', NEW.discount, 'delivery_address', NEW.delivery_address, 'pickup_time', NEW.pickup_time, 'table_number', NEW.table_number, 'CreatedAt', NEW.CreatedAt, 'UpdatedAt', NEW.UpdatedAt, 'Active', NEW.Active));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `orders_after_update` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
  INSERT INTO orders_audit (action, order_id, prev_data, new_data)
  VALUES ('UPDATE', NEW.order_id, JSON_OBJECT('cart_id', OLD.cart_id, 'restaurant_id', OLD.restaurant_id, 'order_date', OLD.order_date, 'order_type', OLD.order_type, 'status', OLD.status, 'total_price', OLD.total_price, 'discount', OLD.discount, 'delivery_address', OLD.delivery_address, 'pickup_time', OLD.pickup_time, 'table_number', OLD.table_number, 'CreatedAt', OLD.CreatedAt, 'UpdatedAt', OLD.UpdatedAt, 'Active', OLD.Active), JSON_OBJECT('cart_id', NEW.cart_id, 'restaurant_id', NEW.restaurant_id, 'order_date', NEW.order_date, 'order_type', NEW.order_type, 'status', NEW.status, 'total_price', NEW.total_price, 'discount', NEW.discount, 'delivery_address', NEW.delivery_address, 'pickup_time', NEW.pickup_time, 'table_number', NEW.table_number, 'CreatedAt', NEW.CreatedAt, 'UpdatedAt', NEW.UpdatedAt, 'Active', NEW.Active));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders_audit`
--

CREATE TABLE `orders_audit` (
  `audit_id` int(11) NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `prev_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`prev_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_data`)),
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_audit`
--

INSERT INTO `orders_audit` (`audit_id`, `action`, `order_id`, `prev_data`, `new_data`, `timestamp`) VALUES
(1, 'INSERT', 13, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 11:26:28\", \"order_type\": \"Delivery\", \"status\": \"Active\", \"total_price\": 71.46, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 11:26:28\", \"UpdatedAt\": \"2023-11-30 11:26:28\", \"Active\": 1}', '2023-11-30 06:26:28'),
(2, 'DELETE', 13, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 11:26:28\", \"order_type\": \"Delivery\", \"status\": \"Active\", \"total_price\": 71.46, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 11:26:28\", \"UpdatedAt\": \"2023-11-30 11:26:28\", \"Active\": 1}', NULL, '2023-11-30 06:26:28'),
(3, 'INSERT', 14, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 09:59:23'),
(4, 'INSERT', 15, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 10:04:55'),
(5, 'INSERT', 16, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 10:10:25'),
(6, 'INSERT', 17, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Active\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 10:11:08'),
(7, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 10:11:09'),
(8, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 10:11:09'),
(9, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 10:11:09'),
(10, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Active\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 10:11:09'),
(11, 'INSERT', 18, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 14:16:29'),
(12, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 14:16:29'),
(13, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 14:16:29'),
(14, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 14:16:29'),
(15, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 14:16:29'),
(16, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 14:16:29'),
(17, 'INSERT', 19, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 15:28:54'),
(18, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 15:28:54'),
(19, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 15:28:54'),
(20, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 15:28:54'),
(21, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 15:28:54'),
(22, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 15:28:54'),
(23, 'UPDATE', 19, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 15:28:54'),
(24, 'INSERT', 20, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Active\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '2023-11-30 15:32:47'),
(25, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 15:32:48'),
(26, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 15:32:48'),
(27, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 15:32:48'),
(28, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 15:32:48'),
(29, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 15:32:48'),
(30, 'UPDATE', 19, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 15:32:48'),
(31, 'UPDATE', 20, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Active\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '2023-11-30 15:32:48'),
(32, 'INSERT', 21, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '2023-11-30 15:36:03'),
(33, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 15:36:04'),
(34, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 15:36:04'),
(35, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 15:36:04'),
(36, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 15:36:04'),
(37, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 15:36:04'),
(38, 'UPDATE', 19, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 15:36:04'),
(39, 'UPDATE', 20, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '2023-11-30 15:36:04'),
(40, 'UPDATE', 21, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '2023-11-30 15:36:04'),
(41, 'INSERT', 22, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '2023-11-30 17:17:10'),
(42, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 17:17:10'),
(43, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 17:17:10'),
(44, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 17:17:10'),
(45, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 17:17:10'),
(46, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 17:17:10'),
(47, 'UPDATE', 19, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 17:17:10'),
(48, 'UPDATE', 20, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '2023-11-30 17:17:10'),
(49, 'UPDATE', 21, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '2023-11-30 17:17:10'),
(50, 'UPDATE', 22, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '2023-11-30 17:17:10'),
(51, 'INSERT', 23, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '2023-11-30 17:22:31'),
(52, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 17:22:31'),
(53, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 17:22:31'),
(54, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 17:22:31'),
(55, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 17:22:31'),
(56, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 17:22:31'),
(57, 'UPDATE', 19, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 17:22:31'),
(58, 'UPDATE', 20, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '2023-11-30 17:22:31'),
(59, 'UPDATE', 21, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '2023-11-30 17:22:31'),
(60, 'UPDATE', 22, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '2023-11-30 17:22:31'),
(61, 'UPDATE', 23, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '2023-11-30 17:22:31'),
(62, 'INSERT', 24, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '2023-11-30 17:26:15'),
(63, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 17:26:15'),
(64, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 17:26:15'),
(65, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 17:26:15'),
(66, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 17:26:15'),
(67, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 17:26:15'),
(68, 'UPDATE', 19, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 17:26:15'),
(69, 'UPDATE', 20, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '2023-11-30 17:26:15'),
(70, 'UPDATE', 21, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '2023-11-30 17:26:15'),
(71, 'UPDATE', 22, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '2023-11-30 17:26:15'),
(72, 'UPDATE', 23, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '2023-11-30 17:26:15');
INSERT INTO `orders_audit` (`audit_id`, `action`, `order_id`, `prev_data`, `new_data`, `timestamp`) VALUES
(73, 'UPDATE', 24, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '2023-11-30 17:26:15'),
(74, 'INSERT', 25, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '2023-11-30 17:28:28'),
(75, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 17:28:28'),
(76, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 17:28:28'),
(77, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 17:28:28'),
(78, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 17:28:28'),
(79, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 17:28:28'),
(80, 'UPDATE', 19, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 17:28:28'),
(81, 'UPDATE', 20, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '2023-11-30 17:28:28'),
(82, 'UPDATE', 21, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '2023-11-30 17:28:28'),
(83, 'UPDATE', 22, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '2023-11-30 17:28:28'),
(84, 'UPDATE', 23, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '2023-11-30 17:28:28'),
(85, 'UPDATE', 24, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '2023-11-30 17:28:28'),
(86, 'UPDATE', 25, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '2023-11-30 17:28:28'),
(87, 'INSERT', 26, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '2023-11-30 17:30:41'),
(88, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 17:30:41'),
(89, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 17:30:41'),
(90, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 17:30:41'),
(91, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 17:30:41'),
(92, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 17:30:41'),
(93, 'UPDATE', 19, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 17:30:41'),
(94, 'UPDATE', 20, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '2023-11-30 17:30:41'),
(95, 'UPDATE', 21, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '2023-11-30 17:30:41'),
(96, 'UPDATE', 22, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '2023-11-30 17:30:41'),
(97, 'UPDATE', 23, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '2023-11-30 17:30:41'),
(98, 'UPDATE', 24, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '2023-11-30 17:30:41'),
(99, 'UPDATE', 25, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '2023-11-30 17:30:41'),
(100, 'UPDATE', 26, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '2023-11-30 17:30:41'),
(101, 'INSERT', 27, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:35:14\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:35:14\", \"UpdatedAt\": \"2023-11-30 22:35:14\", \"Active\": 1}', '2023-11-30 17:35:14'),
(102, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 17:35:14'),
(103, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 17:35:14'),
(104, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 17:35:14'),
(105, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 17:35:14'),
(106, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 17:35:14'),
(107, 'UPDATE', 19, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 17:35:14'),
(108, 'UPDATE', 20, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '2023-11-30 17:35:14'),
(109, 'UPDATE', 21, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '2023-11-30 17:35:14'),
(110, 'UPDATE', 22, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '2023-11-30 17:35:14'),
(111, 'UPDATE', 23, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '2023-11-30 17:35:14'),
(112, 'UPDATE', 24, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '2023-11-30 17:35:14'),
(113, 'UPDATE', 25, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '2023-11-30 17:35:14'),
(114, 'UPDATE', 26, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '2023-11-30 17:35:14'),
(115, 'UPDATE', 27, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:35:14\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:35:14\", \"UpdatedAt\": \"2023-11-30 22:35:14\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:35:14\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:35:14\", \"UpdatedAt\": \"2023-11-30 22:35:14\", \"Active\": 1}', '2023-11-30 17:35:14'),
(116, 'INSERT', 28, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:37:07\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:37:07\", \"UpdatedAt\": \"2023-11-30 22:37:07\", \"Active\": 1}', '2023-11-30 17:37:07'),
(117, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 17:37:07'),
(118, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 17:37:07'),
(119, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 17:37:07'),
(120, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 17:37:07'),
(121, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 17:37:07'),
(122, 'UPDATE', 19, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 17:37:07'),
(123, 'UPDATE', 20, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '2023-11-30 17:37:07'),
(124, 'UPDATE', 21, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '2023-11-30 17:37:07'),
(125, 'UPDATE', 22, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '2023-11-30 17:37:07'),
(126, 'UPDATE', 23, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '2023-11-30 17:37:07'),
(127, 'UPDATE', 24, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '2023-11-30 17:37:07'),
(128, 'UPDATE', 25, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '2023-11-30 17:37:07'),
(129, 'UPDATE', 26, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '2023-11-30 17:37:07'),
(130, 'UPDATE', 27, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:35:14\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:35:14\", \"UpdatedAt\": \"2023-11-30 22:35:14\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:35:14\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:35:14\", \"UpdatedAt\": \"2023-11-30 22:35:14\", \"Active\": 1}', '2023-11-30 17:37:07'),
(131, 'UPDATE', 28, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:37:07\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:37:07\", \"UpdatedAt\": \"2023-11-30 22:37:07\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:37:07\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:37:07\", \"UpdatedAt\": \"2023-11-30 22:37:07\", \"Active\": 1}', '2023-11-30 17:37:07'),
(132, 'INSERT', 29, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:39:53\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:39:53\", \"UpdatedAt\": \"2023-11-30 22:39:53\", \"Active\": 1}', '2023-11-30 17:39:53'),
(133, 'INSERT', 30, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:40:15\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:40:15\", \"UpdatedAt\": \"2023-11-30 22:40:15\", \"Active\": 1}', '2023-11-30 17:40:15'),
(134, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 17:40:15'),
(135, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 17:40:15'),
(136, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 17:40:15'),
(137, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 17:40:15'),
(138, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 17:40:15'),
(139, 'UPDATE', 19, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 17:40:15'),
(140, 'UPDATE', 20, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '2023-11-30 17:40:15'),
(141, 'UPDATE', 21, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '2023-11-30 17:40:15');
INSERT INTO `orders_audit` (`audit_id`, `action`, `order_id`, `prev_data`, `new_data`, `timestamp`) VALUES
(142, 'UPDATE', 22, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '2023-11-30 17:40:15'),
(143, 'UPDATE', 23, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '2023-11-30 17:40:15'),
(144, 'UPDATE', 24, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '2023-11-30 17:40:15'),
(145, 'UPDATE', 25, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '2023-11-30 17:40:15'),
(146, 'UPDATE', 26, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '2023-11-30 17:40:15'),
(147, 'UPDATE', 27, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:35:14\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:35:14\", \"UpdatedAt\": \"2023-11-30 22:35:14\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:35:14\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:35:14\", \"UpdatedAt\": \"2023-11-30 22:35:14\", \"Active\": 1}', '2023-11-30 17:40:15'),
(148, 'UPDATE', 28, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:37:07\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:37:07\", \"UpdatedAt\": \"2023-11-30 22:37:07\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:37:07\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:37:07\", \"UpdatedAt\": \"2023-11-30 22:37:07\", \"Active\": 1}', '2023-11-30 17:40:15'),
(149, 'UPDATE', 29, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:39:53\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:39:53\", \"UpdatedAt\": \"2023-11-30 22:39:53\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:39:53\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:39:53\", \"UpdatedAt\": \"2023-11-30 22:39:53\", \"Active\": 1}', '2023-11-30 17:40:15'),
(150, 'UPDATE', 30, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:40:15\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:40:15\", \"UpdatedAt\": \"2023-11-30 22:40:15\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:40:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:40:15\", \"UpdatedAt\": \"2023-11-30 22:40:15\", \"Active\": 1}', '2023-11-30 17:40:15'),
(151, 'INSERT', 31, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:41:26\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 83.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:41:26\", \"UpdatedAt\": \"2023-11-30 22:41:26\", \"Active\": 1}', '2023-11-30 17:41:26'),
(152, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 17:41:26'),
(153, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 17:41:26'),
(154, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 17:41:26'),
(155, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 17:41:26'),
(156, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 17:41:26'),
(157, 'UPDATE', 19, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 17:41:26'),
(158, 'UPDATE', 20, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '2023-11-30 17:41:26'),
(159, 'UPDATE', 21, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '2023-11-30 17:41:26'),
(160, 'UPDATE', 22, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '2023-11-30 17:41:26'),
(161, 'UPDATE', 23, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '2023-11-30 17:41:26'),
(162, 'UPDATE', 24, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '2023-11-30 17:41:26'),
(163, 'UPDATE', 25, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '2023-11-30 17:41:26'),
(164, 'UPDATE', 26, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '2023-11-30 17:41:26'),
(165, 'UPDATE', 27, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:35:14\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:35:14\", \"UpdatedAt\": \"2023-11-30 22:35:14\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:35:14\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:35:14\", \"UpdatedAt\": \"2023-11-30 22:35:14\", \"Active\": 1}', '2023-11-30 17:41:26'),
(166, 'UPDATE', 28, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:37:07\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:37:07\", \"UpdatedAt\": \"2023-11-30 22:37:07\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:37:07\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:37:07\", \"UpdatedAt\": \"2023-11-30 22:37:07\", \"Active\": 1}', '2023-11-30 17:41:26'),
(167, 'UPDATE', 29, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:39:53\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:39:53\", \"UpdatedAt\": \"2023-11-30 22:39:53\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:39:53\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:39:53\", \"UpdatedAt\": \"2023-11-30 22:39:53\", \"Active\": 1}', '2023-11-30 17:41:26'),
(168, 'UPDATE', 30, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:40:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:40:15\", \"UpdatedAt\": \"2023-11-30 22:40:15\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:40:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:40:15\", \"UpdatedAt\": \"2023-11-30 22:40:15\", \"Active\": 1}', '2023-11-30 17:41:26'),
(169, 'UPDATE', 31, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:41:26\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 83.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:41:26\", \"UpdatedAt\": \"2023-11-30 22:41:26\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:41:26\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 83.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:41:26\", \"UpdatedAt\": \"2023-11-30 22:41:26\", \"Active\": 1}', '2023-11-30 17:41:26'),
(170, 'INSERT', 32, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:44:23\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 104.39, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:44:23\", \"UpdatedAt\": \"2023-11-30 22:44:23\", \"Active\": 1}', '2023-11-30 17:44:23'),
(171, 'INSERT', 33, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:47:47\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 104.39, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:47:47\", \"UpdatedAt\": \"2023-11-30 22:47:47\", \"Active\": 1}', '2023-11-30 17:47:47'),
(172, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 17:47:47'),
(173, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 17:47:47'),
(174, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 17:47:47'),
(175, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 17:47:47'),
(176, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 17:47:47'),
(177, 'UPDATE', 19, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 17:47:47'),
(178, 'UPDATE', 20, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '2023-11-30 17:47:47'),
(179, 'UPDATE', 21, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '2023-11-30 17:47:47'),
(180, 'UPDATE', 22, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '2023-11-30 17:47:47'),
(181, 'UPDATE', 23, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '2023-11-30 17:47:47'),
(182, 'UPDATE', 24, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '2023-11-30 17:47:47'),
(183, 'UPDATE', 25, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '2023-11-30 17:47:47'),
(184, 'UPDATE', 26, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '2023-11-30 17:47:47'),
(185, 'UPDATE', 27, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:35:14\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:35:14\", \"UpdatedAt\": \"2023-11-30 22:35:14\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:35:14\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:35:14\", \"UpdatedAt\": \"2023-11-30 22:35:14\", \"Active\": 1}', '2023-11-30 17:47:47'),
(186, 'UPDATE', 28, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:37:07\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:37:07\", \"UpdatedAt\": \"2023-11-30 22:37:07\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:37:07\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:37:07\", \"UpdatedAt\": \"2023-11-30 22:37:07\", \"Active\": 1}', '2023-11-30 17:47:47'),
(187, 'UPDATE', 29, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:39:53\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:39:53\", \"UpdatedAt\": \"2023-11-30 22:39:53\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:39:53\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:39:53\", \"UpdatedAt\": \"2023-11-30 22:39:53\", \"Active\": 1}', '2023-11-30 17:47:47'),
(188, 'UPDATE', 30, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:40:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:40:15\", \"UpdatedAt\": \"2023-11-30 22:40:15\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:40:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:40:15\", \"UpdatedAt\": \"2023-11-30 22:40:15\", \"Active\": 1}', '2023-11-30 17:47:47'),
(189, 'UPDATE', 31, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:41:26\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 83.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:41:26\", \"UpdatedAt\": \"2023-11-30 22:41:26\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:41:26\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 83.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:41:26\", \"UpdatedAt\": \"2023-11-30 22:41:26\", \"Active\": 1}', '2023-11-30 17:47:47'),
(190, 'UPDATE', 32, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:44:23\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 104.39, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:44:23\", \"UpdatedAt\": \"2023-11-30 22:44:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:44:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 104.39, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:44:23\", \"UpdatedAt\": \"2023-11-30 22:44:23\", \"Active\": 1}', '2023-11-30 17:47:47'),
(191, 'UPDATE', 33, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:47:47\", \"order_type\": \"Dine-in\", \"status\": \"Active\", \"total_price\": 104.39, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:47:47\", \"UpdatedAt\": \"2023-11-30 22:47:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:47:47\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 104.39, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:47:47\", \"UpdatedAt\": \"2023-11-30 22:47:47\", \"Active\": 1}', '2023-11-30 17:47:47'),
(192, 'INSERT', 34, NULL, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 23:05:17\", \"order_type\": \"Delivery\", \"status\": \"Active\", \"total_price\": 25.48, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 23:05:17\", \"UpdatedAt\": \"2023-11-30 23:05:17\", \"Active\": 1}', '2023-11-30 18:05:17'),
(193, 'UPDATE', 14, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 14:59:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 0.00, \"discount\": 0.00, \"delivery_address\": \"\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 14:59:23\", \"UpdatedAt\": \"2023-11-30 14:59:23\", \"Active\": 1}', '2023-11-30 18:05:18'),
(194, 'UPDATE', 15, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:04:55\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:04:55\", \"UpdatedAt\": \"2023-11-30 15:04:55\", \"Active\": 1}', '2023-11-30 18:05:18'),
(195, 'UPDATE', 16, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:10:25\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:10:25\", \"UpdatedAt\": \"2023-11-30 15:10:25\", \"Active\": 1}', '2023-11-30 18:05:18'),
(196, 'UPDATE', 17, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 15:11:08\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 18.50, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 15:11:08\", \"UpdatedAt\": \"2023-11-30 15:11:08\", \"Active\": 1}', '2023-11-30 18:05:18'),
(197, 'UPDATE', 18, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 19:16:29\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 19:16:29\", \"UpdatedAt\": \"2023-11-30 19:16:29\", \"Active\": 1}', '2023-11-30 18:05:18'),
(198, 'UPDATE', 19, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:28:54\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:28:54\", \"UpdatedAt\": \"2023-11-30 20:28:54\", \"Active\": 1}', '2023-11-30 18:05:18'),
(199, 'UPDATE', 20, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:32:47\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 107.42, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:32:47\", \"UpdatedAt\": \"2023-11-30 20:32:47\", \"Active\": 1}', '2023-11-30 18:05:18'),
(200, 'UPDATE', 21, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 20:36:03\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 16.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 20:36:03\", \"UpdatedAt\": \"2023-11-30 20:36:03\", \"Active\": 1}', '2023-11-30 18:05:18'),
(201, 'UPDATE', 22, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:17:10\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 14.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:17:10\", \"UpdatedAt\": \"2023-11-30 22:17:10\", \"Active\": 1}', '2023-11-30 18:05:18'),
(202, 'UPDATE', 23, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:22:31\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:22:31\", \"UpdatedAt\": \"2023-11-30 22:22:31\", \"Active\": 1}', '2023-11-30 18:05:18'),
(203, 'UPDATE', 24, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:26:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 23.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:26:15\", \"UpdatedAt\": \"2023-11-30 22:26:15\", \"Active\": 1}', '2023-11-30 18:05:18'),
(204, 'UPDATE', 25, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:28:28\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 30.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:28:28\", \"UpdatedAt\": \"2023-11-30 22:28:28\", \"Active\": 1}', '2023-11-30 18:05:18'),
(205, 'UPDATE', 26, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:30:41\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 81.49, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:30:41\", \"UpdatedAt\": \"2023-11-30 22:30:41\", \"Active\": 1}', '2023-11-30 18:05:18'),
(206, 'UPDATE', 27, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:35:14\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:35:14\", \"UpdatedAt\": \"2023-11-30 22:35:14\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:35:14\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:35:14\", \"UpdatedAt\": \"2023-11-30 22:35:14\", \"Active\": 1}', '2023-11-30 18:05:18'),
(207, 'UPDATE', 28, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:37:07\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:37:07\", \"UpdatedAt\": \"2023-11-30 22:37:07\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:37:07\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 103.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:37:07\", \"UpdatedAt\": \"2023-11-30 22:37:07\", \"Active\": 1}', '2023-11-30 18:05:18'),
(208, 'UPDATE', 29, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:39:53\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:39:53\", \"UpdatedAt\": \"2023-11-30 22:39:53\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:39:53\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:39:53\", \"UpdatedAt\": \"2023-11-30 22:39:53\", \"Active\": 1}', '2023-11-30 18:05:18'),
(209, 'UPDATE', 30, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:40:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:40:15\", \"UpdatedAt\": \"2023-11-30 22:40:15\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:40:15\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 63.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:40:15\", \"UpdatedAt\": \"2023-11-30 22:40:15\", \"Active\": 1}', '2023-11-30 18:05:18');
INSERT INTO `orders_audit` (`audit_id`, `action`, `order_id`, `prev_data`, `new_data`, `timestamp`) VALUES
(210, 'UPDATE', 31, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:41:26\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 83.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:41:26\", \"UpdatedAt\": \"2023-11-30 22:41:26\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:41:26\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 83.50, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:41:26\", \"UpdatedAt\": \"2023-11-30 22:41:26\", \"Active\": 1}', '2023-11-30 18:05:18'),
(211, 'UPDATE', 32, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:44:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 104.39, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:44:23\", \"UpdatedAt\": \"2023-11-30 22:44:23\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:44:23\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 104.39, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:44:23\", \"UpdatedAt\": \"2023-11-30 22:44:23\", \"Active\": 1}', '2023-11-30 18:05:18'),
(212, 'UPDATE', 33, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:47:47\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 104.39, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:47:47\", \"UpdatedAt\": \"2023-11-30 22:47:47\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 22:47:47\", \"order_type\": \"Dine-in\", \"status\": \"Inactive\", \"total_price\": 104.39, \"discount\": 0.00, \"delivery_address\": null, \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 22:47:47\", \"UpdatedAt\": \"2023-11-30 22:47:47\", \"Active\": 1}', '2023-11-30 18:05:18'),
(213, 'UPDATE', 34, '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 23:05:17\", \"order_type\": \"Delivery\", \"status\": \"Active\", \"total_price\": 25.48, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 23:05:17\", \"UpdatedAt\": \"2023-11-30 23:05:17\", \"Active\": 1}', '{\"cart_id\": 1, \"restaurant_id\": 1, \"order_date\": \"2023-11-30 23:05:17\", \"order_type\": \"Delivery\", \"status\": \"Inactive\", \"total_price\": 25.48, \"discount\": 0.00, \"delivery_address\": \"H#5, St#8, Mehran Park\", \"pickup_time\": null, \"table_number\": null, \"CreatedAt\": \"2023-11-30 23:05:17\", \"UpdatedAt\": \"2023-11-30 23:05:17\", \"Active\": 1}', '2023-11-30 18:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `Payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_date` datetime NOT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `payments`
--
DELIMITER $$
CREATE TRIGGER `payments_after_delete` AFTER DELETE ON `payments` FOR EACH ROW BEGIN
  INSERT INTO payments_audit (action, Payment_id, prev_data, new_data)
  VALUES ('DELETE', OLD.Payment_id, JSON_OBJECT('order_id', OLD.order_id, 'payment_date', OLD.payment_date, 'payment_amount', OLD.payment_amount), NULL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `payments_after_insert` AFTER INSERT ON `payments` FOR EACH ROW BEGIN
  INSERT INTO payments_audit (action, Payment_id, prev_data, new_data)
  VALUES ('INSERT', NEW.Payment_id, NULL, JSON_OBJECT('order_id', NEW.order_id, 'payment_date', NEW.payment_date, 'payment_amount', NEW.payment_amount));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `payments_after_update` AFTER UPDATE ON `payments` FOR EACH ROW BEGIN
  INSERT INTO payments_audit (action, Payment_id, prev_data, new_data)
  VALUES ('UPDATE', NEW.Payment_id, JSON_OBJECT('order_id', OLD.order_id, 'payment_date', OLD.payment_date, 'payment_amount', OLD.payment_amount), JSON_OBJECT('order_id', NEW.order_id, 'payment_date', NEW.payment_date, 'payment_amount', NEW.payment_amount));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payments_audit`
--

CREATE TABLE `payments_audit` (
  `audit_id` int(11) NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `Payment_id` int(11) DEFAULT NULL,
  `prev_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`prev_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_data`)),
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `productcomments`
--

CREATE TABLE `productcomments` (
  `ProductComment_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `comment_date` datetime NOT NULL,
  `comment_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `productordercount`
--

CREATE TABLE `productordercount` (
  `ProductOrderCount_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productordercount`
--

INSERT INTO `productordercount` (`ProductOrderCount_id`, `product_id`, `order_count`) VALUES
(0, 1, 21),
(1, 2, 9),
(2, 3, 6),
(3, 0, 7),
(4, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `discount` int(11) DEFAULT 0,
  `total_sales` decimal(10,2) DEFAULT 0.00,
  `CreatedAt` datetime NOT NULL,
  `UpdatedAt` datetime NOT NULL,
  `Active` tinyint(1) NOT NULL,
  `menu_item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `picture`, `price`, `discount`, `total_sales`, `CreatedAt`, `UpdatedAt`, `Active`, `menu_item_id`) VALUES
(0, 'Tikka Pizza', 'Delicious Tikka Pizza', 'assets/images/gallery/small/pic1.jpg', '12.99', 30, '1.00', '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1, 2),
(1, 'Rice', 'Flavorful Rice', 'assets/images/gallery/small/pic2.jpg', '8.99', 30, '1.00', '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1, 6),
(2, 'Green Salad', 'Fresh Green Salad', 'assets/images/gallery/small/pic3.jpg', '6.99', 30, '0.00', '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1, 7),
(3, 'Pasta', 'Tasty Pasta', 'assets/images/gallery/small/pic4.jpg', '10.99', 30, '0.00', '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1, 3),
(4, 'Beef Burger', 'Delicious Burger', 'assets\\images\\menu-small\\pic1.png', '20.00', 30, '0.00', '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1, 1),
(5, 'Chicken Pasta', 'Tasty Pasta', 'assets\\images\\menu-small\\pic9.png', '10.00', 0, '0.00', '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1, 2),
(6, 'Tandoor', 'Flavorful Tandoor', 'assets\\images\\menu-small\\pic12.png', '15.00', 0, '0.00', '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1, 3),
(7, 'Dal Fry', 'Yummy Dal Fry', 'assets\\images\\menu-small\\grid\\pic3.png', '65.00', 30, '0.00', '2023-11-18 10:00:00', '2023-11-18 10:00:00', 1, 4);

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `products_after_delete_trigger` AFTER DELETE ON `products` FOR EACH ROW BEGIN
  INSERT INTO products_audit (action, product_id, prev_data, new_data)
  VALUES ('DELETE', OLD.product_id, 
    JSON_OBJECT('name', OLD.name, 'description', OLD.description, 'picture', OLD.picture, 'price', OLD.price, 'CreatedAt', OLD.CreatedAt, 'UpdatedAt', OLD.UpdatedAt, 'Active', OLD.Active, 'menu_item_id', OLD.menu_item_id),
    NULL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `products_after_insert_trigger` AFTER INSERT ON `products` FOR EACH ROW BEGIN
  INSERT INTO products_audit (action, product_id, prev_data, new_data)
  VALUES ('INSERT', NEW.product_id, NULL, 
    JSON_OBJECT('name', NEW.name, 'description', NEW.description, 'picture', NEW.picture, 'price', NEW.price, 'CreatedAt', NEW.CreatedAt, 'UpdatedAt', NEW.UpdatedAt, 'Active', NEW.Active, 'menu_item_id', NEW.menu_item_id));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `products_after_update_trigger` AFTER UPDATE ON `products` FOR EACH ROW BEGIN
  INSERT INTO products_audit (action, product_id, prev_data, new_data)
  VALUES ('UPDATE', OLD.product_id, 
    JSON_OBJECT('name', OLD.name, 'description', OLD.description, 'picture', OLD.picture, 'price', OLD.price, 'CreatedAt', OLD.CreatedAt, 'UpdatedAt', OLD.UpdatedAt, 'Active', OLD.Active, 'menu_item_id', OLD.menu_item_id),
    JSON_OBJECT('name', NEW.name, 'description', NEW.description, 'picture', NEW.picture, 'price', NEW.price, 'CreatedAt', NEW.CreatedAt, 'UpdatedAt', NEW.UpdatedAt, 'Active', NEW.Active, 'menu_item_id', NEW.menu_item_id));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `products_audit`
--

CREATE TABLE `products_audit` (
  `audit_id` int(11) NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `prev_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`prev_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_data`)),
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_audit`
--

INSERT INTO `products_audit` (`audit_id`, `action`, `product_id`, `prev_data`, `new_data`, `timestamp`) VALUES
(1, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"threshold_quantity\": 50, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"threshold_quantity\": 50, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 15:28:54'),
(2, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"threshold_quantity\": 50, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"threshold_quantity\": 50, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 15:32:47'),
(3, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"threshold_quantity\": 50, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"threshold_quantity\": 50, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 15:36:03'),
(4, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 16:58:46'),
(5, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 16:58:46'),
(6, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 16:58:46'),
(7, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 16:59:24'),
(8, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 16:59:24'),
(9, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 16:59:24'),
(10, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:04:12'),
(11, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 17:04:12'),
(12, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:04:12'),
(13, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:05:25'),
(14, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 17:05:25'),
(15, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:05:25'),
(16, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:06:24'),
(17, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 17:06:24'),
(18, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:06:24'),
(19, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:07:37'),
(20, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 17:07:37'),
(21, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:07:37'),
(22, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:10:51'),
(23, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:10:51'),
(24, 'UPDATE', 3, '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:10:51'),
(25, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:12:05'),
(26, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:12:12'),
(27, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:12:12'),
(28, 'UPDATE', 3, '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:12:12'),
(29, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:16:10'),
(30, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:16:10'),
(31, 'UPDATE', 3, '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:16:10'),
(32, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:16:54'),
(33, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:16:54'),
(34, 'UPDATE', 3, '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:16:54'),
(35, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:19:05'),
(36, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:19:05'),
(37, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 17:19:05'),
(38, 'UPDATE', 3, '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:19:05'),
(39, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 17:19:05'),
(40, 'UPDATE', 5, '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:19:05'),
(41, 'UPDATE', 6, '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:19:05'),
(42, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:19:05'),
(43, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:19:10'),
(44, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:19:10'),
(45, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 17:19:10'),
(46, 'UPDATE', 3, '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:19:10'),
(47, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 17:19:10'),
(48, 'UPDATE', 5, '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:19:10'),
(49, 'UPDATE', 6, '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:19:10'),
(50, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:19:10'),
(51, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:22:45'),
(52, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:22:45'),
(53, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 17:22:45'),
(54, 'UPDATE', 3, '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:22:45'),
(55, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 17:22:45'),
(56, 'UPDATE', 5, '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:22:45'),
(57, 'UPDATE', 6, '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:22:45'),
(58, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:22:45'),
(59, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:25:50'),
(60, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:25:50'),
(61, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 17:25:50'),
(62, 'UPDATE', 3, '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:25:50'),
(63, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 17:25:50'),
(64, 'UPDATE', 5, '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:25:50'),
(65, 'UPDATE', 6, '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:25:50'),
(66, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:25:50'),
(67, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:27:49'),
(68, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:27:49'),
(69, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 17:27:49'),
(70, 'UPDATE', 3, '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:27:49'),
(71, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 17:27:49'),
(72, 'UPDATE', 5, '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:27:49'),
(73, 'UPDATE', 6, '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:27:49'),
(74, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:27:49'),
(75, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:28:16'),
(76, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:28:16'),
(77, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 17:28:16'),
(78, 'UPDATE', 3, '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:28:16'),
(79, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 17:28:16'),
(80, 'UPDATE', 5, '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:28:16'),
(81, 'UPDATE', 6, '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:28:16'),
(82, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:28:16'),
(83, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:43:40'),
(84, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 17:43:40'),
(85, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:43:40'),
(86, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:43:57'),
(87, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 17:43:57'),
(88, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:43:57'),
(89, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:44:11');
INSERT INTO `products_audit` (`audit_id`, `action`, `product_id`, `prev_data`, `new_data`, `timestamp`) VALUES
(90, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 17:44:11'),
(91, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:44:11'),
(92, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:47:47'),
(93, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:47:47'),
(94, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 17:47:47'),
(95, 'UPDATE', 3, '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:47:47'),
(96, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 17:47:47'),
(97, 'UPDATE', 5, '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 17:47:47'),
(98, 'UPDATE', 6, '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 17:47:47'),
(99, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:47:47'),
(100, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:48:49'),
(101, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 17:48:49'),
(102, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:48:49'),
(103, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:50:03'),
(104, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 17:50:03'),
(105, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:50:03'),
(106, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:50:45'),
(107, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 17:50:45'),
(108, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:50:45'),
(109, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:51:38'),
(110, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 17:51:38'),
(111, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:51:38'),
(112, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:55:34'),
(113, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 17:55:34'),
(114, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:55:34'),
(115, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 17:55:48'),
(116, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 17:55:48'),
(117, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 17:55:48'),
(118, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 18:04:41'),
(119, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 18:04:41'),
(120, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 18:04:41'),
(121, 'UPDATE', 0, '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Tikka Pizza\", \"description\": \"Delicious Tikka Pizza\", \"picture\": \"assets/images/gallery/small/pic1.jpg\", \"price\": 12.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 18:05:18'),
(122, 'UPDATE', 1, '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '{\"name\": \"Rice\", \"description\": \"Flavorful Rice\", \"picture\": \"assets/images/gallery/small/pic2.jpg\", \"price\": 8.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 6}', '2023-11-30 18:05:18'),
(123, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 18:05:18'),
(124, 'UPDATE', 3, '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets/images/gallery/small/pic4.jpg\", \"price\": 10.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 18:05:18'),
(125, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 18:05:18'),
(126, 'UPDATE', 5, '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '{\"name\": \"Chicken Pasta\", \"description\": \"Tasty Pasta\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic9.png\", \"price\": 10.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 2}', '2023-11-30 18:05:18'),
(127, 'UPDATE', 6, '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '{\"name\": \"Tandoor\", \"description\": \"Flavorful Tandoor\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic12.png\", \"price\": 15.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 3}', '2023-11-30 18:05:18'),
(128, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 18:05:18'),
(129, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 18:07:43'),
(130, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 18:07:43'),
(131, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 18:07:43'),
(132, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 18:07:45'),
(133, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 18:07:45'),
(134, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 18:07:45'),
(135, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 18:08:21'),
(136, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 18:08:21'),
(137, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 18:08:21'),
(138, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 18:08:34'),
(139, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 18:08:34'),
(140, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 18:08:34'),
(141, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 18:08:52'),
(142, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 18:08:52'),
(143, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 18:08:52'),
(144, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 18:09:23'),
(145, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 18:09:23'),
(146, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 18:09:23'),
(147, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 18:09:24'),
(148, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 18:09:24'),
(149, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 18:09:24'),
(150, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 18:09:52'),
(151, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 18:09:52'),
(152, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 18:09:52'),
(153, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 18:14:36'),
(154, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 18:14:36'),
(155, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 18:14:36'),
(156, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 18:24:12'),
(157, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 18:24:12'),
(158, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 18:24:12'),
(159, 'UPDATE', 2, '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '{\"name\": \"Green Salad\", \"description\": \"Fresh Green Salad\", \"picture\": \"assets/images/gallery/small/pic3.jpg\", \"price\": 6.99, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 7}', '2023-11-30 18:24:40'),
(160, 'UPDATE', 4, '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '{\"name\": \"Beef Burger\", \"description\": \"Delicious Burger\", \"picture\": \"assets\\\\images\\\\menu-small\\\\pic1.png\", \"price\": 20.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 1}', '2023-11-30 18:24:40'),
(161, 'UPDATE', 7, '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '{\"name\": \"Dal Fry\", \"description\": \"Yummy Dal Fry\", \"picture\": \"assets\\\\images\\\\menu-small\\\\grid\\\\pic3.png\", \"price\": 65.00, \"CreatedAt\": \"2023-11-18 10:00:00\", \"UpdatedAt\": \"2023-11-18 10:00:00\", \"Active\": 1, \"menu_item_id\": 4}', '2023-11-30 18:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurant_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `open_hours` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime NOT NULL,
  `UpdatedAt` datetime NOT NULL,
  `Active` tinyint(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `remaining_tables` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restaurant_id`, `name`, `address`, `contact`, `description`, `open_hours`, `CreatedAt`, `UpdatedAt`, `Active`, `email`, `remaining_tables`) VALUES
(1, 'Foodie Express', 'Shalimar, Lahore, Pakistan', '+92 334 8076605', 'The Best Food Station', '9:00 AM - 10:00 PM', '2023-10-19 18:26:21', '2023-10-19 18:26:21', 1, 'waqasghani13@gmail.com', 10);

-- --------------------------------------------------------

--
-- Table structure for table `seatingmanagement`
--

CREATE TABLE `seatingmanagement` (
  `seating_id` int(11) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `total_seats` int(11) DEFAULT NULL,
  `table_status` varchar(50) NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seatingmanagement`
--

INSERT INTO `seatingmanagement` (`seating_id`, `restaurant_id`, `total_seats`, `table_status`) VALUES
(1, 1, 5, 'Available'),
(2, 1, 7, 'Available'),
(3, 1, 4, '0'),
(4, 1, 8, 'Available'),
(5, 1, 6, 'Available'),
(6, 1, 3, '0'),
(7, 1, 9, 'Available'),
(8, 1, 5, 'Available'),
(9, 1, 6, 'Available'),
(10, 1, 4, '0');

-- --------------------------------------------------------

--
-- Table structure for table `tablebooking`
--

CREATE TABLE `tablebooking` (
  `booking_id` int(11) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `number_of_people` int(11) DEFAULT NULL,
  `checkin_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `checkout_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `seating_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tablebooking`
--

INSERT INTO `tablebooking` (`booking_id`, `restaurant_id`, `customer_name`, `phone_number`, `email`, `number_of_people`, `checkin_time`, `checkout_time`, `seating_id`) VALUES
(4, 1, 'Muhammad Waqas Rashid', '0334807660', 'waqasghani13@gmail.com', 2, '0000-00-00 00:00:00', '2023-11-24 11:55:10', 6),
(6, 1, 'Muhammad Waqas Rashid', '0334807660', 'waqasghani13@gmail.com', 4, '0000-00-00 00:00:00', '2023-11-24 12:10:17', 10),
(7, 1, 'Muhammad Waqas Rashid', '0334807660', 'waqasghani13@gmail.com', 3, '0000-00-00 00:00:00', '2023-11-30 18:24:35', 3);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `voucher_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT NULL,
  `CreatedAt` datetime NOT NULL,
  `UpdatedAt` datetime NOT NULL,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`voucher_id`, `code`, `discount_amount`, `expiration_date`, `is_used`, `CreatedAt`, `UpdatedAt`, `Active`) VALUES
(0, 'VOUCHER123', '30.00', '2023-12-31 00:00:00', 0, '2023-11-30 21:02:00', '2023-11-30 21:02:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `user_id`, `product_id`) VALUES
(1, 1, 1),
(2, 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `cartitems_audit`
--
ALTER TABLE `cartitems_audit`
  ADD PRIMARY KEY (`audit_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `carts_audit`
--
ALTER TABLE `carts_audit`
  ADD PRIMARY KEY (`audit_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customers_audit`
--
ALTER TABLE `customers_audit`
  ADD PRIMARY KEY (`audit_id`);

--
-- Indexes for table `deliveryassignments`
--
ALTER TABLE `deliveryassignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `deliverydrivers`
--
ALTER TABLE `deliverydrivers`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`Employee_id`);

--
-- Indexes for table `error_logs`
--
ALTER TABLE `error_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `menuitems`
--
ALTER TABLE `menuitems`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `menuitems_audit`
--
ALTER TABLE `menuitems_audit`
  ADD PRIMARY KEY (`audit_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `orders_audit`
--
ALTER TABLE `orders_audit`
  ADD PRIMARY KEY (`audit_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`Payment_id`),
  ADD KEY `payments_ibfk_1` (`order_id`);

--
-- Indexes for table `payments_audit`
--
ALTER TABLE `payments_audit`
  ADD PRIMARY KEY (`audit_id`);

--
-- Indexes for table `productcomments`
--
ALTER TABLE `productcomments`
  ADD PRIMARY KEY (`ProductComment_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `productordercount`
--
ALTER TABLE `productordercount`
  ADD PRIMARY KEY (`ProductOrderCount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_menu_item` (`menu_item_id`);

--
-- Indexes for table `products_audit`
--
ALTER TABLE `products_audit`
  ADD PRIMARY KEY (`audit_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurant_id`);

--
-- Indexes for table `seatingmanagement`
--
ALTER TABLE `seatingmanagement`
  ADD PRIMARY KEY (`seating_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `tablebooking`
--
ALTER TABLE `tablebooking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `seating_id` (`seating_id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD UNIQUE KEY `unique_wishlist` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cartitems`
--
ALTER TABLE `cartitems`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `cartitems_audit`
--
ALTER TABLE `cartitems_audit`
  MODIFY `audit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `carts_audit`
--
ALTER TABLE `carts_audit`
  MODIFY `audit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers_audit`
--
ALTER TABLE `customers_audit`
  MODIFY `audit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryassignments`
--
ALTER TABLE `deliveryassignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `error_logs`
--
ALTER TABLE `error_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menuitems_audit`
--
ALTER TABLE `menuitems_audit`
  MODIFY `audit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `orders_audit`
--
ALTER TABLE `orders_audit`
  MODIFY `audit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `payments_audit`
--
ALTER TABLE `payments_audit`
  MODIFY `audit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_audit`
--
ALTER TABLE `products_audit`
  MODIFY `audit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `seatingmanagement`
--
ALTER TABLE `seatingmanagement`
  MODIFY `seating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tablebooking`
--
ALTER TABLE `tablebooking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`),
  ADD CONSTRAINT `cartitems_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `deliveryassignments`
--
ALTER TABLE `deliveryassignments`
  ADD CONSTRAINT `deliveryassignments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `deliveryassignments_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `deliverydrivers` (`driver_id`);

--
-- Constraints for table `menuitems`
--
ALTER TABLE `menuitems`
  ADD CONSTRAINT `menuitems_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `productcomments`
--
ALTER TABLE `productcomments`
  ADD CONSTRAINT `productcomments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `productordercount`
--
ALTER TABLE `productordercount`
  ADD CONSTRAINT `productordercount_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_menu_item` FOREIGN KEY (`menu_item_id`) REFERENCES `menuitems` (`item_id`);

--
-- Constraints for table `seatingmanagement`
--
ALTER TABLE `seatingmanagement`
  ADD CONSTRAINT `seatingmanagement_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`);

--
-- Constraints for table `tablebooking`
--
ALTER TABLE `tablebooking`
  ADD CONSTRAINT `tablebooking_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  ADD CONSTRAINT `tablebooking_ibfk_2` FOREIGN KEY (`seating_id`) REFERENCES `seatingmanagement` (`seating_id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
