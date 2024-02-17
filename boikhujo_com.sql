-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2022 at 06:35 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boikhujo.com`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `district_id` int(11) NOT NULL,
  `division_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `name`, `details`, `created`) VALUES
(1, 'Humayun Ahmed', 'Humayun Ahmed (13 November 1948 – 19 July 2012) was a Bangladeshi novelist, dramatist, screenwriter, filmmaker, songwriter, scholar, and professor. His breakthrough was his debut novel Nondito Noroke published in 1972.  He wrote over 200 fiction and non-fiction books, many of which were bestsellers in Bangladesh. His books were the top sellers at the Ekushey Book Fair during the 1990s and 2000s. He won the Bangla Academy Literary Award in 1981 and the Ekushey Padak in 1994 for his contribution to Bengali literature.\nIn the early 1990s, Ahmed emerged as a filmmaker. He went on to make a total of eight films - each based on his own novels. He received six Bangladesh National Film Awards in different categories for the films Daruchini Dip, Aguner Poroshmoni and Ghetuputra Komola. He has his own production company named Nuhash Chalachitra', '2022-03-22 19:07:43');

-- --------------------------------------------------------

--
-- Table structure for table `bookposts`
--

CREATE TABLE `bookposts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `details` varchar(1024) NOT NULL,
  `price1` decimal(10,2) NOT NULL,
  `price2` decimal(10,2) NOT NULL,
  `type` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `division_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `division_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `name`, `division_id`, `created`) VALUES
(1, 'Dhaka', 1, '2022-03-23 09:15:54'),
(2, 'Gazipur', 1, '2022-03-23 09:15:54'),
(3, 'Gopalganj', 1, '2022-03-23 09:15:54'),
(4, 'Kishoreganj', 1, '2022-03-23 09:15:54'),
(5, 'Madaripur', 1, '2022-03-23 09:15:54'),
(6, 'Manikganj', 1, '2022-03-23 09:15:54'),
(7, 'Munshiganj', 1, '2022-03-23 09:15:54'),
(8, 'Narayanganj', 1, '2022-03-23 09:15:54'),
(9, 'Rajbari', 1, '2022-03-23 09:15:54'),
(10, 'Shariatpur', 1, '2022-03-23 09:15:54'),
(11, 'Faridpur', 1, '2022-03-23 09:15:54'),
(12, 'Tangail', 1, '2022-03-23 09:15:54'),
(13, 'Narsingdi', 1, '2022-03-23 09:15:54'),
(14, 'Bandarban', 2, '2022-03-23 09:15:54'),
(15, 'Brahmanbaria', 2, '2022-03-23 09:15:54'),
(16, 'Chandpur', 2, '2022-03-23 09:15:54'),
(17, 'Chittagong', 2, '2022-03-23 09:15:54'),
(18, 'Comilla', 2, '2022-03-23 09:15:54'),
(19, 'Cox\'s Bazar', 2, '2022-03-23 09:15:54'),
(20, 'Feni', 2, '2022-03-23 09:15:54'),
(21, 'Khagrachhari', 2, '2022-03-23 09:15:54'),
(22, 'Lakshmipur', 2, '2022-03-23 09:15:54'),
(23, 'Noakhali', 2, '2022-03-23 09:15:54'),
(24, 'Rangamati', 2, '2022-03-23 09:15:54'),
(25, 'Barguna', 3, '2022-03-23 09:15:54'),
(26, 'Barisal', 3, '2022-03-23 09:15:54'),
(27, 'Bhola', 3, '2022-03-23 09:15:54'),
(28, 'Jhalokati', 3, '2022-03-23 09:15:54'),
(29, 'Patuakhali', 3, '2022-03-23 09:15:54'),
(30, 'Pirojpur', 3, '2022-03-23 09:15:54'),
(31, 'Bagerhat', 4, '2022-03-23 09:15:54'),
(32, 'Chuadanga', 4, '2022-03-23 09:15:54'),
(33, 'Jessore', 4, '2022-03-23 09:15:54'),
(34, 'Jhenaidah', 4, '2022-03-23 09:15:54'),
(35, 'Khulna', 4, '2022-03-23 09:15:54'),
(36, 'Kushtia', 4, '2022-03-23 09:15:54'),
(37, 'Magura', 4, '2022-03-23 09:15:54'),
(38, 'Meherpur', 4, '2022-03-23 09:15:54'),
(39, 'Narail', 4, '2022-03-23 09:15:54'),
(40, 'Satkhira', 4, '2022-03-23 09:15:54'),
(41, 'Bogra', 5, '2022-03-23 09:15:54'),
(42, 'Joypurhat', 5, '2022-03-23 09:15:54'),
(43, 'Naogaon', 5, '2022-03-23 09:15:54'),
(44, 'Natore', 5, '2022-03-23 09:15:54'),
(45, 'Chapai Nawabganj', 5, '2022-03-23 09:15:54'),
(46, 'Pabna', 5, '2022-03-23 09:15:54'),
(47, 'Rajshahi', 5, '2022-03-23 09:15:54'),
(48, 'Sirajganj', 5, '2022-03-23 09:15:54'),
(49, 'Habiganj', 6, '2022-03-23 09:15:54'),
(50, 'Moulvibazar', 6, '2022-03-23 09:15:54'),
(51, 'Sunamganj', 6, '2022-03-23 09:15:54'),
(52, 'Sylhet', 6, '2022-03-23 09:15:54'),
(53, 'Dinajpur', 7, '2022-03-23 09:15:54'),
(54, 'Gaibandha', 7, '2022-03-23 09:15:54'),
(55, 'Kurigram', 7, '2022-03-23 09:15:54'),
(56, 'Lalmonirhat', 7, '2022-03-23 09:15:54'),
(57, 'Nilphamari', 7, '2022-03-23 09:15:54'),
(58, 'Panchagarh', 7, '2022-03-23 09:15:54'),
(59, 'Rangpur', 7, '2022-03-23 09:15:54'),
(60, 'Thakurgaon', 7, '2022-03-23 09:15:54'),
(61, 'Jamalpur', 8, '2022-03-23 09:15:54'),
(62, 'Mymensingh', 8, '2022-03-23 09:15:54'),
(63, 'Netrokona', 8, '2022-03-23 09:15:54'),
(64, 'Sherpur', 8, '2022-03-23 09:15:54');

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`id`, `name`, `created`) VALUES
(1, 'Dhaka', '2022-03-23 07:03:56'),
(2, 'Chittagong', '2022-03-23 07:03:56'),
(3, 'Barisal', '2022-03-23 07:03:56'),
(4, 'Khulna', '2022-03-23 07:03:56'),
(5, 'Rajshahi', '2022-03-23 07:03:56'),
(6, 'Sylhet', '2022-03-23 07:03:56'),
(7, 'Rangpur', '2022-03-23 07:03:56'),
(8, 'Mymensingh', '2022-03-23 07:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `bookpost_id` int(11) NOT NULL,
  `selleruser_id` int(11) NOT NULL,
  `buyeruser_id` int(11) NOT NULL,
  `messages` varchar(512) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `lat` varchar(50) NOT NULL,
  `lng` varchar(50) NOT NULL,
  `aboutme` varchar(512) NOT NULL,
  `division_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `publications`
