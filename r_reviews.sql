-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 05, 2023 at 10:09 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MyDatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `r_reviews`
--

CREATE TABLE `r_reviews` (
  `reviewId` int(5) NOT NULL,
  `userId` int(5) NOT NULL,
  `restaurantId` int(5) NOT NULL,
  `comment` text NOT NULL,
  `date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `r_reviews`
--

INSERT INTO `r_reviews` (`reviewId`, `userId`, `restaurantId`, `comment`, `date`) VALUES
(1, 1, 1, 'Super Good Service.Just love the way the chicken is done It is PERFECT It is crispy on the outside and juicy and tender inside, Best Korean Fried Chicken I ever taste in my life', '2023-08-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `r_reviews`
--
ALTER TABLE `r_reviews`
  ADD PRIMARY KEY (`reviewId`),
  ADD KEY `FK_user_review` (`userId`),
  ADD KEY `FK_restaurant_review` (`restaurantId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `r_reviews`
--
ALTER TABLE `r_reviews`
  MODIFY `reviewId` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `r_reviews`
--
ALTER TABLE `r_reviews`
  ADD CONSTRAINT `FK_restaurant_review` FOREIGN KEY (`restaurantId`) REFERENCES `r_restaurants` (`restaurantId`),
  ADD CONSTRAINT `FK_user_review` FOREIGN KEY (`userId`) REFERENCES `r_users` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
