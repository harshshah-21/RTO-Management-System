-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2017 at 10:37 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rto_mng_system1`
--

-- --------------------------------------------------------

--
-- Table structure for table `transfer_process`
--

CREATE TABLE `transfer_process` (
  `T_id` int(11) NOT NULL,
  `REG_id` int(11) NOT NULL,
  `A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transfer_process`
--

INSERT INTO `transfer_process` (`T_id`, `REG_id`, `A_id`) VALUES
(4, 3, 20),
(7, 7, 20),
(8, 5, 20),
(9, 3, 20),
(10, 8, 20),
(11, 8, 20),
(12, 8, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transfer_process`
--
ALTER TABLE `transfer_process`
  ADD PRIMARY KEY (`T_id`),
  ADD KEY `REG_id` (`REG_id`),
  ADD KEY `A_id` (`A_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transfer_process`
--
ALTER TABLE `transfer_process`
  ADD CONSTRAINT `transfer_process_ibfk_1` FOREIGN KEY (`REG_id`) REFERENCES `reg_motor_vehicle` (`REG_id`),
  ADD CONSTRAINT `transfer_process_ibfk_2` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
