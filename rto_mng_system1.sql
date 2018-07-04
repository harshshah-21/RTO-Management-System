-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2017 at 07:36 PM
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `authority_registration` ()  READS SQL DATA
SELECT * FROM `user` WHERE `U_id` IN (SELECT `U_id` FROM `authority` WHERE `U_id` IN (SELECT `U_id` FROM `reg_motor_vehicle`))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `authority_type` (IN `authority` TEXT, IN `type` TEXT)  READS SQL DATA
    COMMENT 'shows if a type of vhcl is authorised by a particlar authoriy'
SELECT `Name` FROM `user` WHERE `U_id` IN (SELECT `U_id` FROM `authority` WHERE `A_id` IN (SELECT `A_id` FROM `reg_motor_result` WHERE `REG_id`IN (SELECT `REG_id` FROM `reg_motor_vehicle` WHERE `Type_of_vehicle` = type )))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `check_dl` ()  READS SQL DATA
    COMMENT 'users applied for LL but not for DL'
SELECT * FROM `user` WHERE `U_id` IN (SELECT `U_id` FROM `learning license` WHERE `L_id` NOT IN (SELECT `L_id` FROM `driving license`))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `demo1` ()  NO SQL
BEGIN
  DECLARE done, counter INT DEFAULT FALSE;
  DECLARE cGroupID INT;
  DECLARE cGroupName VARCHAR(50);
  DECLARE cursor1 CURSOR FOR SELECT `U_id`,`Name` FROM `user` WHERE `U_id` IN (SELECT `U_id` FROM `permit`) ;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  CREATE TEMPORARY TABLE log
  (
    id int not null auto_increment primary key, 
    group_id int,
    group_name varchar(50)
  );

  OPEN cursor1;

  read_loop: LOOP
    FETCH cursor1 INTO cGroupID,cGroupName;
    SET counter = counter + 1;
    IF done THEN
        LEAVE read_loop;
    END IF;
    IF 1 THEN
      INSERT INTO log(group_id, group_name)
      SELECT cGroupID AS U_id, cGroupName as Name;
    END IF;  
  END LOOP;

  CLOSE cursor1;

  SELECT * FROM log;
  DROP TABLE log;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `demo2` ()  NO SQL
BEGIN
  DECLARE done, counter INT DEFAULT FALSE;
  DECLARE cGroupID INT;
  DECLARE cGroupName VARCHAR(50);
  DECLARE cursor1 CURSOR FOR SELECT `U_id`,`Name` FROM `user` WHERE `U_id` IN (SELECT `U_id` FROM `authority`) ;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  CREATE TEMPORARY TABLE log
  (
    id int not null auto_increment primary key, 
    group_id int,
    group_name varchar(50)
  );

  OPEN cursor1;

  read_loop: LOOP
    FETCH cursor1 INTO cGroupID,cGroupName;
    SET counter = counter + 1;
    IF done THEN
        LEAVE read_loop;
    END IF;
    IF 1 THEN
      INSERT INTO log(group_id, group_name)
      SELECT cGroupID AS U_id, cGroupName as Name;
    END IF;  
  END LOOP;

  CLOSE cursor1;

  SELECT * FROM log;
  DROP TABLE log;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `duplicate_license` ()  READS SQL DATA
    COMMENT 'lists of users applied for duplicate license'
(SELECT * FROM `user` WHERE `U_id` IN (SELECT `U_id` FROM `driving license` WHERE `D_id` IN (SELECT `D_id` FROM `duplicate license`)))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `duplicate_permit` (IN `authority` TEXT)  NO SQL
    COMMENT 'list of users who obtained permit from a specific authority'
