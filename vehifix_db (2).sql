-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2022 at 03:10 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vehifix_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers_tbl`
--

CREATE TABLE `customers_tbl` (
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact_num` varchar(20) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_status` varchar(100) NOT NULL,
  `load_balance` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers_tbl`
--

INSERT INTO `customers_tbl` (`name`, `email`, `contact_num`, `user_name`, `user_status`, `load_balance`) VALUES
('Algen T. Caburnay', 'algen@email.com', '12345678901', 'algen', 'OFFLINE', '0');

-- --------------------------------------------------------

--
-- Table structure for table `offered_serv_tbl`
--

CREATE TABLE `offered_serv_tbl` (
  `offered_serv_id` int(11) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `service_name` varchar(250) NOT NULL,
  `vehicle_name` varchar(250) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offered_serv_tbl`
--

INSERT INTO `offered_serv_tbl` (`offered_serv_id`, `user_name`, `service_name`, `vehicle_name`, `price`) VALUES
(1, 'rappaller', 'Vulcanize', 'Honda Beat', 150),
(2, 'rappaller', 'Crude Oil Change', 'Honda Beat', 200),
(3, 'rapaller', 'Vulcanize', 'Suzuki Mio', 150),
(4, 'cvdave', 'Crude Oil Change', 'Suzuki Raider', 200),
(5, 'cvdave', 'Crude Oil Change', 'Bao Bao', 205),
(6, 'rappaller', 'Crude Oil Change', 'Suzuki Raider', 210);

-- --------------------------------------------------------

--
-- Table structure for table `requests_tbl`
--

CREATE TABLE `requests_tbl` (
  `request_id` int(11) NOT NULL,
  `user_name_customer` varchar(250) NOT NULL,
  `user_name_sp` varchar(250) NOT NULL,
  `timestamp_booking` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `request` varchar(250) NOT NULL,
  `customer_location` varchar(250) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date_appointment` varchar(250) NOT NULL,
  `cust_contact_email` varchar(200) NOT NULL,
  `cust_contact_num` varchar(20) NOT NULL,
  `customer_name` varchar(200) NOT NULL,
  `request_status` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `selectable_place`
--

CREATE TABLE `selectable_place` (
  `place_id` int(11) NOT NULL,
  `place` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `selectable_place`
--

INSERT INTO `selectable_place` (`place_id`, `place`) VALUES
(1, 'Pagadian City, Santa Maria'),
(2, 'Pagadian City, Santo Nino'),
(3, 'Pagadian City, San Pedro'),
(4, 'Pagadian City, San Pablo');

-- --------------------------------------------------------

--
-- Table structure for table `selectable_services`
--

CREATE TABLE `selectable_services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(240) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `selectable_services`
--

INSERT INTO `selectable_services` (`service_id`, `service_name`) VALUES
(1, 'Vulcanize'),
(2, 'Crude Oil Change'),
(3, 'Tow'),
(4, 'Synthetic Oil Change'),
(5, 'Brake Pad and Rotor Replacement - Front'),
(6, 'Brake Pads - Replace Rear'),
(7, 'Fuel Refill'),
(8, 'Air Tyres Refill'),
(9, 'Transmission Flush');

-- --------------------------------------------------------

--
-- Table structure for table `selectable_vehicles`
--

CREATE TABLE `selectable_vehicles` (
  `vehicle_id` int(11) NOT NULL,
  `vehicle_name` varchar(240) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `selectable_vehicles`
--

INSERT INTO `selectable_vehicles` (`vehicle_id`, `vehicle_name`) VALUES
(1, 'Honda Beat'),
(2, 'Suzuki Raider'),
(3, 'Suzuki Mio'),
(4, 'Bao Bao');

-- --------------------------------------------------------

--
-- Table structure for table `serviceable_location_tbl`
--

CREATE TABLE `serviceable_location_tbl` (
  `serviceable_loc_id` int(11) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `place` varchar(250) NOT NULL,
  `charge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `serviceable_location_tbl`
--

INSERT INTO `serviceable_location_tbl` (`serviceable_loc_id`, `user_name`, `place`, `charge`) VALUES
(1, 'rappaller', 'Pagadian City, Santa Maria', 20),
(2, 'rappaller', 'Pagadian City, Santo Nino', 20),
(3, 'cvdave', 'Pagadian City, San Pablo', 25),
(5, 'cvdave', 'Pagadian City, San Pedro', 25),
(6, 'cvdave', 'Pagadian City, Santa Maria', 30);

-- --------------------------------------------------------

--
-- Table structure for table `service_providers_schedule`
--

CREATE TABLE `service_providers_schedule` (
  `schedule_id` int(11) NOT NULL,
  `sp_user_name` varchar(250) NOT NULL,
  `day` varchar(100) NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service_providers_tbl`
--

CREATE TABLE `service_providers_tbl` (
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact_num` varchar(12) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_status` varchar(20) NOT NULL,
  `load_balance` varchar(7) NOT NULL,
  `current_estimated_earnings` varchar(7) NOT NULL,
  `owner_name` varchar(250) NOT NULL,
  `shop_name` varchar(250) NOT NULL,
  `location` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_providers_tbl`
--

INSERT INTO `service_providers_tbl` (`name`, `email`, `contact_num`, `user_name`, `user_status`, `load_balance`, `current_estimated_earnings`, `owner_name`, `shop_name`, `location`) VALUES
('Christian Dave Villanueva', 'cvdave@email.com', '12345678901', 'cvdave', 'OFFLINE', '0', '0', '', 'CD Moto Shop', 'Pagadian City'),
('Rosales Paller', 'rappaller@email.com', '12345678901', 'rappaller', 'OFFLINE', '0', '0', '', 'Rosales\' Moto Shop', 'Pagadian City');

-- --------------------------------------------------------

--
-- Table structure for table `users_tbl`
--

CREATE TABLE `users_tbl` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact_num` varchar(12) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `user_status` varchar(20) NOT NULL,
  `load_balance` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_tbl`
--

INSERT INTO `users_tbl` (`user_id`, `name`, `email`, `contact_num`, `user_type`, `user_name`, `password`, `user_status`, `load_balance`) VALUES
(1, 'Christian Dave Villanueva', 'cvdave@email.com', '12345678901', 'Service Provider', 'cvdave', '$2y$10$nc6OZeTVOq3LOWqUA8BfjOqcDUq3Siox8lwnsUkvAPU/NlDA85emK', 'OFFLINE', '0'),
(2, 'Rosales Paller', 'rappaller@email.com', '12345678901', 'Service Provider', 'rappaller', '$2y$10$Fx2BrxomVlWkdVxoj9Nnu.0845s1C/xkGJJPCBCfzHXdmvSRW6gTu', 'OFFLINE', '0'),
(3, 'Algen T. Caburnay', 'algen@email.com', '12345678901', 'Customer', 'algen', '$2y$10$KSxl0MNm9hel7o/nHTZgDe.tTsKV2y3CtQMtbVoHEHiwgoyiFxoT6', 'OFFLINE', '0');

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE `user_tbl` (
  `user_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(250) NOT NULL,
  `contact_num` varchar(20) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_type` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `user_status` varchar(100) NOT NULL,
  `load_balance` int(50) NOT NULL,
  `current_estimated_earnings` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers_tbl`
--
ALTER TABLE `customers_tbl`
  ADD PRIMARY KEY (`user_name`);

--
-- Indexes for table `offered_serv_tbl`
--
ALTER TABLE `offered_serv_tbl`
  ADD PRIMARY KEY (`offered_serv_id`);

--
-- Indexes for table `requests_tbl`
--
ALTER TABLE `requests_tbl`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `selectable_place`
--
ALTER TABLE `selectable_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `selectable_services`
--
ALTER TABLE `selectable_services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `selectable_vehicles`
--
ALTER TABLE `selectable_vehicles`
  ADD PRIMARY KEY (`vehicle_id`);

--
-- Indexes for table `serviceable_location_tbl`
--
ALTER TABLE `serviceable_location_tbl`
  ADD PRIMARY KEY (`serviceable_loc_id`);

--
-- Indexes for table `service_providers_schedule`
--
ALTER TABLE `service_providers_schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `service_providers_tbl`
--
ALTER TABLE `service_providers_tbl`
  ADD PRIMARY KEY (`user_name`);

--
-- Indexes for table `users_tbl`
--
ALTER TABLE `users_tbl`
  ADD PRIMARY KEY (`user_id`,`user_name`);

--
-- Indexes for table `user_tbl`
--
ALTER TABLE `user_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `offered_serv_tbl`
--
ALTER TABLE `offered_serv_tbl`
  MODIFY `offered_serv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `requests_tbl`
--
ALTER TABLE `requests_tbl`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selectable_place`
--
ALTER TABLE `selectable_place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `selectable_services`
--
ALTER TABLE `selectable_services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `selectable_vehicles`
--
ALTER TABLE `selectable_vehicles`
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `serviceable_location_tbl`
--
ALTER TABLE `serviceable_location_tbl`
  MODIFY `serviceable_loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_providers_schedule`
--
ALTER TABLE `service_providers_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_tbl`
--
ALTER TABLE `users_tbl`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_tbl`
--
ALTER TABLE `user_tbl`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
