-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2024 at 01:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `examination_rectifier`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentID`, `DepartmentName`) VALUES
(1, 'Computer Science'),
(2, 'Electronics Department'),
(3, 'Mechanical Department');

-- --------------------------------------------------------

--
-- Table structure for table `examination`
--

CREATE TABLE `examination` (
  `ExamID` int(11) NOT NULL,
  `ExamName` varchar(100) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  `TeacherID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `examination`
--

INSERT INTO `examination` (`ExamID`, `ExamName`, `Date`, `DepartmentID`, `TeacherID`) VALUES
(1, 'Midterm Exam', '2024-02-15', 1, 201),
(2, 'Math Quiz', '2024-03-05', 2, 202),
(3, 'Physics Lab Final', '2024-04-20', 3, 203);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FeedbackID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `TeacherID` int(11) DEFAULT NULL,
  `FeedbackText` text DEFAULT NULL,
  `FeedbackDate` datetime DEFAULT NULL,
  `ExamID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FeedbackID`, `StudentID`, `TeacherID`, `FeedbackText`, `FeedbackDate`, `ExamID`) VALUES
(1, 101, 201, 'Well done on the midterm!', '2024-02-16 10:00:00', 1),
(2, 102, 202, 'Good effort on the math quiz.', '2024-03-06 11:30:00', 2),
(3, 103, 203, 'Excellent work on the physics lab final.', '2024-04-21 15:30:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `ModuleID` int(11) NOT NULL,
  `ModuleName` varchar(50) NOT NULL,
  `DepartmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`ModuleID`, `ModuleName`, `DepartmentID`) VALUES
(1, 'Mathematics', 1),
(2, 'Computer Science', 2),
(3, 'Physics', 1),
(4, 'History', 3);

-- --------------------------------------------------------

--
-- Table structure for table `problemsubmissions`
--

CREATE TABLE `problemsubmissions` (
  `SubmissionID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `ProblemDescription` text DEFAULT NULL,
  `SubmissionDate` datetime DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `ExamID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `problemsubmissions`
--

INSERT INTO `problemsubmissions` (`SubmissionID`, `StudentID`, `ProblemDescription`, `SubmissionDate`, `Status`, `ExamID`) VALUES
(1, NULL, 'test', '2024-02-04 07:28:02', 'Pending', NULL),
(4, NULL, 'gdn', '2024-02-05 11:40:45', NULL, NULL),
(5, NULL, 'gdn', '2024-02-05 11:55:09', NULL, NULL),
(6, NULL, 'gdn', '2024-02-05 11:59:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `FirstName`, `LastName`, `DateOfBirth`, `Email`, `DepartmentID`) VALUES
(101, 'John', 'Doe', '1990-05-15', 'john.doe@example.com', 1),
(102, 'Jane', 'Smith', '1992-08-22', 'jane.smith@example.com', 2),
(103, 'Bob', 'Johnson', '1991-03-10', 'bob.johnson@example.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `TeacherID` int(11) NOT NULL,
  `TeacherName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`TeacherID`, `TeacherName`, `Email`, `DepartmentID`) VALUES
(201, 'Smith', 'prof.smith@example.com', 1),
(202, 'Johnson', 'dr.johnson@example.com', 2),
(203, 'Brown', 'mrs.brown@example.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `UserRole` varchar(20) DEFAULT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `TeacherID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `UserRole`, `StudentID`, `TeacherID`) VALUES
(301, 'student1', '12345', 'Student', 101, NULL),
(302, 'teacher1', '123123', 'Teacher', NULL, 201);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentID`),
  ADD UNIQUE KEY `DepartmentName` (`DepartmentName`);

--
-- Indexes for table `examination`
--
ALTER TABLE `examination`
  ADD PRIMARY KEY (`ExamID`),
  ADD KEY `DepartmentID` (`DepartmentID`),
  ADD KEY `TeacherID` (`TeacherID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FeedbackID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `TeacherID` (`TeacherID`),
  ADD KEY `ExamID` (`ExamID`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`ModuleID`),
  ADD KEY `fk_modules_department` (`DepartmentID`);

--
-- Indexes for table `problemsubmissions`
--
ALTER TABLE `problemsubmissions`
  ADD PRIMARY KEY (`SubmissionID`),
  ADD UNIQUE KEY `SubmissionID_2` (`SubmissionID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `ExamID` (`ExamID`),
  ADD KEY `SubmissionID` (`SubmissionID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`TeacherID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `TeacherID` (`TeacherID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `problemsubmissions`
--
ALTER TABLE `problemsubmissions`
  MODIFY `SubmissionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `examination`
--
ALTER TABLE `examination`
  ADD CONSTRAINT `examination_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`),
  ADD CONSTRAINT `examination_ibfk_2` FOREIGN KEY (`TeacherID`) REFERENCES `teachers` (`TeacherID`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`TeacherID`) REFERENCES `teachers` (`TeacherID`),
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`ExamID`) REFERENCES `examination` (`ExamID`);

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `fk_modules_department` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`);

--
-- Constraints for table `problemsubmissions`
--
ALTER TABLE `problemsubmissions`
  ADD CONSTRAINT `problemsubmissions_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  ADD CONSTRAINT `problemsubmissions_ibfk_2` FOREIGN KEY (`ExamID`) REFERENCES `examination` (`ExamID`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`TeacherID`) REFERENCES `teachers` (`TeacherID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
