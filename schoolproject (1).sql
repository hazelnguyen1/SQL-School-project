-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 19, 2021 at 12:55 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schoolproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `BLDG_CODE` varchar(3) NOT NULL,
  `BLDG_NAME` varchar(15) NOT NULL,
  `BLDG_LOCATION` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `CLASS_CODE` decimal(10,0) NOT NULL,
  `CLASS_SECTION` decimal(10,0) DEFAULT NULL,
  `CLASS_TIME` time DEFAULT NULL,
  `CRS_CODE` decimal(10,0) DEFAULT NULL,
  `PROF_NUM` decimal(10,0) DEFAULT NULL,
  `room_code` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clubs`
--

CREATE TABLE `clubs` (
  `CLUB_ID` char(8) NOT NULL,
  `ROOM_CODE` varchar(3) NOT NULL,
  `CLUB_NAME` varchar(35) NOT NULL,
  `CLUB_PRESIDENT` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CRS_CODE` decimal(10,0) NOT NULL,
  `DEPT_CODE` varchar(5) NOT NULL,
  `CRS_TITLE` text NOT NULL,
  `CRS_DESCRIPTION` text NOT NULL,
  `CRS_CREDIT` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DEPT_CODE` decimal(10,0) NOT NULL,
  `DEPT_NAME` text NOT NULL,
  `SCHOOL_CODE` decimal(10,0) DEFAULT NULL,
  `PROF_NUM` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `CLASS_CODE` decimal(10,0) NOT NULL,
  `ENROLL_DATE` date NOT NULL,
  `ENROLL_GRADE` varchar(9) DEFAULT NULL,
  `stu_num` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `housing`
--

CREATE TABLE `housing` (
  `DORM_NAME` varchar(10) NOT NULL,
  `MAXIMUM_OCCUPANTS` decimal(10,0) NOT NULL,
  `DORM_ADDRESS` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `PROF_NUM` decimal(10,0) NOT NULL,
  `DEPT_CODE` decimal(10,0) DEFAULT NULL,
  `PROF_SPECIALTY` varchar(15) DEFAULT NULL,
  `PROF_RANK` decimal(10,0) DEFAULT NULL,
  `PROF_LNAME` varchar(15) DEFAULT NULL,
  `PROF_FNAME` varchar(15) DEFAULT NULL,
  `PROF_INITIAL` varchar(3) DEFAULT NULL,
  `PROF_EMAIL` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `ROOM_CODE` varchar(3) NOT NULL,
  `ROOM_TYPE` text,
  `BLDG_CODE` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roster`
--

CREATE TABLE `roster` (
  `STU_NUM` decimal(10,0) NOT NULL,
  `RENEWAL_DATE` date NOT NULL,
  `club_id` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `SCHOOL_CODE` decimal(10,0) NOT NULL,
  `SCHOOL_NAME` varchar(15) NOT NULL,
  `PROF_NUM` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `STU_NUM` varchar(10) NOT NULL,
  `STU_LNAME` varchar(15) DEFAULT NULL,
  `STU_FNAME` varchar(15) DEFAULT NULL,
  `STU_INITIAL` varchar(3) DEFAULT NULL,
  `STU_EMAIL` varchar(30) DEFAULT NULL,
  `DEPT_CODE` decimal(10,0) NOT NULL,
  `PROF_NUM` decimal(10,0) DEFAULT NULL,
  `DORM_NAME` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`BLDG_CODE`),
  ADD UNIQUE KEY `BLDG_CODE` (`BLDG_CODE`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`CLASS_CODE`),
  ADD UNIQUE KEY `CLASS_CODE` (`CLASS_CODE`),
  ADD KEY `CRS_CODE` (`CRS_CODE`),
  ADD KEY `PROF_NUM` (`PROF_NUM`),
  ADD KEY `room_code` (`room_code`);

