-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2023 at 11:07 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(2, 'TJ', 'ZULII');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL,
  `Sold` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`, `Sold`) VALUES
(1, 'Jewella Design Best', 'A complete set for the modern yet traditionally captivating bride. The Shehzar Maala set is a beautiful concept of stones, rich designs and varying jewelry pieces.', 250, 'topproduct.jpg', 'jewella.png', 'topproduct.jpg', 1100),
(2, 'Natasha Denona', 'Mini Nude Eyeshadow Kit - Mini Nude Eyeshadow Palette & Eyeshadow Brush', 27, 'Natasha Denona.png', 'Natasha Denona-2.png', 'Natasha Denona-3.png', 879),
(3, 'Makeup Removing Cleanser Balm', 'ALCOHOL, FRAGRANCE, SOAP, AND PARABEN-FREE', 10, 'Cerave.png', 'Cerave-2.png', 'Cerave-3.png', 560),
(4, 'Bracelet', 'Glorious Multi Layer Bow Charm Bracelet Watch', 3, 'Bracelet.png', 'Bracelet-2.png', 'Bracelet.png', 915),
(5, 'Earring', 'Earrings', 20, 'Earrin299-3.png', 'Earring299.png', 'Earring299-2.png', 870),
(6, 'Ring', 'Modern Ring ', 3, 'ring-2.png', 'ring-3.png', 'ring.png', 780),
(7, 'Anklet', 'Anklet Silver', 30, 'Anklet.png', 'Anklet-2.png', 'Anklet-3.png', 960),
(8, 'Tilak Set', 'A silver antique traditional set with ornamental earrings and a tika set to make the modern woman in love with our ethnic and rich valued culture.', 10, 'Tilak set.png', 'Tilak set-2.png', 'Tilak set.png', 415),
(9, 'Ellipse', 'beautifully studded accessory. Perfect for events and festivities.', 6, 'Ellipse-3.png', 'Ellipse.png', 'Ellipse-2.png', 989),
(10, 'Hair Gajara', 'RED YELLOW GOLD HAIR GAJARA', 3, 'Hair Gajara-3.png', 'Hair Gajara.png', 'Hair Gajara-2.png', 550),
(11, 'Antique Anklet', 'Wedding Anklet', 10, 'Anklet Ant.png', 'Anklet Ant-3.png', 'Anklet Ant-2.png', 340),
(12, 'Pendant', 'Silver Statement Pendant', 10, 'Pendant.png', 'Pendant.png', 'Pendant.png', 1050),
(13, 'BRIGHTENING POWER TRIO', 'Formulation perfected to provide 100% results.', 13, 'Power trio-2.png', 'Power trio.png', 'Power trio-2.png', 480),
(14, 'NYX POWDER PUFF LIPPIE LIP CREAM', 'Featuring a pillowy-soft powder-puff applicator', 7, 'Powder puff.png', 'Powder puff-2.png', 'Powder puff-3.png', 340),
(15, 'Eyeliner', 'MAYBELLINE LASTING DRAMA NEW 36HR GEL', 8, 'Classic wing.png', 'Classic wing-2.png', 'Classic wing-3.png', 1010),
(16, 'Crystal Clear', 'Lâ€™OREAL PARIS REVITALIFT CRYSTAL MICRO-ESSENCE 22ML+SHEET MASK+GEL CREAM', 8, 'CC.png', 'CC-2.png', 'CC.png', 680),
(17, 'LIGHT REFLECTINGâ„¢ FOUNDATION', 'ADVANCED MAKEUP-SKINCARE HYBRID FOUNDATION WITH MEDIUM, BUILDABLE COVERAGE AND A NATURAL FINISH. MORE\r\nVariations', 15, 'Foundation.png', 'Foundation-2.png', 'Foundation-3.png', 880),
(18, 'LIPSTICK', 'A NEW LINEUP OF LIPSTICK IN MATTE, SATIN, AND SHEER FINISHES. INNOVATIVE NEW FORMULA DELIVERS INSTANT COLOR VIBRANCY AND CONDITIONS LIPS FOR A HYDRATED FEEL. ', 6, 'Lipstick.png', 'Lipstick-2.png', 'Lipstick-3.png', 990),
(19, 'Primer', 'Vitamin Enriched Face Base Priming Moisturizer', 9, 'PRIMER.png', 'PRIMER-2.png', 'PRIMER-3.png', 0),
(20, 'Highlighter', 'STAR LIT LIQUID HIGHLIGHTER PR BOX', 12, 'Highlighter.png', 'Highlighter-3.png', 'Highlighter-2.png', 0),
(21, 'product', 'demo product', 30, '21369051.jpg', 'Screenshot 2023-06-29 122200.png', '1000_F_506230737_E4YoxVMbFdEmU89I9tFeU9eRkJ7fScyY.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `Purchased_Worth` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `Purchased_Worth`) VALUES
(2, 'Ahmed', 'Ahmed123@gmail.com', 'cdc8e8820ddf377ec75ef13c7d70303764e38b3a', '8650\r\n'),
(3, 'Owais', 'Owais123@gmail.com', '1b01e33772f874d3b03a34c9e16356c5834eb3b6', '7000'),
(4, 'Hashir', 'Hashir123@gmail.com', '6a2c6f1211c8bddfbf5c0ff8689930d1e3bf75c8', '5870'),
(5, 'Abdullah', 'Abdullah123@gmail.com', 'f2d3f09150beb76c7f2c83dc27732a0b23718875', '9380'),
(6, 'Hamza', 'Hamza123@gmail.com', 'b6737fc7368bbc970124bb2cd5c8dfc75b283432', '7640'),
(7, 'Rabika', 'Rabika123@gmail.com', 'b52cb69e2f19bb1086ada97e6f4af7769ecb4a48', '9770'),
(8, 'Umama', 'Umama123@gmail.com', '87306f33ea8c111cf2e414c2ecbd4fc59f6daecd', '6310'),
(9, 'Noor-ul-imaan', 'imaan123@example.com', '5d8ba3b00fc45a77f87378caa7f6872090c3c6a2', '7990'),
(10, 'Mbappe', 'Mbappe123@gmail.com', 'cac2e3b54108ed23a233fd48b2888c701181d04e', '9990'),
(11, 'Shahab', 'Shahab123@gmail.com', '4452d964c32facab3cea757597315efaff49a10a', '1500');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
