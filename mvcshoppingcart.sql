-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 18, 2019 at 08:22 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvcshoppingcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `appmanager`
--

CREATE TABLE `appmanager` (
  `authorityId` int(11) NOT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `emailId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appmanager`
--

INSERT INTO `appmanager` (`authorityId`, `authorities`, `emailId`) VALUES
(1, 'ROLE_ADMIN', 'anjumchnpk@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `billingAddress`
--

CREATE TABLE `billingAddress` (
  `billindAddressId` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billingAddress`
--

INSERT INTO `billingAddress` (`billindAddressId`, `address`, `city`, `country`, `state`, `zipcode`) VALUES
(1, 'Cericon building no 16, Olaya Road Riyadh Opposite Jarir book Store', 'Riyadh', 'Saudi Arabia', 'Riyadh', '11524');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Id` int(11) NOT NULL,
  `grand_Total` double DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`Id`, `grand_Total`, `customerId`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

CREATE TABLE `cartitem` (
  `cartItemId` int(11) NOT NULL,
  `price` double NOT NULL,
  `quality` int(11) NOT NULL,
  `cartId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerId` int(11) NOT NULL,
  `customerPhone` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `billingAddressId` int(11) DEFAULT NULL,
  `cartId` int(11) DEFAULT NULL,
  `shippingAddressId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerId`, `customerPhone`, `firstName`, `lastName`, `billingAddressId`, `cartId`, `shippingAddressId`, `userId`) VALUES
(1, '565663825', 'abid', 'anjum', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customerorder`
--

CREATE TABLE `customerorder` (
  `customerOrderId` int(11) NOT NULL,
  `billingAddressId` int(11) DEFAULT NULL,
  `cartId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `shippingAddressId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `Id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `unit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `query`
--

CREATE TABLE `query` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shippingAddress`
--

CREATE TABLE `shippingAddress` (
  `shippingAddressId` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shippingAddress`
--

INSERT INTO `shippingAddress` (`shippingAddressId`, `address`, `city`, `country`, `state`, `zipcode`) VALUES
(1, 'Lahore', 'Lahore', 'Saudi Arabia', 'Lahore', '11524');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `emailId` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `emailId`, `enabled`, `password`) VALUES
(1, 'anjumchnpk@gmail.com', 1, 'Pakistan1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appmanager`
--
ALTER TABLE `appmanager`
  ADD PRIMARY KEY (`authorityId`);

--
-- Indexes for table `billingAddress`
--
ALTER TABLE `billingAddress`
  ADD PRIMARY KEY (`billindAddressId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK2E7B207E47D396` (`customerId`);

--
-- Indexes for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`cartItemId`),
  ADD KEY `FK6D6633FA59D1A` (`productId`),
  ADD KEY `FK6D663364F2F91A` (`cartId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`),
  ADD KEY `FK24217FDE64F2F91A` (`cartId`),
  ADD KEY `FK24217FDEEA825D68` (`shippingAddressId`),
  ADD KEY `FK24217FDE84AA5BB0` (`userId`),
  ADD KEY `FK24217FDEFAFFAFEC` (`billingAddressId`);

--
-- Indexes for table `customerorder`
--
ALTER TABLE `customerorder`
  ADD PRIMARY KEY (`customerOrderId`),
  ADD KEY `FK811B423064F2F91A` (`cartId`),
  ADD KEY `FK811B42307E47D396` (`customerId`),
  ADD KEY `FK811B4230EA825D68` (`shippingAddressId`),
  ADD KEY `FK811B4230FAFFAFEC` (`billingAddressId`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `query`
--
ALTER TABLE `query`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippingAddress`
--
ALTER TABLE `shippingAddress`
  ADD PRIMARY KEY (`shippingAddressId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appmanager`
--
ALTER TABLE `appmanager`
  MODIFY `authorityId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `billingAddress`
--
ALTER TABLE `billingAddress`
  MODIFY `billindAddressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cartitem`
--
ALTER TABLE `cartitem`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customerorder`
--
ALTER TABLE `customerorder`
  MODIFY `customerOrderId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `query`
--
ALTER TABLE `query`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shippingAddress`
--
ALTER TABLE `shippingAddress`
  MODIFY `shippingAddressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK2E7B207E47D396` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`);

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `FK6D663364F2F91A` FOREIGN KEY (`cartId`) REFERENCES `cart` (`Id`),
  ADD CONSTRAINT `FK6D6633FA59D1A` FOREIGN KEY (`productId`) REFERENCES `item` (`Id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK24217FDE64F2F91A` FOREIGN KEY (`cartId`) REFERENCES `cart` (`Id`),
  ADD CONSTRAINT `FK24217FDE84AA5BB0` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  ADD CONSTRAINT `FK24217FDEEA825D68` FOREIGN KEY (`shippingAddressId`) REFERENCES `shippingAddress` (`shippingAddressId`),
  ADD CONSTRAINT `FK24217FDEFAFFAFEC` FOREIGN KEY (`billingAddressId`) REFERENCES `billingAddress` (`billindAddressId`);

--
-- Constraints for table `customerorder`
--
ALTER TABLE `customerorder`
  ADD CONSTRAINT `FK811B423064F2F91A` FOREIGN KEY (`cartId`) REFERENCES `cart` (`Id`),
  ADD CONSTRAINT `FK811B42307E47D396` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  ADD CONSTRAINT `FK811B4230EA825D68` FOREIGN KEY (`shippingAddressId`) REFERENCES `shippingAddress` (`shippingAddressId`),
  ADD CONSTRAINT `FK811B4230FAFFAFEC` FOREIGN KEY (`billingAddressId`) REFERENCES `billingAddress` (`billindAddressId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
