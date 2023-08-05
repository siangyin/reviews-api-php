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
-- Table structure for table `r_restaurants`
--

CREATE TABLE `r_restaurants` (
  `restaurantId` int(5) NOT NULL,
  `name` varchar(150) NOT NULL,
  `photo` text NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `openinghours` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `r_restaurants`
--

INSERT INTO `r_restaurants` (`restaurantId`, `name`, `photo`, `category`, `description`, `openinghours`) VALUES
(1, '4 Fingers Crispy Chicken', 'https://onewestside.com/wp-content/uploads/2019/09/4Fingers_logo.png', 'Korean', 'Crispy and saucy 4Fingers fried chicken. Hand brushed to perfection with our unique Soy Garlic or Spicy Hot sauce that leave you wanting for more.', '08:00 AM - 10:00 PM'),
(2, 'Akira Back', 'https://i2.wp.com/absteakla.com/wp-content/uploads/2020/09/AB-Steak-logo.jpg?fit=1321%2C1017&ssl=1', 'Japanese', 'Savor modern Japanese cuisine from world-renowned chef Akira Back, featuring reinvented flavors, Korean accents and global influences.\\\\n\\\\nChef Akira Back thrill diners at his award-winning restaurant with a new wave of Japanese cuisine, combining the best of classic Japanese dishes with ingredients and flavors inspired by both Akira Back\'s South Korean heritage, his experiences and upbringing in the US. Expect quality ingredients, cross-cultural culinary techniques and an explosion of flavors at Akira Back.Japanese', '12:00 PM - 2:30 PM, 6:00 PM - 10:00 PM'),
(3, 'Bar-Roque Grill', 'https://static.wixstatic.com/media/a35e9b_b2eaf7f1c50c4cae8e8c1ec2d157c643~mv2.png/v1/fill/w_640,h_400,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/a35e9b_b2eaf7f1c50c4cae8e8c1ec2d157c643~mv2.png', 'French', 'The Alsace-born chef takes diners on a culinary journey to his homeland with authentic regional specialties such as choucroute garnie and tarte flambée aux escargots. International dishes are also popular, like Malaysian rotisserie free-range chicken and a selection of beefsteaks dry aged in-house and chargrilled to perfection. Service is attentive and helpful. Start or end the night with a drink on the terrace or at the bar.', '5:30 PM - 10:30 PM'),
(4, 'Haidilao Hot Pot', 'https://www.sunwaypyramid.com/static/shops/48b1fd331b010c44f54c41f66e814301/w768.png', 'Chinese', 'Worldwide popular Sichuan style Hot Pot, gathering various regional influences and tastes along the way. Watch the chefs knead their homemade noodles right at your booths and taste the freshness of the succulent noodles that\'s perfect with the hearty spice-infused broth. Enjoy complimentary drinks and snacks while waiting for a table.', '10:30 AM - 06:00 AM'),
(5, 'NOX - Dine In The Dark', 'https://whatstheplanb.files.wordpress.com/2021/05/nox_logo_social.jpeg', 'Western', 'At NOX – Dine In The Dark, we invite you to plunge into an intriguing new world of mystery and sensation you have never experienced before, and join us on a culinary journey through taste, smell, touch and sound, in total darkness. Seated in our pitch-black dining room, you will be guided and served by blind or visually impaired individuals that have been specially trained to offer guidance and reassurance to sighted guests. It is truly a rich human experience when the roles are reversed and the blind become your eyes, opening your mind to a deeper consciousness. ', '6:00 PM - 12:00 AM'),
(6, 'Shin Minori Japanese Restaurant', 'https://s3-ap-southeast-1.amazonaws.com/v3-live.image.oddle.me/logo/menu_logo_ShinMinoriJapaneseRestaurantae3cc9.jpg', 'Japanese', 'Shin Minori is all about value in Japanese dining. Offering all sorts of cravings from sushi to tempura, this is your one stop shop for Japanese feasting without the splurge. Best known for its a la carte buffet option, Shin Minori is the UE Square eatery that\'s ideal for group gatherings or family dinners, where a variety of palates need to be pleased. ', '12:00 PM - 2:30 PM, 6:15 PM - 10:15 PM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `r_restaurants`
--
ALTER TABLE `r_restaurants`
  ADD PRIMARY KEY (`restaurantId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `r_restaurants`
--
ALTER TABLE `r_restaurants`
  MODIFY `restaurantId` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
