-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2019 at 09:17 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `EmpID` varchar(10) NOT NULL,
  `Warden_Name` varchar(50) NOT NULL,
  `passwrd` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`EmpID`, `Warden_Name`, `passwrd`) VALUES
('admin', 'ABC XYZ', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `ammenities`
--

CREATE TABLE `ammenities` (
  `RNum` varchar(10) NOT NULL,
  `Beds` int(11) NOT NULL,
  `Tables` int(11) NOT NULL,
  `Chairs` int(11) NOT NULL,
  `Cupboard` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ammenities`
--

INSERT INTO `ammenities` (`RNum`, `Beds`, `Tables`, `Chairs`, `Cupboard`) VALUES
('S03', 1, 1, 1, 1),
('S04', 2, 1, 0, 1),
('S05', 2, 1, 2, 2),
('T01', 2, 1, 2, 1),
('T02', 2, 1, 1, 1),
('T06', 2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `complaints_by`
--

CREATE TABLE `complaints_by` (
  `FeedbackNo` int(11) NOT NULL,
  `Hostel_ID` varchar(5) NOT NULL,
  `FeedbackStatus` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaints_by`
--

INSERT INTO `complaints_by` (`FeedbackNo`, `Hostel_ID`, `FeedbackStatus`) VALUES
(1, 'TDI', 'Repaired'),
(2, 'TDI', 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DName` varchar(100) NOT NULL,
  `DCode` varchar(5) NOT NULL,
  `HoD` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DName`, `DCode`, `HoD`) VALUES
('Computer Science and Engineering', 'CSE', 'ABC'),
('Electronics and Communication Engineering', 'ECE', 'DEF'),
('Electrical and ELectronical Engineering', 'EEE', 'GHI');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FeedNum` int(11) NOT NULL,
  `Enroll_Id` varchar(9) NOT NULL,
  `SName` varchar(50) NOT NULL,
  `RequestType` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `Comments` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FeedNum`, `Enroll_Id`, `SName`, `RequestType`, `Date`, `Comments`) VALUES
(1, '181210036', 'Prasun Verma', 'Water Supply', '2019-11-18', 'Water not coming through the taps'),
(2, '181210050', 'Shashi Raj', 'Leave', '2019-11-11', 'Going out of premises for shopping');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `Enroll_ID` varchar(9) NOT NULL,
  `FeeID` varchar(15) NOT NULL,
  `Amount` decimal(8,2) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `Type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`Enroll_ID`, `FeeID`, `Amount`, `Status`, `Type`) VALUES
('181210036', '181210036SEP', '3100.00', 'Paid', 'MESS'),
('181210050', '181210050SEP', '3100.00', 'Pending', 'MESS'),
('181210051', '181210051HOS', '10000.00', 'Paid', 'HOSTEL');

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `Hid` varchar(5) NOT NULL,
  `HostelName` varchar(50) NOT NULL,
  `WardenID` varchar(10) NOT NULL,
  `TotalRooms` int(11) DEFAULT NULL,
  `Address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hostel`
--

INSERT INTO `hostel` (`Hid`, `HostelName`, `WardenID`, `TotalRooms`, `Address`) VALUES
('SRCH', 'Harishchandra', 'admin', 3, 'sector A-7,Narela'),
('TDI', 'MY FLOOR 2', 'admin', 3, 'Kundli');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `RNum` varchar(10) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `H_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`RNum`, `Type`, `Status`, `Capacity`, `H_id`) VALUES
('S03', 'with bathroom', 'occupied', 1, 'SRCH'),
('S04', 'without bathroom', 'vacant', 2, 'SRCH'),
('S05', 'without bathroom', 'vacant', 2, 'SRCH'),
('T01', 'with bathroom', 'vacant', 2, 'TDI'),
('T02', 'without bathroom', 'occupied', 2, 'TDI'),
('T06', 'with bathroom', 'occupied', 2, 'TDI');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `SName` varchar(50) NOT NULL,
  `EnrollId` varchar(9) NOT NULL,
  `Branch` char(5) NOT NULL,
  `Semester` int(11) NOT NULL,
  `ContactNo` varchar(10) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `HS/OS` char(2) NOT NULL,
  `EmailId` varchar(50) DEFAULT NULL,
  `password` varchar(15) NOT NULL,
  `Hid` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`SName`, `EnrollId`, `Branch`, `Semester`, `ContactNo`, `Gender`, `Address`, `HS/OS`, `EmailId`, `password`, `Hid`) VALUES
('Prasun Verma', '181210036', 'CSE', 3, '9998887776', 'M', NULL, 'OS', NULL, 'abc', 'TDI'),
('Raghav Shukla', '181210038', 'CSE', 3, '5556667778', 'M', NULL, 'OS', NULL, '123', 'TDI'),
('Shashi Raj', '181210050', 'CSE', 3, '1112223334', 'M', NULL, 'OS', NULL, 'def', 'TDI'),
('Shivam Joshi', '181210051', 'CSE', 3, '2223334445', 'M', NULL, 'HS', NULL, '456', 'TDI');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`EmpID`);

--
-- Indexes for table `ammenities`
--
ALTER TABLE `ammenities`
  ADD PRIMARY KEY (`RNum`);

--
-- Indexes for table `complaints_by`
--
ALTER TABLE `complaints_by`
  ADD PRIMARY KEY (`FeedbackNo`,`Hostel_ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DCode`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FeedNum`,`SName`),
  ADD KEY `feed` (`Enroll_Id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`Enroll_ID`,`FeeID`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`Hid`),
  ADD KEY `warden` (`WardenID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`RNum`,`H_id`),
  ADD KEY `room` (`H_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`EnrollId`),
  ADD KEY `branch` (`Branch`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ammenities`
--
ALTER TABLE `ammenities`
  ADD CONSTRAINT `supply` FOREIGN KEY (`RNum`) REFERENCES `room` (`RNum`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feed` FOREIGN KEY (`Enroll_Id`) REFERENCES `student` (`EnrollId`);

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `feerel` FOREIGN KEY (`Enroll_ID`) REFERENCES `student` (`EnrollId`);

--
-- Constraints for table `hostel`
--
ALTER TABLE `hostel`
  ADD CONSTRAINT `warden` FOREIGN KEY (`WardenID`) REFERENCES `admin` (`EmpID`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room` FOREIGN KEY (`H_id`) REFERENCES `hostel` (`Hid`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `branch` FOREIGN KEY (`Branch`) REFERENCES `department` (`DCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
