SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema vacineSe
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vacineSe` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `vacineSe` ;

-- -----------------------------------------------------
-- Table `vacineSe`.`vacina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vacineSe`.`vacina` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `dose` INT NOT NULL,
  `laboratorio` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vacineSe`.`campanha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vacineSe`.`campanha` (
  `nome` VARCHAR(45) NOT NULL,
  `vacina` INT NULL DEFAULT NULL,
  `inicio` DATE NOT NULL,
  `fim` DATE NOT NULL,
  PRIMARY KEY (`nome`),
  INDEX `vacina` (`vacina` ASC) VISIBLE,
  CONSTRAINT `campanha_ibfk_1`
    FOREIGN KEY (`vacina`)
    REFERENCES `vacineSe`.`vacina` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vacineSe`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vacineSe`.`funcionario` (
  `cpf` BIGINT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `genero` CHAR(1) NOT NULL,
  `nascimento` DATE NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `unidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vacineSe`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vacineSe`.`paciente` (
  `cpf` BIGINT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `genero` CHAR(1) NOT NULL,
  `nascimento` DATE NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `alergia` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vacineSe`.`vacinacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vacineSe`.`vacinacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vacina` INT NULL DEFAULT NULL,
  `lote` VARCHAR(45) NOT NULL,
  `validade` DATE NOT NULL,
  `dataVacinacao` DATE NOT NULL,
  `cpfPaciente` INT NOT NULL,
  `cpfFuncionario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `vacina` (`vacina` ASC) VISIBLE,
  INDEX `cpfPaciente` (`cpfPaciente` ASC) VISIBLE,
  INDEX `cpfFuncionario` (`cpfFuncionario` ASC) VISIBLE,
  CONSTRAINT `vacinacao_ibfk_1`
    FOREIGN KEY (`vacina`)
    REFERENCES `vacineSe`.`vacina` (`id`),
  CONSTRAINT `vacinacao_ibfk_2`
    FOREIGN KEY (`cpfPaciente`)
    REFERENCES `vacineSe`.`paciente` (`cpf`),
  CONSTRAINT `vacinacao_ibfk_3`
    FOREIGN KEY (`cpfFuncionario`)
    REFERENCES `vacineSe`.`funcionario` (`cpf`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
