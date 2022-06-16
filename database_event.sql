
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema event_management
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema event_management
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `event_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `event_management` ;

-- -----------------------------------------------------
-- Table `event_management`.`costs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `event_management`.`costs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cost_description` VARCHAR(50) NULL DEFAULT NULL,
  `overall_cost` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `event_management`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `event_management`.`clients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cost_id` INT NULL DEFAULT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `budget_limit` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `clients_ibfk_1` (`cost_id` ASC) VISIBLE,
  CONSTRAINT `clients_ibfk_1`
    FOREIGN KEY (`cost_id`)
    REFERENCES `event_management`.`costs` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `event_management`.`teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `event_management`.`teams` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NULL DEFAULT NULL,
  `employee_names` VARCHAR(200) NULL DEFAULT NULL,
  `setup_deadline` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `teams_ibfk_1` (`client_id` ASC) VISIBLE,
  CONSTRAINT `teams_ibfk_1`
    FOREIGN KEY (`client_id`)
    REFERENCES `event_management`.`clients` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 36
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `event_management`.`events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `event_management`.`events` (
  `name` VARCHAR(100) NOT NULL,
  `team_id` INT NULL DEFAULT NULL,
  `cost_id` INT NULL DEFAULT NULL,
  `location` VARCHAR(50) NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`name`),
  INDEX `events_ibfk_1` (`team_id` ASC) VISIBLE,
  INDEX `events_ibfk_2` (`cost_id` ASC) VISIBLE,
  CONSTRAINT `events_ibfk_1`
    FOREIGN KEY (`team_id`)
    REFERENCES `event_management`.`teams` (`id`),
  CONSTRAINT `events_ibfk_2`
    FOREIGN KEY (`cost_id`)
    REFERENCES `event_management`.`costs` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
