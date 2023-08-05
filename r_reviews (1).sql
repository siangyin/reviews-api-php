-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 05, 2023 at 11:43 AM
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
  `createdOn` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `r_reviews`
--

INSERT INTO `r_reviews` (`reviewId`, `userId`, `restaurantId`, `comment`, `createdOn`) VALUES
(1, 1, 1, 'Super Good Service.Just love the way the chicken is done It is PERFECT It is crispy on the outside and juicy and tender inside, Best Korean Fried Chicken I ever taste in my life', '2023-08-05'),
(3, 1, 2, 'I absolutely love Akira Back, high quality food and service. Fish is super fresh and deliciously seasoned. A new favourite in Singapore! Fine dining without the hefty price tag. Their cocktails are delicious too', '2023-08-05'),
(4, 2, 2, 'Good food, good ambience with good service. Inside the restaurant is a bit cold though. Also the address of the place is 30 Beach Road but if you put this to ride hailing app, there is a chance they will drop you at a much further place so safest to put JW Marriott Hotel as your destination. Tuna pizza and Tacos are good, Wagyu fried rice and scallop are okay.', '2023-08-05'),
(5, 3, 2, 'Outstanding flavors, quality and service.  Mushroom and Tuna pizzas are both a must have. Brother from Another Mother was innovative and fun. Botan Ebi was some of the best I have ever had. I think we ordered half the menu and we were not disappointed.  We will order the other half next visit!', '2023-08-05'),
(6, 3, 1, 'Is good good', '2023-08-05');

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
  MODIFY `reviewId` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
