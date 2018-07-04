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
-- Table structure for table `learning license`
--

CREATE TABLE `learning license` (
  `L_id` int(11) NOT NULL,
  `U_id` int(11) NOT NULL,
  `Type_of_vehicle` text NOT NULL,
  `Birthplace` text NOT NULL,
  `Edu_qual` text NOT NULL,
  `date` date NOT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `learning license`
--

INSERT INTO `learning license` (`L_id`, `U_id`, `Type_of_vehicle`, `Birthplace`, `Edu_qual`, `date`, `approval_status`) VALUES
(1, 1, '2', 'bhopal', '4', '2017-09-08', 1),
(2, 2, '2', 'surat', '3', '2017-10-02', 1),
(3, 3, '1', 'bharuch', '6', '2017-10-03', 1),
(4, 4, '1', 'baroda', '2', '2017-10-11', 1),
(5, 5, '3', 'Gadhinagar', '3', '2017-10-12', 1),
(6, 6, '3', 'Bhopal', '7', '2017-10-12', 1),
(7, 7, '4', 'Ahmd', '6', '2017-10-13', 1),
(8, 8, '2', 'Mumbai', '5', '2017-10-23', 1),
(9, 9, '2', 'Pune', '4', '2017-11-28', 1),
(21, 21, '4', 'surat', '8', '2017-10-23', 1),
(22, 22, '1', 'surat', '3', '2017-10-30', 1),
(23, 25, '3', 'surat', '6', '2017-11-04', 1),
(24, 26, '2', 'surat', '3', '2017-12-20', 1),
(25, 27, '1', 'surat', '2', '1997-05-31', 1),
(26, 28, '3', 'Kalol', '3', '2016-05-31', 1),
(27, 29, '3', 'Mumbai', '5', '2014-03-11', 1),
(28, 30, '1', 'Surat', '2', '2013-06-02', 1),
(29, 31, '3', 'Rajpipla', '4', '2012-02-09', 1),
(30, 32, '4', 'Surat', '6', '2010-02-21', 1),
(31, 33, '4', 'Ahmedabad', '5', '2013-08-09', 1),
(33, 34, '2', 'Surat', '0', '2000-05-05', 1),
(34, 35, '3', 'Bhavnagar', '7', '2012-10-19', 1),
(35, 36, '4', 'Ahmedabad', '4', '2014-01-02', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `learning license`
--
ALTER TABLE `learning license`
  ADD PRIMARY KEY (`L_id`),
  ADD KEY `U_id` (`U_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `learning license`
--
ALTER TABLE `learning license`
  MODIFY `L_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `learning license`
--
ALTER TABLE `learning license`
  ADD CONSTRAINT `learning license_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