BEGIN
SELECT * FROM `user` WHERE `U_id` IN (SELECT `U_id` FROM `permit` WHERE `P_id` IN (SELECT `P_id` FROM `duplicate permit`  WHERE `A_id` IN(SELECT `A_id` FROM `authority` WHERE `U_id` IN (SELECT `U_id` FROM `user` WHERE `Name` = authority))));
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fact` (IN `a` INT)  BEGIN
 DECLARE x  INT;
 
 
 SET x = 1;
 
 
 WHILE a != 0 DO
 SET  x = x*a;
 SET a = a - 1; 
 END WHILE;
 
SELECT x;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `never_registered` ()  READS SQL DATA
SELECT * FROM `user` WHERE `U_id` NOT IN (SELECT `U_id` FROM `reg_motor_vehicle`)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `permit` (IN `type` TEXT)  NO SQL
SELECT * FROM `user` u INNER JOIN `permit` p WHERE u.`U_id` IN (SELECT p.`U_id` FROM `permit` WHERE p.`type_of_permit` = type)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `renewal_of_dl` ()  READS SQL DATA
    COMMENT 'list of users applied for renewal of driving license'
(SELECT * FROM `user` WHERE `U_id` IN (SELECT `U_id` FROM `driving license` WHERE `D_id` IN (SELECT `D_id` FROM `renenwal_of_dl`)))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `seating_capacity` (IN `s` INT)  NO SQL
    COMMENT 'users who registered vehicle with a certain seat capacity'
SELECT DISTINCT `reg_motor_vehicle`.`U_id`,`user`.`Aadharno`,`reg_motor_vehicle`.`Type_of_vehicle`,`reg_motor_vehicle`.`seating_capacity`,`reg_motor_vehicle`.`date_of_manuf`,`reg_motor_vehicle`.`fuel_type`,`reg_motor_vehicle`.`Engine_no` FROM `user` INNER JOIN `reg_motor_vehicle` WHERE `reg_motor_vehicle`.`seating_capacity`> s AND `user`.`U_id` IN (SELECT `reg_motor_vehicle`.`U_id` FROM `reg_motor_vehicle` WHERE `reg_motor_vehicle`.`seating_capacity` > s) GROUP BY `reg_motor_vehicle`.`U_id`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Test` ()  READS SQL DATA
BEGIN
  DECLARE done, counter INT DEFAULT FALSE;
  DECLARE cGroupID INT;
  DECLARE cGroupName VARCHAR(50);
  DECLARE cursor1 CURSOR FOR SELECT U_id, Name FROM user;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  CREATE TEMPORARY TABLE log
  (
    id int not null auto_increment primary key, 
    group_id int,
    group_name varchar(50)
  );

  OPEN cursor1;

  read_loop: LOOP
    FETCH cursor1 INTO cGroupID,cGroupName;
    SET counter = counter + 1;
    IF done THEN
        LEAVE read_loop;
    END IF;
    IF counter % 2 <> 0 THEN
      INSERT INTO log(group_id, group_name)
      SELECT cGroupID AS U_id, cGroupName as Name;
    END IF;  
  END LOOP;

  CLOSE cursor1;

  SELECT * FROM log;
  DROP TABLE log;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `userExists` (IN `username` TEXT, IN `total` INT)  READS SQL DATA
    COMMENT 'if user applied for transfer of ownership'
BEGIN

SELECT COUNT(S_U_id) INTO total FROM `transfer of ownership` WHERE `S_U_id` IN ( SELECT `U_id` FROM `user` WHERE `Name` = username);

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `authority`
--

