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
-- Table structure for table `renewal_dl_result`
--

CREATE TABLE `renewal_dl_result` (
  `REN_id` int(11) NOT NULL,
  `D_id` int(11) NOT NULL,
  `dl_no` text NOT NULL,
  `A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `renewal_dl_result`
--

INSERT INTO `renewal_dl_result` (`REN_id`, `D_id`, `dl_no`, `A_id`) VALUES
(1, 1, 'DL59f7181618956', 20),
(2, 2, 'DL59we45161fd9d', 18),
(3, 3, 'DL56ty76161fd9d', 20),
(4, 4, 'DL637818161fd9d', 23),
(5, 7, 'DL59f7asd654d9d', 20),
(6, 8, 'DL5q3w4e5r1fd9d', 22),
(7, 9, 'DL59f718169poi7', 20),
(8, 2, 'DL59we45161fd9d', 18),
(11, 6, 'DL59feac85b1265', 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `renewal_dl_result`
--
ALTER TABLE `renewal_dl_result`
  ADD PRIMARY KEY (`REN_id`),
  ADD KEY `D_id` (`D_id`),
  ADD KEY `A_id` (`A_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `renewal_dl_result`
--
ALTER TABLE `renewal_dl_result`
  ADD CONSTRAINT `renewal_dl_result_ibfk_1` FOREIGN KEY (`D_id`) REFERENCES `driving license` (`D_id`),
  ADD CONSTRAINT `renewal_dl_result_ibfk_2` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
