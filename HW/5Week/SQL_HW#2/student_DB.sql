-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema S_test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema S_test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `S_test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `S_test` ;

-- -----------------------------------------------------
-- Table `S_test`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S_test`.`department` (
  `dep` INT NOT NULL,
  `department_name` VARCHAR(45) NULL,
  `department_` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`dep`, `department_name`),
  UNIQUE INDEX `department_name_UNIQUE` (`department_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `S_test`.`student_ID`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S_test`.`student_ID` (
  `sid` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `age` VARCHAR(45) NOT NULL,
  `student_number` VARCHAR(45) NOT NULL,
  `department_dep` INT NOT NULL,
  PRIMARY KEY (`sid`, `student_number`),
  INDEX `fk_student_ID_department1_idx` (`department_dep` ASC) VISIBLE,
  CONSTRAINT `fk_student_ID_department1`
    FOREIGN KEY (`department_dep`)
    REFERENCES `S_test`.`department` (`dep`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `S_test`.`class_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S_test`.`class_info` (
  `idclass_info` INT NOT NULL,
  `department_dep` INT NOT NULL,
  `class_name` VARCHAR(45) NOT NULL,
  `class_code` INT NOT NULL,
  `student_ID_sid` INT NOT NULL,
  `student_ID_student_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idclass_info`, `class_code`),
  INDEX `fk_class_info_department1_idx` (`department_dep` ASC) VISIBLE,
  INDEX `fk_class_info_student_ID1_idx` (`student_ID_sid` ASC, `student_ID_student_number` ASC) VISIBLE,
  CONSTRAINT `fk_class_info_department1`
    FOREIGN KEY (`department_dep`)
    REFERENCES `S_test`.`department` (`dep`),
  CONSTRAINT `fk_class_info_student_ID1`
    FOREIGN KEY (`student_ID_sid` , `student_ID_student_number`)
    REFERENCES `S_test`.`student_ID` (`sid` , `student_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `S_test`.`building_number`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S_test`.`building_number` (
  `class_info_idclass_info` INT NOT NULL,
  `class_info_idclass_info1` INT NOT NULL,
  `building_number` VARCHAR(100) NOT NULL,
  `department_dep` INT NOT NULL,
  `department_department_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`class_info_idclass_info`, `building_number`),
  INDEX `fk_building_number_class_info1_idx` (`class_info_idclass_info1` ASC) VISIBLE,
  INDEX `fk_building_number_department1_idx` (`department_dep` ASC, `department_department_name` ASC) VISIBLE,
  CONSTRAINT `fk_building_number_class_info1`
    FOREIGN KEY (`class_info_idclass_info1`)
    REFERENCES `S_test`.`class_info` (`idclass_info`),
  CONSTRAINT `fk_building_number_department1`
    FOREIGN KEY (`department_dep` , `department_department_name`)
    REFERENCES `S_test`.`department` (`dep` , `department_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `S_test`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S_test`.`user` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(64) NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE INDEX `uid_UNIQUE` (`uid` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `S_test`.`purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S_test`.`purchase` (
  `pcid` INT NOT NULL AUTO_INCREMENT,
  `user_uid` INT NOT NULL,
  PRIMARY KEY (`pcid`),
  UNIQUE INDEX `pcid_UNIQUE` (`pcid` ASC) VISIBLE,
  INDEX `fk_buy_user_idx` (`user_uid` ASC) VISIBLE,
  CONSTRAINT `fk_buy_user`
    FOREIGN KEY (`user_uid`)
    REFERENCES `S_test`.`user` (`uid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `S_test`.`proudct`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S_test`.`proudct` (
  `ipd` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `pd_content` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`ipd`),
  UNIQUE INDEX `ipd_UNIQUE` (`ipd` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `S_test`.`buy_has_proudct`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S_test`.`buy_has_proudct` (
  `buy_pcid` INT NOT NULL,
  `proudct_ipd` INT NOT NULL,
  PRIMARY KEY (`buy_pcid`, `proudct_ipd`),
  INDEX `fk_buy_has_proudct_proudct1_idx` (`proudct_ipd` ASC) VISIBLE,
  INDEX `fk_buy_has_proudct_buy1_idx` (`buy_pcid` ASC) VISIBLE,
  CONSTRAINT `fk_buy_has_proudct_buy1`
    FOREIGN KEY (`buy_pcid`)
    REFERENCES `S_test`.`purchase` (`pcid`),
  CONSTRAINT `fk_buy_has_proudct_proudct1`
    FOREIGN KEY (`proudct_ipd`)
    REFERENCES `S_test`.`proudct` (`ipd`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `S_test`.`propessor_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S_test`.`propessor_info` (
  `department_dep` INT NOT NULL,
  `propessor_name` VARCHAR(45) NOT NULL,
  `prpeessor_major` VARCHAR(45) NULL,
  `propessor_email` VARCHAR(128) NULL,
  INDEX `fk_propessor_info_department1_idx` (`department_dep` ASC) VISIBLE,
  PRIMARY KEY (`propessor_email`),
  UNIQUE INDEX `propessor_email_UNIQUE` (`propessor_email` ASC) VISIBLE,
  CONSTRAINT `fk_propessor_info_department1`
    FOREIGN KEY (`department_dep`)
    REFERENCES `S_test`.`department` (`dep`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `S_test`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S_test`.`review` (
  `rid` INT NOT NULL,
  `title` VARCHAR(64) NOT NULL,
  `re_contect` MEDIUMTEXT NOT NULL,
  `user_uid` INT NOT NULL,
  `proudct_ipd` INT NOT NULL,
  PRIMARY KEY (`rid`),
  INDEX `fk_review_user1_idx` (`user_uid` ASC) VISIBLE,
  INDEX `fk_review_proudct1_idx` (`proudct_ipd` ASC) VISIBLE,
  CONSTRAINT `fk_review_proudct1`
    FOREIGN KEY (`proudct_ipd`)
    REFERENCES `S_test`.`proudct` (`ipd`),
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`user_uid`)
    REFERENCES `S_test`.`user` (`uid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `S_test`.`study_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S_test`.`study_info` (
  `class_info_idclass_info` INT NOT NULL,
  `studtroom_number` VARCHAR(45) NULL,
  `study_time` VARCHAR(45) NULL,
  INDEX `fk_study_info_class_info1_idx` (`class_info_idclass_info` ASC) VISIBLE,
  CONSTRAINT `fk_study_info_class_info1`
    FOREIGN KEY (`class_info_idclass_info`)
    REFERENCES `S_test`.`class_info` (`idclass_info`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `S_test`.`user_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S_test`.`user_info` (
  `id` INT NULL DEFAULT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `gender` VARCHAR(50) NULL DEFAULT NULL,
  `age` INT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `S_test`.`propessor_info_has_class_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S_test`.`propessor_info_has_class_info` (
  `propessor_info_propessor_email` VARCHAR(128) NOT NULL,
  `class_info_idclass_info` INT NOT NULL,
  `class_info_class_code` INT NOT NULL,
  PRIMARY KEY (`propessor_info_propessor_email`, `class_info_idclass_info`, `class_info_class_code`),
  INDEX `fk_propessor_info_has_class_info_class_info1_idx` (`class_info_idclass_info` ASC, `class_info_class_code` ASC) VISIBLE,
  INDEX `fk_propessor_info_has_class_info_propessor_info1_idx` (`propessor_info_propessor_email` ASC) VISIBLE,
  CONSTRAINT `fk_propessor_info_has_class_info_propessor_info1`
    FOREIGN KEY (`propessor_info_propessor_email`)
    REFERENCES `S_test`.`propessor_info` (`propessor_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_propessor_info_has_class_info_class_info1`
    FOREIGN KEY (`class_info_idclass_info` , `class_info_class_code`)
    REFERENCES `S_test`.`class_info` (`idclass_info` , `class_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
