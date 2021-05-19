-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 19, 2021 at 07:27 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `USERSERVICE`
--

-- --------------------------------------------------------

--
-- Table structure for table `ASSIGN_PERMISSION_TO_ROLE`
--

CREATE TABLE `ASSIGN_PERMISSION_TO_ROLE` (
  `ID` int(11) NOT NULL,
  `PERMISSION_ID` int(11) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ASSIGN_PERMISSION_TO_ROLE`
--

INSERT INTO `ASSIGN_PERMISSION_TO_ROLE` (`ID`, `PERMISSION_ID`, `ROLE_ID`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 4, 2),
(7, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ASSIGN_USER_TO_ROLE`
--

CREATE TABLE `ASSIGN_USER_TO_ROLE` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ASSIGN_USER_TO_ROLE`
--

INSERT INTO `ASSIGN_USER_TO_ROLE` (`ID`, `USER_ID`, `ROLE_ID`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PERMISSION`
--

CREATE TABLE `PERMISSION` (
  `ID` int(11) NOT NULL,
  `PERMISSION_NAME` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PERMISSION`
--

INSERT INTO `PERMISSION` (`ID`, `PERMISSION_NAME`) VALUES
(1, 'CREATE_NOTE'),
(2, 'EDIT_NOTE'),
(3, 'DELETE_NOTE'),
(4, 'VIEW_ALL_NOTE'),
(5, 'VIEW_NOTE');

-- --------------------------------------------------------

--
-- Table structure for table `ROLE`
--

CREATE TABLE `ROLE` (
  `ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ROLE`
--

INSERT INTO `ROLE` (`ID`, `ROLE_NAME`) VALUES
(1, 'ADMINISTRATOR'),
(2, 'AUDITOR');

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE `USER` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `EMAIL_ID` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`ID`, `NAME`, `EMAIL_ID`, `PASSWORD`) VALUES
(1, 'John', 'john@gmail.com', '$2a$10$jbIi/RIYNm5xAW9M7IaE5.WPw6BZgD8wcpkZUg0jm8RHPtdfDcMgm'),
(2, 'Mike', 'mike@gmail.com', '$2a$10$jbIi/RIYNm5xAW9M7IaE5.WPw6BZgD8wcpkZUg0jm8RHPtdfDcMgm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ASSIGN_PERMISSION_TO_ROLE`
--
ALTER TABLE `ASSIGN_PERMISSION_TO_ROLE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PERMISSION_ID` (`PERMISSION_ID`),
  ADD KEY `ROLE_ID` (`ROLE_ID`);

--
-- Indexes for table `ASSIGN_USER_TO_ROLE`
--
ALTER TABLE `ASSIGN_USER_TO_ROLE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `USER_ID` (`USER_ID`),
  ADD KEY `ROLE_ID` (`ROLE_ID`);

--
-- Indexes for table `PERMISSION`
--
ALTER TABLE `PERMISSION`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ROLE`
--
ALTER TABLE `ROLE`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL_ID` (`EMAIL_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ASSIGN_PERMISSION_TO_ROLE`
--
ALTER TABLE `ASSIGN_PERMISSION_TO_ROLE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ASSIGN_USER_TO_ROLE`
--
ALTER TABLE `ASSIGN_USER_TO_ROLE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `PERMISSION`
--
ALTER TABLE `PERMISSION`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ROLE`
--
ALTER TABLE `ROLE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `USER`
--
ALTER TABLE `USER`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ASSIGN_PERMISSION_TO_ROLE`
--
ALTER TABLE `ASSIGN_PERMISSION_TO_ROLE`
  ADD CONSTRAINT `ASSIGN_PERMISSION_TO_ROLE_ibfk_1` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `PERMISSION` (`ID`),
  ADD CONSTRAINT `ASSIGN_PERMISSION_TO_ROLE_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`);

--
-- Constraints for table `ASSIGN_USER_TO_ROLE`
--
ALTER TABLE `ASSIGN_USER_TO_ROLE`
  ADD CONSTRAINT `ASSIGN_USER_TO_ROLE_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`ID`),
  ADD CONSTRAINT `ASSIGN_USER_TO_ROLE_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
