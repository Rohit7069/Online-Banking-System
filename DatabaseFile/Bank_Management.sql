-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 30, 2020 at 08:25 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `accname` varchar(30) NOT NULL,
  `accno` int(11) NOT NULL,
  `accifsc` varchar(20) NOT NULL,
  `accemail` varchar(30) NOT NULL,
  `accpassword` varchar(50) NOT NULL,
  `acctype` varchar(50) NOT NULL,
  `accbalance` decimal(10,0) NOT NULL,
  `accdate` date NOT NULL,
  PRIMARY KEY (`accno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`accname`, `accno`, `accifsc`, `accemail`, `accpassword`, `acctype`, `accbalance`, `accdate`) VALUES
('Brijesh Kargar', 7896, 'SBIn0011020', 'brijesh@gmail.com', '9db077197b5f4184cd9eb439086fbdef', 'Savings', '377050', '2020-05-30'),
('Rohit Bhalala', 7878, 'SBIN0011020', 'rohit@gmail.com', '2d235ace000a3ad85f590e321c89bb99', 'Current', '450000', '2020-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
CREATE TABLE IF NOT EXISTS `branch` (
  `ifsccode` varchar(25) NOT NULL,
  `branchname` varchar(50) NOT NULL,
  `city` varchar(25) NOT NULL,
  `branchaddress` text NOT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(25) NOT NULL,
  `pincode` int(11) NOT NULL,
  PRIMARY KEY (`ifsccode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`ifsccode`, `branchname`, `city`, `branchaddress`, `state`, `country`, `pincode`) VALUES
('GUR2345', 'Head office', 'Gurgaon', 'National Highway 8, 67 KM Milestone', 'Haryana', 'India', 122413),
('HYD1234', 'Hyderabad branch', 'hyderabad', 'Balaji nagar, Kukatpally, JNTU', 'Telangana', 'India', 155200);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `empid` int(10) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(25) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `emailid` varchar(30) NOT NULL,
  `contactno` varchar(30) NOT NULL,
  `createdat` date NOT NULL,
  `last_login` datetime NOT NULL,
  PRIMARY KEY (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=313800 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`empid`, `employee_name`, `loginid`, `password`, `emailid`, `contactno`, `createdat`, `last_login`) VALUES
(313786, 'John', '445545', '125487', 'soudha_ban@52yahoo.com', '9535543313', '2012-12-15', '2012-12-03 11:27:00'),
(313787, 'Mark', 'mahesh', 'qwert', 'mahesh@gmail.com', '98478872783', '0000-00-00', '0000-00-00 00:00:00'),
(313788, 'Rick', '3535355', '3636', 'jyothi@yahoo.com', '95425422424', '2013-01-02', '0000-00-00 00:00:00'),
(313791, 'admin', 'admin', 'admin', 'admin', '8100496433', '2013-01-12', '2013-01-12 00:00:00'),
(313798, 'Raj', 'rajkiran', '123456', 'abc@gmail.com', '9874563210', '2013-02-02', '0000-00-00 00:00:00'),
(313799, 'Sameer', 'emp', 'emp', 'emp@gmail.com', '987456321', '2013-02-09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
CREATE TABLE IF NOT EXISTS `loan` (
  `loanid` int(10) NOT NULL AUTO_INCREMENT,
  `loanamt` varchar(25) NOT NULL,
  `accno` int(12) NOT NULL,
  `interest` float(10,2) NOT NULL,
  `loandate` date NOT NULL,
  `loantype` varchar(30) NOT NULL,
  `loan_rem` decimal(10,0) NOT NULL,
  PRIMARY KEY (`loanid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loanid`, `loanamt`, `accno`, `interest`, `loandate`, `loantype`, `loan_rem`) VALUES
(1, '505000', 7878, 7.00, '2020-05-30', 'Home Loan', '433580'),
(2, '350000', 7896, 10.00, '2020-05-30', 'Morgage', '350000');

-- --------------------------------------------------------

--
-- Table structure for table `loanpayment`
--

DROP TABLE IF EXISTS `loanpayment`;
CREATE TABLE IF NOT EXISTS `loanpayment` (
  `paymentid` int(10) NOT NULL AUTO_INCREMENT,
  `from_acc` int(11) NOT NULL,
  `loantype` varchar(20) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`paymentid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loanpayment`
--

INSERT INTO `loanpayment` (`paymentid`, `from_acc`, `loantype`, `amount`, `payment_date`) VALUES
(1, 7878, 'Home Loan', '65000', '2020-05-30'),
(2, 7878, 'Home Loan', '6420', '2020-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `payee`
--

DROP TABLE IF EXISTS `payee`;
CREATE TABLE IF NOT EXISTS `payee` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(30) NOT NULL,
  `accno` int(11) NOT NULL,
  `acctype` varchar(20) NOT NULL,
  `ifsccode` varchar(20) NOT NULL,
  `registered_in` int(11) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registered_payee`
--

DROP TABLE IF EXISTS `registered_payee`;
CREATE TABLE IF NOT EXISTS `registered_payee` (
  `slno` int(11) NOT NULL AUTO_INCREMENT,
  `payeename` varchar(25) NOT NULL,
  `accountnumber` varchar(25) NOT NULL,
  `accounttype` varchar(25) NOT NULL,
  `bankname` varchar(25) NOT NULL,
  `ifsccode` varchar(25) NOT NULL,
  PRIMARY KEY (`slno`)
) ENGINE=InnoDB AUTO_INCREMENT=67545 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registered_payee`
--

INSERT INTO `registered_payee` (`slno`, `payeename`, `accountnumber`, `accounttype`, `bankname`, `ifsccode`) VALUES
(67543, 'arpitha', '26548', 'saving', 'canarabank', 'KARB0000404'),
(67544, 'aastha', '123458', 'CURRENT ACCOUNT', 'Canara Bank', '1254333');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payee_name` varchar(50) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `from_acc` int(11) NOT NULL,
  `trans_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `payee_name`, `amount`, `from_acc`, `trans_date`) VALUES
(1, 'Brijesh Kargar', '1010', 7878, '2020-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(20) NOT NULL,
  `u_email` varchar(20) NOT NULL,
  `u_password` varchar(50) NOT NULL,
  `accno` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `u_name`, `u_email`, `u_password`, `accno`) VALUES
(1, 'admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 0),
(2, 'Rohit Bhalala', 'rohit@gmail.com', '2d235ace000a3ad85f590e321c89bb99', 7878),
(3, 'Brijesh Kargar', 'brijesh@gmail.com', '9db077197b5f4184cd9eb439086fbdef', 7896),
(4, 'Jenish Devani', 'jenish@gmail.com', '17c1eb805f782ec09e6ba5af68e29312', 4563);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
