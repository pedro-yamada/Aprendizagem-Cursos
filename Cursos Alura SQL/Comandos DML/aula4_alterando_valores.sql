USE VENDAS_SUCOS;

/*ALTERANDO VALORES DA TABELA */
SELECT * FROM produtos;

UPDATE PRODUTOS	
SET PRECO_LISTA = 5
WHERE CODIGO = '1000889';

UPDATE PRODUTOS
SET EMBALAGEM = 'PET', TAMANHO = '1 Litro', DESCRITOR = 'Sabor da Montanha - 1 Litro - Uva'
WHERE CODIGO = '1000889';

SELECT * FROM PRODUTOS
WHERE SABOR = 'Maracuja';

UPDATE produtos SET PRECO_LISTA = PRECO_LISTA * 1.10
WHERE SABOR = 'Maracujá';

-- Atividade
SELECT * FROM CLIENTES
WHERE CPF = '19290992743';

UPDATE CLIENTES
SET ENDERECO = 'R. Jorge Emílio 23', 
	BAIRRO = 'Santo Amaro', 
    CIDADE = 'São Paulo', 
    ESTADO = 'SP' ,
    CEP = '8833223'
WHERE CPF = '19290992743';

SELECT * FROM VENDEDORES;
SELECT * FROM sucos_vendas.tabela_de_vendedores;

SELECT * from vendedores A
INNER JOIN sucos_vendas.tabela_de_vendedores B
ON A.MATRICULA = substring(B.MATRICULA, 3, 3);

UPDATE vendedores A
INNER JOIN sucos_vendas.tabela_de_vendedores B
ON A.MATRICULA = substring(B.MATRICULA, 3, 3)
SET A.FERIAS = B.DE_FERIAS;

-- Atividade
USE vendas_sucos;

UPDATE clientes C 
INNER JOIN vendedores V 
ON V.BAIRRO = C.BAIRRO
SET C.VOLUME_COMPRA = C.VOLUME_COMPRA * 1.3;

SELECT * FROM clientes C 
INNER JOIN vendedores V 
ON V.BAIRRO = C.BAIRRO;

/*EXCLUIR DADOS DA TABELA*/
INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)

     VALUES ('1001001','Sabor dos Alpes 700 ml - Manga','Manga','700 ml','Garrafa',7.50),

         ('1001000','Sabor dos Alpes 700 ml - Melão','Melão','700 ml','Garrafa',7.50),

         ('1001002','Sabor dos Alpes 700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),

         ('1001003','Sabor dos Alpes 700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),

         ('1001004','Sabor dos Alpes 700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),

         ('1001005','Sabor dos Alpes 700 ml - Açai','Açai','700 ml','Garrafa',7.50),

         ('1001006','Sabor dos Alpes 1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),

         ('1001007','Sabor dos Alpes 1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),

         ('1001008','Sabor dos Alpes 1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),

         ('1001009','Sabor dos Alpes 1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),

         ('1001010','Sabor dos Alpes 1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),

         ('1001011','Sabor dos Alpes 1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);
         
SELECT * FROM PRODUTOS
WHERE SUBSTRING(DESCRITOR, 1, 15) = 'Sabor dos Alpes';

DELETE FROM PRODUTOS 
WHERE SUBSTRING(DESCRITOR, 1, 15) = 'Sabor dos Alpes'; 

DELETE FROM PRODUTOS 
WHERE TAMANHO = '1 Litro' AND SUBSTRING(DESCRITOR, 1, 15) = 'Sabor dos Alpes'; 

SELECT CODIGO_DO_PRODUTO FROM SUCOS_VENDAS.TABELA_DE_PRODUTOS;

SELECT CODIGO FROM PRODUTOS WHERE CODIGO NOT IN (
SELECT CODIGO_DO_PRODUTO FROM SUCOS_VENDAS.TABELA_DE_PRODUTOS);

DELETE FROM PRODUTOS WHERE CODIGO NOT IN (
SELECT CODIGO_DO_PRODUTO FROM SUCOS_VENDAS.TABELA_DE_PRODUTOS);

-- Atividade
SELECT A.NUMERO FROM NOTAS A
INNER JOIN CLIENTES B ON A.CPF = B.CPF
WHERE B.IDADE <= 18;

SELECT * FROM NOTAS;
SELECT * FROM CLIENTES;

DELETE A FROM NOTAS A
INNER JOIN CLIENTES B ON A.CPF = B.CPF
WHERE B.IDADE <= 18;

/*Alterando e apagando toda a tabela*/
CREATE TABLE `produtos2` (
  `CODIGO` varchar(10) NOT NULL,
  `DESCRITOR` varchar(100) DEFAULT NULL,
  `SABOR` varchar(50) DEFAULT NULL,
  `TAMANHO` varchar(50) DEFAULT NULL,
  `EMBALAGEM` varchar(50) DEFAULT NULL,
  `PRECO_LISTA` float DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO PRODUTOS2
SELECT * FROM PRODUTOS;

SELECT * FROM PRODUTOS2;

UPDATE PRODUTOS2 SET PRECO_LISTA = 8;

DELETE FROM PRODUTOS2;

DELETE FROM NOTAS;
DELETE FROM ITENS_NOTAS;

/*COMMIT E ROLLBACK*/
-- Testando
START TRANSACTION;

SELECT * FROM VENDEDORES;

UPDATE VENDEDORES SET COMISSAO = COMISSAO * 1.15;

ROLLBACK;

-- Alterando de fato
START TRANSACTION;
UPDATE VENDEDORES SET COMISSAO = COMISSAO * 1.15;
COMMIT;
SELECT * FROM VENDEDORES;
