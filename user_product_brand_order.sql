-- MySQL Script generated by MySQL Workbench
-- Thu Sep 26 12:02:49 2024
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `usercol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `mydb`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`marca` (
  `nombre` VARCHAR(35) NOT NULL,
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`producto` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `marca_id` INT NOT NULL,
  `creado_por` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `creado_por_idx` (`id` ASC, `creado_por` ASC) VISIBLE,
  INDEX `marca_id_idx` (`marca_id` ASC) VISIBLE,
  CONSTRAINT `creado_por`
    FOREIGN KEY (`id` , `creado_por`)
    REFERENCES `mydb`.`user` (`id` , `username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `marca_id`
    FOREIGN KEY (`marca_id`)
    REFERENCES `mydb`.`marca` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orden` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orden_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orden_detalle` (
  `id` INT NOT NULL,
  `orden_id` INT NOT NULL,
  `producto_id` INT NOT NULL,
  PRIMARY KEY (`orden_id`, `producto_id`, `id`),
  INDEX `fk_orden_has_producto_producto1_idx` (`producto_id` ASC) VISIBLE,
  INDEX `fk_orden_has_producto_orden1_idx` (`orden_id` ASC) VISIBLE,
  CONSTRAINT `fk_orden_has_producto_orden1`
    FOREIGN KEY (`orden_id`)
    REFERENCES `mydb`.`orden` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_has_producto_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `mydb`.`producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
