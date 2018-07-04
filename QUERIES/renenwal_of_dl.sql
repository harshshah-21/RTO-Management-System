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
-- Table structure for table `renenwal_of_dl`
--

CREATE TABLE `renenwal_of_dl` (
  `REN_id` int(11) NOT NULL,
  `dl_no` text NOT NULL,
  `U_id` int(11) NOT NULL,
  `date_of_issue` date NOT NULL,
  `date_of_expiry` year(2) DEFAULT NULL,
  `date_of_last_renewal` date NOT NULL,
  `approval_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `renenwal_of_dl`
--

INSERT INTO `renenwal_of_dl` (`REN_id`, `dl_no`, `U_id`, `date_of_issue`, `date_of_expiry`, `date_of_last_renewal`, `approval_status`) VALUES
(1, 'DL59f7181618956', 1, '2013-09-04', 24, '2015-09-04', 1),
(2, 'DL59we45161fd9d', 2, '2013-09-07', 24, '2015-09-25', 1),
(3, 'DL56ty76161fd9d', 3, '2013-09-04', 24, '2015-09-01', 1),
(4, 'DL637818161fd9d', 4, '2013-09-05', 24, '2015-09-07', 1),
(5, 'DL59f7asd654d9d', 7, '2013-09-04', 24, '2015-09-11', 1),
(6, 'DL5q3w4e5r1fd9d', 8, '2013-09-04', 24, '2015-09-27', 1),
(7, 'DL59f718169poi7', 9, '2013-10-01', 24, '2015-10-02', 1),
(11, 'DL59feac85b1265', 6, '2013-06-10', 24, '2015-10-02', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `renenwal_of_dl`
--
ALTER TABLE `renenwal_of_dl`
  ADD PRIMARY KEY (`REN_id`),
  ADD KEY `U_id` (`U_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `renenwal_of_dl`
--
ALTER TABLE `renenwal_of_dl`
  MODIFY `REN_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `renenwal_of_dl`
--
ALTER TABLE `renenwal_of_dl`
  ADD CONSTRAINT `renenwal_of_dl_ibfk_2` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
