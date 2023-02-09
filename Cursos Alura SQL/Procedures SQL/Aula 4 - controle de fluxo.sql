SELECT * FROM tabela_de_clientes;

-- Se cliente nasceu antes de 2000 é jovem, caso o contrário é velho
SELECT DATA_DE_NASCIMENTO FROM tabela_de_clientes
WHERE CPF = '1471156710';

USE `sucos_vendas`;
DROP procedure IF EXISTS `cliente_novo_velho`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `cliente_novo_velho` (vCPF VARCHAR(20))
BEGIN
	DECLARE vResultado VARCHAR (20);
    DECLARE vDataNascimento DATE;
    
    SELECT DATA_DE_NASCIMENTO INTO vDataNascimento
    FROM tabela_de_clientes
	WHERE CPF = vCPF;
    
    IF vDataNascimento < '2000-01-01' THEN
		SET vResultado = 'Cliente Velho';
    ELSE
		SET vResultado = 'Cliente Novo';
	END IF;
	SELECT vResultado;
END$$
DELIMITER ;

CALL cliente_novo_velho('1471156710');
CALL cliente_novo_velho('19290992743');

-- Atividade
/*Crie uma Stored Procedure que, baseado em uma data, contamos o número de notas fiscais. 
Se houverem mais que 70 notas exibimos a mensagem: ‘Muita nota’. 
Ou então exibimos a mensagem ‘Pouca nota’. Também exibir o número de notas. 
Chame esta Stored Procedure de Testa_Numero_Notas.

A data a ser usada para testar a nota será um parâmetro da Stored Procedure.*/
DELIMITER $$
USE `sucos_vendas`$$
DROP procedure IF EXISTS `Testa_Numero_Notas`$$
CREATE PROCEDURE `Testa_Numero_Notas` (vData DATE)
BEGIN
	DECLARE vResultado VARCHAR (20);
    DECLARE vQuantidade_notas INT;
    
	SELECT COUNT(DATA_VENDA) INTO vResultado
    FROM notas_fiscais
	WHERE DATA_VENDA = vData ;
    
    IF vResultado < 70 THEN
		SET vResultado = 'Pouca nota';
    ELSE
		SET vResultado = 'Muita nota';
	END IF;
	SELECT vResultado;
END$$
DELIMITER ;

SELECT * FROM notas_fiscais
ORDER BY DATA_VENDA;

CALL Testa_Numero_Notas('2015-01-01');
CALL Testa_Numero_Notas('2015-01-02');

/*IF THEN ELSEIF*/
SELECT * FROM tabela_de_produtos;

DELIMITER $$
USE `sucos_vendas`$$
DROP procedure IF EXISTS `acha_status_preco`$$
CREATE PROCEDURE `acha_status_preco` (vProduto VARCHAR(50))
BEGIN
	DECLARE vPreco FLOAT;
    DECLARE vMensagem VARCHAR(50);
    
	SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos
    WHERE CODIGO_DO_PRODUTO = vProduto;
	IF vPreco >= 12 THEN
		SET vMensagem = 'Produto caro';
	ELSEIF vPreco >= 7 THEN
		SET vMensagem = 'Produto em conta'; 
	ELSE 
		SET vMensagem = 'Produto barato';
	END IF;
    SELECT vMensagem;
END$$
DELIMITER ;

SELECT * FROM tabela_de_produtos;

CALL acha_status_preco('1000889');
CALL acha_status_preco('1004327');

SELECT SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = '20170301';

DELIMITER $$
USE `sucos_vendas`$$
DROP procedure IF EXISTS `Comparativo_Vendas`$$
CREATE PROCEDURE `Comparativo_Vendas` (vData1 DATE, vData2 DATE)
BEGIN
	DECLARE vVendas1 FLOAT;
    DECLARE vVendas2 FLOAT;
    
    DECLARE vResultado VARCHAR(10);
    
	SELECT SUM(B.QUANTIDADE * B.PRECO) INTO vVendas1 FROM 
	NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
	ON A.NUMERO = B.NUMERO
	WHERE A.DATA_VENDA = vData1;
    
	SELECT SUM(B.QUANTIDADE * B.PRECO) INTO vVendas2 FROM 
	NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
	ON A.NUMERO = B.NUMERO
	WHERE A.DATA_VENDA = vData2;
    
    IF (vVendas1 / vVendas2) >= 1.1 THEN
		SET vResultado = 'Verde';
	ELSEIF (vVendas1 / vVendas2) >= 0.9 THEN
		SET vResultado = 'Amarelo';
	ELSE
		SET vResultado = 'Vermelho';
	END IF;
    
    SELECT vResultado as Resultado;
END$$
DELIMITER ;

SELECT * FROM notas_fiscais;
call Comparativo_Vendas('2013-01-01', '2015-01-01');

/*Case not found*/


