-- MySQL Script generated by MySQL Workbench
-- Tue Dec  7 15:48:24 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cs158Afinal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cs158Afinal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cs158Afinal` DEFAULT CHARACTER SET utf8 ;
USE `cs158Afinal` ;

-- -----------------------------------------------------
-- Table `cs158Afinal`.`SPELLS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs158Afinal`.`SPELLS` (
  `spell_id` INT NOT NULL,
  `required_level` INT NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`spell_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs158Afinal`.`CLASS_SPELLS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs158Afinal`.`CLASS_SPELLS` (
  `class_spell_id` INT NOT NULL,
  `spell_id_fk` INT NULL,
  PRIMARY KEY (`class_spell_id`),
  INDEX `spell_id_fk` (`spell_id_fk` ASC) INVISIBLE,
  CONSTRAINT `spell_id_fk`
    FOREIGN KEY (`spell_id_fk`)
    REFERENCES `cs158Afinal`.`SPELLS` (`spell_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs158Afinal`.`CLASS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs158Afinal`.`CLASS` (
  `class_name_id` INT NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `stats_bonus` VARCHAR(45) NOT NULL,
  `class_spell_fk` INT NULL,
  PRIMARY KEY (`class_name_id`),
  INDEX `class_spell_fk_idx` (`class_spell_fk` ASC) VISIBLE,
  CONSTRAINT `class_spell_fk`
    FOREIGN KEY (`class_spell_fk`)
    REFERENCES `cs158Afinal`.`CLASS_SPELLS` (`class_spell_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs158Afinal`.`ITEM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs158Afinal`.`ITEM` (
  `item_name_id` INT NOT NULL,
  `item_description` VARCHAR(255) NOT NULL,
  `item_stats` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`item_name_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs158Afinal`.`INVENTORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs158Afinal`.`INVENTORY` (
  `inventory_id` INT NOT NULL AUTO_INCREMENT,
  `player_id_inv_fk` INT NULL,
  `item_id_fk` INT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `player_id_fk_idx` (`player_id_inv_fk` ASC) VISIBLE,
  INDEX `item_id_fk_idx` (`item_id_fk` ASC) VISIBLE,
  CONSTRAINT `player_id_inv_fk`
    FOREIGN KEY (`player_id_inv_fk`)
    REFERENCES `cs158Afinal`.`PLAYER` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `item_id_fk`
    FOREIGN KEY (`item_id_fk`)
    REFERENCES `cs158Afinal`.`ITEM` (`item_name_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs158Afinal`.`BIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs158Afinal`.`BIO` (
  `bio_id` INT NOT NULL,
  `traits` VARCHAR(255) NULL,
  `ideals` VARCHAR(255) NULL,
  `flaws` VARCHAR(255) NULL,
  PRIMARY KEY (`bio_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs158Afinal`.`PLAYER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs158Afinal`.`PLAYER` (
  `player_id` INT NOT NULL AUTO_INCREMENT,
  `xp` INT NOT NULL,
  `char_name` VARCHAR(20) NOT NULL,
  `player_level` INT NOT NULL,
  `class` INT NOT NULL,
  `armor` INT NOT NULL,
  `constitution` INT NOT NULL,
  `strength` INT NOT NULL,
  `dexterity` INT NOT NULL,
  `intelligence` INT NOT NULL,
  `wisdom` INT NOT NULL,
  `charisma` INT NOT NULL,
  `class_fk` INT NULL,
  `inventory_id_fk` INT NULL,
  `bio_id_fk` INT NULL,
  PRIMARY KEY (`player_id`),
  INDEX `class_fk_idx` (`class_fk` ASC) VISIBLE,
  INDEX `inventory_id_fk_idx` (`inventory_id_fk` ASC) VISIBLE,
  INDEX `bio_id_fk_idx` (`bio_id_fk` ASC) VISIBLE,
  CONSTRAINT `class_fk`
    FOREIGN KEY (`class_fk`)
    REFERENCES `cs158Afinal`.`CLASS` (`class_name_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `inventory_id_fk`
    FOREIGN KEY (`inventory_id_fk`)
    REFERENCES `cs158Afinal`.`INVENTORY` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `bio_id_fk`
    FOREIGN KEY (`bio_id_fk`)
    REFERENCES `cs158Afinal`.`BIO` (`bio_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs158Afinal`.`EQUIPMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs158Afinal`.`EQUIPMENT` (
  `equip_id` INT NOT NULL AUTO_INCREMENT,
  `ammo_count` INT NULL,
  `player_id_equip_fk` INT NULL,
  `helmet_fk` INT NULL,
  `chestplate_fk` INT NULL,
  `boot_fk` INT NULL,
  `primarywep_fk` INT NULL,
  `secondarywep_fk` INT NULL,
  `ammo_fk` INT NULL,
  `acc1_fk` INT NULL,
  `acc2_fk` INT NULL,
  `acc3_fk` INT NULL,
  PRIMARY KEY (`equip_id`),
  INDEX `chestplate_fk_idx` (`chestplate_fk` ASC) VISIBLE,
  INDEX `boot_fk_idx` (`boot_fk` ASC) VISIBLE,
  INDEX `primarywep_fk_idx` (`primarywep_fk` ASC) VISIBLE,
  INDEX `secondarywep_fk_idx` (`secondarywep_fk` ASC) VISIBLE,
  INDEX `ammo_fk_idx` (`ammo_fk` ASC) VISIBLE,
  INDEX `acc1_fk_idx` (`acc1_fk` ASC) VISIBLE,
  INDEX `acc2_fk_idx` (`acc2_fk` ASC) VISIBLE,
  INDEX `acc3_fk_idx` (`acc3_fk` ASC) VISIBLE,
  INDEX `helmet_fk_idx` (`helmet_fk` ASC) VISIBLE,
  CONSTRAINT `player_id_equip_fk`
    FOREIGN KEY (`equip_id`)
    REFERENCES `cs158Afinal`.`PLAYER` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `helmet_fk`
    FOREIGN KEY (`helmet_fk`)
    REFERENCES `cs158Afinal`.`ITEM` (`item_name_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `chestplate_fk`
    FOREIGN KEY (`chestplate_fk`)
    REFERENCES `cs158Afinal`.`ITEM` (`item_name_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `boot_fk`
    FOREIGN KEY (`boot_fk`)
    REFERENCES `cs158Afinal`.`ITEM` (`item_name_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `primarywep_fk`
    FOREIGN KEY (`primarywep_fk`)
    REFERENCES `cs158Afinal`.`ITEM` (`item_name_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `secondarywep_fk`
    FOREIGN KEY (`secondarywep_fk`)
    REFERENCES `cs158Afinal`.`ITEM` (`item_name_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ammo_fk`
    FOREIGN KEY (`ammo_fk`)
    REFERENCES `cs158Afinal`.`ITEM` (`item_name_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `acc1_fk`
    FOREIGN KEY (`acc1_fk`)
    REFERENCES `cs158Afinal`.`ITEM` (`item_name_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `acc2_fk`
    FOREIGN KEY (`acc2_fk`)
    REFERENCES `cs158Afinal`.`ITEM` (`item_name_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `acc3_fk`
    FOREIGN KEY (`acc3_fk`)
    REFERENCES `cs158Afinal`.`ITEM` (`item_name_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs158Afinal`.`PROFICIENT_SKILL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs158Afinal`.`PROFICIENT_SKILL` (
  `proficient_skills_id` INT NOT NULL,
  `proficient_skills_bonus_stats` INT NOT NULL,
  `proficient_skills_description` VARCHAR(255) NOT NULL,
  `player_id_prof_fk` INT NULL,
  PRIMARY KEY (`proficient_skills_id`),
  INDEX `player_id_fk_idx` (`player_id_prof_fk` ASC) VISIBLE,
  CONSTRAINT `player_id_prof_fk`
    FOREIGN KEY (`player_id_prof_fk`)
    REFERENCES `cs158Afinal`.`PLAYER` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `cs158Afinal` ;

-- -----------------------------------------------------
-- Placeholder table for view `cs158Afinal`.`Player Info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs158Afinal`.`Player Info` (`player_id` INT, `char_name` INT, `player_level` INT, `class` INT);

-- -----------------------------------------------------
-- Placeholder table for view `cs158Afinal`.`Player Spells`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs158Afinal`.`Player Spells` (`player_id` INT, `class_name_id` INT, `spell_id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `cs158Afinal`.`Player Inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs158Afinal`.`Player Inventory` (`player_id` INT, `inventory_id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `cs158Afinal`.`Player Equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs158Afinal`.`Player Equipment` (`player_id` INT, `equip_id` INT);

-- -----------------------------------------------------
-- View `cs158Afinal`.`Player Info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cs158Afinal`.`Player Info`;
USE `cs158Afinal`;
CREATE  OR REPLACE VIEW `Player Info` AS
SELECT player_id, char_name, player_level, class
FROM PLAYER
;

-- -----------------------------------------------------
-- View `cs158Afinal`.`Player Spells`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cs158Afinal`.`Player Spells`;
USE `cs158Afinal`;
CREATE  OR REPLACE VIEW `Player Spells` AS
    SELECT 
        player_id, class_name_id, spell_id
    FROM
        PLAYER
            JOIN
        CLASS
			JOIN
		SPELLS
;

-- -----------------------------------------------------
-- View `cs158Afinal`.`Player Inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cs158Afinal`.`Player Inventory`;
USE `cs158Afinal`;
CREATE  OR REPLACE VIEW `Player Inventory` AS
SELECT player_id, inventory_id
FROM PLAYER JOIN INVENTORY
;

-- -----------------------------------------------------
-- View `cs158Afinal`.`Player Equipment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cs158Afinal`.`Player Equipment`;
USE `cs158Afinal`;
CREATE  OR REPLACE VIEW `Player Equipment` AS
SELECT player_id, equip_id
FROM PLAYER JOIN EQUIPMENT
;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
