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
-- Table structure for table `transfer of ownership`
--

CREATE TABLE `transfer of ownership` (
  `T_id` int(11) NOT NULL,
  `S_U_id` int(11) NOT NULL,
  `R_U_id` int(11) NOT NULL,
  `REG_id` int(11) NOT NULL,
  `approval_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transfer of ownership`
--

INSERT INTO `transfer of ownership` (`T_id`, `S_U_id`, `R_U_id`, `REG_id`, `approval_status`) VALUES
(1, 4, 2, 4, 1),
(3, 2, 4, 2, 1),
(4, 3, 2, 3, 1),
(5, 4, 10, 4, 1),
(6, 6, 5, 6, 1),
(7, 7, 3, 7, 1),
(8, 5, 13, 5, 1),
(9, 3, 9, 3, 1),
(10, 21, 1, 8, 1),
(11, 21, 1, 8, 1),
(12, 21, 1, 8, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transfer of ownership`
--
ALTER TABLE `transfer of ownership`
  ADD PRIMARY KEY (`T_id`),
  ADD KEY `S_U_id` (`S_U_id`),
  ADD KEY `R_U_id` (`R_U_id`),
  ADD KEY `REG_id` (`REG_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transfer of ownership`
--
ALTER TABLE `transfer of ownership`
  MODIFY `T_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `transfer of ownership`
--
ALTER TABLE `transfer of ownership`
  ADD CONSTRAINT `transfer of ownership_ibfk_2` FOREIGN KEY (`S_U_id`) REFERENCES `user` (`U_id`),
  ADD CONSTRAINT `transfer of ownership_ibfk_3` FOREIGN KEY (`R_U_id`) REFERENCES `user` (`U_id`),
  ADD CONSTRAINT `transfer of ownership_ibfk_4` FOREIGN KEY (`REG_id`) REFERENCES `reg_motor_vehicle` (`REG_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