CREATE TABLE `authority` (
  `A_id` int(11) NOT NULL,
  `U_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authority`
--

INSERT INTO `authority` (`A_id`, `U_id`) VALUES
(20, 1),
(18, 2),
(22, 3),
(23, 4),
(25, 9);

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
(20, 'DL59feb7add2935', 22, 0, 0),
(21, 'DL59feb982b89d3', 20, 0, 0),
(22, 'DL59febb0a4f4e0', 20, 0, 0),
(23, 'DL59febda3d056c', 23, 0, 0),
(24, 'DL59fec5f18d252', 20, 0, 0),
(28, 'DL5a02adac9488f', 20, 0, 0),
(29, 'DL5a02cef4a4666', 20, 0, 0);

--
-- Triggers `dl_result`
--
DELIMITER $$
CREATE TRIGGER `testTrigger` AFTER INSERT ON `dl_result` FOR EACH ROW UPDATE `driving license` SET `approval_status`= '1' WHERE `D_id` = 29
$$
DELIMITER ;

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
(22, 'LL59feba7ac50f4', 31, '2013-02-11', '3105', 1),
(23, 'LL59febbc13a9af', 32, '2016-01-02', '3039', 1),
(24, 'LL59fec2ad58f14', 33, '2014-02-04', '2525', 1),
(25, 'LL59fec55c7a369', 34, '2011-02-08', '1516', 0),
(26, 'LL59fec7540e6e1', 35, '2012-12-03', '9999', 0),
(27, 'LL59fec967ddf84', 36, '2014-04-05', '9995', 0),
(28, 'LL5a02ac7ee1821', 37, '2014-05-06', '2020', 1),
(29, 'LL5a02ce51886f3', 39, '2017-11-25', '5252', 1);

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
(4, 'DL637818161fd9d', 'stolen wallet', 0, 0),
(5, 'DL61f718161fd9d', 'lost in tornado', 0, 0),
(7, 'DL59f7asd654d9d', 'lost', 0, 0),
(8, 'DL5q3w4e5r1fd9d', 'lost', 0, 1),
(9, 'DL5a02adac9488f', 'misplaced', 0, 0);

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
(8, 8, 'DL5q3w4e5r1fd9d', 20);

--
-- Triggers `duplicatelicense_result`
--
DELIMITER $$
CREATE TRIGGER `dup_license1` AFTER INSERT ON `duplicatelicense_result` FOR EACH ROW UPDATE `duplicate license` SET `approval_status`= 1 WHERE `DUP_id` = 8
$$
DELIMITER ;

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
(1, 1, 'PR5a00d644362ef', 'lost in floods', 1),
(2, 2, 'PR5a00d645110cc', 'lost somewhere I dont know where', 1),
(3, 3, 'PR5a00d645e20fa', 'stolen', 1),
(4, 4, 'PR5a00d66c68aba', 'lost', 1),
(5, 5, 'PR5a00d6a2edb67', 'lost', 0),
(6, 6, 'PR5a00d6a3a1905', 'stolen', 0);

-- --------------------------------------------------------

--
-- Table structure for table `duplicate reg certificate`
--

CREATE TABLE `duplicate reg certificate` (
  `DUP_REG_id` int(11) NOT NULL,
  `REG_id` int(11) NOT NULL,
  `circumstances` text NOT NULL,
  `approval_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `duplicate reg certificate`
--

INSERT INTO `duplicate reg certificate` (`DUP_REG_id`, `REG_id`, `circumstances`, `approval_status`) VALUES
(1, 2, 'misplaced', 1),
(2, 3, 'stolen', 1),
(3, 4, 'lost', 1),
(4, 5, 'stolen with vehicle', 1),
(5, 6, 'lost in flood', 0),
(6, 7, 'lost', 0);

-- --------------------------------------------------------

--
-- Table structure for table `duplicate_permit_result`
--

CREATE TABLE `duplicate_permit_result` (
  `DUP_id` int(11) NOT NULL,
  `P_id` int(11) NOT NULL,
  `p_no` text NOT NULL,
  `A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `duplicate_permit_result`
--

INSERT INTO `duplicate_permit_result` (`DUP_id`, `P_id`, `p_no`, `A_id`) VALUES
(1, 1, 'PR5a00d644362ef', 20),
(2, 2, 'PR5a00d645110cc', 20),
(3, 3, 'PR5a00d645e20fa', 20),
(4, 4, 'PR5a00d66c68aba', 20);

--
-- Triggers `duplicate_permit_result`
--
DELIMITER $$
CREATE TRIGGER `dup_permit1` AFTER INSERT ON `duplicate_permit_result` FOR EACH ROW UPDATE `duplicate permit` SET `approval_status`=1 WHERE `DUP_P_id` = 6
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `duplicate_reg_result`
--

CREATE TABLE `duplicate_reg_result` (
  `DUP_REG_id` int(11) NOT NULL,
  `REG_id` int(11) NOT NULL,
  `reg_no` text NOT NULL,
  `Engine_no` bigint(11) NOT NULL,
  `A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `duplicate_reg_result`
--

INSERT INTO `duplicate_reg_result` (`DUP_REG_id`, `REG_id`, `reg_no`, `Engine_no`, `A_id`) VALUES
(1, 2, 'RG60jna2c29047d', 85694, 20),
(2, 3, 'RG61mab2c29047', 47834, 20),
(3, 4, 'RG59feb2gc29047', 65987, 20),
(4, 5, 'RG59frt2c29047dg', 66398, 20);

--
-- Triggers `duplicate_reg_result`
--
DELIMITER $$
CREATE TRIGGER `dup_reg_trigger` AFTER INSERT ON `duplicate_reg_result` FOR EACH ROW UPDATE `duplicate reg certificate` SET `approval_status`= 1 WHERE `DUP_REG_id` = 6
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `duplicate_result`
--

CREATE TABLE `duplicate_result` (
  `DUP_id` int(11) NOT NULL,
  `D_id` int(11) NOT NULL,
  `pre_appl` tinyint(1) NOT NULL,
  `A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(33, 34, '2', 'Surat', '0', '2000-05-05', 0),
(34, 35, '3', 'Bhavnagar', '7', '2012-10-19', 0),
(35, 36, '4', 'Ahmedabad', '4', '2014-01-02', 0),
(36, 37, '1', 'surat', '7', '2014-01-01', 1),
(37, 39, '1', 'surat', 'default', '2017-11-10', 1),
(41, 40, '2', 'gandhinagar', '5', '2017-11-17', 1),
(43, 41, '1', 'surat', '6', '2017-11-17', 0);

--
-- Triggers `learning license`
--
DELIMITER $$
CREATE TRIGGER `ll_log` AFTER INSERT ON `learning license` FOR EACH ROW INSERT INTO `ll_log`(`U_id`, `Applied`, `timestamp`) VALUES (41,'1','2017-11-08 12:19:34')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ll_log`
--

CREATE TABLE `ll_log` (
  `U_id` int(11) NOT NULL,
  `Applied` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ll_log`
--

INSERT INTO `ll_log` (`U_id`, `Applied`, `timestamp`) VALUES
(41, 1, '2017-11-08 06:49:34');

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
(36, 37, 'LL5a02ac7ee1821', 0),
(37, 39, 'LL5a02ce51886f3', 20),
(41, 40, 'LL5a02e89a3ac69', 20);

--
-- Triggers `ll_result`
--
DELIMITER $$
CREATE TRIGGER `ll_trigger` AFTER INSERT ON `ll_result` FOR EACH ROW UPDATE `learning license` SET `approval_status`= 1 WHERE `L_id` = 41
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `permit`
--

CREATE TABLE `permit` (
  `P_id` int(11) NOT NULL,
  `type_of_permit` varchar(20) NOT NULL,
  `REG_id` int(11) NOT NULL,
  `reg_no` text NOT NULL,
  `U_id` int(11) NOT NULL,
  `approval_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permit`
--

INSERT INTO `permit` (`P_id`, `type_of_permit`, `REG_id`, `reg_no`, `U_id`, `approval_status`) VALUES
(1, '4', 2, 'RG60jna2c29047d', 2, 1),
(2, '2', 3, 'RG61mab2c29047', 3, 1),
(3, '3', 4, 'RG59feb2gc29047', 4, 1),
(4, '4', 5, 'RG59frt2c29047dg', 5, 1),
(5, '5', 6, 'RG1654b2c29047', 6, 1),
(6, '3', 7, 'RG59feqwer9047d', 7, 1),
(7, '1', 8, 'RG59feb2669047d', 21, 1),
(8, '4', 8, ' RG59feb2669047d', 21, 0),
(9, '2', 10, 'RG59feb2c29047d', 27, 1),
(10, '0', 11, 'RG59feb60334797', 28, 1),
(11, '1', 12, 'RG59feb7f9dc864', 29, 1),
(12, '2', 13, 'RG59feb9b279195', 30, 1),
(13, '2', 14, 'RG59febb055aa39', 31, 1),
(14, '1', 15, 'RG59febd6082795', 32, 0),
(15, '3', 16, 'RG59fec36012d3c', 33, 1),
(16, '2', 17, 'RG59fec5ea5ab40', 34, 1),
(17, '2', 18, 'RG59fec7ef2f5be', 35, 1),
(18, '5', 19, 'RG59fec9d1cdbaa', 36, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permit_result`
--

CREATE TABLE `permit_result` (
  `P_id` int(11) NOT NULL,
  `U_id` int(11) NOT NULL,
  `reg_no` text NOT NULL,
  `Engine_no` bigint(11) NOT NULL,
  `p_no` text NOT NULL,
  `A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permit_result`
--

INSERT INTO `permit_result` (`P_id`, `U_id`, `reg_no`, `Engine_no`, `p_no`, `A_id`) VALUES
(1, 2, 'RG60jna2c29047d', 85694, 'PR5a00d644362ef', 20),
(2, 3, 'RG61mab2c29047', 47834, 'PR5a00d645110cc', 20),
(3, 4, 'RG59feb2gc29047', 65987, 'PR5a00d645e20fa', 20),
(4, 5, 'RG59frt2c29047dg', 66398, 'PR5a00d66c68aba', 20),
(5, 6, 'RG1654b2c29047', 45987, 'PR5a00d6a2edb67', 20),
(6, 7, 'RG59feqwer9047d', 65489, 'PR5a00d6a3a1905', 20),
(7, 21, 'RG59feb2669047d', 56325897, 'PR5a00d6a40cd4a', 20),
(9, 27, 'RG59feb2c29047d', 1234567891, 'PR5a00d6a7a3eb6', 20),
(10, 28, 'RG59feb60334797', 1234567892, 'PR5a00d6a84f616', 20),
(11, 29, 'RG59feb7f9dc864', 1234567893, 'PR5a00d6a8b4e4e', 20),
(12, 30, 'RG59feb9b279195', 1234567894, 'PR5a00d6a91cc2f', 20),
(13, 31, 'RG59febb055aa39', 1234567895, 'PR5a00d6a9d44c9', 20),
(15, 33, 'RG59fec36012d3c', 1234567897, 'PR5a01fc41d1c01', 20),
(16, 34, 'RG59fec5ea5ab40', 1234567898, 'PR5a01eb43bf666', 20),
(17, 35, 'RG59fec7ef2f5be', 1234567898, 'PR5a01de4e3c978', 20),
(18, 36, 'RG59fec9d1cdbaa', 1234567899, 'PR5a00d57397c86', 20);

--
-- Triggers `permit_result`
--
DELIMITER $$
CREATE TRIGGER `new_per_trigger` AFTER INSERT ON `permit_result` FOR EACH ROW UPDATE `permit` SET `approval_status`=1 WHERE `P_id` = '15'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reg_motor_result`
--

CREATE TABLE `reg_motor_result` (
  `REG_id` int(11) NOT NULL,
  `reg_no` text NOT NULL,
  `dl_no` text NOT NULL,
  `U_id` int(11) NOT NULL,
  `Engine_no` bigint(11) NOT NULL,
  `A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_motor_result`
--

INSERT INTO `reg_motor_result` (`REG_id`, `reg_no`, `dl_no`, `U_id`, `Engine_no`, `A_id`) VALUES
(1, 'RG59feb18f5b868', 'DL59we45161fd9d', 2, 25634, 20),
(2, 'RG60jna2c29047d', 'DL56ty76161fd9d', 3, 85694, 20),
(3, 'RG61mab2c29047', 'DL637818161fd9d', 4, 47834, 20),
(4, 'RG59feb2gc29047', 'DL637818161fd9d', 4, 65987, 20),
(5, 'RG59frt2c29047dg', 'DL61f718161fd9d', 5, 66398, 20),
(6, 'RG1654b2c29047', 'DL59feac85b1265', 6, 45987, 20),
(7, 'RG59feqwer9047d', 'DL59f7asd654d9d', 7, 65489, 20),
(8, 'RG59feb2669047d', 'DL5a00c23818174', 21, 56325897, 20),
(10, 'RG59feb2c29047d', 'DL59feac0a4e2e8', 27, 1234567891, 20),
(11, 'RG59feb60334797', '', 28, 1234567892, 20),
(12, 'RG59feb7f9dc864', 'DL59feb7add2935', 29, 1234567893, 20),
(14, 'RG59febb055aa39', '', 31, 1234567895, 20),
(15, 'RG59febd6082795', '', 32, 1234567896, 20),
(16, 'RG59fec36012d3c', '', 33, 1234567897, 20),
(17, 'RG59fec5ea5ab40', '', 34, 1234567898, 20),
(18, 'RG5a029a6a690f9', '', 35, 1234567898, 20),
(19, 'RG5a029a6b61405', '', 36, 1234567899, 20),
(21, 'RG5a02af9762a10', 'DL5a02adac9488f', 37, 1234567898, 20),
(22, 'RG5a02d01d8096a', 'DL5a02cef4a4666', 39, 1234567888, 20);

--
-- Triggers `reg_motor_result`
--
DELIMITER $$
CREATE TRIGGER `reg_trigger` AFTER INSERT ON `reg_motor_result` FOR EACH ROW UPDATE `reg_motor_vehicle` SET `approval_status`= 1 WHERE `REG_id` = 22
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reg_motor_vehicle`
--

CREATE TABLE `reg_motor_vehicle` (
  `REG_id` int(11) NOT NULL,
  `U_id` int(11) NOT NULL,
  `Dealers_name` text NOT NULL,
  `Type_of_vehicle` text NOT NULL,
  `date_of_manuf` year(4) NOT NULL,
  `Engine_no` bigint(11) NOT NULL,
  `seating_capacity` int(11) NOT NULL,
  `fuel_type` text NOT NULL,
  `approval_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_motor_vehicle`
--

INSERT INTO `reg_motor_vehicle` (`REG_id`, `U_id`, `Dealers_name`, `Type_of_vehicle`, `date_of_manuf`, `Engine_no`, `seating_capacity`, `fuel_type`, `approval_status`) VALUES
(1, 2, 'Dream Honda', '4', 2016, 25634, 4, '4', 1),
(2, 3, 'Dream Yuva', '2', 2013, 85694, 4, '3', 1),
(3, 4, 'Dream Honda', '3', 2014, 47834, 2, '2', 1),
(4, 4, 'Yamaha', '4', 2014, 65987, 4, '3', 1),
(5, 5, 'SUZUKI', '4', 2016, 66398, 10, '3', 1),
(6, 6, 'Renault', '3', 2016, 45987, 8, '3', 1),
(7, 7, 'Nissan', '4', 2016, 65489, 6, '1', 1),
(8, 21, 'Honda', '2', 2014, 56325897, 3, '2', 1),
(10, 27, 'Karan Desai', '1', 2016, 1234567891, 2, '3', 1),
(11, 28, 'Disha ', '3', 2017, 1234567892, 4, '4', 1),
(12, 29, 'Mitul', '3', 2016, 1234567893, 4, '2', 1),
(13, 30, 'Harrsh', '1', 2013, 1234567894, 2, '0', 0),
(14, 31, 'Prabha ', '3', 2014, 1234567895, 4, '3', 1),
(15, 32, 'Jayshree', '3', 2017, 1234567896, 4, '4', 1),
(16, 33, 'Saumya', '4', 2014, 1234567897, 50, '1', 1),
(17, 34, 'Nik', '2', 2014, 1234567898, 3, '2', 1),
(18, 35, 'Amar Vakharia', '3', 2013, 1234567898, 4, '0', 1),
(19, 36, 'Khushi', '4', 2014, 1234567899, 15, '2', 1),
(21, 37, 'Honda', '1', 2017, 1234567898, 2, '0', 1),
(22, 39, 'Karan Desai', '1', 2017, 1234567888, 2, '0', 1);

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
(2, 'DL59we45161fd9d', 2, '2013-09-07', 24, '2015-09-25', 0),
(3, 'DL56ty76161fd9d', 3, '2013-09-04', 24, '2015-09-01', 1),
(4, 'DL637818161fd9d', 4, '2013-09-05', 24, '2015-09-07', 1),
(5, 'DL59f7asd654d9d', 7, '2013-09-04', 24, '2015-09-11', 1),
(6, 'DL5q3w4e5r1fd9d', 8, '2013-09-04', 24, '2015-09-27', 0),
(7, 'DL59f718169poi7', 9, '2013-10-01', 24, '2015-10-02', 1),
(11, 'DL59feac85b1265', 6, '2013-06-10', 24, '2015-10-02', 1),
(12, 'DL5a02adac9488f', 37, '2015-02-01', 20, '2014-05-06', 1);

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
(12, 28, 'DL5a02adac9488f', 20);

--
-- Triggers `renewal_dl_result`
--
DELIMITER $$
CREATE TRIGGER `ren_dl_trigger` AFTER INSERT ON `renewal_dl_result` FOR EACH ROW UPDATE `renenwal_of_dl` SET `approval_status` = 1  WHERE `REN_id` = '12'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transfer of ownership`
--

CREATE TABLE `transfer of ownership` (
  `T_id` int(11) NOT NULL,
  `S_U_id` int(11) NOT NULL,
  `R_U_id` int(11) NOT NULL,
  `REG_id` int(11) NOT NULL,
  `approval_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transfer of ownership`
--

INSERT INTO `transfer of ownership` (`T_id`, `S_U_id`, `R_U_id`, `REG_id`, `approval_status`) VALUES
(1, 4, 2, 4, 1),
(3, 2, 4, 2, 0),
(4, 3, 2, 3, 1),
(5, 4, 10, 4, 1),
(6, 6, 5, 6, 1),
(7, 7, 3, 7, 1),
(8, 5, 13, 5, 1),
(9, 3, 9, 3, 1),
(10, 21, 1, 8, 1),
(11, 21, 1, 8, 1),
(12, 21, 1, 8, 0),
(13, 37, 1, 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transfer_process`
--

CREATE TABLE `transfer_process` (
  `T_id` int(11) NOT NULL,
  `REG_id` int(11) NOT NULL,
  `A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transfer_process`
--

INSERT INTO `transfer_process` (`T_id`, `REG_id`, `A_id`) VALUES
(1, 4, 20),
(4, 3, 20),
(5, 4, 20),
(6, 6, 20),
(7, 7, 20),
(8, 5, 20),
(9, 3, 20),
(10, 8, 20),
(11, 8, 20);

--
-- Triggers `transfer_process`
--
DELIMITER $$
CREATE TRIGGER `transfer_process1` AFTER INSERT ON `transfer_process` FOR EACH ROW UPDATE `transfer of ownership` SET `approval_status`= 1 WHERE `T_id` =  1
$$
DELIMITER ;

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
(36, 'Nisarg Mehta', 'nisarg13@gmail.com', 'Satellite road', 960154008210, 0, 9601540082),
(37, 'pratham', 'pra@gmail.com', 'tulsi residency', 982413056012, 0, 9824130560),
(38, 'darshan', 'darshu@gmail.com', 'aarav hostel', 9999999999912, 0, 9999999999),
(39, 'parth', 'parth65@gmail.com', 'tulsi residency', 123456789789, 0, 1234567890),
(40, 'saloni', 'sg@gmail.com', 'Bansri ', 963852741236, 1, 9876543213),
(41, 'jay', 'jay@gmail.com', 'Royalcare', 987654321478, 0, 9876543210);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`A_id`),
  ADD KEY `U_id` (`U_id`);

--
-- Indexes for table `dl_result`
--
ALTER TABLE `dl_result`
  ADD PRIMARY KEY (`D_id`),
  ADD KEY `A_id` (`A_id`);

--
-- Indexes for table `driving license`
--
ALTER TABLE `driving license`
  ADD PRIMARY KEY (`D_id`),
  ADD KEY `U_id` (`U_id`),
  ADD KEY `Date_of_test` (`Date_of_test`);

--
-- Indexes for table `duplicate license`
--
ALTER TABLE `duplicate license`
  ADD PRIMARY KEY (`DUP_id`);

--
-- Indexes for table `duplicatelicense_result`
--
ALTER TABLE `duplicatelicense_result`
  ADD PRIMARY KEY (`DUP_id`),
  ADD KEY `A_id` (`A_id`),
  ADD KEY `D_id` (`D_id`);

--
-- Indexes for table `duplicate permit`
--
ALTER TABLE `duplicate permit`
  ADD PRIMARY KEY (`DUP_P_id`),
  ADD KEY `P_id` (`P_id`);

--
-- Indexes for table `duplicate reg certificate`
--
ALTER TABLE `duplicate reg certificate`
  ADD PRIMARY KEY (`DUP_REG_id`),
  ADD KEY `REG_id` (`REG_id`);

--
-- Indexes for table `duplicate_permit_result`
--
ALTER TABLE `duplicate_permit_result`
  ADD PRIMARY KEY (`DUP_id`),
  ADD KEY `P_id` (`P_id`),
  ADD KEY `A_id` (`A_id`);

--
-- Indexes for table `duplicate_reg_result`
--
ALTER TABLE `duplicate_reg_result`
  ADD PRIMARY KEY (`DUP_REG_id`),
  ADD KEY `REG_id` (`REG_id`),
  ADD KEY `A_id` (`A_id`),
  ADD KEY `Engine_no` (`Engine_no`);

--
-- Indexes for table `duplicate_result`
--
ALTER TABLE `duplicate_result`
  ADD PRIMARY KEY (`DUP_id`),
  ADD KEY `D_id` (`D_id`),
  ADD KEY `A_id` (`A_id`);

--
-- Indexes for table `learning license`
--
ALTER TABLE `learning license`
  ADD PRIMARY KEY (`L_id`),
  ADD KEY `U_id` (`U_id`);

--
-- Indexes for table `ll_log`
--
ALTER TABLE `ll_log`
  ADD PRIMARY KEY (`U_id`);

--
-- Indexes for table `ll_result`
--
ALTER TABLE `ll_result`
  ADD PRIMARY KEY (`L_id`);

--
-- Indexes for table `permit`
--
ALTER TABLE `permit`
  ADD PRIMARY KEY (`P_id`),
  ADD KEY `REG_id` (`REG_id`),
  ADD KEY `U_id` (`U_id`);

--
-- Indexes for table `permit_result`
--
ALTER TABLE `permit_result`
  ADD PRIMARY KEY (`P_id`),
  ADD KEY `U_id` (`U_id`),
  ADD KEY `Engine_no` (`Engine_no`),
  ADD KEY `A_id` (`A_id`);

--
-- Indexes for table `reg_motor_result`
--
ALTER TABLE `reg_motor_result`
  ADD PRIMARY KEY (`REG_id`),
  ADD KEY `U_id` (`U_id`),
  ADD KEY `A_id` (`A_id`),
  ADD KEY `Engine_no` (`Engine_no`);

--
-- Indexes for table `reg_motor_vehicle`
--
ALTER TABLE `reg_motor_vehicle`
  ADD PRIMARY KEY (`REG_id`),
  ADD KEY `U_id` (`U_id`),
  ADD KEY `Engine_no` (`Engine_no`);

--
-- Indexes for table `renenwal_of_dl`
--
ALTER TABLE `renenwal_of_dl`
  ADD PRIMARY KEY (`REN_id`),
  ADD KEY `U_id` (`U_id`);

--
-- Indexes for table `renewal_dl_result`
--
ALTER TABLE `renewal_dl_result`
  ADD PRIMARY KEY (`REN_id`),
  ADD KEY `D_id` (`D_id`),
  ADD KEY `A_id` (`A_id`);

--
-- Indexes for table `transfer of ownership`
--
ALTER TABLE `transfer of ownership`
  ADD PRIMARY KEY (`T_id`),
  ADD KEY `S_U_id` (`S_U_id`),
  ADD KEY `R_U_id` (`R_U_id`),
  ADD KEY `REG_id` (`REG_id`);

--
-- Indexes for table `transfer_process`
--
ALTER TABLE `transfer_process`
  ADD PRIMARY KEY (`T_id`),
  ADD KEY `REG_id` (`REG_id`),
  ADD KEY `A_id` (`A_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`U_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authority`
--
ALTER TABLE `authority`
  MODIFY `A_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `dl_result`
--
ALTER TABLE `dl_result`
  MODIFY `D_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `driving license`
--
ALTER TABLE `driving license`
  MODIFY `D_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `duplicate license`
--
ALTER TABLE `duplicate license`
  MODIFY `DUP_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `duplicatelicense_result`
--
ALTER TABLE `duplicatelicense_result`
  MODIFY `DUP_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `duplicate permit`
--
ALTER TABLE `duplicate permit`
  MODIFY `DUP_P_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `duplicate reg certificate`
--
ALTER TABLE `duplicate reg certificate`
  MODIFY `DUP_REG_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `duplicate_reg_result`
--
ALTER TABLE `duplicate_reg_result`
  MODIFY `DUP_REG_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `duplicate_result`
--
ALTER TABLE `duplicate_result`
  MODIFY `DUP_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `learning license`
--
ALTER TABLE `learning license`
  MODIFY `L_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `permit`
--
ALTER TABLE `permit`
  MODIFY `P_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `permit_result`
--
ALTER TABLE `permit_result`
  MODIFY `P_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `reg_motor_result`
--
ALTER TABLE `reg_motor_result`
  MODIFY `REG_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `reg_motor_vehicle`
--
ALTER TABLE `reg_motor_vehicle`
  MODIFY `REG_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `renenwal_of_dl`
--
ALTER TABLE `renenwal_of_dl`
  MODIFY `REN_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `transfer of ownership`
--
ALTER TABLE `transfer of ownership`
  MODIFY `T_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `U_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `authority`
--
ALTER TABLE `authority`
  ADD CONSTRAINT `authority_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`);

--
-- Constraints for table `dl_result`
--
ALTER TABLE `dl_result`
  ADD CONSTRAINT `dl_result_ibfk_1` FOREIGN KEY (`D_id`) REFERENCES `driving license` (`D_id`),
  ADD CONSTRAINT `dl_result_ibfk_2` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`);

--
-- Constraints for table `driving license`
--
ALTER TABLE `driving license`
  ADD CONSTRAINT `driving license_ibfk_2` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`);

--
-- Constraints for table `duplicatelicense_result`
--
ALTER TABLE `duplicatelicense_result`
  ADD CONSTRAINT `duplicatelicense_result_ibfk_1` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`),
  ADD CONSTRAINT `duplicatelicense_result_ibfk_2` FOREIGN KEY (`D_id`) REFERENCES `driving license` (`D_id`);

--
-- Constraints for table `duplicate permit`
--
ALTER TABLE `duplicate permit`
  ADD CONSTRAINT `duplicate permit_ibfk_1` FOREIGN KEY (`P_id`) REFERENCES `permit` (`P_id`);

--
-- Constraints for table `duplicate reg certificate`
--
ALTER TABLE `duplicate reg certificate`
  ADD CONSTRAINT `duplicate reg certificate_ibfk_1` FOREIGN KEY (`REG_id`) REFERENCES `reg_motor_vehicle` (`REG_id`);

--
-- Constraints for table `duplicate_permit_result`
--
ALTER TABLE `duplicate_permit_result`
  ADD CONSTRAINT `duplicate_permit_result_ibfk_1` FOREIGN KEY (`DUP_id`) REFERENCES `duplicate permit` (`DUP_P_id`),
  ADD CONSTRAINT `duplicate_permit_result_ibfk_2` FOREIGN KEY (`P_id`) REFERENCES `permit` (`P_id`),
  ADD CONSTRAINT `duplicate_permit_result_ibfk_3` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`);

--
-- Constraints for table `duplicate_reg_result`
--
ALTER TABLE `duplicate_reg_result`
  ADD CONSTRAINT `duplicate_reg_result_ibfk_1` FOREIGN KEY (`REG_id`) REFERENCES `reg_motor_vehicle` (`REG_id`),
  ADD CONSTRAINT `duplicate_reg_result_ibfk_2` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`),
  ADD CONSTRAINT `duplicate_reg_result_ibfk_3` FOREIGN KEY (`Engine_no`) REFERENCES `reg_motor_vehicle` (`Engine_no`);

--
-- Constraints for table `duplicate_result`
--
ALTER TABLE `duplicate_result`
  ADD CONSTRAINT `duplicate_result_ibfk_1` FOREIGN KEY (`D_id`) REFERENCES `driving license` (`D_id`),
  ADD CONSTRAINT `duplicate_result_ibfk_2` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`);

--
-- Constraints for table `learning license`
--
ALTER TABLE `learning license`
  ADD CONSTRAINT `learning license_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`);

--
-- Constraints for table `ll_log`
--
ALTER TABLE `ll_log`
  ADD CONSTRAINT `ll_log_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`);

--
-- Constraints for table `permit`
--
ALTER TABLE `permit`
  ADD CONSTRAINT `permit_ibfk_1` FOREIGN KEY (`REG_id`) REFERENCES `reg_motor_vehicle` (`REG_id`),
  ADD CONSTRAINT `permit_ibfk_2` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`);

--
-- Constraints for table `permit_result`
--
ALTER TABLE `permit_result`
  ADD CONSTRAINT `permit_result_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`),
  ADD CONSTRAINT `permit_result_ibfk_2` FOREIGN KEY (`Engine_no`) REFERENCES `reg_motor_vehicle` (`Engine_no`),
  ADD CONSTRAINT `permit_result_ibfk_3` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`),
  ADD CONSTRAINT `permit_result_ibfk_4` FOREIGN KEY (`P_id`) REFERENCES `permit` (`P_id`);

--
-- Constraints for table `reg_motor_result`
--
ALTER TABLE `reg_motor_result`
  ADD CONSTRAINT `reg_motor_result_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`),
  ADD CONSTRAINT `reg_motor_result_ibfk_2` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`),
  ADD CONSTRAINT `reg_motor_result_ibfk_3` FOREIGN KEY (`Engine_no`) REFERENCES `reg_motor_vehicle` (`Engine_no`),
  ADD CONSTRAINT `reg_motor_result_ibfk_4` FOREIGN KEY (`REG_id`) REFERENCES `reg_motor_vehicle` (`REG_id`);

--
-- Constraints for table `reg_motor_vehicle`
--
ALTER TABLE `reg_motor_vehicle`
  ADD CONSTRAINT `reg_motor_vehicle_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`);

--
-- Constraints for table `renenwal_of_dl`
--
ALTER TABLE `renenwal_of_dl`
  ADD CONSTRAINT `renenwal_of_dl_ibfk_2` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`);

--
-- Constraints for table `renewal_dl_result`
--
ALTER TABLE `renewal_dl_result`
  ADD CONSTRAINT `renewal_dl_result_ibfk_1` FOREIGN KEY (`D_id`) REFERENCES `driving license` (`D_id`),
  ADD CONSTRAINT `renewal_dl_result_ibfk_2` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`);

--
-- Constraints for table `transfer of ownership`
--
ALTER TABLE `transfer of ownership`
  ADD CONSTRAINT `transfer of ownership_ibfk_2` FOREIGN KEY (`S_U_id`) REFERENCES `user` (`U_id`),
  ADD CONSTRAINT `transfer of ownership_ibfk_3` FOREIGN KEY (`R_U_id`) REFERENCES `user` (`U_id`),
  ADD CONSTRAINT `transfer of ownership_ibfk_4` FOREIGN KEY (`REG_id`) REFERENCES `reg_motor_vehicle` (`REG_id`);

--
-- Constraints for table `transfer_process`
--
ALTER TABLE `transfer_process`
  ADD CONSTRAINT `transfer_process_ibfk_1` FOREIGN KEY (`REG_id`) REFERENCES `reg_motor_vehicle` (`REG_id`),
  ADD CONSTRAINT `transfer_process_ibfk_2` FOREIGN KEY (`A_id`) REFERENCES `authority` (`A_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
