-- Criando o database

CREATE DATABASE sucos_alura;

DROP DATABASE sucos_2_alura;

-- Criando/removendo as tabelas dentro do nosso database

CREATE TABLE tbCliente
(CPF VARCHAR(11),
NOME VARCHAR(100),
ENDERECO1 VARCHAR(150),
ENDERECO2 VARCHAR(150),
BAIRRO VARCHAR(50),
CIDADE VARCHAR(50),
ESTADO VARCHAR(50),
CEP VARCHAR(8),
IDADE SMALLINT,
SEXO VARCHAR(1),
LIMITE_CREDITO FLOAT,
VOLUME_COMPRA FLOAT, 
PRIMEIRA_COMPRA BIT(1));

CREATE TABLE TABELA_DE_VENDEDORES
(MATRICULA VARCHAR(5),
NOME VARCHAR(100),
PERCENTUAL_COMISSAO FLOAT);

CREATE TABLE TABELA_DE_VENDEDORES2 (
        MATRICULA varchar(5),
        NOME varchar(100),
        PERCENTUAL_COMISSAO float
);

DROP TABLE TABELA_DE_VENDEDORES2;

-- Inserindo dados nas tabelas

USE sucos;

INSERT INTO tbproduto(
PRODUTO,
NOME,
EMBALAGEM,
TAMANHO,
SABOR,
PRECO_LISTA)
VALUES(
'1040107',
'Light - 350 ml - Melância',
'Lata',
'350 ml',
'Melância',
4.56);

SELECT * FROM tbproduto;

INSERT INTO tbvendedores(
MATRICULA,
NOME,
PERCENTUAL_COMISSAO)
VALUES(
'00233',
'João Geraldo da Fonseca',
0.10);

SELECT * FROM tbvendedores;

INSERT INTO tbproduto(
PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA)
VALUES(
'1037797',
'Clean - 2 Litros - Laranja',
'Pet',
'2 Litros',
'Laranja',
16.01);
INSERT INTO tbproduto(
PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA)
VALUES(
'1000889',
'Sabor da Montanha - 700 ml- Uva',
'Garrafa',
'700 ml',
'Uva',
6.31);
INSERT INTO tbproduto(
PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA)
VALUES(
'1004327',
'Videira do Campo - 1.5 Litros- Melância',
'PET',
'1.5 Litros',
'Melância',
19.51);

SELECT * FROM tbproduto;

USE sucos_alura;
INSERT INTO tbvendedores(MATRICULA,NOME,PERCENTUAL_COMISSAO)
VALUES('00235', 'Márcio Almeida Silva', 0.08);
INSERT INTO tbvendedores(MATRICULA,NOME,PERCENTUAL_COMISSAO)
VALUES('00236', 'Cláudia Morais', 0.08);
SELECT * FROM tbvendedores;

-- Alterando os registros
INSERT INTO tbproduto (
PRODUTO,  NOME, EMBALAGEM, TAMANHO, SABOR,
PRECO_LISTA) VALUES
('544931', 'Frescor do Verão - 350 ml - Limão', 'PET', '350 ml','Limão',3.20);
INSERT INTO tbproduto (
PRODUTO,  NOME, EMBALAGEM, TAMANHO, SABOR,
PRECO_LISTA) VALUES
('1078680', 'Frescor do Verão - 470 ml - Manga', 'Lata', '470 ml','Manga',5.18);

SELECT * FROM tbproduto;

UPDATE tbproduto SET EMBALAGEM = 'Lata', PRECO_LISTA = 2.46
WHERE PRODUTO = '544931';
UPDATE tbproduto SET EMBALAGEM = 'Garrafa'
WHERE PRODUTO = '1078680';

-- Atividade:
SELECT * FROM tbvendedores;

UPDATE tbvendedores SET PERCENTUAL_COMISSAO = 0.11
WHERE MATRICULA = '00236';
UPDATE tbvendedores SET NOME = 'José Geraldo da Fonseca Junior'
WHERE MATRICULA = '00233';

-- Excluindo registros 
SELECT * FROM tbproduto;

DELETE FROM tbproduto WHERE PRODUTO = '1078680';

-- Atividade:
SELECT * FROM tbvendedores;

DELETE FROM tbvendedores WHERE MATRICULA = '00233';

-- Incluindo a chave primária: A chave primária deve ser uma coluna que não se repete.

