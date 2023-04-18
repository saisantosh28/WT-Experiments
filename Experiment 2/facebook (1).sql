-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 18, 2023 at 06:14 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `email`, `comment`) VALUES
(63, 1, 'maddisaisantosh.20.cse@anits.edu.in', 'hii'),
(64, 2, 'maddisaisantosh.20.cse@anits.edu.in', 'hello');

-- --------------------------------------------------------

--
-- Table structure for table `current_users`
--

CREATE TABLE `current_users` (
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `current_users`
--

INSERT INTO `current_users` (`email`) VALUES
('maddisai2811@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `email` varchar(100) NOT NULL,
  `image` blob NOT NULL,
  `description` varchar(100) NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `likes` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`email`, `image`, `description`, `post_id`, `likes`) VALUES
('maddisai2811@gmail.com', 0x726f6869742d736861726d612d637269636b65742d776f726c642d6375702d7a3133617269726e326b6c62773569682e6a7067, 'hii', 1, 2),
('maddisaisantosh.20.cse@anits.edu.in', 0x66616365626f6f6b2e6a7067, 'icon', 2, 2),
('maddisaisantosh.20.cse@anits.edu.in', 0x4170706c652d6950686f6e652d31342d50726f2d77686572652d746f2d6275792d72656c656173652d646174652d616e642d7072696365732d73706563732d312e6a7067, 'iphone', 4, 2),
('maddisaisantosh.20.cse@anits.edu.in', 0x6b6172742e706e67, 'cart\r\n', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `email` varchar(100) NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`email`, `post_id`) VALUES
('maddisai2811@gmail.com', 1),
('maddisai2811@gmail.com', 2),
('maddisai2811@gmail.com', 4),
('maddisaisantosh.20.cse@anits.edu.in', 1),
('maddisaisantosh.20.cse@anits.edu.in', 2),
('maddisaisantosh.20.cse@anits.edu.in', 4),
('maddisaisantosh.20.cse@anits.edu.in', 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `phonenumber` varchar(20) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`phonenumber`, `firstname`, `lastname`, `email`, `password`, `dob`, `address`) VALUES
('9542440209', 'Sai', 'Santosh', 'maddisai2811@gmail.com', 'santosh', '2002-11-28', 'Thagarapuvalasa'),
('9949809798', 'maddi', 'Sai', 'maddisaisantosh.20.cse@anits.edu.in', 'santosh', '2002-11-28', 'Thagarapuvalasa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `email` (`email`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`email`,`post_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phonenumber` (`phonenumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `images` (`post_id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `images` (`post_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
