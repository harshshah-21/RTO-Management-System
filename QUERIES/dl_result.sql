-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2017 at 10:34 AM
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
-- Table structure for table `dl_result`
--

CREATE TABLE `dl_result` (
  `D_id` int(11) NOT NULL,
  `dl_no` text NOT NULL,
  `A_id` int(11) NOT NULL,
  `result` tinyint(1) NOT NULL,
  `pre_appl` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dl_result`
--

INSERT INTO `dl_result` (`D_id`, `dl_no`, `A_id`, `result`, `pre_appl`) VALUES
(1, 'DL59f7181618956', 23, 0, 0),
(2, 'DL59we45161fd9d', 22, 0, 0),
(3, 'DL56ty76161fd9d', 18, 0, 0),
(4, 'DL637818161fd9d', 22, 0, 0),
(5, 'DL61f718161fd9d', 23, 0, 0),
(6, 'DL59feac85b1265', 20, 0, 0),
(7, 'DL59f7asd654d9d', 18, 0, 0),
(8, 'DL5q3w4e5r1fd9d', 20, 0, 0),
(9, 'DL59f718169poi7', 20, 0, 0),
(10, 'DL4k5718161fd9d', 20, 0, 0),
(15, 'DL5a00c23818174', 20, 0, 0),
(17, 'DL59f718161fd9d', 18, 0, 0),
(18, 'DL59feac0a4e2e8', 18, 0, 0),
(19, 'DL59feb7acb7a4b', 20, 0, 0),
(20, 'DL59feb7add2935', 22, 0, 0),
(21, 'DL59feb982b89d3', 20, 0, 0),
(22, 'DL59febb0a4f4e0', 20, 0, 0),
(23, 'DL59febda3d056c', 23, 0, 0),
(24, 'DL59fec5f18d252', 20, 0, 0),
(25, 'DL59fec5f4acff7', 22, 0, 0),
(26, 'DL59fec7eb600c5', 18, 0, 0),
(27, 'DL59fec9ce17f18', 20, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dl_result`
--
ALTER TABLE `dl_result`
  ADD PRIMARY KEY (`D_id`),
  ADD KEY `A_id` (`A_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dl_result`
--
ALTER TABLE `dl_result`
  MODIFY `D_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dl_result`
--
ALTER TABLE `dl_result`
  ADD CONSTRAINT `dl_result_ibfk_1` FOREIGN KEY (`D_id`) REFERENCES `driving license` (`D_id`),
  ADD CONSTRAINT `dl_result_ibfk_2` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
