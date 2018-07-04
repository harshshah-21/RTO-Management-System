-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2017 at 10:36 AM
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
-- Table structure for table `reg_motor_result`
--

CREATE TABLE `reg_motor_result` (
  `REG_id` int(11) NOT NULL,
  `reg_no` text NOT NULL,
  `dl_no` text NOT NULL,
  `U_id` int(11) NOT NULL,
  `Engine_no` bigint(11) NOT NULL,
  `A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_motor_result`
--

INSERT INTO `reg_motor_result` (`REG_id`, `reg_no`, `dl_no`, `U_id`, `Engine_no`, `A_id`) VALUES
(1, 'RG59feb18f5b868', 'DL59we45161fd9d', 2, 25634, 20),
(2, 'RG60jna2c29047d', 'DL56ty76161fd9d', 3, 85694, 20),
(3, 'RG61mab2c29047', 'DL637818161fd9d', 4, 47834, 20),
(4, 'RG59feb2gc29047', 'DL637818161fd9d', 4, 65987, 20),
(5, 'RG59frt2c29047dg', 'DL61f718161fd9d', 5, 66398, 20),
(6, 'RG1654b2c29047', 'DL59feac85b1265', 6, 45987, 20),
(7, 'RG59feqwer9047d', 'DL59f7asd654d9d', 7, 65489, 20),
(8, 'RG59feb2669047d', 'DL5a00c23818174', 21, 56325897, 20),
(10, 'RG59feb2c29047d', 'DL59feac0a4e2e8', 27, 1234567891, 20),
(11, 'RG59feb60334797', '', 28, 1234567892, 20),
(12, 'RG59feb7f9dc864', 'DL59feb7add2935', 29, 1234567893, 20),
(13, 'RG59feb9b279195', 'DL59feb982b89d3', 30, 1234567894, 20),
(14, 'RG59febb055aa39', '', 31, 1234567895, 20),
(15, 'RG59febd6082795', '', 32, 1234567896, 20),
(16, 'RG59fec36012d3c', '', 33, 1234567897, 20),
(17, 'RG59fec5ea5ab40', '', 34, 1234567898, 20),
(18, 'RG59fec7ef2f5be', 'DL59fec7eb600c5', 35, 1234567898, 20),
(19, 'RG59fec9d1cdbaa', 'DL59fec9ce17f18', 36, 1234567899, 20),
(20, 'RG5a015bb64a487', 'DL5a00c23818174', 21, 3698521478, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reg_motor_result`
--
ALTER TABLE `reg_motor_result`
  ADD PRIMARY KEY (`REG_id`),
  ADD KEY `U_id` (`U_id`),
  ADD KEY `A_id` (`A_id`),
  ADD KEY `Engine_no` (`Engine_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reg_motor_result`
--
ALTER TABLE `reg_motor_result`
  MODIFY `REG_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `reg_motor_result`
--
ALTER TABLE `reg_motor_result`
  ADD CONSTRAINT `reg_motor_result_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`),
  ADD CONSTRAINT `reg_motor_result_ibfk_2` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`),
  ADD CONSTRAINT `reg_motor_result_ibfk_3` FOREIGN KEY (`Engine_no`) REFERENCES `reg_motor_vehicle` (`Engine_no`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
