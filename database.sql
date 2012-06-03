-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 03, 2012 at 03:53 PM
-- Server version: 5.5.24
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ttu_idu0140`
--

-- --------------------------------------------------------

--
-- Table structure for table `catalog_type`
--

CREATE TABLE IF NOT EXISTS `catalog_type` (
  `catalog_type` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`catalog_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comm_device`
--

CREATE TABLE IF NOT EXISTS `comm_device` (
  `comm_device` int(30) NOT NULL AUTO_INCREMENT,
  `comm_device_type` decimal(22,0) DEFAULT NULL,
  `customer` decimal(22,0) DEFAULT NULL,
  `value_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`comm_device`),
  KEY `comm_device_idx1` (`customer`),
  KEY `comm_device_idx2` (`comm_device_type`),
  KEY `comm_device_idx3` (`value_text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comm_device_type`
--

CREATE TABLE IF NOT EXISTS `comm_device_type` (
  `comm_device_type` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`comm_device_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `comm_device_type`
--

INSERT INTO `comm_device_type` (`comm_device_type`, `name`, `description`) VALUES
(1, 'telefon', NULL),
(2, 'mobiil', NULL),
(3, 'faks', NULL),
(4, 'mail', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE IF NOT EXISTS `contract` (
  `contract` int(30) NOT NULL AUTO_INCREMENT,
  `contract_manager` decimal(22,0) DEFAULT NULL,
  `contract_status_type` decimal(22,0) DEFAULT NULL,
  `customer` decimal(22,0) DEFAULT NULL,
  `contract_type` decimal(22,0) DEFAULT NULL,
  `cnt_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `parent_cnt` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `conditions` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value_amount` decimal(32,16) DEFAULT NULL,
  `struct_unit` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`contract`),
  KEY `contract_idx10` (`updated`),
  KEY `contract_idx11` (`updated_by`),
  KEY `contract_idx12` (`struct_unit`),
  KEY `contract_idx2` (`contract_manager`),
  KEY `contract_idx3` (`customer`),
  KEY `contract_idx4` (`cnt_number`),
  KEY `contract_idx5` (`name`),
  KEY `contract_idx6` (`valid_from`),
  KEY `contract_idx7` (`valid_to`),
  KEY `contract_idx8` (`created`),
  KEY `contract_idx9` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contract_atr_type`
--

CREATE TABLE IF NOT EXISTS `contract_atr_type` (
  `contract_atr_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `selectable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `uniq` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `can_change` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `default_value` decimal(22,0) DEFAULT NULL,
  `default_value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`contract_atr_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contract_atr_type_value`
--

CREATE TABLE IF NOT EXISTS `contract_atr_type_value` (
  `contract_atr_type_value` int(30) NOT NULL AUTO_INCREMENT,
  `contract_atr_type` decimal(22,0) DEFAULT NULL,
  `value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`contract_atr_type_value`),
  KEY `contract_atr_type_value_idx1` (`contract_atr_type`),
  KEY `contract_atr_type_value_idx2` (`value_text`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contract_attribute`
--

CREATE TABLE IF NOT EXISTS `contract_attribute` (
  `contract_attribute` int(30) NOT NULL AUTO_INCREMENT,
  `contract_atr_type_value` decimal(22,0) DEFAULT NULL,
  `contract_atr_type` decimal(22,0) DEFAULT NULL,
  `contract` decimal(22,0) DEFAULT NULL,
  `value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `selectable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `can_change` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`contract_attribute`),
  KEY `contract_attribute_idx1` (`contract`),
  KEY `contract_attribute_idx2` (`value_text`(255)),
  KEY `contract_attribute_idx3` (`contract_atr_type`),
  KEY `contract_attribute_idx4` (`contract_atr_type_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contract_manager`
--

CREATE TABLE IF NOT EXISTS `contract_manager` (
  `contract_manager` int(30) NOT NULL AUTO_INCREMENT,
  `contract` decimal(22,0) DEFAULT NULL,
  `employee` decimal(22,0) DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `status` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`contract_manager`),
  KEY `contract_manager_idx1` (`contract`),
  KEY `contract_manager_idx2` (`employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contract_property`
--

CREATE TABLE IF NOT EXISTS `contract_property` (
  `contract_property` int(30) NOT NULL AUTO_INCREMENT,
  `contract` decimal(22,0) DEFAULT NULL,
  `property` decimal(22,0) DEFAULT NULL,
  `status` decimal(22,0) DEFAULT NULL,
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `relation_type` decimal(22,0) DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`contract_property`),
  KEY `contract_property_idx1` (`contract`),
  KEY `contract_property_idx2` (`property`),
  KEY `contract_property_idx3` (`relation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contract_relation`
--

CREATE TABLE IF NOT EXISTS `contract_relation` (
  `contract_relation` int(30) NOT NULL AUTO_INCREMENT,
  `contract` decimal(22,0) DEFAULT NULL,
  `contract1` decimal(22,0) DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `status` decimal(22,0) DEFAULT NULL,
  `relation_type` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`contract_relation`),
  KEY `contract_relation_idx1` (`contract`),
  KEY `contract_relation_idx2` (`contract1`),
  KEY `contract_relation_idx3` (`relation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contract_status`
--

CREATE TABLE IF NOT EXISTS `contract_status` (
  `contract_status` int(30) NOT NULL AUTO_INCREMENT,
  `contract` decimal(22,0) DEFAULT NULL,
  `contract_status_type` decimal(22,0) DEFAULT NULL,
  `customer` decimal(22,0) DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `ended` datetime DEFAULT NULL,
  `ended_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`contract_status`),
  KEY `contract_status_idx1` (`contract`),
  KEY `contract_status_idx2` (`contract_status_type`),
  KEY `contract_status_idx3` (`valid_from`),
  KEY `contract_status_idx4` (`valid_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contract_status_type`
--

CREATE TABLE IF NOT EXISTS `contract_status_type` (
  `contract_status_type` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`contract_status_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `contract_status_type`
--

INSERT INTO `contract_status_type` (`contract_status_type`, `name`) VALUES
(1, 'projekt'),
(2, 'kinnitatud'),
(3, 'kehtiv'),
(4, 'peatatatud'),
(5, 'läpetatud'),
(6, 'läpetatud uuega');

-- --------------------------------------------------------

--
-- Table structure for table `contract_type`
--

CREATE TABLE IF NOT EXISTS `contract_type` (
  `contract_type` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`contract_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contract_type_atrib`
--

CREATE TABLE IF NOT EXISTS `contract_type_atrib` (
  `contract_type_atrib` int(30) NOT NULL AUTO_INCREMENT,
  `contract_atr_type` decimal(22,0) DEFAULT NULL,
  `contract_type` decimal(22,0) DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `status` decimal(22,0) DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`contract_type_atrib`),
  KEY `contract_type_atrib_idx1` (`contract_type`),
  KEY `contract_type_atrib_idx2` (`contract_atr_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cst_address`
--

CREATE TABLE IF NOT EXISTS `cst_address` (
  `cst_address` int(30) NOT NULL AUTO_INCREMENT,
  `customer` decimal(22,0) DEFAULT NULL,
  `zip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `house` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `county` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `parish` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `town_county` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `address_type` decimal(22,0) DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sms` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `country` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`cst_address`),
  KEY `cst_address_idx1` (`customer`),
  KEY `cst_address_idx2` (`address`),
  KEY `cst_address_idx3` (`county`),
  KEY `cst_address_idx4` (`house`),
  KEY `cst_address_idx5` (`town_county`),
  KEY `cst_address_idx6` (`zip`),
  KEY `cst_address_idx7` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cst_app_session`
--

CREATE TABLE IF NOT EXISTS `cst_app_session` (
  `cst_app_session` int(30) NOT NULL AUTO_INCREMENT,
  `cst_user` decimal(22,0) DEFAULT NULL,
  `customer` decimal(22,0) DEFAULT NULL,
  `session_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status_type` decimal(22,0) DEFAULT NULL,
  `session_start` datetime DEFAULT NULL,
  `session_end` datetime DEFAULT NULL,
  `last_action` datetime DEFAULT NULL,
  `app_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cst_app_session`),
  KEY `cst_app_session_idx1` (`customer`),
  KEY `cst_app_session_idx2` (`cst_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cst_state_type`
--

CREATE TABLE IF NOT EXISTS `cst_state_type` (
  `cst_state_type` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cst_state_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cst_state_type`
--

INSERT INTO `cst_state_type` (`cst_state_type`, `name`) VALUES
(1, 'aktiivne'),
(2, 'suletud');

-- --------------------------------------------------------

--
-- Table structure for table `cst_type`
--

CREATE TABLE IF NOT EXISTS `cst_type` (
  `cst_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cst_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cst_type`
--

INSERT INTO `cst_type` (`cst_type`, `name`) VALUES
(1, 'Edasimja'),
(2, 'Partner'),
(3, 'Klient'),
(4, 'Suurklient');

-- --------------------------------------------------------

--
-- Table structure for table `cst_type_atr_type`
--

CREATE TABLE IF NOT EXISTS `cst_type_atr_type` (
  `cst_type_atr_type` int(30) NOT NULL AUTO_INCREMENT,
  `cst_type` decimal(22,0) DEFAULT NULL,
  `customer_atr_type` decimal(22,0) DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cst_type_atr_type`),
  KEY `cst_type_atr_type_idx1` (`customer_atr_type`),
  KEY `cst_type_atr_type_idx2` (`cst_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cst_user`
--

CREATE TABLE IF NOT EXISTS `cst_user` (
  `cst_user` int(30) NOT NULL AUTO_INCREMENT,
  `customer` decimal(22,0) DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `passw` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `user_status_type` decimal(22,0) DEFAULT NULL,
  `user_status_date` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `last_session` decimal(22,0) DEFAULT NULL,
  `contact_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cst_user`),
  UNIQUE KEY `cst_user_ux1` (`username`),
  KEY `cst_user_idx1` (`customer`),
  KEY `cst_user_idx2` (`passw`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cst_user`
--

INSERT INTO `cst_user` (`cst_user`, `customer`, `username`, `passw`, `user_status_type`, `user_status_date`, `created`, `updated`, `created_by`, `updated_by`, `last_session`, `contact_email`) VALUES
(1, 1, 'admin', '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer` int(30) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `identity_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(30,0) DEFAULT NULL,
  `updated_by` decimal(30,0) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `cst_type` int(2) DEFAULT NULL,
  `cst_state_type` int(2) DEFAULT NULL,
  PRIMARY KEY (`customer`),
  KEY `customer_idx10` (`updated_by`),
  KEY `customer_idx2` (`last_name`),
  KEY `customer_idx3` (`identity_code`),
  KEY `customer_idx5` (`cst_state_type`),
  KEY `customer_idx6` (`first_name`),
  KEY `customer_idx7` (`created`),
  KEY `customer_idx8` (`created_by`),
  KEY `customer_idx9` (`updated`),
  KEY `customer_idx11` (`note`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer`, `first_name`, `last_name`, `identity_code`, `note`, `created`, `updated`, `created_by`, `updated_by`, `birth_date`, `cst_type`, `cst_state_type`) VALUES
(1, 'Georgii', 'Zalizko', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_atr_type`
--

CREATE TABLE IF NOT EXISTS `customer_atr_type` (
  `customer_atr_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `required` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `uniq` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `selectable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `can_change` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `default_value` decimal(22,0) DEFAULT NULL,
  `default_value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`customer_atr_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_atr_type_value`
--

CREATE TABLE IF NOT EXISTS `customer_atr_type_value` (
  `customer_atr_type_value` int(30) NOT NULL AUTO_INCREMENT,
  `customer_atr_type` decimal(22,0) DEFAULT NULL,
  `value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`customer_atr_type_value`),
  KEY `customer_atr_type_value_idx1` (`customer_atr_type`),
  KEY `customer_atr_type_value_idx2` (`value_text`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_attribute`
--

CREATE TABLE IF NOT EXISTS `customer_attribute` (
  `customer_attribute` int(30) NOT NULL AUTO_INCREMENT,
  `customer_atr_type_value` decimal(22,0) DEFAULT NULL,
  `customer_atr_type` decimal(22,0) DEFAULT NULL,
  `customer` decimal(22,0) DEFAULT NULL,
  `value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `selectable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `can_change` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_attribute`),
  KEY `customer_attribute_idx1` (`customer`),
  KEY `customer_attribute_idx2` (`customer_atr_type`),
  KEY `customer_attribute_idx3` (`customer_atr_type_value`),
  KEY `customer_attribute_idx4` (`value_text`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_event`
--

CREATE TABLE IF NOT EXISTS `customer_event` (
  `customer_event` int(30) NOT NULL AUTO_INCREMENT,
  `project` decimal(22,0) DEFAULT NULL,
  `struct_unit` decimal(22,0) DEFAULT NULL,
  `order_` decimal(22,0) DEFAULT NULL,
  `customer` decimal(22,0) DEFAULT NULL,
  `cust_event_type` decimal(22,0) DEFAULT NULL,
  `subject` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value_text` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`customer_event`),
  KEY `customer_event_idx1` (`customer`),
  KEY `customer_event_idx2` (`created_by`),
  KEY `customer_event_idx3` (`cust_event_type`),
  KEY `customer_event_idx4` (`struct_unit`),
  KEY `customer_event_idx5` (`project`),
  KEY `customer_event_idx6` (`subject`(255)),
  KEY `customer_event_idx7` (`created`),
  KEY `customer_event_idx9` (`value_text`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE IF NOT EXISTS `customer_group` (
  `customer_group` int(30) NOT NULL AUTO_INCREMENT,
  `customer` decimal(22,0) DEFAULT NULL,
  `c_group` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`customer_group`),
  KEY `customer_group_idx1` (`customer`),
  KEY `customer_group_idx2` (`c_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_message`
--

CREATE TABLE IF NOT EXISTS `customer_message` (
  `customer_message` int(30) NOT NULL AUTO_INCREMENT,
  `cust_message_type` decimal(22,0) DEFAULT NULL,
  `customer` decimal(22,0) DEFAULT NULL,
  `cust_message_status_type` decimal(22,0) DEFAULT NULL,
  `subject` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value_text` varchar(600) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `show_start` datetime DEFAULT NULL,
  `show_end` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_message`),
  KEY `customer_message_idx1` (`customer`),
  KEY `customer_message_idx2` (`created`),
  KEY `customer_message_idx3` (`cust_message_type`),
  KEY `customer_message_idx4` (`created_by`),
  KEY `customer_message_idx7` (`subject`(255)),
  KEY `customer_message_idx6` (`value_text`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cust_event_atrib`
--

CREATE TABLE IF NOT EXISTS `cust_event_atrib` (
  `cust_event_atrib` int(30) NOT NULL AUTO_INCREMENT,
  `cust_event_atrib_value` decimal(22,0) DEFAULT NULL,
  `cust_event_atrib_type` decimal(22,0) DEFAULT NULL,
  `customer_event` decimal(22,0) DEFAULT NULL,
  `value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `selectable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `can_change` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`cust_event_atrib`),
  KEY `cust_event_atrib_idx1` (`customer_event`),
  KEY `cust_event_atrib_idx2` (`cust_event_atrib_value`),
  KEY `cust_event_atrib_idx3` (`cust_event_atrib_type`),
  KEY `cust_event_atrib_idx4` (`value_text`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cust_event_atrib_type`
--

CREATE TABLE IF NOT EXISTS `cust_event_atrib_type` (
  `cust_event_atrib_type` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `required` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `uniq` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `selectable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `can_change` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `default_value` decimal(22,0) DEFAULT NULL,
  `default_value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cust_event_atrib_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cust_event_atrib_value`
--

CREATE TABLE IF NOT EXISTS `cust_event_atrib_value` (
  `cust_event_atrib_value` int(30) NOT NULL AUTO_INCREMENT,
  `cust_event_atrib_type` decimal(22,0) DEFAULT NULL,
  `value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`cust_event_atrib_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cust_event_class`
--

CREATE TABLE IF NOT EXISTS `cust_event_class` (
  `cust_event_class` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cust_event_class`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cust_event_class`
--

INSERT INTO `cust_event_class` (`cust_event_class`, `name`, `description`) VALUES
(1, 'kliendi sndmus', NULL),
(2, 'tegevus', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cust_event_type`
--

CREATE TABLE IF NOT EXISTS `cust_event_type` (
  `cust_event_type` int(30) NOT NULL AUTO_INCREMENT,
  `cust_event_class` decimal(22,0) DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cust_event_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `cust_event_type`
--

INSERT INTO `cust_event_type` (`cust_event_type`, `cust_event_class`, `name`, `description`) VALUES
(1, 1, 'kliendi ksimus kauba kohta', NULL),
(2, 1, 'pakkumise ksimine', NULL),
(3, 2, 'pakkumise tegemine', NULL),
(4, 1, 'probleem tellimusega', NULL),
(5, 1, 'garantii probleem', NULL),
(6, 2, 'teavitus', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cust_message_status_type`
--

CREATE TABLE IF NOT EXISTS `cust_message_status_type` (
  `cust_message_status_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cust_message_status_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cust_message_type`
--

CREATE TABLE IF NOT EXISTS `cust_message_type` (
  `cust_message_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cust_message_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `c_group`
--

CREATE TABLE IF NOT EXISTS `c_group` (
  `c_group` int(30) NOT NULL AUTO_INCREMENT,
  `struct_unit` decimal(22,0) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`c_group`),
  KEY `c_group_idx1` (`struct_unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `employee` int(30) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `emp_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `current_position` decimal(22,0) DEFAULT NULL,
  `current_manager` decimal(22,0) DEFAULT NULL,
  `current_struct_unit` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `emp_role` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`employee`),
  KEY `employee_idx1` (`current_struct_unit`),
  KEY `employee_idx2` (`first_name`),
  KEY `employee_idx3` (`last_name`),
  KEY `employee_idx4` (`emp_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_struct_unit`
--

CREATE TABLE IF NOT EXISTS `employee_struct_unit` (
  `employee_struct_unit` int(30) NOT NULL AUTO_INCREMENT,
  `employee` decimal(22,0) NOT NULL,
  `struct_unit` decimal(22,0) NOT NULL,
  `relation_type` decimal(22,0) NOT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`employee_struct_unit`),
  KEY `employee_struct_unit_idx1` (`struct_unit`),
  KEY `employee_struct_unit_idx2` (`employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `emp_app_session`
--

CREATE TABLE IF NOT EXISTS `emp_app_session` (
  `emp_app_session` int(30) NOT NULL AUTO_INCREMENT,
  `employee` decimal(22,0) DEFAULT NULL,
  `emp_user` decimal(22,0) DEFAULT NULL,
  `session_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status_type` decimal(22,0) DEFAULT NULL,
  `session_start` datetime DEFAULT NULL,
  `session_end` datetime DEFAULT NULL,
  `last_action` datetime DEFAULT NULL,
  `app_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`emp_app_session`),
  KEY `emp_app_session_idx1` (`emp_user`),
  KEY `emp_app_session_idx2` (`employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `emp_role`
--

CREATE TABLE IF NOT EXISTS `emp_role` (
  `emp_role` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`emp_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_user`
--

CREATE TABLE IF NOT EXISTS `emp_user` (
  `emp_user` int(30) NOT NULL AUTO_INCREMENT,
  `employee` decimal(22,0) DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `passw` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `user_status_type` decimal(22,0) DEFAULT NULL,
  `user_status_date` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `last_session` decimal(22,0) DEFAULT NULL,
  `contact_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`emp_user`),
  UNIQUE KEY `emp_user_ux1` (`username`),
  KEY `emp_user_idx1` (`employee`),
  KEY `emp_user_idx2` (`passw`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `enterprise`
--

CREATE TABLE IF NOT EXISTS `enterprise` (
  `enterprise` int(30) NOT NULL AUTO_INCREMENT,
  `ent_type` decimal(22,0) DEFAULT NULL,
  `short_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `long_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `identity_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `ent_state_type` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`enterprise`),
  KEY `enteprise_idx1` (`short_name`),
  KEY `enteprise_idx2` (`long_name`),
  KEY `enteprise_idx3` (`identity_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `enterprise`
--

INSERT INTO `enterprise` (`enterprise`, `ent_type`, `short_name`, `long_name`, `identity_code`, `note`, `created`, `updated`, `created_by`, `updated_by`, `ent_state_type`) VALUES
(1, NULL, 'HP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, 'IBM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 'Oracle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, 'Microsoft', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, 'BMW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, 'Volkswagen-Audi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, 'Unisys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, 'Hitachi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, 'Microlink', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, 'Ordi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, NULL, 'Sun', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, NULL, 'SAP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, NULL, 'Dell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, NULL, 'Intel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, NULL, 'AMD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, NULL, 'Acer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, NULL, 'Fujitsu-Siemens', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, NULL, 'MSI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, NULL, 'Asustek', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, NULL, 'AOpen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, NULL, 'Abit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, NULL, 'Gigabyte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, NULL, 'Epson', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, NULL, 'Toshiba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, NULL, 'Sony', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, NULL, 'Panasonic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, NULL, 'Mitshubishi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, NULL, 'Mitac', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, NULL, 'Samsung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, NULL, 'Apple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, NULL, 'Elitegroup', 'Elitegroup Computer Systems\r\nElitegroup Computer Systems\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, NULL, 'RedHat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, NULL, 'Novell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, NULL, 'K-Arvutisalong', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, NULL, 'Gateway', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, NULL, 'Sharp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, NULL, 'Beko', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, NULL, 'Brandt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, NULL, 'Aiwa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, NULL, 'JVC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, NULL, 'Pioneer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, NULL, 'Canon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, NULL, 'Olympos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, NULL, 'Nikon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, NULL, 'NEC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, NULL, 'Teac', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, NULL, 'Zyxel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, NULL, 'Kyocera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, NULL, 'Lexmark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, NULL, 'Konica-Minolta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, NULL, 'LG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, NULL, 'Epox', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, NULL, 'Western Digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, NULL, 'Seagate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, NULL, 'Maxtor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, NULL, 'Philips', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, NULL, 'Kenwood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, NULL, 'PQI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, NULL, 'Enlight', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, NULL, 'Iomega', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, NULL, 'SMC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, NULL, '3Com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, NULL, 'Viewsonic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, NULL, 'Cisco', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, NULL, 'Antec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, NULL, 'Plextor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, NULL, 'Siemens', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, NULL, 'Nokia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, NULL, 'Motorola', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, NULL, 'Kingston', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, NULL, 'Lite-On', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, NULL, 'Powerware', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, NULL, 'Adaptec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, NULL, 'EMC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, NULL, 'Procase', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, NULL, 'Promise', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, NULL, 'Baltika', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, NULL, 'Standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, NULL, 'Jabil Circuit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, NULL, 'Solectron', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, NULL, 'Nortel Networks', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, NULL, 'Viisnurk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, NULL, 'Norma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, NULL, 'APC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, NULL, 'Pentax', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, NULL, 'BenQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, NULL, 'Casio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, NULL, 'Wacom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, NULL, 'AOC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, NULL, 'CTX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, NULL, 'Hansol', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, NULL, 'Renault', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, NULL, 'Miro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, NULL, 'Tulikivi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, NULL, 'If”', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, NULL, 'Bahco', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, NULL, 'Makita', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, NULL, 'Rannila', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, NULL, 'Svedbergs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, NULL, 'Gustavsberg\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, NULL, 'Volvo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, NULL, 'Kia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, NULL, 'Thorsman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enterprise_customer`
--

CREATE TABLE IF NOT EXISTS `enterprise_customer` (
  `enterprise_customer` int(30) NOT NULL AUTO_INCREMENT,
  `customer` decimal(22,0) DEFAULT NULL,
  `enterprise` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `relation_type` decimal(22,0) DEFAULT NULL,
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`enterprise_customer`),
  KEY `enteprise_customer_idx1` (`enterprise`),
  KEY `enteprise_customer_idx2` (`customer`),
  KEY `enteprise_customer_idx3` (`customer`,`enterprise`,`relation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ent_address`
--

CREATE TABLE IF NOT EXISTS `ent_address` (
  `ent_address` int(30) NOT NULL AUTO_INCREMENT,
  `enterprise` decimal(22,0) DEFAULT NULL,
  `zip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `house` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `county` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `parish` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `town_county` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `address_type` decimal(22,0) DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sms` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `country` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`ent_address`),
  KEY `ent_address_idx1` (`enterprise`),
  KEY `ent_address_idx2` (`zip`),
  KEY `ent_address_idx3` (`house`),
  KEY `ent_address_idx4` (`address`),
  KEY `ent_address_idx5` (`county`),
  KEY `ent_address_idx6` (`town_county`),
  KEY `ent_address_idx7` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ent_customer_relation_type`
--

CREATE TABLE IF NOT EXISTS `ent_customer_relation_type` (
  `ent_customer_relation_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ent_customer_relation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ent_relation`
--

CREATE TABLE IF NOT EXISTS `ent_relation` (
  `ent_relation` int(30) NOT NULL AUTO_INCREMENT,
  `enterprise` decimal(22,0) DEFAULT NULL,
  `enterprise1` decimal(22,0) DEFAULT NULL,
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ent_relation_type` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`ent_relation`),
  KEY `ent_relation_idx1` (`enterprise`),
  KEY `ent_relation_idx2` (`enterprise1`),
  KEY `ent_relation_idx3` (`enterprise`,`ent_relation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ent_relation_type`
--

CREATE TABLE IF NOT EXISTS `ent_relation_type` (
  `ent_relation_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ent_relation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ent_type`
--

CREATE TABLE IF NOT EXISTS `ent_type` (
  `ent_type` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ent_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ent_type`
--

INSERT INTO `ent_type` (`ent_type`, `name`, `description`) VALUES
(1, 'Suur', NULL),
(2, 'Keskmine', NULL),
(3, 'V„ike', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_`
--

CREATE TABLE IF NOT EXISTS `order_` (
  `order_` int(30) NOT NULL AUTO_INCREMENT,
  `order_status_type` decimal(22,0) DEFAULT NULL,
  `order_status_date` datetime DEFAULT NULL,
  `e_shop_chart` decimal(22,0) DEFAULT NULL,
  `contract` decimal(22,0) DEFAULT NULL,
  `customer` decimal(22,0) DEFAULT NULL,
  `order_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `shipping_address` decimal(22,0) DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `customer_confirmed` datetime DEFAULT NULL,
  `customer_confirmed_by` decimal(22,0) DEFAULT NULL,
  `payd` datetime DEFAULT NULL,
  `shipped` datetime DEFAULT NULL,
  `confirmed` datetime DEFAULT NULL,
  `confirmed_by` decimal(22,0) DEFAULT NULL,
  `completed` datetime DEFAULT NULL,
  `completed_by` decimal(22,0) DEFAULT NULL,
  `order_type` decimal(22,0) DEFAULT NULL,
  `d1` datetime DEFAULT NULL,
  `n1` decimal(22,0) DEFAULT NULL,
  `a1` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `d2` datetime DEFAULT NULL,
  `n2` decimal(22,0) DEFAULT NULL,
  `a2` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `struct_unit` decimal(22,0) DEFAULT NULL,
  `offer` decimal(22,0) DEFAULT NULL,
  `project` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`order_`),
  KEY `order_idx1` (`customer`),
  KEY `order_idx10` (`order_status_date`),
  KEY `order_idx11` (`order_status_type`),
  KEY `order_idx12` (`project`),
  KEY `order_idx13` (`offer`),
  KEY `order_idx2` (`contract`),
  KEY `order_idx3` (`order_number`),
  KEY `order_idx4` (`created_by`),
  KEY `order_idx5` (`created`),
  KEY `order_idx6` (`updated`),
  KEY `order_idx7` (`updated_by`),
  KEY `order_idx8` (`customer_confirmed`),
  KEY `order_idx9` (`shipping_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_customer`
--

CREATE TABLE IF NOT EXISTS `order_customer` (
  `order_customer` int(30) NOT NULL AUTO_INCREMENT,
  `customer` decimal(22,0) DEFAULT NULL,
  `order_` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `relation_type` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`order_customer`),
  KEY `order_customer_idx1` (`customer`),
  KEY `order_customer_idx2` (`order_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE IF NOT EXISTS `order_item` (
  `order_item` int(30) NOT NULL AUTO_INCREMENT,
  `order_` decimal(22,0) DEFAULT NULL,
  `item` decimal(22,0) DEFAULT NULL,
  `product` decimal(22,0) DEFAULT NULL,
  `item_count` decimal(22,0) DEFAULT NULL,
  `item_price` decimal(30,6) DEFAULT NULL,
  `item_type` decimal(22,0) DEFAULT NULL,
  `item_added` datetime DEFAULT NULL,
  PRIMARY KEY (`order_item`),
  KEY `order_item_idx1` (`order_`),
  KEY `order_item_idx2` (`product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_relation`
--

CREATE TABLE IF NOT EXISTS `order_relation` (
  `order_relation` int(30) NOT NULL AUTO_INCREMENT,
  `order_` decimal(22,0) DEFAULT NULL,
  `order1` decimal(22,0) DEFAULT NULL,
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `order_relation_type` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`order_relation`),
  KEY `order_relation_idx1` (`order_`),
  KEY `order_relation_idx2` (`order1`),
  KEY `order_relation_idx3` (`order_relation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_relation_type`
--

CREATE TABLE IF NOT EXISTS `order_relation_type` (
  `order_relation_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`order_relation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_relation_type`
--

INSERT INTO `order_relation_type` (`order_relation_type`, `name`, `description`) VALUES
(1, 'seotud pakkumise tellimus', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE IF NOT EXISTS `order_status` (
  `order_status` int(30) NOT NULL AUTO_INCREMENT,
  `order_` decimal(22,0) DEFAULT NULL,
  `order_status_type` decimal(22,0) DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `ended` datetime DEFAULT NULL,
  `ended_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`order_status`),
  KEY `order_status_idx1` (`order_`),
  KEY `order_status_idx2` (`order_status_type`),
  KEY `order_status_idx3` (`valid_from`),
  KEY `order_status_idx4` (`valid_to`),
  KEY `order_status_idx5` (`created`),
  KEY `order_status_idx6` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_status_class`
--

CREATE TABLE IF NOT EXISTS `order_status_class` (
  `order_status_class` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`order_status_class`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `order_status_class`
--

INSERT INTO `order_status_class` (`order_status_class`, `name`) VALUES
(1, 'Pakkumine'),
(2, 'Tellimus');

-- --------------------------------------------------------

--
-- Table structure for table `order_status_type`
--

CREATE TABLE IF NOT EXISTS `order_status_type` (
  `order_status_type` int(30) NOT NULL AUTO_INCREMENT,
  `order_status_class` decimal(22,0) DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`order_status_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `order_status_type`
--

INSERT INTO `order_status_type` (`order_status_type`, `order_status_class`, `name`) VALUES
(1, 1, 'Projekt'),
(2, 1, 'Koostaja kinnitus'),
(3, 1, 'Kliendi kinnitus'),
(4, 2, 'Ostukorv'),
(5, 2, 'Kliendi kinnitus'),
(6, 2, 'Vastuvätja kinnitus'),
(7, 2, 'Makstud'),
(8, 2, 'Komplekteerimisel'),
(9, 2, 'Tellijale v„ljastatud');

-- --------------------------------------------------------

--
-- Table structure for table `order_type`
--

CREATE TABLE IF NOT EXISTS `order_type` (
  `order_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`order_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_type`
--

INSERT INTO `order_type` (`order_type`, `name`, `description`) VALUES
(1, 'E-poe pakkumine', NULL),
(2, 'E-poe tellimus', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE IF NOT EXISTS `payment_type` (
  `payment_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`payment_type`, `name`) VALUES
(1, 'igakuine'),
(2, 'kvartaalne'),
(3, '2 korda aastas');

-- --------------------------------------------------------

--
-- Table structure for table `paym_graph`
--

CREATE TABLE IF NOT EXISTS `paym_graph` (
  `paym_graph` int(30) NOT NULL AUTO_INCREMENT,
  `payment_type` decimal(22,0) DEFAULT NULL,
  `customer` decimal(22,0) DEFAULT NULL,
  `order_` decimal(22,0) DEFAULT NULL,
  `payment_total` decimal(32,16) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `contract` decimal(22,0) DEFAULT NULL,
  `status` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`paym_graph`),
  KEY `paym_graph_idx1` (`order_`),
  KEY `paym_graph_idx2` (`customer`),
  KEY `paym_graph_idx3` (`payment_type`),
  KEY `paym_graph_idx4` (`due_date`),
  KEY `paym_graph_idx5` (`contract`),
  KEY `paym_graph_idx6` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paym_part`
--

CREATE TABLE IF NOT EXISTS `paym_part` (
  `paym_part` int(30) NOT NULL AUTO_INCREMENT,
  `paym_graph` decimal(22,0) DEFAULT NULL,
  `paym_part_type` decimal(22,0) DEFAULT NULL,
  `paym_amount` decimal(32,16) DEFAULT NULL,
  PRIMARY KEY (`paym_part`),
  KEY `paym_part_idx1` (`paym_graph`),
  KEY `paym_part_idx2` (`paym_part_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paym_part_type`
--

CREATE TABLE IF NOT EXISTS `paym_part_type` (
  `paym_part_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`paym_part_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paym_part_type`
--

INSERT INTO `paym_part_type` (`paym_part_type`, `name`, `description`) VALUES
(1, 'pähiosa', NULL),
(2, 'teenustasu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `process_step`
--

CREATE TABLE IF NOT EXISTS `process_step` (
  `process_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `step` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product` int(30) NOT NULL AUTO_INCREMENT,
  `enterprise` decimal(22,0) DEFAULT NULL,
  `product_type` decimal(22,0) DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `catalog` decimal(22,0) DEFAULT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `code1` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `price` decimal(30,6) DEFAULT NULL,
  `price2` decimal(30,6) DEFAULT NULL,
  `price3` decimal(30,6) DEFAULT NULL,
  `product_status_type` decimal(22,0) DEFAULT NULL,
  `producer` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`product`),
  KEY `product_idx10` (`price`),
  KEY `product_idx2` (`name`),
  KEY `product_idx3` (`catalog`),
  KEY `product_idx4` (`created`),
  KEY `product_idx5` (`updated`),
  KEY `product_idx6` (`description`(255)),
  KEY `product_idx7` (`enterprise`),
  KEY `product_idx8` (`producer`),
  KEY `product_idx9` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product`, `enterprise`, `product_type`, `created_by`, `catalog`, `code`, `code1`, `name`, `description`, `created`, `updated`, `updated_by`, `price`, `price2`, `price3`, `product_status_type`, `producer`) VALUES
(1, 0, NULL, NULL, NULL, 'ABC1', NULL, 'Dell Super 1', 'Dell Super 1 laptop description', '2012-03-04 21:17:40', '2012-03-04 21:17:40', NULL, 100.000000, NULL, NULL, NULL, 'DELL'),
(2, 0, NULL, NULL, NULL, 'ABC2', NULL, 'Dell Super 2', 'Dell Super 2 laptop description', '2012-03-04 21:17:28', '2012-03-04 21:17:28', NULL, 150.000000, NULL, NULL, NULL, 'DELL'),
(3, 0, NULL, NULL, NULL, 'APPLE1', NULL, 'Apple Super 1', 'Apple Super 1 laptop description', '2012-03-04 21:17:15', '2012-03-04 21:17:15', NULL, 200.000000, NULL, NULL, NULL, 'APPLE'),
(4, 0, NULL, NULL, NULL, 'HDD1', NULL, 'WD HDD 1', 'Wester Digital Hard drive 1 description', '2012-03-04 21:19:04', '2012-03-04 21:19:04', NULL, 50.000000, NULL, NULL, NULL, 'WD'),
(5, 0, NULL, NULL, NULL, 'HDD2', NULL, 'WD HDD 2', 'Wester Digital Hard drive two description', '2012-03-04 21:19:26', '2012-03-04 21:19:26', NULL, 60.000000, NULL, NULL, NULL, 'WD'),
(6, 0, NULL, NULL, NULL, 'HDD2', NULL, 'WD HDD 3', 'Wester Digital Hard drive three description', '2012-06-02 21:19:26', '2012-06-02 21:19:26', NULL, 60.000000, NULL, NULL, NULL, 'WD'),
(7, 0, NULL, NULL, NULL, 'APPLE2', NULL, 'Apple 2', 'Apple Super 2 lap', '2012-03-04 21:17:15', '2012-03-04 21:17:15', NULL, 500.000000, NULL, NULL, NULL, 'APPLE');

-- --------------------------------------------------------

--
-- Table structure for table `product_atr_type`
--

CREATE TABLE IF NOT EXISTS `product_atr_type` (
  `product_atr_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `required` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `uniq` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `selectable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `can_change` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `default_value` decimal(22,0) DEFAULT NULL,
  `default_value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`product_atr_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_atr_type_value`
--

CREATE TABLE IF NOT EXISTS `product_atr_type_value` (
  `product_atr_type_value` int(30) NOT NULL AUTO_INCREMENT,
  `product_atr_type` decimal(22,0) DEFAULT NULL,
  `value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`product_atr_type_value`),
  KEY `product_atr_type_value_idx1` (`product_atr_type`),
  KEY `product_atr_type_value_idx2` (`value_text`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

CREATE TABLE IF NOT EXISTS `product_attribute` (
  `product_attribute` int(30) NOT NULL AUTO_INCREMENT,
  `product_atr_type_value` decimal(22,0) DEFAULT NULL,
  `product_atr_type` decimal(22,0) DEFAULT NULL,
  `product` decimal(22,0) DEFAULT NULL,
  `value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `selectable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `can_change` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`product_attribute`),
  KEY `product_attribute_idx1` (`product`),
  KEY `product_attribute_idx2` (`product_atr_type_value`),
  KEY `product_attribute_idx3` (`product_atr_type`),
  KEY `product_attribute_idx4` (`value_text`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_catalog`
--

CREATE TABLE IF NOT EXISTS `product_catalog` (
  `product_catalog` int(30) NOT NULL AUTO_INCREMENT,
  `upper_catalog` decimal(22,0) DEFAULT NULL,
  `cat_level` decimal(22,0) DEFAULT NULL,
  `customer` decimal(22,0) DEFAULT NULL,
  `catalog_type` decimal(22,0) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `catalog_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `item_count` decimal(22,0) DEFAULT NULL,
  `last_item_updated` datetime DEFAULT NULL,
  `last_item_created` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `status_type` decimal(22,0) DEFAULT NULL,
  `struct_unit` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`product_catalog`),
  KEY `product_catalog_idx2` (`struct_unit`),
  KEY `product_catalog_idx3` (`name`),
  KEY `product_catalog_idx4` (`description`(255)),
  KEY `product_catalog_idx5` (`upper_catalog`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `product_catalog`
--

INSERT INTO `product_catalog` (`product_catalog`, `upper_catalog`, `cat_level`, `customer`, `catalog_type`, `name`, `catalog_code`, `description`, `item_count`, `last_item_updated`, `last_item_created`, `created_by`, `updated_by`, `created`, `updated`, `status_type`, `struct_unit`) VALUES
(1, NULL, NULL, NULL, NULL, 'Laptops', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, 'Components', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, 'Printers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, 'Monitors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_catalog_atr_type`
--

CREATE TABLE IF NOT EXISTS `product_catalog_atr_type` (
  `product_catalog_atr_type` int(30) NOT NULL AUTO_INCREMENT,
  `product_catalog` decimal(22,0) DEFAULT NULL,
  `product_atr_type` decimal(22,0) NOT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `status` decimal(22,0) DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`product_catalog_atr_type`),
  KEY `product_catalog_atr_type_idx1` (`product_catalog`),
  KEY `product_catalog_atr_type_idx2` (`product_atr_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_catalog_relation`
--

CREATE TABLE IF NOT EXISTS `product_catalog_relation` (
  `product_catalog_relation` int(30) NOT NULL AUTO_INCREMENT,
  `upper_catalog` decimal(22,0) DEFAULT NULL,
  `lower_catalog` decimal(22,0) DEFAULT NULL,
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `relation_type` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`product_catalog_relation`),
  UNIQUE KEY `product_catalog_relation_ux1` (`upper_catalog`,`lower_catalog`),
  KEY `product_catalog_relation_idx1` (`upper_catalog`),
  KEY `product_catalog_relation_idx2` (`lower_catalog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_product_catalog`
--

CREATE TABLE IF NOT EXISTS `product_product_catalog` (
  `product_product_catalog` int(30) NOT NULL AUTO_INCREMENT,
  `product_catalog` decimal(22,0) DEFAULT NULL,
  `product` decimal(22,0) DEFAULT NULL,
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `relation_type` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `deleted_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`product_product_catalog`),
  UNIQUE KEY `product_product_catalog_ux1` (`product`,`product_catalog`),
  KEY `product_product_catalog_idx1` (`product`),
  KEY `product_product_catalog_idx2` (`product_catalog`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `product_product_catalog`
--

INSERT INTO `product_product_catalog` (`product_product_catalog`, `product_catalog`, `product`, `note`, `relation_type`, `created`, `created_by`, `deleted`, `deleted_by`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `project` int(30) NOT NULL AUTO_INCREMENT,
  `project_status_type` decimal(22,0) DEFAULT NULL,
  `project_type` decimal(22,0) DEFAULT NULL,
  `struct_unit` decimal(22,0) DEFAULT NULL,
  `manager` decimal(22,0) DEFAULT NULL,
  `last_status_change` datetime DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`project`),
  KEY `project_idx1` (`name`),
  KEY `project_idx2` (`struct_unit`),
  KEY `project_idx3` (`manager`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_relation`
--

CREATE TABLE IF NOT EXISTS `project_relation` (
  `project_relation` int(30) NOT NULL AUTO_INCREMENT,
  `project` decimal(22,0) DEFAULT NULL,
  `project1` decimal(22,0) DEFAULT NULL,
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `relation_type` decimal(22,0) DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`project_relation`),
  KEY `project_relation_idx1` (`project`),
  KEY `project_relation_idx2` (`project1`),
  KEY `project_relation_idx3` (`project`,`relation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_relation_type`
--

CREATE TABLE IF NOT EXISTS `project_relation_type` (
  `project_relation_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`project_relation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_status`
--

CREATE TABLE IF NOT EXISTS `project_status` (
  `project_status` int(30) NOT NULL AUTO_INCREMENT,
  `project_status_type` decimal(22,0) DEFAULT NULL,
  `project` decimal(22,0) DEFAULT NULL,
  `status_start` datetime DEFAULT NULL,
  `status_end` datetime DEFAULT NULL,
  `prev_status` decimal(22,0) DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`project_status`),
  KEY `project_status_idx1` (`project`),
  KEY `project_status_idx2` (`project_status_type`),
  KEY `project_status_idx3` (`status_start`),
  KEY `project_status_idx4` (`status_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_status_type`
--

CREATE TABLE IF NOT EXISTS `project_status_type` (
  `project_status_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`project_status_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_status_type`
--

INSERT INTO `project_status_type` (`project_status_type`, `name`) VALUES
(1, 'planeerimisel'),
(2, 'k„igus'),
(3, 'läpetatud');

-- --------------------------------------------------------

--
-- Table structure for table `project_type`
--

CREATE TABLE IF NOT EXISTS `project_type` (
  `project_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`project_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_type`
--

INSERT INTO `project_type` (`project_type`, `name`, `description`) VALUES
(1, 'Mgikampaania', NULL),
(2, 'Partnerikampaania', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE IF NOT EXISTS `property` (
  `property` int(30) NOT NULL AUTO_INCREMENT,
  `property_type` decimal(22,0) DEFAULT NULL,
  `property_status_type` decimal(22,0) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value_amount` decimal(32,16) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`property`),
  KEY `property_idx1` (`property_type`),
  KEY `property_idx2` (`name`),
  KEY `property_idx3` (`created`),
  KEY `property_idx4` (`updated`),
  KEY `property_idx5` (`created_by`),
  KEY `property_idx6` (`updated_by`),
  KEY `property_idx8` (`description`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `property_atr_type`
--

CREATE TABLE IF NOT EXISTS `property_atr_type` (
  `property_atr_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `required` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `uniq` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `selectable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `can_change` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `default_value` decimal(22,0) DEFAULT NULL,
  `default_value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`property_atr_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `property_atr_value`
--

CREATE TABLE IF NOT EXISTS `property_atr_value` (
  `property_atr_value` int(30) NOT NULL AUTO_INCREMENT,
  `property_atr_type` decimal(22,0) DEFAULT NULL,
  `value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`property_atr_value`),
  KEY `property_atr_value_idx1` (`property_atr_type`),
  KEY `property_atr_value_idx2` (`value_text`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `property_attribute`
--

CREATE TABLE IF NOT EXISTS `property_attribute` (
  `property_attribute` int(30) NOT NULL AUTO_INCREMENT,
  `property_atr_value` decimal(22,0) DEFAULT NULL,
  `property_atr_type` decimal(22,0) DEFAULT NULL,
  `property` decimal(22,0) DEFAULT NULL,
  `value_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `selectable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `can_change` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderb` decimal(22,0) DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`property_attribute`),
  KEY `property_attribute_idx1` (`property`),
  KEY `property_attribute_idx2` (`property_atr_value`),
  KEY `property_attribute_idx3` (`property_atr_type`),
  KEY `property_attribute_idx4` (`value_text`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `property_class`
--

CREATE TABLE IF NOT EXISTS `property_class` (
  `property_class` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`property_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `property_class`
--

INSERT INTO `property_class` (`property_class`, `name`, `description`) VALUES
(1, 'säidukid', NULL),
(2, 'kinnisvara', NULL),
(3, 'arvutustehnika', NULL),
(4, 'koduelektroonika', NULL),
(5, 'meditsiinitehnika', NULL),
(6, 't””stusseadmed', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_relation`
--

CREATE TABLE IF NOT EXISTS `property_relation` (
  `property_relation` int(30) NOT NULL AUTO_INCREMENT,
  `property` decimal(22,0) DEFAULT NULL,
  `property1` decimal(22,0) DEFAULT NULL,
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` decimal(22,0) DEFAULT NULL,
  `relation_type` decimal(22,0) DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `updated_by` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`property_relation`),
  KEY `property_relation_idx1` (`property`),
  KEY `property_relation_idx2` (`property1`),
  KEY `property_relation_idx3` (`property`,`relation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `property_status`
--

CREATE TABLE IF NOT EXISTS `property_status` (
  `property_status` int(30) NOT NULL AUTO_INCREMENT,
  `property_status_type` decimal(22,0) DEFAULT NULL,
  `property` decimal(22,0) DEFAULT NULL,
  `status_start` datetime DEFAULT NULL,
  `status_end` datetime DEFAULT NULL,
  `prev_status` decimal(22,0) DEFAULT NULL,
  `created_by` decimal(22,0) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`property_status`),
  KEY `property_status_idx1` (`property`),
  KEY `property_status_idx2` (`property_status_type`),
  KEY `property_status_idx3` (`status_start`),
  KEY `property_status_idx4` (`status_end`),
  KEY `property_status_idx5` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `property_status_type`
--

CREATE TABLE IF NOT EXISTS `property_status_type` (
  `property_status_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`property_status_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `property_type`
--

CREATE TABLE IF NOT EXISTS `property_type` (
  `property_type` decimal(22,0) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `property_class` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`property_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `property_type`
--

INSERT INTO `property_type` (`property_type`, `name`, `description`, `property_class`) VALUES
(1, 'säiduauto', NULL, 1),
(2, 'kaubik', NULL, 1),
(3, 'buss', NULL, 1),
(4, 'veoauto', NULL, 1),
(5, 'j„relhaagis', NULL, 1),
(6, 'mootorratas', NULL, 1),
(7, 'traktor', NULL, 1),
(8, 'pällumajandusmasin', NULL, 1),
(9, 'korter', NULL, 2),
(10, 'eramu', NULL, 2),
(11, 'ridamaja', NULL, 2),
(12, 'kärvalhoone', NULL, 2),
(13, 'tootmishoone', NULL, 2),
(14, 'server', NULL, 3),
(15, 'andmesalvestus', NULL, 3),
(16, 't””jaam', NULL, 3),
(17, 'notebook', NULL, 3),
(20, 'printer', NULL, 3),
(21, 'värguseade', NULL, 3),
(22, 'televiisor', NULL, 4),
(23, 'hi-fi', NULL, 4),
(24, 'pesumasin', NULL, 4),
(25, 'klmkapp', NULL, 4),
(26, 'puidut””masin', NULL, 6),
(27, 'metalliläikemasin', NULL, 6),
(28, 'tästuk', NULL, 6),
(29, 'v„rvimisseade', NULL, 6),
(30, 'värgu tester', NULL, 6),
(31, 'auto diagnostika', NULL, 6),
(32, 'elektriseadmete diagnostika', NULL, 6),
(33, 'trkit””stus', NULL, 6),
(34, 'tektsiilimasinad', NULL, 6),
(35, 'plastmassivalu', NULL, 6),
(36, 'teletehnika', NULL, 6),
(37, 'nahat””stuse seade', NULL, 6),
(38, 'riide v„rvimise seade', NULL, 6),
(39, 'tselluloosit””stuse seade', NULL, 6),
(40, 'm””blit””stuse seade', NULL, 6),
(41, 'turvatehnika', NULL, 6),
(42, 'esitlustehnika', NULL, 6),
(43, 'metallivalu seade', NULL, 6),
(44, 'tomograaf', NULL, 5),
(45, 'hambaravi seade', NULL, 5),
(46, 'laserravi seade', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `prop_type_atrib`
--

CREATE TABLE IF NOT EXISTS `prop_type_atrib` (
  `prop_type_atrib` int(30) NOT NULL AUTO_INCREMENT,
  `property_type` decimal(22,0) DEFAULT NULL,
  `property_atr_type` decimal(22,0) DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`prop_type_atrib`),
  KEY `prop_type_atrib_idx1` (`property_atr_type`),
  KEY `prop_type_atrib_idx2` (`property_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `struct_unit`
--

CREATE TABLE IF NOT EXISTS `struct_unit` (
  `struct_unit` int(30) NOT NULL AUTO_INCREMENT,
  `struct_unit_type` decimal(22,0) NOT NULL,
  `unit_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `upper_unit` decimal(22,0) DEFAULT NULL,
  `name_in_en` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`struct_unit`),
  KEY `struct_unit_idx1` (`upper_unit`),
  KEY `struct_unit_idx2` (`unit_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `struct_unit`
--

INSERT INTO `struct_unit` (`struct_unit`, `struct_unit_type`, `unit_code`, `name`, `description`, `upper_unit`, `name_in_en`) VALUES
(1, 1, 'HC1', 'Peakontor', 'Peakontor', 0, 'Main office'),
(2, 2, 'STORE1', 'Metsapood', 'Metsas asuv pood', 1, 'Forest shop'),
(3, 2, 'SP1', 'Spordivahendid 1', 'Spordivahendite pood', 1, 'Sports1'),
(4, 2, 'SP2', 'Spordivahendid- suusapood', 'Suusad', 1, 'SportsWinter'),
(5, 2, 'RM1', 'Meditsiiniraamatud', 'Meditsiiniraamatute pood', 1, 'MedBook'),
(6, 2, 'RM2', 'Tehnikaraamatute pood', 'tehnikaraamat', 1, 'TechBook'),
(7, 2, 'EL1', 'Elektroonika kauplus', 'elektroonikapood', 1, 'Electronics'),
(8, 2, 'IT1', 'Arvutipood', 'arvutustehnika', 1, 'PC products'),
(9, 2, 'IT2', 'Arvutipood ettevätetele', 'serverid', 1, 'IT Enterprise'),
(10, 2, 'OF1', 'Kontoritarbed1', 'Kontoritarvete pood pealinnas', 1, 'Office1'),
(11, 2, 'OF2', 'Kontoritarbed2', 'Kontoritarbed linnas2', 1, 'Office2'),
(12, 2, 'CR1', 'Autotarvikud1', 'Autotarvikute pood', 1, 'Car 1'),
(13, 2, 'FR1', 'M””bel1', 'M””blipood', 1, 'Furniture 1'),
(14, 2, 'SF1', 'Tarkvara1', 'Kontoritarkvara', 1, 'Software1'),
(15, 2, 'KC1', 'K””gitarbed', 'K””gitarvete pood', 1, 'Kitchen 1'),
(16, 2, 'CD1', 'Plaadipood1', 'Plaadipood', 1, 'Music1'),
(17, 2, 'SF2', 'Tarkvara2', 'Tarkvara2', 1, 'Software2'),
(18, 2, 'OF3', 'Kontoritarbed3', 'Kontoritarbed3', 1, 'Office3'),
(19, 2, 'TC1', 'Piletid', 'Piletite pood', 1, 'Tickets'),
(20, 2, 'PH1', 'Telefonid1', 'Telefoni pood 1', 1, 'Phones1'),
(21, 2, 'PH2', 'Telefonid2', 'Telefoni pood2', 1, 'Phones2'),
(22, 2, 'PH3', 'Telefonid3', 'Telefoni pood 3', 1, 'Phones3'),
(23, 2, 'BL1', 'Ehituspood', 'Ehitustarved', 1, 'Building materials'),
(24, 2, 'SF3', 'Tarkvara3', 'Tarkvara3', 1, 'Software3'),
(25, 2, 'MP3_1', 'Muusika mp3_1', 'Mp3_1', 1, 'mp3_1'),
(26, 2, 'MP3_2', 'Muusika mp3_2', 'Mp3_2', 1, 'mp3_2'),
(27, 2, 'GRDN1', 'Aiatarbed 1', 'Aiatarvete pood 1', 1, 'Garden 1'),
(28, 2, 'GRDN2', 'Aiatarbed 2', 'Aiatarvete pood 2', 1, 'Garden 2'),
(29, 2, 'GRDN3', 'Aiatarbed 3', 'Aiatarvete pood 3', 1, 'Garden 3'),
(30, 2, 'TOY1', 'M„nguasjad 1', 'M„nguasjade pood 1', 1, 'Toys 1'),
(31, 2, 'TOY2', 'M„nguasjad 2', 'M„nguasjade pood 2', 1, 'Toys 2'),
(32, 2, 'TOY3', 'M„nguasjad 3', 'M„nguasjade pood 3', 1, 'Toys 3'),
(33, 2, 'ZOO1', 'Zoo 1', 'Zookauplus 1', 1, 'Zoo1'),
(34, 2, 'ZOO2', 'Zoo 2', 'Zookauplus 2', 1, 'Zoo 2'),
(35, 2, 'FR2                ', 'M””bel 2', 'M””blipood 2', 1, 'Furniture 2'),
(36, 2, 'FR3', 'M””bel 3', 'M””blipood 3', 1, 'Furniture 3'),
(37, 2, 'EL2', 'Elektroonika kauplus 2', 'elektroonikapood 2', 1, 'Electronics'),
(38, 2, 'KT1', 'K””gitehnika 1', 'K””gitehnika pood 1', 1, 'Kitchen technics'),
(39, 2, 'KT2', 'K””gitehnika 2', 'K””gitehnika pood 2', 1, 'Kitchen technics'),
(40, 2, 'VG1', 'Videom„ngud 1', 'Videom„ngud 1', 1, 'Video games 1'),
(41, 2, 'VG2', 'Videom„ngud 2', 'Videom„ngud 2', 1, 'Video games 2'),
(42, 2, 'VG3 ', 'Videom„ngud 3', 'Videom„ngud 3', 1, 'Video games 3'),
(43, 2, 'CM1', 'Ehitusmasinad 1', 'Ehitusmasinad 1', 1, 'Construction machines 1'),
(44, 2, 'CM2', 'Ehitusmasinad 2', 'Ehitusmasinad 2', 1, 'Construction machines 2'),
(45, 2, 'ELTLS1', 'El. t””riistad 1', 'Elektrilised t””riistad 1', 1, 'Electrical tools 1'),
(46, 2, 'ELTLS2', 'El. t””riistad 2', 'Elektrilised t””riistad 2', 1, 'Electrical tools 2'),
(47, 2, 'TLS1', 'T””riistad 1', 'T””riistad 1', 1, 'Tools 1'),
(48, 2, 'TLS2', 'T””riistad 2', 'T””riistad 2', 1, 'Tools 2'),
(49, 2, 'TLS3', 'T””riistad 3', 'T””riistad 3', 1, 'Tools 3'),
(50, 2, 'CD2', 'Plaadipood 2', 'Plaadipood 2', 1, 'Music2'),
(51, 2, 'KNV1', 'Taskunoad', 'Taskunoad 1', 1, 'Knives 1'),
(52, 2, 'GRDNF1', 'Aiam””bel 1', 'Aiam””bel 1', 1, 'Garden furniture 1'),
(53, 2, 'GRDNF2', 'Aiam””bel 2', 'Aiam””bel 2', 1, 'Garden furniture 2'),
(54, 2, 'PHOT1', 'Fototarbed 1', 'Fototarbed 1', 1, 'Photo 1'),
(55, 2, 'PHOT2', 'Fototarbed 2', 'Fototarbed 2', 1, 'Photo 2'),
(56, 2, 'PHOT3', 'Fototarbed 3', 'Fototarbed 3', 1, 'Photo 3'),
(57, 2, 'BAT1', 'Akud', 'Akud ja patareid', 1, 'Batteries 1'),
(58, 2, 'PR1', 'Printerid', 'Printerid ja plotterid', 1, 'Printers and plotters'),
(59, 2, 'ART1', 'Kunst 1', 'Kunst', 1, 'Art 1'),
(60, 2, 'TV1', 'Televiisorid', 'Televiisorid', 1, 'TV1'),
(61, 2, 'PDA1', 'Pihuarvutid', 'Pihuarvutid', 1, 'PDA1'),
(62, 2, 'SM1', 'Salvestusmeedia', 'Salvestusmeedia (lindid, CF, SD , xD)', 1, 'Storage media 1'),
(63, 2, 'JW1', 'Juveelid', 'Juveelid', 1, 'Jewelry 1'),
(64, 2, 'WTCH1', 'Kellad 1', 'Kellad 1', 1, 'Watches 1'),
(65, 2, 'WTCH2', 'Kellad 2', 'Kellad 2', 1, 'Watches 2'),
(66, 2, 'RF1', 'Katusekattematerjalid', 'Katusekattematerjalid', 1, 'Roof materials 1'),
(67, 2, 'CW1', 'Kpsetusnäud', 'Kpsetusnäud (cookware)', 1, 'Cookware 1'),
(68, 2, 'SH1', 'Kingad 1', 'Kingad 1', 1, 'Shoes 1'),
(69, 2, 'SH2', 'Kingad 2', 'Kingad 2', 1, 'Shoes 2'),
(70, 2, 'V1', 'Video 1', 'Video 1', 1, 'Video 1'),
(71, 2, 'V2', 'Video 2', 'Video 2', 1, 'Video 2'),
(72, 2, 'V3', 'Video 3', 'Video 3', 1, 'Video 3'),
(73, 2, 'V4', 'Video 4', 'Video 4', 1, 'Video 4'),
(74, 2, 'LT1', 'Valgustid 1', 'Valgustid 1', 1, 'Lights 1'),
(75, 2, 'LT2', 'Valgustid 2', 'Valgusid 2', 1, 'Lights 2'),
(76, 2, 'GFT1', 'Kingitused 1', 'Kingitused 1', 1, 'Gifts 1'),
(77, 2, 'GFT2', 'Kingitused 2', 'Kingitused 2', 1, 'Gifts 2'),
(78, 2, 'PHAR1', 'Ravimid 1', 'Ravimid 1', 1, 'Pharmatseutics 1'),
(79, 2, 'PHAR2', 'Ravimid 2', 'Ravimid 2', 1, 'Pharmatseutics 2'),
(80, 2, 'IT3', 'Arvutustehnika rent', 'Arvutustehnika rent', 1, 'IT rent'),
(81, 2, 'IT4', 'Projektorid', 'Projektorid', 1, 'Projektorid'),
(82, 2, 'RM3', 'Raamatud 3', 'Raamatud 3', 1, 'Books 3'),
(83, 2, 'RM4', 'Raamatud 4', 'Raamatud 4', 1, 'Books 4'),
(84, 2, 'RM5', 'Raamatud 5', 'Raamatud 5', 1, 'Books 5'),
(85, 2, 'BLD1', 'Ehitusmaterjalid 1', 'Ehitusmaterjalid 1', 1, 'Building 1'),
(86, 2, 'BLD2', 'Ehitusmaterjalid 2', 'Ehitusmaterjalid 2', 1, 'Building 2'),
(87, 2, 'BLD3', 'Ehitusmaterjalid 3', 'Ehitusmaterjalid 3', 1, 'Building 3'),
(88, 2, 'WSH1', 'Pesumasinad', 'Pesumasinad', 1, 'Washing machines'),
(89, 2, 'IT5', 'Kävakettad', 'Kävakettad', 1, 'Hard disks'),
(90, 2, 'IT6', 'Andmesalvestus', 'Andmesalvestus ja arhiveerimine', 1, 'IT Storage'),
(91, 2, 'HCE1', 'Kodukeemia', 'Kodukeemia', 1, 'Home chemistry'),
(92, 2, 'MT1', 'Muusikariistad 1', 'Muusikariistad 1', 1, 'Music equipment 1'),
(93, 2, 'MT2', 'Muusikariistad 2', 'Muusikariistad 2', 1, 'Music equipment 2'),
(94, 2, 'MT3', 'Muusikariistad 3', 'Muusikariistad 3', 1, 'Music equipment 3'),
(95, 2, 'LXF1', 'Luksusm””bel 1', 'Luksusm””bel 1', 1, 'Luxury furniture 1'),
(96, 2, 'LXF2', 'Luksusm””bel 2', 'Luksusm””bel 2', 1, 'Luxury furniture 2'),
(97, 2, 'IT7', 'Arvutid 7', 'Arvutid 7', 1, 'IT 7'),
(98, 2, 'CR2', 'Autotarvikud 2', 'Autotarvikud 2', 1, 'Car 2'),
(99, 2, 'CR3', 'Autotarvikud 3', 'Autotarvikud 3', 1, 'Car 3'),
(100, 2, 'CR4', 'Autotarvikud 4', 'Autotarvikud 4', 1, 'Car 4');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
