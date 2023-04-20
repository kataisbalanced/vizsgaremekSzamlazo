﻿--
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.2.23.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 2023. 02. 24. 11:29:18
-- Server version: 5.5.5-10.1.38-MariaDB
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE szamlalo;

--
-- Drop table `users`
--
DROP TABLE IF EXISTS users;

--
-- Drop table `szamlatetel`
--
DROP TABLE IF EXISTS szamlatetel;

--
-- Drop table `products`
--
DROP TABLE IF EXISTS products;

--
-- Drop table `recepithead`
--
DROP TABLE IF EXISTS recepithead;

--
-- Drop table `buyers`
--
DROP TABLE IF EXISTS buyers;

--
-- Set default database
--
USE szamlalo;

--
-- Create table `buyers`
--
CREATE TABLE buyers (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) DEFAULT NULL,
  postalCode INT(11) DEFAULT NULL,
  settlement VARCHAR(255) DEFAULT NULL,
  streetAddress VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create table `recepithead`
--
CREATE TABLE recepithead (
  id INT(11) NOT NULL AUTO_INCREMENT,
  accountNumber INT(11) DEFAULT NULL,
  kelt VARCHAR(255) DEFAULT NULL,
  fulllfillment VARCHAR(255) DEFAULT NULL,
  buyerId INT(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create foreign key
--
ALTER TABLE recepithead 
  ADD CONSTRAINT FK_szamlafej_vevok_id FOREIGN KEY (buyerId)
    REFERENCES buyers(id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create table `products`
--
CREATE TABLE products (
  id INT(11) NOT NULL AUTO_INCREMENT,
  productName VARCHAR(255) DEFAULT NULL,
  price INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create table `szamlatetel`
--
CREATE TABLE szamlatetel (
  id INT(11) NOT NULL AUTO_INCREMENT,
  recepitHeadId INT(11) DEFAULT NULL,
  productId INT(11) DEFAULT NULL,
  quantity INT(11) DEFAULT NULL,
  quantityUnit VARCHAR(255) DEFAULT NULL,
  grossUnit INT(11) DEFAULT NULL,
  vatPercentage INT(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create foreign key
--
ALTER TABLE szamlatetel 
  ADD CONSTRAINT FK_szamlatetel_szamlafej_id FOREIGN KEY (recepitHeadId)
    REFERENCES recepithead(id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE szamlatetel 
  ADD CONSTRAINT FK_szamlatetel_termekek_id FOREIGN KEY (productId)
    REFERENCES products(id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create table `users`
--
CREATE TABLE users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(255) DEFAULT NULL,
  lastName VARCHAR(255) DEFAULT NULL,
  gender VARCHAR(255) DEFAULT NULL,
  userName VARCHAR(255) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  password VARCHAR(255) DEFAULT NULL,
  number INT(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

-- 
-- Dumping data for table buyers
--
-- Table szamlalo.buyers does not contain any data (it is empty)

-- 
-- Dumping data for table recepithead
--
-- Table szamlalo.recepithead does not contain any data (it is empty)

-- 
-- Dumping data for table products
--
-- Table szamlalo.products does not contain any data (it is empty)

-- 
-- Dumping data for table users
--
-- Table szamlalo.users does not contain any data (it is empty)

-- 
-- Dumping data for table szamlatetel
--
-- Table szamlalo.szamlatetel does not contain any data (it is empty)

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;