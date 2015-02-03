-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Feb 02, 2015 at 05:54 PM
-- Server version: 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `hia`
--
DROP DATABASE `hia`;
CREATE DATABASE IF NOT EXISTS `hia` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hia`;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
CREATE TABLE IF NOT EXISTS `district` (
`id` int(11) NOT NULL COMMENT 'รหัสอ้างอิง',
  `bot_code` varchar(6) NOT NULL COMMENT 'รหัสอำเภออ้างอิงตามธปท.',
  `dopa_code` varchar(6) NOT NULL COMMENT 'รหัสอำเภออ้างอิงตามกรมการปกครอง',
  `name` varchar(20) NOT NULL COMMENT 'อำเภอ/เขต',
  `note` varchar(100) DEFAULT NULL COMMENT 'หมายเหตุ',
  `dt_create` timestamp NULL DEFAULT NULL COMMENT 'วันที่สร้าง',
  `ts_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่ปรับปรุงล่าสุด',
  `province_id` int(11) NOT NULL COMMENT '(อ้างอิง) รหัสอ้างอิงจังหวัด'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1422888904),
('m140209_132017_init', 1422888921),
('m140403_174025_create_account_table', 1422888921),
('m140504_113157_update_tables', 1422888923),
('m140504_130429_create_token_table', 1422888923),
('m140830_171933_fix_ip_field', 1422888924),
('m140830_172703_change_account_table_name', 1422888924),
('m141222_110026_update_ip_field', 1422888924);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(32) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bio` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`) VALUES
(1, NULL, NULL, 'ajnok@ajnok.ajnok', 'f4da23dbf246ca6c9825d32ababb426b', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
`id` int(11) NOT NULL COMMENT 'รหัสอ้างอิง',
  `bot_code` varchar(6) NOT NULL COMMENT 'รหัสจังหวัดอ้างอิงตามธปท.',
  `dopa_code` varchar(6) NOT NULL COMMENT 'รหัสจังหวัดอ้างอิงตามกรมการปกครอง',
  `name` varchar(20) NOT NULL COMMENT 'จังหวัด',
  `note` varchar(100) DEFAULT NULL COMMENT 'หมายเหตุ',
  `dt_create` timestamp NULL DEFAULT NULL COMMENT 'วันที่สร้าง',
  `ts_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่ปรับปรุงล่าสุด',
  `region_id` int(11) NOT NULL COMMENT '(อ้างอิง) รหัสอ้างอิงภูมิภาค'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
`id` int(11) NOT NULL COMMENT 'รหัสอ้างอิง',
  `bot_code` varchar(6) NOT NULL COMMENT 'รหัสภูมิภาคอ้างอิงตามธปท.',
  `dopa_code` varchar(6) DEFAULT NULL COMMENT 'รหัสภูมิภาคอ้างอิงตามกรมการปกครอง (ไม่จำเป็น)',
  `name` varchar(20) NOT NULL COMMENT 'ภาค',
  `note` varchar(100) DEFAULT NULL COMMENT 'หมายเหตุ',
  `dt_create` timestamp NULL DEFAULT NULL COMMENT 'วันที่สร้าง',
  `ts_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่ปรับปรุงล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `social_account`
--

DROP TABLE IF EXISTS `social_account`;
CREATE TABLE IF NOT EXISTS `social_account` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subdistrict`
--

DROP TABLE IF EXISTS `subdistrict`;
CREATE TABLE IF NOT EXISTS `subdistrict` (
`id` int(11) NOT NULL COMMENT 'รหัสอ้างอิง',
  `bot_code` varchar(6) DEFAULT NULL COMMENT 'รหัสตำบลอ้างอิงตามธปท. (ไม่จำเป็น)',
  `dopa_code` varchar(6) DEFAULT NULL COMMENT 'รหัสตำบลอ้างอิงตามกรมการปกครอง (ไม่จำเป็น)',
  `thaitambon_code` varchar(6) NOT NULL COMMENT 'รหัสตำบลอ้างอิงตาม Thaitambon.com',
  `name` varchar(20) NOT NULL COMMENT 'ตำบล/แขวง',
  `note` varchar(100) DEFAULT NULL COMMENT 'หมายเหตุ',
  `dt_create` timestamp NULL DEFAULT NULL COMMENT 'วันที่สร้าง',
  `ts_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่ปรับปรุงล่าสุด',
  `district_id` int(11) NOT NULL COMMENT '(อ้างอิง) รหัสอ้างอิงอำเภอ'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`) VALUES
(1, 'ajnok', 'ajnok@ajnok.ajnok', '$2y$10$AqoJ.qYMYGucGYp0vkcwkuF3Sl9bzZmnqsHM6pJI6HMO9wNqrD9WW', 'MrYhjDGM0qWAn-YmQmW1JHzTAOxIvl3u', NULL, NULL, NULL, '::1', 1422891494, 1422891494, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `district`
--
ALTER TABLE `district`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `bot_code` (`bot_code`,`name`), ADD UNIQUE KEY `dopa_code_UNIQUE` (`dopa_code`), ADD UNIQUE KEY `bot_code_UNIQUE` (`bot_code`), ADD KEY `province_id_idx` (`province_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
 ADD PRIMARY KEY (`version`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
 ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `bot_code` (`bot_code`,`name`), ADD UNIQUE KEY `name_UNIQUE` (`name`), ADD UNIQUE KEY `dopa_code_UNIQUE` (`dopa_code`), ADD UNIQUE KEY `bot_code_UNIQUE` (`bot_code`), ADD KEY `region_id_idx` (`region_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `bot_code` (`bot_code`,`name`), ADD UNIQUE KEY `name_UNIQUE` (`name`), ADD UNIQUE KEY `bot_code_UNIQUE` (`bot_code`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `dopa_code_UNIQUE` (`dopa_code`);

--
-- Indexes for table `social_account`
--
ALTER TABLE `social_account`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `account_unique` (`provider`,`client_id`), ADD KEY `fk_user_account` (`user_id`);

--
-- Indexes for table `subdistrict`
--
ALTER TABLE `subdistrict`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `thaitambon_code_UNIQUE` (`thaitambon_code`), ADD UNIQUE KEY `bot_code` (`bot_code`,`name`), ADD UNIQUE KEY `dopa_code_UNIQUE` (`dopa_code`), ADD UNIQUE KEY `bot_code_UNIQUE` (`bot_code`), ADD KEY `district_id_idx` (`district_id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
 ADD UNIQUE KEY `token_unique` (`user_id`,`code`,`type`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_unique_username` (`username`), ADD UNIQUE KEY `user_unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสอ้างอิง',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสอ้างอิง',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสอ้างอิง';
--
-- AUTO_INCREMENT for table `social_account`
--
ALTER TABLE `social_account`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subdistrict`
--
ALTER TABLE `subdistrict`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสอ้างอิง',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `district`
--
ALTER TABLE `district`
ADD CONSTRAINT `province_id` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `province`
--
ALTER TABLE `province`
ADD CONSTRAINT `region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `social_account`
--
ALTER TABLE `social_account`
ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subdistrict`
--
ALTER TABLE `subdistrict`
ADD CONSTRAINT `district_id` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `token`
--
ALTER TABLE `token`
ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
