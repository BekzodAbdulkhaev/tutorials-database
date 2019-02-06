-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 항공사
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 항공사
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `항공사` DEFAULT CHARACTER SET utf8 ;
USE `항공사` ;

-- -----------------------------------------------------
-- Table `항공사`.`회원`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `항공사`.`회원` ;

CREATE TABLE IF NOT EXISTS `항공사`.`회원` (
  `회원아이디` INT NOT NULL AUTO_INCREMENT,
  `성명` VARCHAR(45) NOT NULL,
  `비밀번호` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`회원아이디`),
  UNIQUE INDEX `회원아이디_UNIQUE` (`회원아이디` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `항공사`.`신용카드`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `항공사`.`신용카드` ;

CREATE TABLE IF NOT EXISTS `항공사`.`신용카드` (
  `신용카드번호` INT NOT NULL,
  `유효기간` DATETIME NOT NULL,
  `회원아이디` INT NULL,
  PRIMARY KEY (`신용카드번호`, `회원아이디`),
  INDEX `fk_신용카드_회원_idx` (`회원아이디` ASC) VISIBLE,
  CONSTRAINT `fk_신용카드_회원`
    FOREIGN KEY (`회원아이디`)
    REFERENCES `항공사`.`회원` (`회원아이디`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `항공사`.`비행기`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `항공사`.`비행기` ;

CREATE TABLE IF NOT EXISTS `항공사`.`비행기` (
  `비행기번호` INT NOT NULL,
  `출발시간` DATETIME NOT NULL,
  `출발날짜` DATETIME NOT NULL,
  PRIMARY KEY (`비행기번호`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `항공사`.`좌석`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `항공사`.`좌석` ;

CREATE TABLE IF NOT EXISTS `항공사`.`좌석` (
  `좌석번호` INT NOT NULL,
  `등급` VARCHAR(10) NOT NULL,
  `비행기번호` INT NOT NULL,
  PRIMARY KEY (`좌석번호`),
  UNIQUE INDEX `id좌석_UNIQUE` (`좌석번호` ASC) VISIBLE,
  INDEX `fk_좌석_비행기1_idx` (`비행기번호` ASC) VISIBLE,
  CONSTRAINT `fk_좌석_비행기1`
    FOREIGN KEY (`비행기번호`)
    REFERENCES `항공사`.`비행기` (`비행기번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `항공사`.`회원_예약_비행기`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `항공사`.`회원_예약_비행기` ;

CREATE TABLE IF NOT EXISTS `항공사`.`회원_예약_비행기` (
  `회원아이디` INT NOT NULL,
  `비행기번호` INT NOT NULL,
  PRIMARY KEY (`회원아이디`, `비행기번호`),
  INDEX `fk_회원_has_비행기_비행기1_idx` (`비행기번호` ASC) VISIBLE,
  INDEX `fk_회원_has_비행기_회원1_idx` (`회원아이디` ASC) VISIBLE,
  CONSTRAINT `fk_회원_has_비행기_회원1`
    FOREIGN KEY (`회원아이디`)
    REFERENCES `항공사`.`회원` (`회원아이디`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_회원_has_비행기_비행기1`
    FOREIGN KEY (`비행기번호`)
    REFERENCES `항공사`.`비행기` (`비행기번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
