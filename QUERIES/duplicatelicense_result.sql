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
-- Table structure for table `duplicatelicense_result`
--

CREATE TABLE `duplicatelicense_result` (
  `DUP_id` int(11) NOT NULL,
  `D_id` int(11) NOT NULL,
  `dl_no` text NOT NULL,
  `A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `duplicatelicense_result`
--

INSERT INTO `duplicatelicense_result` (`DUP_id`, `D_id`, `dl_no`, `A_id`) VALUES
(1, 2, 'DL59we45161fd9d', 20),
(2, 3, 'DL56ty76161fd9d', 20),
(3, 7, 'DL59f7asd654d9d', 20),
(4, 4, 'DL637818161fd9d', 20),
(5, 5, 'DL61f718161fd9d', 20),
(9, 9, 'DL59f718169poi7', 20),
(10, 25, 'DL59fec5f4acff7', 20),
(11, 26, 'DL59fec7eb600c5', 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `duplicatelicense_result`
--
ALTER TABLE `duplicatelicense_result`
  ADD PRIMARY KEY (`DUP_id`),
  ADD KEY `A_id` (`A_id`),
  ADD KEY `D_id` (`D_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `duplicatelicense_result`
--
ALTER TABLE `duplicatelicense_result`
  MODIFY `DUP_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `duplicatelicense_result`
--
ALTER TABLE `duplicatelicense_result`
  ADD CONSTRAINT `duplicatelicense_result_ibfk_1` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`),
  ADD CONSTRAINT `duplicatelicense_result_ibfk_2` FOREIGN KEY (`D_id`) REFERENCES `driving license` (`D_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
