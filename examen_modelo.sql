-- MySQL Script generated by MySQL Workbench
-- Wed Jan  3 11:15:17 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema examen
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema examen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `examen` DEFAULT CHARACTER SET utf8 ;
USE `examen` ;

-- -----------------------------------------------------
-- Table `examen`.`PROVEEDORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examen`.`PROVEEDORES` (
  `P` CHAR(5) NOT NULL,
  `PNOMBRE` VARCHAR(20) NULL,
  `CATEGORIA` INT NULL,
  `CIUDAD` VARCHAR(20) NULL,
  PRIMARY KEY (`P`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examen`.`COMPONENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examen`.`COMPONENTES` (
  `C` CHAR(5) NOT NULL,
  `CNOMBRE` VARCHAR(20) NULL,
  `COLOR` VARCHAR(20) NULL,
  `PESO` INT NULL,
  `CIUDAD` VARCHAR(20) NULL,
  PRIMARY KEY (`C`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examen`.`ARTICULOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examen`.`ARTICULOS` (
  `T` CHAR(5) NOT NULL,
  `TNOMBRE` VARCHAR(20) NULL,
  `CIUDAD` VARCHAR(20) NULL,
  PRIMARY KEY (`T`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examen`.`ENVIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examen`.`ENVIOS` (
  `IDENVIOS` INT NOT NULL AUTO_INCREMENT,
  `P` CHAR(5) NULL,
  `C` CHAR(5) NULL,
  `T` CHAR(5) NULL,
  `CANTIDAD` INT NULL,
  PRIMARY KEY (`IDENVIOS`),
  INDEX `FK_PROVEEDOR_idx` (`P` ASC),
  INDEX `FK_COMPONENTES_idx` (`C` ASC),
  INDEX `FK_ARTICULOS_idx` (`T` ASC),
  CONSTRAINT `FK_PROVEEDOR`
    FOREIGN KEY (`P`)
    REFERENCES `examen`.`PROVEEDORES` (`P`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_COMPONENTES`
    FOREIGN KEY (`C`)
    REFERENCES `examen`.`COMPONENTES` (`C`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ARTICULOS`
    FOREIGN KEY (`T`)
    REFERENCES `examen`.`ARTICULOS` (`T`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `PROVEEDORES` (`P`,`PNOMBRE`,`CATEGORIA`,`CIUDAD`) VALUES ('P1','CARLOS',20,'SEVILLA');
INSERT INTO `PROVEEDORES` (`P`,`PNOMBRE`,`CATEGORIA`,`CIUDAD`) VALUES ('P2','JUAN',10,'MADRID');
INSERT INTO `PROVEEDORES` (`P`,`PNOMBRE`,`CATEGORIA`,`CIUDAD`) VALUES ('P3','JOSE',30,'SEVILLA');
INSERT INTO `PROVEEDORES` (`P`,`PNOMBRE`,`CATEGORIA`,`CIUDAD`) VALUES ('P4','INMA',20,'SEVILLA');
INSERT INTO `PROVEEDORES` (`P`,`PNOMBRE`,`CATEGORIA`,`CIUDAD`) VALUES ('P5','EVA',30,'CACERES');


INSERT INTO `ARTICULOS` (`T`,`TNOMBRE`,`CIUDAD`) VALUES ('T1','CLASIFICADORA','MADRID');
INSERT INTO `ARTICULOS` (`T`,`TNOMBRE`,`CIUDAD`) VALUES ('T2','PERFORADORA','MALAGA');
INSERT INTO `ARTICULOS` (`T`,`TNOMBRE`,`CIUDAD`) VALUES ('T3','LECTORA','CACERES');
INSERT INTO `ARTICULOS` (`T`,`TNOMBRE`,`CIUDAD`) VALUES ('T4','CONSOLA','CACERES');
INSERT INTO `ARTICULOS` (`T`,`TNOMBRE`,`CIUDAD`) VALUES ('T5','MEZCLADORA','SEVILLA');
INSERT INTO `ARTICULOS` (`T`,`TNOMBRE`,`CIUDAD`) VALUES ('T6','TERMINAL','BARCELONA');
INSERT INTO `ARTICULOS` (`T`,`TNOMBRE`,`CIUDAD`) VALUES ('T7','CINTA','SEVILLA');


INSERT INTO `COMPONENTES` (`C`,`CNOMBRE`,`COLOR`,`PESO`,`CIUDAD`) VALUES ('C1','X3A','ROJO',12,'SEVILLA');
INSERT INTO `COMPONENTES` (`C`,`CNOMBRE`,`COLOR`,`PESO`,`CIUDAD`) VALUES ('C2','B85','VERDE',17,'MADRID');
INSERT INTO `COMPONENTES` (`C`,`CNOMBRE`,`COLOR`,`PESO`,`CIUDAD`) VALUES ('C3','C4B','AZUL',17,'MALAGA');
INSERT INTO `COMPONENTES` (`C`,`CNOMBRE`,`COLOR`,`PESO`,`CIUDAD`) VALUES ('C4','C4B','ROJO',14,'SEVILLA');
INSERT INTO `COMPONENTES` (`C`,`CNOMBRE`,`COLOR`,`PESO`,`CIUDAD`) VALUES ('C5','VT8','AZUL',12,'MADRID');
INSERT INTO `COMPONENTES` (`C`,`CNOMBRE`,`COLOR`,`PESO`,`CIUDAD`) VALUES ('C6','C30','ROJO',19,'SEVILLA');