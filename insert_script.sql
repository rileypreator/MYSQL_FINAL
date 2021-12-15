-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Formula1_Final
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Formula1_Final` ;

-- -----------------------------------------------------
-- Schema Formula1_Final
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Formula1_Final` DEFAULT CHARACTER SET utf8 ;
USE `Formula1_Final` ;

-- -----------------------------------------------------
-- Table `Formula1_Final`.`Season`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Formula1_Final`.`Season` ;

CREATE TABLE IF NOT EXISTS `Formula1_Final`.`Season` (
  `season_id` INT NOT NULL AUTO_INCREMENT,
  `year` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`season_id`),
  UNIQUE INDEX `season_id_UNIQUE` (`season_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Formula1_Final`.`Team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Formula1_Final`.`Team` ;

CREATE TABLE IF NOT EXISTS `Formula1_Final`.`Team` (
  `team_id` INT NOT NULL AUTO_INCREMENT,
  `team_name` VARCHAR(45) NOT NULL,
  `team_points` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE INDEX `team_id_UNIQUE` (`team_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Formula1_Final`.`Driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Formula1_Final`.`Driver` ;

CREATE TABLE IF NOT EXISTS `Formula1_Final`.`Driver` (
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
    REFERENCES `Formula1_Final`.`Team` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Formula1_Final`.`Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Formula1_Final`.`Location` ;

CREATE TABLE IF NOT EXISTS `Formula1_Final`.`Location` (
  `location_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `start_date` VARCHAR(45) NOT NULL,
  `end_date` VARCHAR(45) NOT NULL,
  `is_sprint` TINYINT NOT NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Formula1_Final`.`Race`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Formula1_Final`.`Race` ;

CREATE TABLE IF NOT EXISTS `Formula1_Final`.`Race` (
  `race_id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  `race_type` ENUM("Practice1", "Practice2", "Practice3", "Qualifying", "Sprint_Qualifying", "Grand_Prix") NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`race_id`),
  UNIQUE INDEX `race_id_UNIQUE` (`race_id` ASC) VISIBLE,
  INDEX `fk_Race_Location1_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `fk_Race_Location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `Formula1_Final`.`Location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Formula1_Final`.`Result`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Formula1_Final`.`Result` ;

CREATE TABLE IF NOT EXISTS `Formula1_Final`.`Result` (
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
    REFERENCES `Formula1_Final`.`Race` (`race_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Result_Driver1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `Formula1_Final`.`Driver` (`driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Formula1_Final`.`Season_has_Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Formula1_Final`.`Season_has_Location` ;

CREATE TABLE IF NOT EXISTS `Formula1_Final`.`Season_has_Location` (
  `season_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`season_id`, `location_id`),
  INDEX `fk_Season_has_Location_Location1_idx` (`location_id` ASC) VISIBLE,
  INDEX `fk_Season_has_Location_Season1_idx` (`season_id` ASC) VISIBLE,
  CONSTRAINT `fk_Season_has_Location_Season1`
    FOREIGN KEY (`season_id`)
    REFERENCES `Formula1_Final`.`Season` (`season_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Season_has_Location_Location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `Formula1_Final`.`Location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Formula1_Final`.`Season_has_Team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Formula1_Final`.`Season_has_Team` ;

CREATE TABLE IF NOT EXISTS `Formula1_Final`.`Season_has_Team` (
  `season_id` INT NOT NULL,
  `team_id` INT NOT NULL,
  PRIMARY KEY (`season_id`, `team_id`),
  INDEX `fk_Season_has_Team_Team1_idx` (`team_id` ASC) VISIBLE,
  INDEX `fk_Season_has_Team_Season1_idx` (`season_id` ASC) VISIBLE,
  CONSTRAINT `fk_Season_has_Team_Season1`
    FOREIGN KEY (`season_id`)
    REFERENCES `Formula1_Final`.`Season` (`season_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Season_has_Team_Team1`
    FOREIGN KEY (`team_id`)
    REFERENCES `Formula1_Final`.`Team` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



USE Formula1_Final;

INSERT INTO Season (season_id, year)
VALUES (1, "2020");

INSERT INTO Season (season_id, year)
VALUES (2, "2021");

INSERT INTO Team (team_id, team_name, team_points)
VALUES (1, "Red Bull Racing Honda", "302");

INSERT INTO Team (team_id, team_name, team_points)
VALUES (2, "Mercedes-AMG Petronas F1 Team", "302");

INSERT INTO Season_has_Team (season_id, team_id)
VALUES (1, 1);

INSERT INTO Season_has_Team (season_id, team_id)
VALUES (1, 2);

INSERT INTO Season_has_Team (season_id, team_id)
VALUES (2, 1);

INSERT INTO Season_has_Team (season_id, team_id)
VALUES (2, 2);



INSERT INTO Driver (driver_id, first_name, last_name, driver_points, team_id)
VALUES (1, 'Max', 'Verstappen', "395", 1);

INSERT INTO Driver (driver_id, first_name, last_name, driver_points, team_id)
VALUES (2, 'Lewis', 'Hamilton', "387", 2);

INSERT INTO Location (location_id, name, start_date, end_date, is_sprint)
VALUES (1, "Monanco", "2021-05-23 10:00:00", "2021-05-27 10:00:00", 0);

INSERT INTO Location (location_id, name, start_date, end_date, is_sprint)
VALUES (2, "France", "2021-06-27 10:00:00", "2021-06-30 10:00:00", 1);

INSERT INTO Race (race_id, start_date, end_date, race_type, location_id)
VALUES (1, "2021-05-23 10:00:00", "2021-05-23 12:00:00", "Qualifying", 1);

INSERT INTO Race (race_id, start_date, end_date, race_type, location_id)
VALUES (2, "2021-05-24 10:00:00", "2021-05-24 12:00:00", "Grand_Prix", 1);

INSERT INTO Race (race_id, start_date, end_date, race_type, location_id)
VALUES (3, "2021-06-27 10:00:00", "2021-06-27 12:00:00", "Sprint_Qualifying", 2);

INSERT INTO Race (race_id, start_date, end_date, race_type, location_id)
VALUES (4, "2021-06-28 10:00:00", "2021-06-28 12:00:00", "Grand_Prix", 2);

INSERT INTO Result (result_id, position, points, race_id, driver_id)
VALUES (1, 1, 25, 1, 1);

INSERT INTO Result (result_id, position, points, race_id, driver_id)
VALUES (2, 2, 18, 1, 2);

INSERT INTO Result (result_id, position, points, race_id, driver_id)
VALUES (3, 1, 25, 2, 1);

INSERT INTO Result (result_id, position, points, race_id, driver_id)
VALUES (4, 2, 18, 2, 2);