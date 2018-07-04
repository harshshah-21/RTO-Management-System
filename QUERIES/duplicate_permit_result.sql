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
-- Table structure for table `duplicate_permit_result`
--

CREATE TABLE `duplicate_permit_result` (
  `DUP_id` int(11) NOT NULL,
  `P_id` int(11) NOT NULL,
  `p_no` text NOT NULL,
  `A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `duplicate_permit_result`
--

INSERT INTO `duplicate_permit_result` (`DUP_id`, `P_id`, `p_no`, `A_id`) VALUES
(1, 1, 'PR5a00d644362ef', 20),
(2, 2, 'PR5a00d645110cc', 20),
(3, 3, 'PR5a00d645e20fa', 20),
(4, 4, 'PR5a00d66c68aba', 20),
(5, 5, 'PR5a00d6a2edb67', 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `duplicate_permit_result`
--
ALTER TABLE `duplicate_permit_result`
  ADD PRIMARY KEY (`DUP_id`),
  ADD KEY `P_id` (`P_id`),
  ADD KEY `A_id` (`A_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `duplicate_permit_result`
--
ALTER TABLE `duplicate_permit_result`
  ADD CONSTRAINT `duplicate_permit_result_ibfk_1` FOREIGN KEY (`DUP_id`) REFERENCES `duplicate permit` (`DUP_P_id`),
  ADD CONSTRAINT `duplicate_permit_result_ibfk_2` FOREIGN KEY (`P_id`) REFERENCES `permit` (`P_id`),
  ADD CONSTRAINT `duplicate_permit_result_ibfk_3` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
