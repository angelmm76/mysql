-- MySQL Script generated by MySQL Workbench
-- Thu Dec 21 11:02:39 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema proyectos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyectos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectos` DEFAULT CHARACTER SET utf8 ;
USE `proyectos` ;

-- -----------------------------------------------------
-- Table `proyectos`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectos`.`clientes` (
  `id_cliente` INT(4) NOT NULL,
  `nombre_cliente` VARCHAR(15) NULL,
  `nif` VARCHAR(10) NULL,
  `direccion` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NULL,
  `telefono` CHAR(9) NULL,
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC),
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectos`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectos`.`departamento` (
  `id_departamento` CHAR(4) NOT NULL,
  `ciudad_departamento` VARCHAR(15) NOT NULL,
  `telefono` CHAR(9) NULL,
  PRIMARY KEY (`id_departamento`, `ciudad_departamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectos`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectos`.`proyectos` (
  `id_proyecto` INT(4) NOT NULL,
  `nombre_proyecto` VARCHAR(45) NULL,
  `precio` INT(10) NULL,
  `fechacomienzo` DATE NULL,
  `fechafinprev` DATE NULL,
  `fechaterrminacion` DATE NULL,
  `id_cliente` INT(4) NULL,
  PRIMARY KEY (`id_proyecto`),
  INDEX `FK_PROY_CLIEN_idx` (`id_cliente` ASC),
  CONSTRAINT `FK_PROY_CLIEN`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `proyectos`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectos`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectos`.`empleados` (
  `id_empleados` INT(4) NOT NULL,
  `nombre_empleado` VARCHAR(45) NULL,
  `apellido_empleado` VARCHAR(45) NULL,
  `sueldo` INT(6) NULL,
  `id_departamento` CHAR(4) NULL,
  `ciudad_departamento` VARCHAR(15) NULL,
  `num_proyecto` INT(4) NULL,
  PRIMARY KEY (`id_empleados`),
  INDEX `FK_EMPL_DEPT_idx` (`id_departamento` ASC, `ciudad_departamento` ASC),
  INDEX `FK_EMPL_PROY_idx` (`num_proyecto` ASC),
  CONSTRAINT `FK_EMPL_DEPT`
    FOREIGN KEY (`id_departamento` , `ciudad_departamento`)
    REFERENCES `proyectos`.`departamento` (`id_departamento` , `ciudad_departamento`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_EMPL_PROY`
    FOREIGN KEY (`num_proyecto`)
    REFERENCES `proyectos`.`proyectos` (`id_proyecto`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
