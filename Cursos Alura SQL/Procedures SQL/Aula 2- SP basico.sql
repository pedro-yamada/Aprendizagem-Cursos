/*Primeira procedure*/
USE `sucos_vendas`;
DROP procedure IF EXISTS `Nao_faz_Nada`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Nao_faz_Nada` ()
BEGIN

END$$
DELIMITER ;

/*Criando primeira stored procedure*/
USE `sucos_vendas`;
DROP procedure IF EXISTS `alo_mundo`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `alo_mundo` ()
BEGIN
SELECT 'Alo mundo!';
END$$

DELIMITER ;

call alo_mundo();

DROP procedure IF EXISTS `mostra_numero`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `mostra_numero` ()
BEGIN
SELECT (1 + 9 - 5);
END$$
DELIMITER ;

call mostra_numero();

DROP procedure IF EXISTS `mostra_numero_alias`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `mostra_numero_alias` ()
BEGIN
SELECT (1 + 9 - 5) as RESULTADO;
END$$
DELIMITER ;

CALL mostra_numero_alias;

DROP procedure IF EXISTS `sp_com_funcoes`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `sp_com_funcoes` ()
BEGIN
SELECT CONCAT('Alo Mundo!!!', '.....', (1+9-5)) as RESULTADO;
END$$
DELIMITER ;

CALL sp_com_funcoes();

/*ALTERANDO PROCEDURES*/
DROP procedure IF EXISTS `alo_mundo_2`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `alo_mundo_2` ()
BEGIN
SELECT 'Alô mundo!' as RESULTADO;
END$$
DELIMITER ;

call alo_mundo_2;

USE `sucos_vendas`;
DROP procedure IF EXISTS `alo_mundo_2`;

USE `sucos_vendas`;
DROP procedure IF EXISTS `sucos_vendas`.`alo_mundo_2`;
;
DELIMITER $$
USE `sucos_vendas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alo_mundo_2`()
BEGIN
SELECT 'Alô mundo!, tudo bem?' as RESULTADO;
END$$
DELIMITER ;

call alo_mundo_2;

-- Apagando 
DROP procedure IF EXISTS `sucos_vendas`.`alo_mundo_2`;

/*DECLARANDO VARIÁVEIS*/
USE `sucos_vendas`;
DROP procedure IF EXISTS `sucos_vendas`.`exibe_variavel`;
;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `exibe_variavel`()
BEGIN
DECLARE texto char(12) default 'Alô Mundo!!';
SELECT texto as RESULTADO;
END$$
DELIMITER ;

CALL exibe_variavel();

USE `sucos_vendas`;
DROP procedure IF EXISTS `sucos_vendas`.`tipos_de_dados`;
;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `tipos_de_dados`()
BEGIN
	DECLARE v varchar(5) default 'TEXTO';
	DECLARE i integer default 10;
    DECLARE d decimal(4,2) default 56.12;
    DECLARE dt date default '2019-03-01';
	SELECT v, i, d, dt;
END$$
DELIMITER ;

call tipos_de_dados;

USE `sucos_vendas`;
DROP procedure IF EXISTS `sucos_vendas`.`data_hora_local`;
;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `data_hora_local`()
BEGIN
	DECLARE ts datetime default localtimestamp();
	SELECT ts as HORÁRIO_LOCAL;
END$$
DELIMITER ;

call data_hora_local;

USE `sucos_vendas`;
DROP procedure IF EXISTS `sucos_vendas`.`mesmo_tipo_dados`;
;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `mesmo_tipo_dados`()
BEGIN
	DECLARE data_1, data_2 date default '2014-09-13';
	SELECT data_1, data_2;
END$$
DELIMITER ;

call mesmo_tipo_dados();

USE `sucos_vendas`;
DROP procedure IF EXISTS `sucos_vendas`.`atribui_valor`;
;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `atribui_valor`()
BEGIN
	DECLARE texto varchar(30) default 'olá mundo!';
	SELECT texto;
    SET texto = 'olá mundo! modificado';
    SELECT texto;
END$$
DELIMITER ;

call atribui_valor();

-- Exercicio 1:
USE `sucos_vendas`;
DROP procedure IF EXISTS `sucos_vendas`.`sp_Exerc01`;
;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `sp_Exerc01`()
BEGIN
	DECLARE Cliente varchar(10) default 'João';
	DECLARE Idade integer default 10;
    DECLARE DataNascimento date default '2007-01-10';
    DECLARE Custo DECIMAL(4,2) default 10.23;
    
    SELECT Cliente, Idade, DataNascimento, Custo;
END$$
DELIMITER ;

CALL sp_Exerc01();