-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2026 at 06:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ridenest`
--
CREATE DATABASE IF NOT EXISTS `ridenest` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ridenest`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `ride_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seats_booked` int(11) NOT NULL DEFAULT 1,
  `booking_status` enum('pending','confirmed','cancelled','completed') DEFAULT 'pending',
  `booked_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `tip_amount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `ride_id`, `user_id`, `seats_booked`, `booking_status`, `booked_at`, `tip_amount`) VALUES
(1, 1, 2, 1, 'cancelled', '2026-09-30 14:52:04', 0.00),
(2, 1, 2, 1, 'confirmed', '2026-09-30 14:54:45', 0.00),
(3, 2, 2, 1, 'cancelled', '2026-10-01 14:21:58', 0.00),
(4, 2, 2, 1, 'cancelled', '2026-10-01 14:28:35', 0.00),
(5, 2, 2, 1, 'cancelled', '2026-10-01 14:28:56', 0.00),
(6, 2, 2, 1, 'cancelled', '2026-10-01 14:34:34', 0.00),
(7, 3, 2, 1, 'cancelled', '2026-10-01 14:57:21', 0.00),
(8, 3, 2, 1, 'confirmed', '2026-10-01 19:37:47', 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `driver_details`
--

CREATE TABLE `driver_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `license_number` varchar(100) DEFAULT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `vehicle_model` varchar(100) DEFAULT NULL,
  `vehicle_number` varchar(50) DEFAULT NULL,
  `vehicle_color` varchar(50) DEFAULT NULL,
  `seats` int(11) DEFAULT 4,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver_details`
--

INSERT INTO `driver_details` (`id`, `user_id`, `license_number`, `vehicle_type`, `vehicle_model`, `vehicle_number`, `vehicle_color`, `seats`, `created_at`) VALUES
(1, 3, '12364563', 'Car', 'Axio', '1246', NULL, 4, '2026-09-30 14:20:55');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `message`, `sent_at`, `is_read`) VALUES
(1, 2, 3, 'Hello', '2026-10-01 14:32:22', 0),
(2, 2, 3, 'sasa', '2026-10-01 14:58:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rides`
--

CREATE TABLE `rides` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `from_location` varchar(255) NOT NULL,
  `to_location` varchar(255) NOT NULL,
  `pickup_checkpoint` varchar(255) DEFAULT NULL,
  `drop_checkpoint` varchar(255) DEFAULT NULL,
  `ride_date` date NOT NULL,
  `ride_time` time NOT NULL,
  `available_seats` int(11) NOT NULL,
  `price_per_seat` decimal(10,2) DEFAULT 0.00,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `female_only` tinyint(1) DEFAULT 0,
  `recurring` tinyint(1) DEFAULT 0,
  `status` enum('available','full','completed','cancelled') DEFAULT 'available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rides`
--

INSERT INTO `rides` (`id`, `driver_id`, `from_location`, `to_location`, `pickup_checkpoint`, `drop_checkpoint`, `ride_date`, `ride_time`, `available_seats`, `price_per_seat`, `vehicle_type`, `female_only`, `recurring`, `status`, `created_at`) VALUES
(1, 3, 'Dhanmondi', 'UIU', 'brac', 'Unite International University', '2026-10-01', '08:24:00', 3, 0.00, 'Car', 1, 0, 'available', '2026-09-30 14:28:30'),
(2, 3, 'Dhanmondi 27', 'Uiu', 'United International University', 'Berait', '2026-10-16', '09:38:00', 2, 123.00, 'Car', 0, 0, 'cancelled', '2026-09-30 15:42:11'),
(3, 3, 'Dhanmondi', 'UIU', 'United International University', 'Berait', '2026-10-02', '09:30:00', 2, 150.00, 'Car', 1, 1, 'available', '2026-10-01 14:49:44'),
(4, 3, 'Dhanmondi', 'brac', 'United International University', 'Berait', '2026-10-10', '12:50:00', 4, 199.98, 'Car', 0, 0, 'available', '2026-10-01 18:50:58'),
(5, 3, 'Dhanmondi', 'UIU', 'United International University', 'Berait', '2026-10-03', '09:31:00', 2, 150.00, 'Car', 1, 1, 'cancelled', '2026-10-01 19:10:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `university_email` varchar(150) DEFAULT NULL,
  `gender` enum('male','female') NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `department`, `phone`, `email`, `password`, `student_id`, `university_email`, `gender`, `role`, `created_at`) VALUES
(2, 'Shakibul Hasan Prince', 'CSE', '01243698552', 'shakibprince25@gmail.com', '$2y$10$79i5tv7qyAlNvPVAA7MZn.Uk.f.lFw8NfzqE0DK1YPp4NElZx0bi.', '0112442', NULL, 'female', 'user', '2026-09-29 14:54:37'),
(3, 'Shakibul Hasan Prince', NULL, '013062222.', 'shakibprince@gmail.com', '$2y$10$FKTR8sScD3mr3qINwVLxGe9RfnaDI8wfirvskn9ahsLHth7CXWE0C', NULL, NULL, 'male', 'driver', '2026-09-30 14:20:55'),
(4, 'Shakibul', 'CSE', '012436985', 'shakibprince2@gmail.com', '$2y$10$I6l94BuBaWESnDBAoFhXsOpMAU/D1W4tjvJFBpilx73s1X7mzR1mK', '123456', NULL, 'male', 'user', '2026-10-01 17:32:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_id` (`ride_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `driver_details`
--
ALTER TABLE `driver_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `rides`
--
ALTER TABLE `rides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `driver_details`
--
ALTER TABLE `driver_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rides`
--
ALTER TABLE `rides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`ride_id`) REFERENCES `rides` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_details`
--
ALTER TABLE `driver_details`
  ADD CONSTRAINT `driver_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rides`
--
ALTER TABLE `rides`
  ADD CONSTRAINT `rides_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
