INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES ('2001001','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
    ('2001000','Sabor da Serra  700 ml - Melão','Melão','700 ml','Garrafa',7.50),
    ('2001002','Sabor da Serra  700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),
    ('2001003','Sabor da Serra  700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),
    ('2001004','Sabor da Serra  700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),
    ('2001005','Sabor da Serra  700 ml - Açai','Açai','700 ml','Garrafa',7.50),
    ('2001006','Sabor da Serra  1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),
    ('2001007','Sabor da Serra  1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),
    ('2001008','Sabor da Serra  1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),
    ('2001009','Sabor da Serra  1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),
    ('2001010','Sabor da Serra  1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),
    ('2001011','Sabor da Serra  1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);

    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    UPDATE tabela_de_produtos SET PRECO_DE_LISTA = 8 WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    DELETE FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
    
USE `sucos_vendas`;
DROP procedure IF EXISTS `manipulacao_dados`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `manipulacao_dados` ()
BEGIN
INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES ('2001001','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
    ('2001000','Sabor da Serra  700 ml - Melão','Melão','700 ml','Garrafa',7.50),
    ('2001002','Sabor da Serra  700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),
    ('2001003','Sabor da Serra  700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),
    ('2001004','Sabor da Serra  700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),
    ('2001005','Sabor da Serra  700 ml - Açai','Açai','700 ml','Garrafa',7.50),
    ('2001006','Sabor da Serra  1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),
    ('2001007','Sabor da Serra  1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),
    ('2001008','Sabor da Serra  1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),
    ('2001009','Sabor da Serra  1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),
    ('2001010','Sabor da Serra  1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),
    ('2001011','Sabor da Serra  1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);

    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    UPDATE tabela_de_produtos SET PRECO_DE_LISTA = 8 WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    DELETE FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
END$$

DELIMITER ;

CALL manipulacao_dados();

USE `sucos_vendas`;
DROP procedure IF EXISTS `inclui_novo_produto`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `inclui_novo_produto` ()
BEGIN
	DECLARE vCodigo varchar(50) DEFAULT '3000001';
    DECLARE vNome varchar(50) DEFAULT 'Sabor do mar 700 ml - Manga ';
    DECLARE vSabor varchar(50) DEFAULT 'Manga';
    DECLARE vTamanho varchar(50) DEFAULT '700 ml';
    DECLARE vEmbalagem varchar(50) DEFAULT 'Garrafa';
    DECLARE vPreco DECIMAL(10, 2) DEFAULT 9.25;
    
INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES (vCodigo,
    vNome,
    vSabor,
    vTamanho,
    vEmbalagem,
    vPreco
    );
END$$
DELIMITER ;

CALL inclui_novo_produto();

SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor do mar%';

-- Atividade: Atualizando a idade:
USE `sucos_vendas`;
DROP procedure IF EXISTS `Calcula_Idade`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Calcula_Idade` ()
BEGIN    
UPDATE TABELA_DE_CLIENTES
SET IDADE = TIMESTAMPDIFF(YEAR, data_de_nascimento, CURDATE());
END$$
DELIMITER ;

SELECT * FROM tabela_de_clientes;
CALL Calcula_Idade();
SELECT * FROM tabela_de_clientes;

USE `sucos_vendas`;
DROP procedure IF EXISTS `inclui_novo_produto_parametro`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `inclui_novo_produto_parametro` (vCodigo varchar(50),
vNome varchar(50), vSabor varchar(50), vTamanho varchar(50), vEmbalagem varchar(50), vPreco DECIMAL(10, 2))
BEGIN   
INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES (vCodigo,
    vNome,
    vSabor,
    vTamanho,
    vEmbalagem,
    vPreco
    );
END$$
DELIMITER ;

SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '4000001';

CALL inclui_novo_produto_parametro('4000001', 'Sabor do Pantanal 1 Litro- Melancia', 
'Melancia', '1 Litro', 'PET', 4.67);

SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '4000001';

-- Atividade 3
USE `sucos_vendas`;
DROP procedure IF EXISTS `Reajuste_Comissao`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Reajuste_Comissao` (vPercent FLOAT)
BEGIN   
	UPDATE tabela_de_vendedores 
	SET PERCENTUAL_COMISSAO = PERCENTUAL_COMISSAO * (1 + vPercent);
END$$
DELIMITER ;

SELECT * FROM tabela_de_vendedores;

-- Controle de erros
USE `sucos_vendas`;
DROP procedure IF EXISTS `inclui_novo_produto_parametro`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `inclui_novo_produto_parametro` (vCodigo varchar(50),
vNome varchar(50), vSabor varchar(50), vTamanho varchar(50), vEmbalagem varchar(50), vPreco DECIMAL(10, 2))
BEGIN   
DECLARE mensagem VARCHAR(50);
DECLARE EXIT HANDLER FOR 1062
BEGIN
	SET mensagem = CONCAT(vCodigo,' já está como chave primária!!!');
    SELECT mensagem;
END;
INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES (vCodigo,
    vNome,
    vSabor,
    vTamanho,
    vEmbalagem,
    vPreco
    );
SET mensagem = "Produto incluido com sucesso!!!";
SELECT mensagem;
END$$
DELIMITER ;

CALL inclui_novo_produto_parametro('4000002', 'Sabor do Pantanal 1 Litro- Melancia', 
'Melancia', '1 Litro', 'PET', 4.67);

CALL inclui_novo_produto_parametro('4000003', 'Sabor do Pantanal 1 Litro- Melancia', 
'Melancia', '1 Litro', 'PET', 4.67);

-- Atribuição de valor com select
SELECT SABOR FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '4000001';

USE `sucos_vendas`;
DROP procedure IF EXISTS `acha_sabor_produto`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `acha_sabor_produto` (vProduto VARCHAR(50))
BEGIN   
	DECLARE vSabor VARCHAR(50);
    SELECT SABOR INTO vSabor FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = vProduto;
	SELECT vSabor;
END$$
DELIMITER ;

CALL acha_sabor_produto('4000001');

CALL acha_sabor_produto('1013793');

-- Atividade
USE `sucos_vendas`;
DROP procedure IF EXISTS `Quantidade_Notas`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Quantidade_Notas` ()
BEGIN   
	DECLARE NUMNOTAS VARCHAR(50);
    SELECT COUNT(DATA_VENDA) INTO NUMNOTAS FROM notas_fiscais WHERE DATA_VENDA = '2017-01-01';
	SELECT NUMNOTAS as Resultado;
END$$
DELIMITER ;

SELECT COUNT(DATA_VENDA) FROM notas_fiscais
WHERE DATA_VENDA = '2017-01-01';

call Quantidade_Notas();