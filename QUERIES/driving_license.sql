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
-- Table structure for table `driving license`
--

CREATE TABLE `driving license` (
  `D_id` int(11) NOT NULL,
  `ll_no` text NOT NULL,
  `U_id` int(11) NOT NULL,
  `Date_of_test` date NOT NULL,
  `vehicle_no` text NOT NULL,
  `approval_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driving license`
--

INSERT INTO `driving license` (`D_id`, `ll_no`, `U_id`, `Date_of_test`, `vehicle_no`, `approval_status`) VALUES
(1, 'LL59f70d60c5a9b', 1, '2016-05-09', '3654', 1),
(2, 'LL59f5ea7as54e9', 2, '2016-09-08', '6382', 1),
(3, 'LLw785ea70ae2e', 3, '2015-11-21', '8956', 1),
(4, 'LL21f5ea70ae2e9', 4, '2017-10-03', '7598', 1),
(5, 'LL59f5e456ae2e9', 5, '2017-08-06', '2350', 1),
(6, 'LL59f21a70ae2e9', 6, '2017-06-26', '9878', 1),
(7, 'LL59f5ea70ae852', 7, '2017-05-07', '8773', 1),
(8, 'LL60f5ea70ae2e9', 8, '2017-06-15', '5328', 1),
(9, 'LL60f5ea70ae2e9', 8, '2017-05-30', '6131', 1),
(10, 'LL59f5ea70a7532', 9, '2017-08-04', '3026', 1),
(15, 'LL6395ea70ae2e9', 21, '2017-10-28', '6121', 1),
(17, 'LL59f7064b8e917', 26, '2017-11-23', '9865', 1),
(18, 'LL59feab46b91d0', 27, '2015-02-02', '3036', 1),
(19, 'LL59feb48971155', 28, '2016-09-17', '2112', 0),
(20, 'LL59feb721617a6', 29, '2015-01-21', '9095', 1),
(21, 'LL59feb928af9fb', 30, '2013-08-02', '2108', 1),
(22, 'LL59feba7ac50f4', 31, '2013-02-11', '3105', 0),
(23, 'LL59febbc13a9af', 32, '2016-01-02', '3039', 0),
(24, 'LL59fec2ad58f14', 33, '2014-02-04', '2525', 0),
(25, 'LL59fec55c7a369', 34, '2011-02-08', '1516', 0),
(26, 'LL59fec7540e6e1', 35, '2012-12-03', '9999', 1),
(27, 'LL59fec967ddf84', 36, '2014-04-05', '9995', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `driving license`
--
ALTER TABLE `driving license`
  ADD PRIMARY KEY (`D_id`),
  ADD KEY `U_id` (`U_id`),
  ADD KEY `Date_of_test` (`Date_of_test`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `driving license`
--
ALTER TABLE `driving license`
  MODIFY `D_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `driving license`
--
ALTER TABLE `driving license`
  ADD CONSTRAINT `driving license_ibfk_2` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
