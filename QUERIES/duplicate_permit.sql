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
-- Table structure for table `duplicate permit`
--

CREATE TABLE `duplicate permit` (
  `DUP_P_id` int(11) NOT NULL,
  `P_id` int(11) NOT NULL,
  `p_no` text NOT NULL,
  `Circumstances` text NOT NULL,
  `approval_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `duplicate permit`
--

INSERT INTO `duplicate permit` (`DUP_P_id`, `P_id`, `p_no`, `Circumstances`, `approval_status`) VALUES
(1, 1, '', 'lost in floods', 1),
(2, 2, '', 'lost somewhere I dont know where', 1),
(3, 3, '', 'stolen', 1),
(4, 4, '', 'lost', 1),
(5, 5, '', 'lost', 1),
(6, 6, '', 'stolen', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `duplicate permit`
--
ALTER TABLE `duplicate permit`
  ADD PRIMARY KEY (`DUP_P_id`),
  ADD KEY `P_id` (`P_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `duplicate permit`
--
ALTER TABLE `duplicate permit`
  MODIFY `DUP_P_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `duplicate permit`
--
ALTER TABLE `duplicate permit`
  ADD CONSTRAINT `duplicate permit_ibfk_1` FOREIGN KEY (`P_id`) REFERENCES `permit` (`P_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
