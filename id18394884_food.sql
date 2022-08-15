-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 04, 2022 at 08:15 AM
-- Server version: 10.5.12-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id18394884_food`
--

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `business_id` int(11) NOT NULL,
  `business_name` varchar(25) CHARACTER SET latin1 NOT NULL,
  `business_address` varchar(25) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0,
  `owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`business_id`, `business_name`, `business_address`, `deleted`, `owner_id`) VALUES
(8, 'Kafe K10 K11', 'K10', 0, 6),
(9, 'Kafe Serumpun', 'K11', 0, 7),
(10, 'SUSHIWAK', 'KTDI', 0, 8),
(15, 'TAKOYAKI', 'UPM Main Campus', 0, 9),
(16, 'KFC', 'IOI', 1, 10),
(24, 'Sushi King', 'K11', 0, 12),
(26, 'PFU UPM', 'Infront PKU', 0, 13);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` float NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0,
  `business_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price`, `deleted`, `business_id`) VALUES
(1, 'Mini Yee Sang', 25, 0, 8),
(2, 'Nasi Goreng Tomyam', 45, 0, 9),
(3, 'HuHu Yee Sang', 20, 0, 10),
(4, 'Saba fish Salad', 15, 1, 15),
(5, 'Hiyashi Soba', 20, 0, 8),
(6, 'Rice', 3, 0, 8),
(7, 'Fried Rice', 13, 0, 9),
(8, 'Drumstick Set', 20, 0, 8),
(9, 'Nasi Goreng Cina', 9.6, 0, 9),
(10, 'Ayam Masak Kicap', 8.6, 0, 9),
(11, 'Empire Combo Box 1', 50, 0, 24),
(12, 'Empire Combo Box 2', 64, 0, 24),
(13, 'Futo Maki', 1.4, 0, 24),
(14, 'Aburi Salmon', 2.7, 0, 24),
(15, 'Drumstick set 2', 23, 0, 8),
(16, 'Sushi1', 2, 0, 16),
(17, 'Sushi2', 2, 0, 16),
(18, 'Sushi3', 2, 0, 16),
(19, 'Bento set', 12, 0, 16);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_type` varchar(16) NOT NULL DEFAULT 'Wallet',
  `total` float NOT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'Yet to be delivered',
  `deleted` tinyint(4) NOT NULL DEFAULT 0,
  `business_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `address`, `description`, `date`, `payment_type`, `total`, `status`, `deleted`, `business_id`) VALUES
(1, 2, 'Address 2', 'Sample Description 1', '2021-12-28 17:32:41', 'Wallet', 150, 'Delivered', 0, 8),
(2, 2, 'New address 2', '', '2021-12-10 17:43:05', 'Wallet', 130, 'Cancelled by Customer', 1, 8),
(3, 3, 'Address 3', 'Sample Description 2', '2021-11-28 19:49:33', 'Cash On Delivery', 130, 'Yet to be delivered', 0, 8),
(4, 3, 'Address 3', '', '2021-11-20 19:52:01', 'Cash On Delivery', 130, 'Cancelled by Customer', 1, 9),
(5, 3, 'New Address 3', '', '2021-12-27 20:47:28', 'Wallet', 285, 'Paused', 0, 9),
(6, 3, 'New Address 3', '', '2022-01-22 00:43:31', 'Wallet', 325, 'Cancelled by Customer', 1, 10),
(7, 2, 'Address 2', '', '2022-02-03 16:37:25', 'Cash On Delivery', 43, 'Delivered', 0, 10),
(8, 2, 'Address 2', '', '2022-02-03 17:57:54', 'Cash On Delivery', 148, 'Cancelled by Customer', 1, 9),
(9, 11, 'IOI city', '', '2022-02-03 18:05:45', 'Cash On Delivery', 85, 'Delivered', 0, 8),
(10, 11, 'IOI city', '', '2022-02-03 18:08:08', 'Cash On Delivery', 20, 'Cancelled by Customer', 1, 10),
(11, 2, 'Address 2', '', '2022-02-03 20:00:48', 'Cash On Delivery', 63.5, 'Cancelled by Customer', 1, 24),
(12, 2, 'Kolej 10, Universiti Putra Malaysia', '', '2022-02-04 04:43:38', 'Cash On Delivery', 52.7, 'Yet to be delivered', 0, 24),
(13, 3, 'Address 3', '', '2022-02-04 05:18:33', 'Cash On Delivery', 60, 'Delivered', 0, 8),
(14, 2, 'Kolej 10   ', '', '2022-02-04 05:38:41', 'Wallet', 21.6, 'Yet to be delivered', 0, 9),
(15, 2, 'Kolej 10   ', 'More spicy', '2022-02-04 07:10:17', 'Wallet', 88, 'Yet to be delivered', 0, 8),
(16, 2, 'No 12 Wing A Kolej 10   ', '', '2022-02-04 07:55:59', 'Cash On Delivery', 6, 'Yet to be delivered', 0, 16),
(17, 20, 'K11 Wing D', '', '2022-02-04 08:13:48', 'Cash On Delivery', 22, 'Yet to be delivered', 0, 16);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `item_id`, `quantity`, `price`) VALUES
(1, 1, 2, 2, 90),
(2, 1, 3, 3, 60),
(3, 2, 2, 2, 90),
(4, 2, 3, 2, 40),
(5, 3, 2, 2, 90),
(6, 3, 3, 2, 40),
(7, 4, 2, 2, 90),
(8, 4, 3, 2, 40),
(9, 5, 2, 5, 225),
(10, 5, 3, 2, 40),
(11, 5, 5, 1, 20),
(12, 6, 2, 5, 225),
(13, 6, 3, 3, 60),
(14, 6, 5, 2, 40),
(15, 7, 5, 2, 40),
(16, 7, 6, 1, 3),
(17, 8, 7, 1, 13),
(18, 8, 2, 3, 135),
(19, 9, 8, 1, 20),
(20, 9, 1, 1, 25),
(21, 9, 5, 2, 40),
(22, 10, 3, 1, 20),
(23, 11, 14, 5, 13.5),
(24, 11, 11, 1, 50),
(25, 12, 14, 1, 2.7),
(26, 12, 11, 1, 50),
(27, 13, 8, 3, 60),
(28, 14, 10, 1, 8.6),
(29, 14, 7, 1, 13),
(30, 15, 8, 1, 20),
(31, 15, 5, 2, 40),
(32, 15, 1, 1, 25),
(33, 15, 6, 1, 3),
(34, 16, 16, 1, 2),
(35, 16, 17, 2, 4),
(36, 17, 19, 1, 12),
(37, 17, 16, 2, 4),
(38, 17, 17, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `runner`
--

CREATE TABLE `runner` (
  `id` int(11) NOT NULL,
  `runner_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `runner_phoneNo` int(11) NOT NULL,
  `business_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `runner`
--

INSERT INTO `runner` (`id`, `runner_name`, `runner_phoneNo`, `business_id`, `deleted`) VALUES
(1, 'Ali', 116254262, 8, 0),
(2, 'Lucy', 132226545, 8, 0),
(3, 'Zain', 132226548, 8, 0),
(4, 'Brown', 136654455, 9, 0),
(5, 'Chris', 123549875, 9, 0),
(6, 'Peter', 123734445, 24, 0),
(7, 'Victor', 123555466, 8, 0),
(9, 'Alex', 1161552661, 16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `poster_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'Open',
  `type` varchar(30) NOT NULL DEFAULT 'Others',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `poster_id`, `subject`, `description`, `status`, `type`, `date`, `deleted`) VALUES
