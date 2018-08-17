-- MySQL Script generated by MySQL Workbench
-- Thu Aug 16 18:09:23 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lineablanca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lineablanca
-- -----------------------------------------------------
CREATE database IF NOT EXISTS `lineablanca`;
USE `lineablanca` ;

-- -----------------------------------------------------
-- Table `lineablanca`.`tb_acceso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lineablanca`.`tb_acceso` (
  `id_acceso` VARCHAR(10) NOT NULL,
  `rol` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_acceso`));


-- -----------------------------------------------------
-- Table `lineablanca`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lineablanca`.`tb_usuario` (
  `id_usuario` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `nombre_usuario` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `acceso` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `usuario_FK1`
	FOREIGN KEY (`acceso`)
    REFERENCES `lineablanca`.`tb_acceso` (`id_acceso`));


-- -----------------------------------------------------
-- Table `lineablanca`.`tb_articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lineablanca`.`tb_articulo` (
  `id_articulo` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(50) NOT NULL,
  `precio` FLOAT NOT NULL,
  PRIMARY KEY (`id_articulo`));


-- -----------------------------------------------------
-- Table `lineablanca`.`tb_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lineablanca`.`tb_cliente` (
  `id_cliente` VARCHAR(10) NOT NULL,
  `nombre_cliente` VARCHAR(50) NOT NULL,
  `apellido_cliente` VARCHAR(50) NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `contrasenia` VARCHAR(50) NOT NULL,
  `acceso` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_cliente`));


-- -----------------------------------------------------
-- Table `lineablanca`.`tb_cotizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lineablanca`.`tb_cotizacion` (
  `id_cotizacion` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_cotizacion`));


-- -----------------------------------------------------
-- Table `lineablanca`.`tb_transaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lineablanca`.`tb_transaccion` (
  `id_transaccion` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_creacion` DATETIME NOT NULL,
  `usuario` VARCHAR(10) NOT NULL,
  `cliente` VARCHAR(10) NOT NULL,
  `tipo` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_transaccion`),
  CONSTRAINT `transaccion_FK1`
    FOREIGN KEY (`usuario`)
    REFERENCES `lineablanca`.`tb_usuario` (`id_usuario`),
  CONSTRAINT `transaccion_FK2`
    FOREIGN KEY (`cliente`)
    REFERENCES `lineablanca`.`tb_cliente` (`id_cliente`));
    

-- -----------------------------------------------------
-- Table `lineablanca`.`tb_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lineablanca`.`tb_factura` (
  `id_factura` VARCHAR(10) NOT NULL,
  `clave_acceso` VARCHAR(50) NOT NULL,
  `numero_autorizacion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_factura`));
  

-- -----------------------------------------------------
-- Table `lineablanca`.`tb_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lineablanca`.`tb_detalle` (
  `id_detalleF` VARCHAR(10) NOT NULL,
  `transaccion` INT(11) NOT NULL,
  `factura` VARCHAR(10) NULL DEFAULT NULL,
  `cotizacion` VARCHAR(10) NULL DEFAULT NULL,
  `articulo` VARCHAR(50) NULL DEFAULT NULL,
  `cantidad` INT(11) NOT NULL,
  PRIMARY KEY (`id_detalleF`),
  CONSTRAINT `detalle_FK1`
    FOREIGN KEY (`transaccion`)
    REFERENCES `lineablanca`.`tb_transaccion` (`id_transaccion`),
  CONSTRAINT `detalle_FK2`
    FOREIGN KEY (`factura`)
    REFERENCES `lineablanca`.`tb_factura` (`id_factura`),
  CONSTRAINT `detalle_FK3`
    FOREIGN KEY (`cotizacion`)
    REFERENCES `lineablanca`.`tb_cotizacion` (`id_cotizacion`),
  CONSTRAINT `detalle_FK4`
    FOREIGN KEY (`articulo`)
    REFERENCES `lineablanca`.`tb_articulo` (`id_articulo`));


-- -----------------------------------------------------
-- Table `lineablanca`.`tb_local`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lineablanca`.`tb_local` (
  `id_local` VARCHAR(10) NOT NULL,
  `nombre_local` VARCHAR(30) NOT NULL,
  `ubicacion` VARCHAR(50) NOT NULL,
  `estado_wifi` TINYINT(1) NOT NULL,
  `tipo` INT(11) NOT NULL,
  PRIMARY KEY (`id_local`));
  
  
-- -----------------------------------------------------
-- Table `lineablanca`.`tb_inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lineablanca`.`tb_inventario` (
  `articulo` VARCHAR(10) NOT NULL,
  `cantidad` INT(11) NOT NULL,
  `local` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`articulo`),
  CONSTRAINT `inventario_FK1`
    FOREIGN KEY (`articulo`)
    REFERENCES `lineablanca`.`tb_articulo` (`id_articulo`),
  CONSTRAINT `inventario_FK2`
    FOREIGN KEY (`local`)
    REFERENCES `lineablanca`.`tb_local` (`id_local`));

