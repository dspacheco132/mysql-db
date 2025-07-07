-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema latomais_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `latomais_db` ;

-- -----------------------------------------------------
-- Schema latomais_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `latomais_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `latomais_db` ;

-- -----------------------------------------------------
-- Table `latomais_db`.`Bonus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`Bonus` ;

CREATE TABLE IF NOT EXISTS `latomais_db`.`Bonus` (
  `classificacao` CHAR(1) NOT NULL,
  `percentagem_bonus` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`classificacao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `latomais_db`.`Lavrador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`Lavrador` ;

CREATE TABLE IF NOT EXISTS `latomais_db`.`Lavrador` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `nif` VARCHAR(20) NOT NULL,
  `morada` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nif` (`nif` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `latomais_db`.`PostoLeite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`PostoLeite` ;

CREATE TABLE IF NOT EXISTS `latomais_db`.`PostoLeite` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `localizacao` VARCHAR(255) NOT NULL,
  `capacidade_diaria_litros` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `latomais_db`.`DepositoLeite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`DepositoLeite` ;

CREATE TABLE IF NOT EXISTS `latomais_db`.`DepositoLeite` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lavrador_id` INT NOT NULL,
  `posto_id` INT NOT NULL,
  `data_hora` DATETIME NOT NULL,
  `quantidade_litros` DECIMAL(10,2) NOT NULL,
  `classificacao` CHAR(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `lavrador_id` (`lavrador_id` ASC) VISIBLE,
  INDEX `posto_id` (`posto_id` ASC) VISIBLE,
  CONSTRAINT `DepositoLeite_ibfk_1`
    FOREIGN KEY (`lavrador_id`)
    REFERENCES `latomais_db`.`Lavrador` (`id`),
  CONSTRAINT `DepositoLeite_ibfk_2`
    FOREIGN KEY (`posto_id`)
    REFERENCES `latomais_db`.`PostoLeite` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `latomais_db`.`PrecoLeite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`PrecoLeite` ;

CREATE TABLE IF NOT EXISTS `latomais_db`.`PrecoLeite` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria` CHAR(1) NOT NULL,
  `data_inicio` DATE NOT NULL,
  `data_fim` DATE NOT NULL,
  `preco_base` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `latomais_db` ;

-- -----------------------------------------------------
-- Placeholder table for view `latomais_db`.`vw_capacidade_vs_recebido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `latomais_db`.`vw_capacidade_vs_recebido` (`posto_id` INT, `posto_nome` INT, `capacidade_diaria_litros` INT, `data` INT, `litros_recebidos_no_dia` INT);

-- -----------------------------------------------------
-- Placeholder table for view `latomais_db`.`vw_despesa_e_litros_por_posto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `latomais_db`.`vw_despesa_e_litros_por_posto` (`posto_id` INT, `posto_nome` INT, `total_litros` INT, `despesa_total` INT);

-- -----------------------------------------------------
-- Placeholder table for view `latomais_db`.`vw_filtro_por_classificacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `latomais_db`.`vw_filtro_por_classificacao` (`id` INT, `lavrador_id` INT, `posto_id` INT, `data_hora` INT, `quantidade_litros` INT, `classificacao` INT, `lavrador_nome` INT);

-- -----------------------------------------------------
-- Placeholder table for view `latomais_db`.`vw_filtro_por_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `latomais_db`.`vw_filtro_por_data` (`id` INT, `lavrador_id` INT, `posto_id` INT, `data_hora` INT, `quantidade_litros` INT, `classificacao` INT, `nome` INT, `posto_nome` INT);

-- -----------------------------------------------------
-- Placeholder table for view `latomais_db`.`vw_filtro_por_lavrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `latomais_db`.`vw_filtro_por_lavrador` (`id` INT, `lavrador_id` INT, `posto_id` INT, `data_hora` INT, `quantidade_litros` INT, `classificacao` INT, `nome` INT, `nif` INT);

-- -----------------------------------------------------
-- Placeholder table for view `latomais_db`.`vw_filtro_por_posto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `latomais_db`.`vw_filtro_por_posto` (`id` INT, `lavrador_id` INT, `posto_id` INT, `data_hora` INT, `quantidade_litros` INT, `classificacao` INT, `posto_nome` INT);

-- -----------------------------------------------------
-- Placeholder table for view `latomais_db`.`vw_pagamentos_por_deposito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `latomais_db`.`vw_pagamentos_por_deposito` (`lavrador` INT, `data_hora` INT, `quantidade_litros` INT, `classificacao` INT, `preco_base` INT, `percentagem_bonus` INT, `total_pago` INT);

-- -----------------------------------------------------
-- Placeholder table for view `latomais_db`.`vw_ranking_lavradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `latomais_db`.`vw_ranking_lavradores` (`nome` INT, `total_litros` INT);

-- -----------------------------------------------------
-- Placeholder table for view `latomais_db`.`vw_total_mensal_lavrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `latomais_db`.`vw_total_mensal_lavrador` (`lavrador_id` INT, `nome` INT, `ano` INT, `mes` INT, `total_litros` INT);

-- -----------------------------------------------------
-- Placeholder table for view `latomais_db`.`vw_total_recebido_lavrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `latomais_db`.`vw_total_recebido_lavrador` (`lavrador_id` INT, `lavrador_nome` INT, `total_recebido` INT);

-- -----------------------------------------------------
-- View `latomais_db`.`vw_capacidade_vs_recebido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`vw_capacidade_vs_recebido`;
DROP VIEW IF EXISTS `latomais_db`.`vw_capacidade_vs_recebido` ;
USE `latomais_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `latomais_db`.`vw_capacidade_vs_recebido` AS select `p`.`id` AS `posto_id`,`p`.`nome` AS `posto_nome`,`p`.`capacidade_diaria_litros` AS `capacidade_diaria_litros`,cast(`d`.`data_hora` as date) AS `data`,sum(`d`.`quantidade_litros`) AS `litros_recebidos_no_dia` from (`latomais_db`.`DepositoLeite` `d` join `latomais_db`.`PostoLeite` `p` on((`d`.`posto_id` = `p`.`id`))) group by `p`.`id`,`data`;

-- -----------------------------------------------------
-- View `latomais_db`.`vw_despesa_e_litros_por_posto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`vw_despesa_e_litros_por_posto`;
DROP VIEW IF EXISTS `latomais_db`.`vw_despesa_e_litros_por_posto` ;
USE `latomais_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `latomais_db`.`vw_despesa_e_litros_por_posto` AS select `p`.`id` AS `posto_id`,`p`.`nome` AS `posto_nome`,sum(`d`.`quantidade_litros`) AS `total_litros`,round(sum(((`d`.`quantidade_litros` * `pl`.`preco_base`) * (1 + (`b`.`percentagem_bonus` / 100)))),2) AS `despesa_total` from (((`latomais_db`.`DepositoLeite` `d` join `latomais_db`.`PostoLeite` `p` on((`d`.`posto_id` = `p`.`id`))) join `latomais_db`.`PrecoLeite` `pl` on(((`d`.`classificacao` = `pl`.`categoria`) and (`d`.`data_hora` between `pl`.`data_inicio` and `pl`.`data_fim`)))) join `latomais_db`.`Bonus` `b` on((`d`.`classificacao` = `b`.`classificacao`))) group by `p`.`id`,`p`.`nome`;

-- -----------------------------------------------------
-- View `latomais_db`.`vw_filtro_por_classificacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`vw_filtro_por_classificacao`;
DROP VIEW IF EXISTS `latomais_db`.`vw_filtro_por_classificacao` ;
USE `latomais_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `latomais_db`.`vw_filtro_por_classificacao` AS select `d`.`id` AS `id`,`d`.`lavrador_id` AS `lavrador_id`,`d`.`posto_id` AS `posto_id`,`d`.`data_hora` AS `data_hora`,`d`.`quantidade_litros` AS `quantidade_litros`,`d`.`classificacao` AS `classificacao`,`l`.`nome` AS `lavrador_nome` from (`latomais_db`.`DepositoLeite` `d` join `latomais_db`.`Lavrador` `l` on((`d`.`lavrador_id` = `l`.`id`)));

-- -----------------------------------------------------
-- View `latomais_db`.`vw_filtro_por_data`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`vw_filtro_por_data`;
DROP VIEW IF EXISTS `latomais_db`.`vw_filtro_por_data` ;
USE `latomais_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `latomais_db`.`vw_filtro_por_data` AS select `d`.`id` AS `id`,`d`.`lavrador_id` AS `lavrador_id`,`d`.`posto_id` AS `posto_id`,`d`.`data_hora` AS `data_hora`,`d`.`quantidade_litros` AS `quantidade_litros`,`d`.`classificacao` AS `classificacao`,`l`.`nome` AS `nome`,`p`.`nome` AS `posto_nome` from ((`latomais_db`.`DepositoLeite` `d` join `latomais_db`.`Lavrador` `l` on((`d`.`lavrador_id` = `l`.`id`))) join `latomais_db`.`PostoLeite` `p` on((`d`.`posto_id` = `p`.`id`)));

-- -----------------------------------------------------
-- View `latomais_db`.`vw_filtro_por_lavrador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`vw_filtro_por_lavrador`;
DROP VIEW IF EXISTS `latomais_db`.`vw_filtro_por_lavrador` ;
USE `latomais_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `latomais_db`.`vw_filtro_por_lavrador` AS select `d`.`id` AS `id`,`d`.`lavrador_id` AS `lavrador_id`,`d`.`posto_id` AS `posto_id`,`d`.`data_hora` AS `data_hora`,`d`.`quantidade_litros` AS `quantidade_litros`,`d`.`classificacao` AS `classificacao`,`l`.`nome` AS `nome`,`l`.`nif` AS `nif` from (`latomais_db`.`DepositoLeite` `d` join `latomais_db`.`Lavrador` `l` on((`d`.`lavrador_id` = `l`.`id`)));

-- -----------------------------------------------------
-- View `latomais_db`.`vw_filtro_por_posto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`vw_filtro_por_posto`;
DROP VIEW IF EXISTS `latomais_db`.`vw_filtro_por_posto` ;
USE `latomais_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `latomais_db`.`vw_filtro_por_posto` AS select `d`.`id` AS `id`,`d`.`lavrador_id` AS `lavrador_id`,`d`.`posto_id` AS `posto_id`,`d`.`data_hora` AS `data_hora`,`d`.`quantidade_litros` AS `quantidade_litros`,`d`.`classificacao` AS `classificacao`,`p`.`nome` AS `posto_nome` from (`latomais_db`.`DepositoLeite` `d` join `latomais_db`.`PostoLeite` `p` on((`d`.`posto_id` = `p`.`id`)));

-- -----------------------------------------------------
-- View `latomais_db`.`vw_pagamentos_por_deposito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`vw_pagamentos_por_deposito`;
DROP VIEW IF EXISTS `latomais_db`.`vw_pagamentos_por_deposito` ;
USE `latomais_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `latomais_db`.`vw_pagamentos_por_deposito` AS select `l`.`nome` AS `lavrador`,`d`.`data_hora` AS `data_hora`,`d`.`quantidade_litros` AS `quantidade_litros`,`d`.`classificacao` AS `classificacao`,`pl`.`preco_base` AS `preco_base`,`b`.`percentagem_bonus` AS `percentagem_bonus`,round(((`d`.`quantidade_litros` * `pl`.`preco_base`) * (1 + (`b`.`percentagem_bonus` / 100))),2) AS `total_pago` from (((`latomais_db`.`DepositoLeite` `d` join `latomais_db`.`Lavrador` `l` on((`d`.`lavrador_id` = `l`.`id`))) join `latomais_db`.`PrecoLeite` `pl` on(((`d`.`classificacao` = `pl`.`categoria`) and (`d`.`data_hora` between `pl`.`data_inicio` and `pl`.`data_fim`)))) join `latomais_db`.`Bonus` `b` on((`d`.`classificacao` = `b`.`classificacao`)));

-- -----------------------------------------------------
-- View `latomais_db`.`vw_ranking_lavradores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`vw_ranking_lavradores`;
DROP VIEW IF EXISTS `latomais_db`.`vw_ranking_lavradores` ;
USE `latomais_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `latomais_db`.`vw_ranking_lavradores` AS select `l`.`nome` AS `nome`,sum(`d`.`quantidade_litros`) AS `total_litros` from (`latomais_db`.`DepositoLeite` `d` join `latomais_db`.`Lavrador` `l` on((`d`.`lavrador_id` = `l`.`id`))) group by `l`.`id` order by `total_litros` desc;

-- -----------------------------------------------------
-- View `latomais_db`.`vw_total_mensal_lavrador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`vw_total_mensal_lavrador`;
DROP VIEW IF EXISTS `latomais_db`.`vw_total_mensal_lavrador` ;
USE `latomais_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `latomais_db`.`vw_total_mensal_lavrador` AS select `l`.`id` AS `lavrador_id`,`l`.`nome` AS `nome`,year(`d`.`data_hora`) AS `ano`,month(`d`.`data_hora`) AS `mes`,sum(`d`.`quantidade_litros`) AS `total_litros` from (`latomais_db`.`DepositoLeite` `d` join `latomais_db`.`Lavrador` `l` on((`d`.`lavrador_id` = `l`.`id`))) group by `l`.`id`,`ano`,`mes`;

-- -----------------------------------------------------
-- View `latomais_db`.`vw_total_recebido_lavrador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `latomais_db`.`vw_total_recebido_lavrador`;
DROP VIEW IF EXISTS `latomais_db`.`vw_total_recebido_lavrador` ;
USE `latomais_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `latomais_db`.`vw_total_recebido_lavrador` AS select `l`.`id` AS `lavrador_id`,`l`.`nome` AS `lavrador_nome`,round(sum(((`d`.`quantidade_litros` * `pl`.`preco_base`) * (1 + (`b`.`percentagem_bonus` / 100)))),2) AS `total_recebido` from (((`latomais_db`.`DepositoLeite` `d` join `latomais_db`.`Lavrador` `l` on((`d`.`lavrador_id` = `l`.`id`))) join `latomais_db`.`PrecoLeite` `pl` on(((`d`.`classificacao` = `pl`.`categoria`) and (`d`.`data_hora` between `pl`.`data_inicio` and `pl`.`data_fim`)))) join `latomais_db`.`Bonus` `b` on((`d`.`classificacao` = `b`.`classificacao`))) group by `l`.`id`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