(1, 2, 'Subject 1', 'New Description for Subject 1', 'Answered', 'Support', '2022-01-30 18:08:51', 0),
(2, 2, 'Food quality', 'I got spoil food. Request for refund.', 'Open', 'Complaint', '2022-02-04 04:46:39', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_details`
--

CREATE TABLE `ticket_details` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_details`
--

INSERT INTO `ticket_details` (`id`, `ticket_id`, `user_id`, `description`, `date`) VALUES
(1, 1, 2, 'New Description for Subject 1', '2022-01-30 18:08:51'),
(2, 1, 2, 'Reply-1 for Subject 1', '2022-01-30 19:59:09'),
(3, 1, 1, 'Reply-2 for Subject 1 from Administrator.', '2022-01-30 20:35:39'),
(4, 1, 1, 'Reply-3 for Subject 1 from Administrator.', '2022-01-30 20:49:35'),
(5, 2, 2, 'I got spoil food. Request for refund.', '2022-02-04 04:46:39'),
(6, 2, 6, 'Thank you for your response. We will deal with this issue as soon as possible.', '2022-02-04 05:54:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(15) NOT NULL DEFAULT 'Customer',
  `name` varchar(15) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(35) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `contact` bigint(11) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `username`, `password`, `email`, `address`, `contact`, `verified`, `deleted`) VALUES
(1, 'Administrator', 'Admin 1', 'root', 'toor', 'aag@gmail.com', 'Address 1', 123546488, 1, 0),
(2, 'Customer', 'Qin Zheyang', 'user1', 'pass1', 'mail2@example.com', 'Kolej 10   ', 123135444, 1, 0),
(3, 'Customer', 'Customer 2', 'user2', 'pass2', 'mail3@example.com', 'Address 3', 133468855, 1, 0),
(4, 'Customer', 'Customer 3', 'user3', 'pass3', 'aafsd123@gmail.com', 'IOI city Conezion', 136665444, 0, 0),
(5, 'Customer', 'Customer 4', 'user4', 'pass4', 'aqgt22@gmail.com', 'East Lake Residence', 132254655, 0, 1),
(6, 'BusinessOwner', 'qin', 'qin', '123', '12ag23@gmail.com', 'Adress 1231241', 139223555, 1, 0),
(7, 'BusinessOwner', 'zhe2', 'qin2', '123', '12gh234@gmail.com', 'Adress 123124141', 139223523, 1, 0),
(8, 'BusinessOwner', 'zhe3', 'qin3', '123', '1231224@gmail.com', 'Adress 123122141', 139223522, 1, 0),
(9, 'BusinessOwner', 'zhe4', 'qin4', '123', '123123ga4@gmail.com', 'Adress 121234141', 139223543, 1, 0),
(10, 'BusinessOwner', 'zhe5', 'qin5', '123', '1g2a31224@gmail.com', 'Adress 1144123', 139212412, 1, 0),
(11, 'Customer', 'Karry', 'Karry', '12345', 'wr@gmail.com', 'IOI city, Malaysia', 139223555, 1, 0),
(12, 'BusinessOwner', 'PFCUPM', 'PFCUPM', '12345', 'dsd@jsdd,com', 'dsaddf', 12345, 1, 0),
(13, 'BusinessOwner', 'Zaki', 'zaki', '12356789', 'zaki@gmail.com', 'D-12A-3, Block D', 132255648, 1, 0),
(14, 'Customer', 'Roy', 'user10', '12345', '123asdf@gmail.com', 'K10', 135545684, 1, 0),
(15, 'Customer', 'Brown', 'Brown', '123', 'asdg@gmail.com', 'K11', 123334565, 0, 1),
(16, 'Customer', 'Alvian', 'user200', '12345', '1asdf@gmail.com', 'Putrajaya', 12345, 0, 0),
(17, 'Customer', 'Marry', 'Marry', '12345', '1ad2sdf@gmail.com', 'UPM', 12342456, 0, 0),
(18, 'BusinessOwner', 'Hion1', 'qzy105', '12345', 'pppgaja@gmail.com', 'UPM K10, Serdang', 15612465455, 1, 0),
(19, 'Customer', 'Firdaus mazlan', 'daus152', 'd12345', 'ppag22@gmail.com', 'K10', 126578292, 0, 0),
(20, 'Customer', 'Mariya', 'Mariya', '12345', 'ad23@gmail.com', 'K10', 1234561345, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `customer_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_details`
--

CREATE TABLE `wallet_details` (
  `id` int(11) NOT NULL,
  `wallet_id` int(11) NOT NULL,
  `number` varchar(16) NOT NULL,
  `cvv` int(3) NOT NULL,
  `balance` float NOT NULL DEFAULT 2000
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet_details`
--

INSERT INTO `wallet_details` (`id`, `wallet_id`, `number`, `cvv`, `balance`) VALUES
(1, 1, '6155247490533921', 983, 3430),
(2, 2, '1887587142382050', 772, 1740.4),
(3, 3, '4595809639046830', 532, 1585),
(4, 4, '5475856443351234', 521, 2000),
(5, 5, '9076633115663264', 229, 2000),
(6, 6, '51135109258871', 983, 2000),
(7, 7, '1170481097366047', 271, 2000),
(8, 8, '2036104120902825', 485, 2000),
(9, 9, '9184374734548767', 756, 2000),
(10, 10, '9187028365966107', 75, 2000),
(11, 11, '6575244580803419', 543, 2000),
(12, 12, '5465165648165156', 111, 2000),
(13, 13, '626482648165189', 787, 2000),
(14, 14, '3252654864682', 333, 2000),
(15, 15, '12354964849788', 781, 2000),
(16, 16, '6654213653556', 754, 2000),
(17, 17, '4453173728596560', 126, 2000),
(18, 18, '1669031588123822', 836, 2000),
(19, 19, '1314297412438162', 579, 2000),
(20, 20, '918308148798155', 861, 2000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`business_id`),
  ADD UNIQUE KEY `business_name` (`business_name`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `business_id` (`business_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `business_id` (`business_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `runner`
--
ALTER TABLE `runner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_id` (`business_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poster_id` (`poster_id`);

--
-- Indexes for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wallet_details`
--
ALTER TABLE `wallet_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallet_id` (`wallet_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `business_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `runner`
--
ALTER TABLE `runner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket_details`
--
ALTER TABLE `ticket_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `wallet_details`
--
ALTER TABLE `wallet_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `business` (`business_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`business_id`) REFERENCES `business` (`business_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `runner`
--
ALTER TABLE `runner`
  ADD CONSTRAINT `runner_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `business` (`business_id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`poster_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD CONSTRAINT `ticket_details_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallet_details`
--
ALTER TABLE `wallet_details`
  ADD CONSTRAINT `wallet_details_ibfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
