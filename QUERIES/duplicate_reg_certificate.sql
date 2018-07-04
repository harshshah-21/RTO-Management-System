-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2017 at 10:35 AM
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
-- Table structure for table `duplicate reg certificate`
--

CREATE TABLE `duplicate reg certificate` (
  `DUP_REG_id` int(11) NOT NULL,
  `REG_id` int(11) NOT NULL,
  `circumstances` text NOT NULL,
  `approval_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `duplicate reg certificate`
--

INSERT INTO `duplicate reg certificate` (`DUP_REG_id`, `REG_id`, `circumstances`, `approval_status`) VALUES
(1, 2, 'misplaced', 1),
(2, 3, 'stolen', 1),
(3, 4, 'lost', 1),
(4, 5, 'stolen with vehicle', 1),
(5, 6, 'lost in flood', 1),
(6, 7, 'lost', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `duplicate reg certificate`
--
ALTER TABLE `duplicate reg certificate`
  ADD PRIMARY KEY (`DUP_REG_id`),
  ADD KEY `REG_id` (`REG_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `duplicate reg certificate`
--
ALTER TABLE `duplicate reg certificate`
  MODIFY `DUP_REG_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `duplicate reg certificate`
--
ALTER TABLE `duplicate reg certificate`
  ADD CONSTRAINT `duplicate reg certificate_ibfk_1` FOREIGN KEY (`REG_id`) REFERENCES `reg_motor_vehicle` (`REG_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