USE sucos_alura;

ALTER TABLE tbproduto ADD PRIMARY KEY (PRODUTO);

-- Manipulando campos de data e lógicos
ALTER TABLE tbcliente ADD PRIMARY KEY (CPF);

ALTER TABLE tbcliente ADD COLUMN (DATA_NASCIMENTO DATE);

INSERT INTO tbcliente (
CPF, NOME, ENDERECO1, ENDERECO2, BAIRRO, CIDADE, ESTADO, CEP, IDADE, SEXO, LIMITE_CREDITO,
VOLUME_COMPRA, PRIMEIRA_COMPRA, DATA_NASCIMENTO) 
VALUES ('00388934505', 'João da Silva', 'Rua projetada A número 10', '', 
'Vila Roman', 'Caratinga', 'Amazonas', '2222222', 30, 'M', 10000.00, 2000,
0 , '1989-10-05');

SELECT * FROM tbcliente;

-- Atividade
ALTER TABLE tbvendedores ADD PRIMARY KEY (MATRICULA);

ALTER TABLE tbvendedores ADD COLUMN(DATA_ADMISSÃO DATE, DE_FERIAS BIT(1));
SELECT * FROM tbvendedores;

UPDATE tbvendedores SET DATA_ADMISSÃO = '2014-08-15'
WHERE MATRICULA = '00235';
UPDATE tbvendedores SET DATA_ADMISSÃO = '2013-09-17'
WHERE MATRICULA = '00236';
UPDATE tbvendedores SET DE_FERIAS = 0
WHERE MATRICULA = '00235';
UPDATE tbvendedores SET DE_FERIAS = 1
WHERE MATRICULA = '00236';

INSERT INTO tbvendedores(MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSÃO, DE_FERIAS)
VALUES('00237', 'Roberta Martins', 0.11, '2017-03-18', 1);
INSERT INTO tbvendedores(MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSÃO, DE_FERIAS)
VALUES('00238', 'Péricles Alves', 0.11, '2016-08-21', 0);

-- CONSULTAR REGISTROS

SELECT * FROM tbcliente;

SELECT CPF, NOME, ENDERECO1, IDADE, SEXO FROM tbcliente;

SELECT CPF, NOME, ENDERECO1, IDADE, SEXO FROM tbcliente LIMIT 5;

SELECT CPF AS CPF_CLIENTE, NOME AS NOME_CLIENTE FROM tbcliente;

SELECT NOME, CPF, IDADE FROM tbcliente;

SELECT NOME, MATRICULA FROM tbvendedores;

SELECT * FROM tbproduto WHERE PRODUTO = '544931';

SELECT CPF FROM tbcliente WHERE CIDADE = 'Rio de Janeiro';

UPDATE tbproduto SET SABOR = 'Cítricos' WHERE SABOR = 'Limão' ;

SELECT * FROM tbproduto;

SELECT * FROM tbvendedores WHERE NOME = 'Claudia Morais';

-- Filtros

SELECT * FROM tbcliente;

SELECT * FROM tbcliente WHERE IDADE <> 22; -- Idade diferente de 22

SELECT * FROM tbcliente WHERE NOME > 'Fernando Cavalcante'; -- Nomes com F para cima 

-- Números ponto flutuante não podem ser usados em condição =, <>, pois não tem esta precisão

SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009; -- Nomes com F para cima 

SELECT * FROM tbvendedores WHERE PERCENTUAL_COMISSAO > 0.1;

SELECT * FROM tbcliente;

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO > '1995-01-13';

SELECT * FROM tbcliente WHERE YEAR(DATA_NASCIMENTO) = '1995';

SELECT * FROM tbcliente WHERE MONTH(DATA_NASCIMENTO) = '10';

SELECT * FROM tbvendedores WHERE YEAR(DATA_ADMISSÃO) >= '2016';

-- Filtros compostos

SELECT * FROM tbproduto WHERE PRECO_LISTA >= 16.007 AND	PRECO_LISTA <= 16.009;

SELECT * FROM tbcliente WHERE IDADE >= 18 AND IDADE <= 22 AND SEXO = 'M';

SELECT * FROM tbcliente WHERE cidade = 'Rio de Janeiro' OR bairro = 'Jardins';

SELECT * FROM tbvendedores WHERE DE_FERIAS = 1 AND YEAR(DATA_ADMISSÃO) < 2016;