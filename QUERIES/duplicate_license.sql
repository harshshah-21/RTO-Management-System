-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2017 at 10:39 AM
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
-- Table structure for table `duplicate license`
--

CREATE TABLE `duplicate license` (
  `DUP_id` int(11) NOT NULL,
  `dl_no` text NOT NULL,
  `Circumstances` text NOT NULL,
  `previously_applied` tinyint(1) NOT NULL,
  `approval_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `duplicate license`
--

INSERT INTO `duplicate license` (`DUP_id`, `dl_no`, `Circumstances`, `previously_applied`, `approval_status`) VALUES
(1, 'DL59f7181618956', 'lost in floods', 0, 1),
(2, 'DL59we45161fd9d', 'stolen', 0, 1),
(3, 'DL56ty76161fd9d', 'lost in wallet', 0, 1),
(4, 'DL637818161fd9d', 'stolen wallet', 0, 1),
(5, 'DL61f718161fd9d', 'lost in tornado', 0, 1),
(7, 'DL59f7asd654d9d', 'lost', 0, 1),
(8, 'DL5q3w4e5r1fd9d', 'lost', 0, 1),
(9, 'DL59f718169poi7', 'flood', 0, 1),
(10, 'DL59fec5f4acff7', 'stolen', 0, 1),
(11, 'DL59fec7eb600c5', 'misplaced', 0, 1),
(12, 'DL59fec9ce17f18', 'floods', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `duplicate license`
--
ALTER TABLE `duplicate license`
  ADD PRIMARY KEY (`DUP_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `duplicate license`
--
ALTER TABLE `duplicate license`
  MODIFY `DUP_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