--

CREATE TABLE `publications` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `details` varchar(512) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `mobile`, `password`, `role`, `created`) VALUES
(1, 'Syed Zayed Hossain', '01629999666', '$2y$10$tK1NGcNsfyQ1c4HYOTS4f.zI1TeYyecmMuFJ2.hAXWEpkalMJGb7.', 2, '2022-03-22 18:01:43'),
(2, 'Tamimul Islam', '01912345678', '$2y$10$gOtE4AROe3SIVQuidzqJke32e.k.9Y3.mFblFpwL5YK/1ty7MXjuC', 1, '2022-03-22 18:02:06'),
(3, 'Shariful Islam', '01712345678', '$2y$10$.GiuaJkvh3bpF07HxoTLGOJK6lL9mSboTuBtxY9.aNotfGuwctc2S', 2, '2022-03-22 18:02:18'),
(4, 'Mohsin Ahmed', '01512345678', '$2y$10$sMjpc1p1CMNPxMtO4OSdyedsutmkwGEAYlBC8VmlDDMnfB2XsQR46', 1, '2022-03-22 18:02:28'),
(5, 'Tasnim Al Rahman', '01812345678', '$2y$10$Zfa.22nTliappGnyIu8t4.3BHr9GZVzByusz/GpusgqetZFwDD7i2', 1, '2022-03-22 18:03:11');

-- --------------------------------------------------------

--
-- Table structure for table `usersprofile`
--

CREATE TABLE `usersprofile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `details` varchar(512) NOT NULL,
  `fbid` varchar(255) NOT NULL,
  `ytlink` varchar(255) NOT NULL,
  `profile_image` varchar(200) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`),
  ADD KEY `division_id` (`division_id`),
  ADD KEY `district_id` (`district_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `division_id` (`division_id`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `usersprofile`
--
ALTER TABLE `usersprofile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publications`
--
ALTER TABLE `publications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usersprofile`
--
ALTER TABLE `usersprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `area_ibfk_1` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `area_ibfk_2` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `district_ibfk_1` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
