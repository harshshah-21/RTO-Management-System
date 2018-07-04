-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2017 at 10:38 AM
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
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `U_id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `email` varchar(20) NOT NULL,
  `Address` text NOT NULL,
  `Aadharno` bigint(11) NOT NULL,
  `Gender` tinyint(1) NOT NULL,
  `Contact` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`U_id`, `Name`, `email`, `Address`, `Aadharno`, `Gender`, `Contact`) VALUES
(1, 'Harsh', 'hrsshah21@gmail.com', 'Sumeru Heights', 846013585912, 0, 8866780373),
(2, 'Himanshu', 'himanshu@gmail.com', 'Sumeru Heights', 932841242812, 0, 9328412428),
(3, 'Milind', ',ilind@gmail.com', 'Sumeru Heights', 846013565412, 0, 9638527412),
(4, 'Keval', 'keval@gmail.com', 'Sumeru Heights', 812313585912, 0, 9741852963),
(5, 'virat', 'virat@gmail.com', 'vishva appt.', 740515625412, 0, 9852741963),
(6, 'pratik', 'pratik@gmail.com', 'turning point', 765489321612, 0, 9624831571),
(7, 'prashant', 'prashant@gmail.com', 'aakash darshan', 879654265612, 0, 8523697412),
(8, 'purvang', 'purvang@gmail.com', 'l.b.park', 986593214612, 0, 7539514682),
(9, 'kunal', 'kunal@gmail.com', 'aakash ganga', 940888037512, 0, 9698521478),
(10, 'harshil', 'harshil@gmail.com', 'aakash darshan', 988765423512, 0, 9654783214),
(11, 'krupal', 'krupal@gmail.com', 'aakash vihar', 940878658912, 0, 8652397412),
(12, 'dharmesh', 'dharmesh@gmail.com', 'meghrath', 740563549812, 0, 9865473212),
(13, 'trushik', 'trushik@gmail.com', 'sumeru', 963587412512, 0, 9785641245),
(14, 'sneha', 'sneha@gmail.com', 'bansri girls hostel', 956874321812, 1, 8659742365),
(21, 'akshay', 'akki@gmail.com', '905 k.b.shah park appt beside Brahmakumari aashram ,', 123456789123, 0, 9638527413),
(22, 'harsh2', 'hrsshah21@gmail.com', '905 k.b.shah park appt beside Brahmakumari aashram ,', 886678037321, 0, 8866780373),
(25, 'vardhan', 'var@gmail.com', '905 k.b.shah park appt beside Brahmakumari aashram ,', 123456789123, 0, 7621863155),
(26, 'Pururaj', 'pururajsolanki45@gma', '5 jalbhumi ,kishansamosa lane', 123456789123, 0, 7572901706),
(27, 'Disha Shah', 'dishashah31597@gmail', 'krishna hostel', 953780004321, 1, 9537800043),
(28, 'Amit Panchal', 'amitpancal2112@gmai.', 'tulsi residency', 816078213654, 0, 8160782136),
(29, 'Nishant', 'nik0311@hotmail.com', 'Kalpvruksh appt', 820099483543, 0, 8200994835),
(30, 'Divya Vakil', 'diakil21@gmail.com', 'Blosoom Aura', 898082284654, 1, 8980822846),
(31, 'Taral Shah', 'tds29@gmail.com', 'Nandanvan society', 992553275321, 0, 9925532753),
(32, 'Satwi', 'satwishah26@yahoo.co', 'Gokuldham society', 982413058012, 1, 9824130580),
(33, 'Yash Bhatt', 'yashbhatt3@gmail.com', 'tulsi residency', 832029190321, 0, 8320291903),
(34, 'Abhi Bhavsar', 'abhiii02@gmail.com', 'Nirma Bunglows', 799052553765, 0, 7990525537),
(35, 'Jayshree', 'jshah19@gmail.com', 'Nandanvan society', 997994784765, 1, 9979947847),
(36, 'Nisarg Mehta', 'nisarg13@gmail.com', 'Satellite road', 960154008210, 0, 9601540082);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`U_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `U_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
