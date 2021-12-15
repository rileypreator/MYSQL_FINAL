-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Season`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Season` (
  `season_id` INT NOT NULL AUTO_INCREMENT,
  `year` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`season_id`),
  UNIQUE INDEX `season_id_UNIQUE` (`season_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Team` (
  `team_id` INT NOT NULL AUTO_INCREMENT,
  `team_name` VARCHAR(45) NOT NULL,
  `team_points` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE INDEX `team_id_UNIQUE` (`team_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Driver` (
  `driver_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `driver_points` VARCHAR(45) NOT NULL,
  `team_id` INT NOT NULL,
  PRIMARY KEY (`driver_id`),
  UNIQUE INDEX `driver_id_UNIQUE` (`driver_id` ASC) VISIBLE,
  INDEX `fk_Driver_Team1_idx` (`team_id` ASC) VISIBLE,
  CONSTRAINT `fk_Driver_Team1`
    FOREIGN KEY (`team_id`)
    REFERENCES `mydb`.`Team` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Location` (
  `location_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `start_date` VARCHAR(45) NOT NULL,
  `end_date` VARCHAR(45) NOT NULL,
  `is_sprint` TINYINT NOT NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Race`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Race` (
  `race_id` INT NOT NULL AUTO_INCREMENT,
  `location` VARCHAR(45) NULL,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  `race_type` ENUM("Practice1", "Practice2", "Practice3", "Qualifying", "Sprint_Qualifying", "Grand_Prix") NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`race_id`),
  UNIQUE INDEX `race_id_UNIQUE` (`race_id` ASC) VISIBLE,
  INDEX `fk_Race_Location1_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `fk_Race_Location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `mydb`.`Location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Result`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Result` (
  `result_id` INT NOT NULL AUTO_INCREMENT,
  `position` INT NOT NULL,
  `points` INT NOT NULL,
  `race_id` INT NOT NULL,
  `driver_id` INT NOT NULL,
  PRIMARY KEY (`result_id`),
  UNIQUE INDEX `result_id_UNIQUE` (`result_id` ASC) VISIBLE,
  INDEX `fk_Result_Race1_idx` (`race_id` ASC) VISIBLE,
  INDEX `fk_Result_Driver1_idx` (`driver_id` ASC) VISIBLE,
  CONSTRAINT `fk_Result_Race1`
    FOREIGN KEY (`race_id`)
    REFERENCES `mydb`.`Race` (`race_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Result_Driver1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `mydb`.`Driver` (`driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Season_has_Team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Season_has_Team` (
  `season_id` INT NOT NULL,
  `team_id` INT NOT NULL,
  PRIMARY KEY (`season_id`, `team_id`),
  INDEX `fk_Season_has_Team_Team1_idx` (`team_id` ASC) VISIBLE,
  INDEX `fk_Season_has_Team_Season_idx` (`season_id` ASC) VISIBLE,
  CONSTRAINT `fk_Season_has_Team_Season`
    FOREIGN KEY (`season_id`)
    REFERENCES `mydb`.`Season` (`season_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Season_has_Team_Team1`
    FOREIGN KEY (`team_id`)
    REFERENCES `mydb`.`Team` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Season_has_Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Season_has_Location` (
  `season_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`season_id`, `location_id`),
  INDEX `fk_Season_has_Location_Location1_idx` (`location_id` ASC) VISIBLE,
  INDEX `fk_Season_has_Location_Season1_idx` (`season_id` ASC) VISIBLE,
  CONSTRAINT `fk_Season_has_Location_Season1`
    FOREIGN KEY (`season_id`)
    REFERENCES `mydb`.`Season` (`season_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Season_has_Location_Location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `mydb`.`Location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
