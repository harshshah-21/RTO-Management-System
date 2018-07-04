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
-- Table structure for table `permit`
--

CREATE TABLE `permit` (
  `P_id` int(11) NOT NULL,
  `type_of_permit` varchar(20) NOT NULL,
  `REG_id` int(11) NOT NULL,
  `reg_no` text NOT NULL,
  `U_id` int(11) NOT NULL,
  `approval_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permit`
--

INSERT INTO `permit` (`P_id`, `type_of_permit`, `REG_id`, `reg_no`, `U_id`, `approval_status`) VALUES
(1, '4', 2, 'RG60jna2c29047d', 2, 1),
(2, '2', 3, 'RG61mab2c29047', 3, 1),
(3, '3', 4, 'RG59feb2gc29047', 4, 1),
(4, '4', 5, 'RG59frt2c29047dg', 5, 1),
(5, '5', 6, 'RG1654b2c29047', 6, 1),
(6, '3', 7, 'RG59feqwer9047d', 7, 1),
(7, '1', 8, 'RG59feb2669047d', 21, 1),
(8, '4', 8, ' RG59feb2669047d', 21, 0),
(9, '2', 10, 'RG59feb2c29047d', 27, 1),
(10, '0', 11, 'RG59feb60334797', 28, 1),
(11, '1', 12, 'RG59feb7f9dc864', 29, 1),
(12, '2', 13, 'RG59feb9b279195', 30, 1),
(13, '2', 14, 'RG59febb055aa39', 31, 1),
(14, '1', 15, 'RG59febd6082795', 32, 0),
(15, '3', 16, 'RG59fec36012d3c', 33, 0),
(16, '2', 17, 'RG59fec5ea5ab40', 34, 0),
(17, '2', 18, 'RG59fec7ef2f5be', 35, 0),
(18, '5', 19, 'RG59fec9d1cdbaa', 36, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permit`
--
ALTER TABLE `permit`
  ADD PRIMARY KEY (`P_id`),
  ADD KEY `REG_id` (`REG_id`),
  ADD KEY `U_id` (`U_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permit`
--
ALTER TABLE `permit`
  MODIFY `P_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `permit`
--
ALTER TABLE `permit`
  ADD CONSTRAINT `permit_ibfk_1` FOREIGN KEY (`REG_id`) REFERENCES `reg_motor_vehicle` (`REG_id`),
  ADD CONSTRAINT `permit_ibfk_2` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
