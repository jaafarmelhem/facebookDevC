-- MySQL Script generated by MySQL Workbench
-- Wed Feb 26 00:31:00 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema facebook
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema facebook
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `facebook` DEFAULT CHARACTER SET utf8 ;
USE `facebook` ;

-- -----------------------------------------------------
-- Table `facebook`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facebook`.`playlist` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `facebook`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facebook`.`users` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `password` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `facebook`.`access`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facebook`.`access` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NULL DEFAULT NULL,
  `user_id` INT(11) UNSIGNED NOT NULL,
  `playlist_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_access_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_access_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  CONSTRAINT `fk_access_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `facebook`.`playlist` (`id`),
  CONSTRAINT `fk_access_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `facebook`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `facebook`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facebook`.`video` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `facebook`.`playlist_videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facebook`.`playlist_videos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `videoId` INT(11) NOT NULL,
  `playlistId` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_playlist_videos_video1_idx` (`videoId` ASC) VISIBLE,
  INDEX `fk_playlist_videos_playlist1_idx` (`playlistId` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_videos_playlist1`
    FOREIGN KEY (`playlistId`)
    REFERENCES `facebook`.`playlist` (`id`),
  CONSTRAINT `fk_playlist_videos_video1`
    FOREIGN KEY (`videoId`)
    REFERENCES `facebook`.`video` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;