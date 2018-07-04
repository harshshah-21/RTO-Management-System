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
-- Table structure for table `reg_motor_vehicle`
--

CREATE TABLE `reg_motor_vehicle` (
  `REG_id` int(11) NOT NULL,
  `U_id` int(11) NOT NULL,
  `Dealers_name` text NOT NULL,
  `Type_of_vehicle` text NOT NULL,
  `date_of_manuf` year(4) NOT NULL,
  `Engine_no` bigint(11) NOT NULL,
  `seating_capacity` int(11) NOT NULL,
  `fuel_type` text NOT NULL,
  `approval_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_motor_vehicle`
--

INSERT INTO `reg_motor_vehicle` (`REG_id`, `U_id`, `Dealers_name`, `Type_of_vehicle`, `date_of_manuf`, `Engine_no`, `seating_capacity`, `fuel_type`, `approval_status`) VALUES
(1, 2, 'Dream Honda', '4', 2016, 25634, 4, '4', 1),
(2, 3, 'Dream Yuva', '2', 2013, 85694, 4, '3', 1),
(3, 4, 'Dream Honda', '3', 2014, 47834, 2, '2', 1),
(4, 4, 'Yamaha', '4', 2014, 65987, 4, '3', 1),
(5, 5, 'SUZUKI', '4', 2016, 66398, 10, '3', 1),
(6, 6, 'Renault', '3', 2016, 45987, 8, '3', 1),
(7, 7, 'Nissan', '4', 2016, 65489, 6, '1', 1),
(8, 21, 'Honda', '2', 2014, 56325897, 3, '2', 1),
(10, 27, 'Karan Desai', '1', 2016, 1234567891, 2, '3', 1),
(11, 28, 'Disha ', '3', 2017, 1234567892, 4, '4', 1),
(12, 29, 'Mitul', '3', 2016, 1234567893, 4, '2', 1),
(13, 30, 'Harrsh', '1', 2013, 1234567894, 2, '0', 1),
(14, 31, 'Prabha ', '3', 2014, 1234567895, 4, '3', 1),
(15, 32, 'Jayshree', '3', 2017, 1234567896, 4, '4', 1),
(16, 33, 'Saumya', '4', 2014, 1234567897, 50, '1', 1),
(17, 34, 'Nik', '2', 2014, 1234567898, 3, '2', 1),
(18, 35, 'Amar Vakharia', '3', 2013, 1234567898, 4, '0', 1),
(19, 36, 'Khushi', '4', 2014, 1234567899, 15, '2', 1),
(20, 21, 'Honda', '4', 2017, 3698521478, 2, '3', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reg_motor_vehicle`
--
ALTER TABLE `reg_motor_vehicle`
  ADD PRIMARY KEY (`REG_id`),
  ADD KEY `U_id` (`U_id`),
  ADD KEY `Engine_no` (`Engine_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reg_motor_vehicle`
--
ALTER TABLE `reg_motor_vehicle`
  MODIFY `REG_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `reg_motor_vehicle`
--
ALTER TABLE `reg_motor_vehicle`
  ADD CONSTRAINT `reg_motor_vehicle_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
