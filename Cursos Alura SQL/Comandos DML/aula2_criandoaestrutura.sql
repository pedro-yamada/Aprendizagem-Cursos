/*Criação deletar Database*/
CREATE DATABASE IF NOT EXISTS vendas_sucos DEFAULT CHAR SET utf8;

DROP DATABASE IF EXISTS vendas_sucos;

/*Criação deletar tabela*/ 
USE vendas_sucos;
CREATE TABLE IF NOT EXISTS PRODUTOS
(
	CODIGO VARCHAR(10) NOT NULL,
    DESCRITOR VARCHAR(100) NULL,
    SABOR VARCHAR(50) NULL,
    TAMANHO VARCHAR(50) NULL,
    EMBALAGEM VARCHAR(50) NULL,
    PRECO_LISTA FLOAT NULL,
    
    PRIMARY KEY (CODIGO)
);

CREATE TABLE IF NOT EXISTS VENDEDORES
(
	MATRICULA VARCHAR(5) NOT NULL,
    NOME VARCHAR(100) NULL,
    BAIRRO VARCHAR(50) NULL,
    COMISSAO FLOAT NULL,
    DATA_ADIMISSAO DATE NULL,
    FERIAS BOOLEAN NULL,
    
    PRIMARY KEY (MATRICULA)
);

ALTER TABLE vendedores RENAME COLUMN DATA_ADIMISSAO TO DATA_ADMISSAO; -- Troca o nome da coluna

DROP TABLE vendedores; -- Deleta tabela

/* Criação de tabelas pelo assistente*/
-- Clicar em Tables com botão direito e em create table
CREATE TABLE `vendas_sucos`.`clientes` (
  `CPF` VARCHAR(11) NOT NULL,
  `NOME` VARCHAR(100) NULL,
  `ENDERECO` VARCHAR(50) NULL,
  `BAIRRO` VARCHAR(50) NULL,
  `CIDADE` VARCHAR(50) NULL,
  `ESTADO` VARCHAR(50) NULL,
  `CEP` VARCHAR(8) NULL,
  `DATA_NASCIMENTO` DATE NULL,
  `IDADE` INT NULL,
  `SEXO` VARCHAR(1) NULL,
  `LIMITE_CREDITO` FLOAT NULL,
  `VOLUME_COMPRA` FLOAT NULL,
  `PRIMEIRA_COMPRA` BIT(1) NULL,
  PRIMARY KEY (`CPF`));

CREATE TABLE `vendas_sucos`.`vendas` (
  `NUMERO` VARCHAR(5) NOT NULL,
  `DATA` DATE NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `MATRICULA` VARCHAR(5) NOT NULL,
  `IMPOSTO` FLOAT NULL,
  PRIMARY KEY (`NUMERO`)
  );
    
CREATE TABLE `vendas_sucos`.`itens_notas` (
  `NUMERO` VARCHAR(5) NOT NULL,
  `CODIGO` VARCHAR(10) NULL,
  `QUANTIDADE` INT(11) NULL,
  `PRECO` FLOAT NULL,
  PRIMARY KEY (`NUMERO`)
  );

/*Criação de tabelas com chaves estrangeiras*/
USE VENDAS_SUCOS;

ALTER TABLE VENDAS ADD CONSTRAINT FK_CLIENTES
FOREIGN KEY (CPF) REFERENCES CLIENTES (CPF);

ALTER TABLE VENDAS ADD CONSTRAINT FK_VENDEDORES
FOREIGN KEY (MATRICULA) REFERENCES VENDEDORES(MATRICULA);

ALTER TABLE itens_notas ADD CONSTRAINT FK_VENDAS
FOREIGN KEY (NUMERO)
REFERENCES VENDAS (NUMERO);

ALTER TABLE itens_notas ADD CONSTRAINT FK_PRODUTOS
FOREIGN KEY (CODIGO)
REFERENCES PRODUTOS (CODIGO);

/*Renomeando tabelas*/
ALTER TABLE VENDAS RENAME NOTAS;