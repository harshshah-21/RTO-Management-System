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
-- Table structure for table `duplicate_reg_result`
--

CREATE TABLE `duplicate_reg_result` (
  `DUP_REG_id` int(11) NOT NULL,
  `REG_id` int(11) NOT NULL,
  `reg_no` text NOT NULL,
  `Engine_no` bigint(11) NOT NULL,
  `A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `duplicate_reg_result`
--

INSERT INTO `duplicate_reg_result` (`DUP_REG_id`, `REG_id`, `reg_no`, `Engine_no`, `A_id`) VALUES
(1, 2, 'RG60jna2c29047d', 85694, 20),
(2, 3, 'RG61mab2c29047', 47834, 20),
(3, 4, 'RG59feb2gc29047', 65987, 20),
(4, 5, 'RG59frt2c29047dg', 66398, 20),
(5, 6, 'RG1654b2c29047', 45987, 20),
(6, 7, 'RG59feqwer9047d', 65489, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `duplicate_reg_result`
--
ALTER TABLE `duplicate_reg_result`
  ADD PRIMARY KEY (`DUP_REG_id`),
  ADD KEY `REG_id` (`REG_id`),
  ADD KEY `A_id` (`A_id`),
  ADD KEY `Engine_no` (`Engine_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `duplicate_reg_result`
--
ALTER TABLE `duplicate_reg_result`
  MODIFY `DUP_REG_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `duplicate_reg_result`
--
ALTER TABLE `duplicate_reg_result`
  ADD CONSTRAINT `duplicate_reg_result_ibfk_1` FOREIGN KEY (`REG_id`) REFERENCES `reg_motor_vehicle` (`REG_id`),
  ADD CONSTRAINT `duplicate_reg_result_ibfk_2` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`),
  ADD CONSTRAINT `duplicate_reg_result_ibfk_3` FOREIGN KEY (`Engine_no`) REFERENCES `reg_motor_vehicle` (`Engine_no`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
