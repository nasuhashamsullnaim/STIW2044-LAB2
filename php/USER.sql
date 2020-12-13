-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 13, 2020 at 06:35 PM
-- Server version: 10.3.25-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itsmelel_deafZone`
--

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE `USER` (
  `FNAME` varchar(100) NOT NULL,
  `PHONE` varchar(15) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `STATE` varchar(50) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `OTP` varchar(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`FNAME`, `PHONE`, `EMAIL`, `STATE`, `PASSWORD`, `OTP`) VALUES
('Cleo cicibu', '0123454637', 'cleocicibu@gmail.com', 'selangor', 'cleocici1234', '3242'),
('Nasuha', '0198898989', 'nasuha@yahoo.com', 'kedah', '94fafbe32cc3599f9416', '8109'),
('pika', '0125425895', 'pikadiela@gmail.com', 'sabah', '7c4a8d09ca3762af61e5', '4914'),
('Ammar', '0123433222', 'ammar55@gmail.com', 'Perlis', '7f33a05d9c9f6a2f12b1', '5556'),
('ahamad', '0198898888', 'ahamad77@yahoo.com', 'terengganu', '4b3b94fefda7a82b3ee4', '4293'),
('', '', '', '', 'da39a3ee5e6b4b0d3255', '8394'),
('', '', '', '', 'da39a3ee5e6b4b0d3255', '5798'),
('Cleo cicibu', '0123454637', 'cleocicibu@gmail.com', 'selangor', 'cleocici1234', '3242');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
