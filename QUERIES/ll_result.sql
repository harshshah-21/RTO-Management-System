-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2017 at 10:42 AM
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
-- Table structure for table `ll_result`
--

CREATE TABLE `ll_result` (
  `L_id` int(11) NOT NULL,
  `U_id` int(11) NOT NULL,
  `LL_no` text NOT NULL,
  `A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ll_result`
--

INSERT INTO `ll_result` (`L_id`, `U_id`, `LL_no`, `A_id`) VALUES
(1, 1, 'LL59f70d60c5a9b', 18),
(2, 2, 'LL59f5ea7as54e9', 20),
(3, 3, 'LLw785ea70ae2e', 20),
(4, 4, 'LL21f5ea70ae2e9', 22),
(5, 5, 'LL59f5e456ae2e9', 23),
(6, 6, 'LL59f21a70ae2e9', 20),
(7, 7, 'LL59f5ea70ae852', 18),
(8, 8, 'LL60f5ea70ae2e9', 20),
(9, 9, 'LL59f5ea70a7532', 22),
(21, 21, 'LL6395ea70ae2e9', 18),
(22, 22, 'LL59f5ea70a98oi', 20),
(23, 25, 'LL59f5ea70ae2e9', 20),
(24, 26, 'LL59f7064b8e917', 20),
(25, 27, 'LL59feab46b91d0', 20),
(26, 28, 'LL59feb48971155', 20),
(27, 29, 'LL59feb721617a6', 22),
(28, 30, 'LL59feb928af9fb', 18),
(29, 31, 'LL59feba7ac50f4', 23),
(30, 32, 'LL59febbc13a9af', 22),
(31, 33, 'LL59fec2ad58f14', 23),
(33, 34, 'LL59fec55c7a369', 20),
(34, 35, 'LL59fec7540e6e1', 18),
(35, 36, 'LL59fec967ddf84', 18);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ll_result`
--
ALTER TABLE `ll_result`
  ADD PRIMARY KEY (`L_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
