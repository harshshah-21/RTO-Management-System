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
-- Table structure for table `permit_result`
--

CREATE TABLE `permit_result` (
  `P_id` int(11) NOT NULL,
  `U_id` int(11) NOT NULL,
  `reg_no` text NOT NULL,
  `Engine_no` bigint(11) NOT NULL,
  `p_no` text NOT NULL,
  `A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permit_result`
--

INSERT INTO `permit_result` (`P_id`, `U_id`, `reg_no`, `Engine_no`, `p_no`, `A_id`) VALUES
(1, 2, 'RG60jna2c29047d', 85694, 'PR5a00d644362ef', 20),
(2, 3, 'RG61mab2c29047', 47834, 'PR5a00d645110cc', 20),
(3, 4, 'RG59feb2gc29047', 65987, 'PR5a00d645e20fa', 20),
(4, 5, 'RG59frt2c29047dg', 66398, 'PR5a00d66c68aba', 20),
(5, 6, 'RG1654b2c29047', 45987, 'PR5a00d6a2edb67', 20),
(6, 7, 'RG59feqwer9047d', 65489, 'PR5a00d6a3a1905', 20),
(7, 21, 'RG59feb2669047d', 56325897, 'PR5a00d6a40cd4a', 20),
(9, 27, 'RG59feb2c29047d', 1234567891, 'PR5a00d6a7a3eb6', 20),
(10, 28, 'RG59feb60334797', 1234567892, 'PR5a00d6a84f616', 20),
(11, 29, 'RG59feb7f9dc864', 1234567893, 'PR5a00d6a8b4e4e', 20),
(12, 30, 'RG59feb9b279195', 1234567894, 'PR5a00d6a91cc2f', 20),
(13, 31, 'RG59febb055aa39', 1234567895, 'PR5a00d6a9d44c9', 20),
(18, 36, 'RG59fec9d1cdbaa', 1234567899, 'PR5a00d57397c86', 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permit_result`
--
ALTER TABLE `permit_result`
  ADD PRIMARY KEY (`P_id`),
  ADD KEY `U_id` (`U_id`),
  ADD KEY `Engine_no` (`Engine_no`),
  ADD KEY `A_id` (`A_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permit_result`
--
ALTER TABLE `permit_result`
  MODIFY `P_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `permit_result`
--
ALTER TABLE `permit_result`
  ADD CONSTRAINT `permit_result_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`),
  ADD CONSTRAINT `permit_result_ibfk_2` FOREIGN KEY (`Engine_no`) REFERENCES `reg_motor_vehicle` (`Engine_no`),
  ADD CONSTRAINT `permit_result_ibfk_3` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`),
  ADD CONSTRAINT `permit_result_ibfk_4` FOREIGN KEY (`P_id`) REFERENCES `permit` (`P_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
