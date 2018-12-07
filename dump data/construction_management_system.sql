-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 07, 2018 at 01:55 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `construction_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `physicalAddress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Address`
--

INSERT INTO `Address` (`id`, `email`, `phoneNumber`, `physicalAddress`) VALUES
(1, 'jsphmuthui@gmail.com', '0725330643', 'Mayfair Casino'),
(2, 'jsphmuthui@gmail.com', '0725330643', 'Mayfair Casino'),
(3, 'jsphmuthui@gmail.com', '0725330643', 'Mayfair Casino'),
(4, 'jsphmuthui@gmail.com', '0725330643', 'Mayfair Casino'),
(5, 'jsphmuthui@gmail.com', '0725330643', 'Mayfair Casino');

-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE `Client` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Client`
--

INSERT INTO `Client` (`id`, `code`, `deleted`, `name`, `address_id`) VALUES
(1, 'CI/256/2018', b'0', 'Musili', 1),
(2, 'CI/757/2018', b'0', 'Musili', 2),
(3, 'CI/274/2018', b'0', 'Musili', 3),
(4, 'CI/969/2018', b'0', 'Musili', 4),
(5, 'CI/703/2018', b'0', 'Musili', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`id`, `deleted`, `name`, `phoneNumber`, `client_id`, `project_id`) VALUES
(1, b'0', 'vincest kiprono', '0725330643', 5, 1),
(2, b'0', 'Edwin Wanyoike', '0725330643', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Milestone`
--

CREATE TABLE `Milestone` (
  `id` bigint(20) NOT NULL,
  `actualDuration` bigint(20) NOT NULL,
  `actualEndDate` datetime DEFAULT NULL,
  `actualStartDate` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `expectedDuration` bigint(20) NOT NULL,
  `expectedEndDate` datetime DEFAULT NULL,
  `expectedStartDate` datetime DEFAULT NULL,
  `milestoneCode` varchar(255) DEFAULT NULL,
  `milestoneDescription` varchar(255) DEFAULT NULL,
  `milestoneName` varchar(255) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Milestone`
--

INSERT INTO `Milestone` (`id`, `actualDuration`, `actualEndDate`, `actualStartDate`, `deleted`, `expectedDuration`, `expectedEndDate`, `expectedStartDate`, `milestoneCode`, `milestoneDescription`, `milestoneName`, `project_id`) VALUES
(1, 0, NULL, NULL, b'0', 1, '2018-11-29 00:00:00', '2018-11-28 00:00:00', NULL, 'beginnin the foundation', 'foundation', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Project`
--

CREATE TABLE `Project` (
  `id` bigint(20) NOT NULL,
  `actualDuration` bigint(20) NOT NULL,
  `actualEndDate` datetime DEFAULT NULL,
  `actualStartDate` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `expectedDuration` bigint(20) NOT NULL,
  `expectedEndDate` datetime DEFAULT NULL,
  `expectedStartDate` datetime DEFAULT NULL,
  `projectCity` varchar(255) DEFAULT NULL,
  `projectCountry` varchar(255) DEFAULT NULL,
  `projectDescription` varchar(255) DEFAULT NULL,
  `projectLocation` varchar(255) DEFAULT NULL,
  `projectName` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Project`
--

INSERT INTO `Project` (`id`, `actualDuration`, `actualEndDate`, `actualStartDate`, `deleted`, `expectedDuration`, `expectedEndDate`, `expectedStartDate`, `projectCity`, `projectCountry`, `projectDescription`, `projectLocation`, `projectName`, `client_id`) VALUES
(1, 0, NULL, NULL, b'0', 3, '2018-11-30 00:00:00', '2018-11-27 00:00:00', 'City1', 'Country1', 'commercial bulding', 'location10', 'Mayfair Casino', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

CREATE TABLE `Role` (
  `id` bigint(20) NOT NULL,
  `accessLevel` varchar(255) DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Role`
--

INSERT INTO `Role` (`id`, `accessLevel`, `deleted`, `role`, `client_id`) VALUES
(1, 'CLIENT', b'0', 'Admin', 1),
(2, 'CLIENT', b'0', 'Supervisor', 5),
(3, 'CLIENT', b'0', 'Foreman', 5),
(4, 'MANAGEMENT', b'0', 'Achitech', 5),
(5, 'SPECIALIST', b'0', 'Technician', 5),
(6, 'CASUAL', b'0', 'werty', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Service`
--

CREATE TABLE `Service` (
  `id` bigint(20) NOT NULL,
  `serviceCostPerUnit` float NOT NULL,
  `serviceDescription` varchar(255) DEFAULT NULL,
  `serviceName` varchar(255) DEFAULT NULL,
  `serviceUnits` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Task`
--

CREATE TABLE `Task` (
  `id` bigint(20) NOT NULL,
  `actualDuration` bigint(20) NOT NULL,
  `actualEndDate` datetime DEFAULT NULL,
  `actualStartDate` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `expectedDuration` bigint(20) NOT NULL,
  `expectedEndDate` datetime DEFAULT NULL,
  `expectedStartDate` datetime DEFAULT NULL,
  `taskCode` varchar(255) DEFAULT NULL,
  `taskDescription` varchar(255) DEFAULT NULL,
  `taskName` varchar(255) DEFAULT NULL,
  `milestone_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Task`
--

INSERT INTO `Task` (`id`, `actualDuration`, `actualEndDate`, `actualStartDate`, `deleted`, `expectedDuration`, `expectedEndDate`, `expectedStartDate`, `taskCode`, `taskDescription`, `taskName`, `milestone_id`) VALUES
(1, 0, NULL, NULL, b'0', 0, '2018-12-08 00:00:00', '2018-12-08 00:00:00', NULL, 'fetching sand for the foundation', 'fetching sand', 1);

-- --------------------------------------------------------

--
-- Table structure for table `TaskAssignment`
--

CREATE TABLE `TaskAssignment` (
  `id` bigint(20) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`id`, `deleted`, `password`, `username`, `client_id`, `employee_id`, `role_id`) VALUES
(3, b'0', '12', '@kaka_musili', 5, NULL, 1),
(4, b'0', 'vinny', 'vinny', NULL, 1, 3),
(5, b'0', 'edu', 'edu', NULL, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `WorkDone`
--

CREATE TABLE `WorkDone` (
  `id` bigint(20) NOT NULL,
  `work` decimal(19,2) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKl63rkjkd4rggxh14d9ydtei43` (`address_id`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbx2m5amrbnt5gplbfxr8ct4d9` (`client_id`),
  ADD KEY `FK3t65hpb474nlc82c8m8oqpq74` (`project_id`);

--
-- Indexes for table `Milestone`
--
ALTER TABLE `Milestone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4y2imlhl4and4511uh6lhnaiy` (`project_id`);

--
-- Indexes for table `Project`
--
ALTER TABLE `Project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfx7y3n5xaohuopukj6rw1tl9p` (`client_id`);

--
-- Indexes for table `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpb0frwcpd2mv24t7gaxlrx9kg` (`client_id`);

--
-- Indexes for table `Service`
--
ALTER TABLE `Service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Task`
--
ALTER TABLE `Task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjl7lj35hlsnb3n8x2kyk9w5lx` (`milestone_id`);

--
-- Indexes for table `TaskAssignment`
--
ALTER TABLE `TaskAssignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg2yfvmam7w5dldmr4sq0lvx1n` (`employee_id`),
  ADD KEY `FKpare127jpwkfqq9jf067b88kn` (`task_id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg6fkdsy9jj4334crqqu3m5hdt` (`client_id`),
  ADD KEY `FK1yao5y1albiyi7r6ktr0wkx47` (`employee_id`),
  ADD KEY `FK84qlpfci484r1luck11eno6ec` (`role_id`);

--
-- Indexes for table `WorkDone`
--
ALTER TABLE `WorkDone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjjd1puexdgebf1qyxllk3as00` (`employee_id`),
  ADD KEY `FKharn0qac3soxurtifhvqet0yg` (`task_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Address`
--
ALTER TABLE `Address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Client`
--
ALTER TABLE `Client`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Milestone`
--
ALTER TABLE `Milestone`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Project`
--
ALTER TABLE `Project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Role`
--
ALTER TABLE `Role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Service`
--
ALTER TABLE `Service`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Task`
--
ALTER TABLE `Task`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `TaskAssignment`
--
ALTER TABLE `TaskAssignment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `WorkDone`
--
ALTER TABLE `WorkDone`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Client`
--
ALTER TABLE `Client`
  ADD CONSTRAINT `FKl63rkjkd4rggxh14d9ydtei43` FOREIGN KEY (`address_id`) REFERENCES `Address` (`id`);

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `FK3t65hpb474nlc82c8m8oqpq74` FOREIGN KEY (`project_id`) REFERENCES `Project` (`id`),
  ADD CONSTRAINT `FKbx2m5amrbnt5gplbfxr8ct4d9` FOREIGN KEY (`client_id`) REFERENCES `Client` (`id`);

--
-- Constraints for table `Milestone`
--
ALTER TABLE `Milestone`
  ADD CONSTRAINT `FK4y2imlhl4and4511uh6lhnaiy` FOREIGN KEY (`project_id`) REFERENCES `Project` (`id`);

--
-- Constraints for table `Project`
--
ALTER TABLE `Project`
  ADD CONSTRAINT `FKfx7y3n5xaohuopukj6rw1tl9p` FOREIGN KEY (`client_id`) REFERENCES `Client` (`id`);

--
-- Constraints for table `Role`
--
ALTER TABLE `Role`
  ADD CONSTRAINT `FKpb0frwcpd2mv24t7gaxlrx9kg` FOREIGN KEY (`client_id`) REFERENCES `Client` (`id`);

--
-- Constraints for table `Task`
--
ALTER TABLE `Task`
  ADD CONSTRAINT `FKjl7lj35hlsnb3n8x2kyk9w5lx` FOREIGN KEY (`milestone_id`) REFERENCES `Milestone` (`id`);

--
-- Constraints for table `TaskAssignment`
--
ALTER TABLE `TaskAssignment`
  ADD CONSTRAINT `FKg2yfvmam7w5dldmr4sq0lvx1n` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`id`),
  ADD CONSTRAINT `FKpare127jpwkfqq9jf067b88kn` FOREIGN KEY (`task_id`) REFERENCES `Task` (`id`);

--
-- Constraints for table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `FK1yao5y1albiyi7r6ktr0wkx47` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`id`),
  ADD CONSTRAINT `FK84qlpfci484r1luck11eno6ec` FOREIGN KEY (`role_id`) REFERENCES `Role` (`id`),
  ADD CONSTRAINT `FKg6fkdsy9jj4334crqqu3m5hdt` FOREIGN KEY (`client_id`) REFERENCES `Client` (`id`);

--
-- Constraints for table `WorkDone`
--
ALTER TABLE `WorkDone`
  ADD CONSTRAINT `FKharn0qac3soxurtifhvqet0yg` FOREIGN KEY (`task_id`) REFERENCES `Task` (`id`),
  ADD CONSTRAINT `FKjjd1puexdgebf1qyxllk3as00` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