--
-- Indexes for table `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`CLUB_ID`),
  ADD UNIQUE KEY `CLUB_ID` (`CLUB_ID`),
  ADD KEY `ROOM_CODE` (`ROOM_CODE`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CRS_CODE`),
  ADD UNIQUE KEY `CRS_CODE` (`CRS_CODE`),
  ADD UNIQUE KEY `DEPT_CODE` (`DEPT_CODE`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DEPT_CODE`),
  ADD UNIQUE KEY `DEPT_CODE` (`DEPT_CODE`),
  ADD KEY `SCHOOL_CODE` (`SCHOOL_CODE`),
  ADD KEY `PROF_NUM` (`PROF_NUM`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`stu_num`,`CLASS_CODE`),
  ADD UNIQUE KEY `CLASS_CODE` (`CLASS_CODE`);

--
-- Indexes for table `housing`
--
ALTER TABLE `housing`
  ADD PRIMARY KEY (`DORM_NAME`),
  ADD UNIQUE KEY `DORM_NAME` (`DORM_NAME`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`PROF_NUM`),
  ADD UNIQUE KEY `PROF_NUM` (`PROF_NUM`),
  ADD KEY `professor_ibfk_1` (`DEPT_CODE`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`ROOM_CODE`),
  ADD UNIQUE KEY `ROOM_CODE` (`ROOM_CODE`),
  ADD KEY `BLDG_CODE` (`BLDG_CODE`);

--
-- Indexes for table `roster`
--
ALTER TABLE `roster`
  ADD PRIMARY KEY (`STU_NUM`,`club_id`),
  ADD UNIQUE KEY `STU_NUM` (`STU_NUM`),
  ADD KEY `club_id` (`club_id`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`SCHOOL_CODE`),
  ADD UNIQUE KEY `SCHOOL_CODE` (`SCHOOL_CODE`),
  ADD KEY `PROF_NUM` (`PROF_NUM`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`STU_NUM`),
  ADD UNIQUE KEY `STU_NUM` (`STU_NUM`),
  ADD KEY `DORM_NAME` (`DORM_NAME`),
  ADD KEY `DEPT_CODE` (`DEPT_CODE`),
  ADD KEY `PROF_NUM` (`PROF_NUM`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`CRS_CODE`) REFERENCES `course` (`CRS_CODE`) ON UPDATE CASCADE,
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`PROF_NUM`) REFERENCES `professor` (`PROF_NUM`) ON UPDATE CASCADE,
  ADD CONSTRAINT `class_ibfk_3` FOREIGN KEY (`room_code`) REFERENCES `room` (`ROOM_CODE`) ON UPDATE CASCADE;

--
-- Constraints for table `clubs`
--
ALTER TABLE `clubs`
  ADD CONSTRAINT `clubs_ibfk_1` FOREIGN KEY (`ROOM_CODE`) REFERENCES `room` (`ROOM_CODE`) ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`SCHOOL_CODE`) REFERENCES `school` (`SCHOOL_CODE`) ON UPDATE CASCADE,
  ADD CONSTRAINT `department_ibfk_2` FOREIGN KEY (`PROF_NUM`) REFERENCES `professor` (`PROF_NUM`) ON UPDATE CASCADE;

--
-- Constraints for table `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `enroll_ibfk_1` FOREIGN KEY (`CLASS_CODE`) REFERENCES `class` (`CLASS_CODE`) ON UPDATE CASCADE,
  ADD CONSTRAINT `enroll_ibfk_2` FOREIGN KEY (`stu_num`) REFERENCES `student` (`STU_NUM`) ON UPDATE CASCADE;

--
-- Constraints for table `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`DEPT_CODE`) REFERENCES `department` (`DEPT_CODE`) ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`BLDG_CODE`) REFERENCES `building` (`BLDG_CODE`) ON UPDATE CASCADE;

--
-- Constraints for table `roster`
--
ALTER TABLE `roster`
  ADD CONSTRAINT `roster_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`CLUB_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `school`
--
ALTER TABLE `school`
  ADD CONSTRAINT `school_ibfk_1` FOREIGN KEY (`PROF_NUM`) REFERENCES `professor` (`PROF_NUM`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`DORM_NAME`) REFERENCES `housing` (`DORM_NAME`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`DEPT_CODE`) REFERENCES `department` (`DEPT_CODE`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`PROF_NUM`) REFERENCES `professor` (`PROF_NUM`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