DELIMITER $$
USE `sucos_vendas`$$
DROP procedure IF EXISTS `acha_tipo_sabor_erro`$$
CREATE PROCEDURE `acha_tipo_sabor_erro` (vProduto VARCHAR(50))
BEGIN
	DECLARE vSabor VARCHAR(50);
    DECLARE msgErro VARCHAR(50);
    
    DECLARE CONTINUE HANDLER FOR 1339 SET 
    msgErro = 'O case não está completo';
    
	SELECT sabor INTO vSabor FROM tabela_de_produtos 
	WHERE CODIGO_DO_PRODUTO = vProduto;
	CASE vSabor
	WHEN 'Lima/Limão' THEN SELECT 'Cítrico';
	WHEN 'Laranja' THEN SELECT 'Cítrico';
	WHEN 'Morango/Limão' THEN SELECT 'Cítrico';
	WHEN 'Uva' THEN SELECT 'Neutro';
	WHEN 'Morango' THEN SELECT 'Neutro';
	END CASE;
	SELECT msgErro;
END$$
DELIMITER ;

CALL acha_tipo_sabor_erro('1000889');

SELECT  * FROM tabela_de_produtos tdp;

/*CASE CONDICIONAL*/
DELIMITER $$
USE `sucos_vendas`$$
DROP procedure IF EXISTS `acha_status_preco_case`$$
CREATE PROCEDURE `acha_status_preco_case` (vProduto VARCHAR(50))
BEGIN
	DECLARE vPreco FLOAT;
    DECLARE vMensagem VARCHAR(50);
    
	SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos
    WHERE CODIGO_DO_PRODUTO = vProduto;
-- Antes:
-- 	IF vPreco >= 12 THEN
-- 		SET vMensagem = 'Produto caro';
-- 	ELSEIF vPreco >= 7 THEN
-- 		SET vMensagem = 'Produto em conta'; 
-- 	ELSE 
-- 		SET vMensagem = 'Produto barato';
-- 	END IF;
   CASE
   WHEN vPReco >=12 THEN SET vMensagem = 'Produto Caro';
   WHEN vPReco >= 7 THEN SET vMensagem = 'Produto em conta';
   WHEN vPReco < 7 THEN SET vMensagem = 'Produto barato';
   END CASE;
   SELECT vMensagem;
END $$
DELIMITER ;

CALL acha_status_preco_case('1000889');

CALL acha_status_preco('1000889');

DELIMITER $$
USE `sucos_vendas`$$
DROP procedure IF EXISTS `Comparativo_Vendas_Case_Cond`$$

CREATE PROCEDURE `Comparativo_Vendas_Case_Cond`(DataInicial DATE, DataFinal DATE)
BEGIN
DECLARE FaturamentoInicial FLOAT;
DECLARE FaturamentoFinal FLOAT;
DECLARE Variacao float;
SELECT SUM(B.QUANTIDADE * B.PRECO) INTO FaturamentoInicial FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = DataInicial;
SELECT SUM(B.QUANTIDADE * B.PRECO) INTO FaturamentoFinal FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = DataFinal ;
SET Variacao = ((FaturamentoFinal / FaturamentoInicial) -1) * 100; 
CASE
WHEN Variacao > 10 THEN SELECT 'Verde';
WHEN Variacao > -10 AND Variacao < 10 THEN  SELECT 'Amarelo';
WHEN Variacao <= -10 THEN SELECT 'Vermelho';
END CASE;
END $$
DELIMITER ;

/*LOOP*/
DROP TABLE TAB_LOOPING;
CREATE TABLE TAB_LOOPING(ID INT);

DELIMITER $$
USE `sucos_vendas`$$
DROP procedure IF EXISTS `looping_while`$$
CREATE PROCEDURE `looping_while` (vNumInicial INT, vNumFinal INT)
BEGIN
	DECLARE vContador INT;
    
	DELETE FROM TAB_LOOPING;    
	
	SET vContador = vNumInicial;
	WHILE vContador <= vNumFinal
	DO 
		INSERT INTO TAB_LOOPING(ID) VALUES (vContador);
		SET vContador = vContador + 1;
	END WHILE;
	SELECT * FROM TAB_LOOPING;
END $$
DELIMITER ;

CALL looping_while(1,1000);
DROP TABLE TAB_LOOPING;
CREATE TABLE TAB_LOOPING(ID INT);
CALL looping_while(1,59);

-- Exercicio
DELIMITER $$
USE `sucos_vendas`$$
DROP procedure IF EXISTS `Soma_Dias_Notas`$$
CREATE PROCEDURE `Soma_Dias_Notas`()
BEGIN
	DECLARE DATAINICIAL DATE;
	DECLARE DATAFINAL DATE;
	DECLARE NUMNOTAS INT;
	SET DATAINICIAL = '20170101';
	SET DATAFINAL = '20170110';
	WHILE DATAINICIAL <= DATAFINAL
	DO
		SELECT COUNT(*) INTO NUMNOTAS  FROM notas_fiscais WHERE DATA_VENDA = DATAINICIAL;
		SELECT concat(DATE_FORMAT(DATAINICIAL, '%d/%m/%Y'), '-' , CAST(NUMNOTAS as CHAR(50)));
		SELECT ADDDATE(DATAINICIAL, INTERVAL 1 DAY) INTO DATAINICIAL;
	END WHILE;
END$$
DELIMITER ;

/*PROBLEMAS SELECT INTO*/

