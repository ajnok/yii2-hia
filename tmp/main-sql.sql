-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema hia
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hia` ;

-- -----------------------------------------------------
-- Schema hia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hia` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `hia` ;

-- -----------------------------------------------------
-- Table `hia`.`region`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hia`.`region` ;

CREATE TABLE IF NOT EXISTS `hia`.`region` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสอ้างอิง',
  `bot_code` VARCHAR(6) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT 'รหัสภูมิภาคอ้างอิงตามธปท.',
  `dopa_code` VARCHAR(6) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT 'รหัสภูมิภาคอ้างอิงตามกรมการปกครอง (ไม่จำเป็น)',
  `name` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT 'ภาค',
  `note` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT 'หมายเหตุ',
  `dt_create` TIMESTAMP NULL DEFAULT NULL COMMENT 'วันที่สร้าง',
  `ts_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่ปรับปรุงล่าสุด',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `bot_code` (`bot_code` ASC, `name` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `bot_code_UNIQUE` (`bot_code` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `dopa_code_UNIQUE` (`dopa_code` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hia`.`province`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hia`.`province` ;

CREATE TABLE IF NOT EXISTS `hia`.`province` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสอ้างอิง',
  `bot_code` VARCHAR(6) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT 'รหัสจังหวัดอ้างอิงตามธปท.',
  `dopa_code` VARCHAR(6) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT 'รหัสจังหวัดอ้างอิงตามกรมการปกครอง',
  `name` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT 'จังหวัด',
  `note` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT 'หมายเหตุ',
  `dt_create` TIMESTAMP NULL DEFAULT NULL COMMENT 'วันที่สร้าง',
  `ts_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่ปรับปรุงล่าสุด',
  `region_id` INT(11) NOT NULL COMMENT '(อ้างอิง) รหัสอ้างอิงภูมิภาค',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `bot_code` (`bot_code` ASC, `name` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `dopa_code_UNIQUE` (`dopa_code` ASC),
  UNIQUE INDEX `bot_code_UNIQUE` (`bot_code` ASC),
  INDEX `region_id_idx` (`region_id` ASC),
  CONSTRAINT `region_id`
    FOREIGN KEY (`region_id`)
    REFERENCES `hia`.`region` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hia`.`district`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hia`.`district` ;

CREATE TABLE IF NOT EXISTS `hia`.`district` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสอ้างอิง',
  `bot_code` VARCHAR(6) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT 'รหัสอำเภออ้างอิงตามธปท.',
  `dopa_code` VARCHAR(6) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT 'รหัสอำเภออ้างอิงตามกรมการปกครอง',
  `name` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT 'อำเภอ/เขต',
  `note` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT 'หมายเหตุ',
  `dt_create` TIMESTAMP NULL DEFAULT NULL COMMENT 'วันที่สร้าง',
  `ts_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่ปรับปรุงล่าสุด',
  `province_id` INT(11) NOT NULL COMMENT '(อ้างอิง) รหัสอ้างอิงจังหวัด',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `bot_code` (`bot_code` ASC, `name` ASC),
  UNIQUE INDEX `dopa_code_UNIQUE` (`dopa_code` ASC),
  UNIQUE INDEX `bot_code_UNIQUE` (`bot_code` ASC),
  INDEX `province_id_idx` (`province_id` ASC),
  CONSTRAINT `province_id`
    FOREIGN KEY (`province_id`)
    REFERENCES `hia`.`province` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hia`.`subdistrict`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hia`.`subdistrict` ;

CREATE TABLE IF NOT EXISTS `hia`.`subdistrict` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสอ้างอิง',
  `bot_code` VARCHAR(6) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT 'รหัสตำบลอ้างอิงตามธปท. (ไม่จำเป็น)',
  `dopa_code` VARCHAR(6) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT 'รหัสตำบลอ้างอิงตามกรมการปกครอง (ไม่จำเป็น)',
  `thaitambon_code` VARCHAR(6) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT 'รหัสตำบลอ้างอิงตาม Thaitambon.com',
  `name` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT 'ตำบล/แขวง',
  `note` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT 'หมายเหตุ',
  `dt_create` TIMESTAMP NULL DEFAULT NULL COMMENT 'วันที่สร้าง',
  `ts_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่ปรับปรุงล่าสุด',
  `district_id` INT(11) NOT NULL COMMENT '(อ้างอิง) รหัสอ้างอิงอำเภอ',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `bot_code` (`bot_code` ASC, `name` ASC),
  UNIQUE INDEX `dopa_code_UNIQUE` (`dopa_code` ASC),
  UNIQUE INDEX `bot_code_UNIQUE` (`bot_code` ASC),
  UNIQUE INDEX `thaitambon_code_UNIQUE` (`thaitambon_code` ASC),
  INDEX `district_id_idx` (`district_id` ASC),
  CONSTRAINT `district_id`
    FOREIGN KEY (`district_id`)
    REFERENCES `hia`.`district` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
