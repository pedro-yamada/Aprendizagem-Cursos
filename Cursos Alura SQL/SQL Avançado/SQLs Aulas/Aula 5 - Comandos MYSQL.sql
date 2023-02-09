USE sucos_vendas;
-- STRINGS ____________________________________________________________________________________________________________________________________________________________________________________________________________
SELECT LTRIM('           OLÁ') AS RESULTADO;

SELECT RTRIM('OLÁ               ') AS RESULTADO; 

SELECT TRIM('             OLÁ               ') AS RESULTADO; 

SELECT CONCAT('OLÁ', ' ', 'TUDO BEM','?') AS RESULTADO;

SELECT UPPER('OLÁ, tudo bem?') AS RESULTADO;

SELECT SUBSTRING('OLÁ, TUDO BEM?', 6) AS RESULTADO;
SELECT SUBSTRING('OLÁ, TUDO BEM?', 7) AS RESULTADO;
SELECT SUBSTRING('OLÁ, TUDO BEM?', 6, 4) AS RESULTADO;

SELECT CONCAT(NOME, '(', CPF, ')') AS RESULTADO FROM tabELA_de_clientes;

-- Atividade ________________________________________________________________________________________________________________________________________________________________________________________________
SELECT NOME, CONCAT( ENDERECO_1,', ',BAIRRO, ', ',CIDADE, ', ',ESTADO ) AS ENDEREÇO_COMPLETO
FROM tabeLA_De_clientes;

-- DATAS ____________________________________________________________________________________________________________________________________________________________________________________________________
SELECT CURDATE();
SELECT cuRRENT_tIME();
SELECT cuRRENT_tIMESTAMP();

SELECT YEAR(CURdATE());
SELECT MONTH(CUrDATE());
SELECT MONTHNAME(CURDATE());
SELECT daYNAME(cURDATE());

SELECT DATEDIFF(CURRENT_TIMESTAMP(),  "2001-05-14") AS RESULTADO;

SELECT DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 5 DAY) AS RESULTADO;

SELECT DISTINCT DATA_VENDA, 
	DAYNAME(DATA_VENDA) AS DIA, MONTHNAME(DATA_VENDA) AS MES, YEAR(DATA_VENDA) AS ANO
FROM notas_fiscais;

-- ATIVIDADE _____________________________________________________________________________________________________________________________________________________________________
SELECT 
    NOME,
    (YEAR(CURDATE()) - YEAR(DATA_DE_NASCIMENTO)) AS IDADE_ATUAL
FROM
    tabela_de_clientes;

SELECT NOME, TIMESTAMPDIFF (YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS    IDADE
FROM  tabela_de_clientes;

-- Comandos Matemáticos_____________________________________________________________________________________________________________________________________________________________________
SELECT (23 + 5 * (9 / 2)) AS RESULTADO;

SELECT CEILING(21.33333333333) AS RESULTADO; -- Devolve maior inteiro
SELECT ROUND(21.33333333333) AS RESULTADO; -- Arredonda
SELECT FLOOR(21.33333333333) AS RESULTADO; -- Devolve menor 

SELECT RAND() AS RESULTADO; -- Retorna número aleatório entre 0 e 1

SELECT NUMERO, QUANTIDADE, PRECO, ROUND(QUANTIDADE * PRECO, 2) AS FATURAMENTO
FROM itens_notas_fiscais;

-- Atividade _____________________________________________________________________________________________
SELECT * FROM itens_notas_fiscais;
SELECT * FROM notas_fiscais;

SELECT YEAR(DATA_VENDA) AS ANO, FLOOR(SUM(IMPOSTO * QUANTIDADE * PRECO)) AS IMPOSTOS
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais I
ON I.NUMERO = NF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY ANO;

-- Conversão de dados ________________________________________________________________________________________________________________________________________________
SELECT CONCAT('O DIA DE HOJE É:', CURRENT_TIMESTAMP());

SELECT CONCAT('O dia de hoje é: ',
DATE_FORMAT(CURRENT_TIMESTAMP(), '%W - %d/%m/%Y'));

SELECT SUBSTRING(CONVERT(23.3, CHAR), 1,1) AS RESULTADO;

-- Atividade ________________________________________________________________________________________________________________________
SELECT * FROM tabela_de_clientes;
SELECT * FROM notas_fiscais;
SELECT * FROM itens_notas_fiscais;

SELECT CONCAT("O cliente ", NOME," faturou ", ROUND(SUM(QUANTIDADE * PRECO)) , " no ano de 2016") AS RESULTADO
FROM itens_notas_fiscais INF
INNER JOIN notas_fiscais NF ON INF.NUMERO = NF.NUMERO
INNER JOIN tabela_de_clientes TC ON TC.CPF = NF.CPF
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY TC.NOME;		-- Minha resolução 

SELECT CONCAT('O cliente ', TC.NOME, ' faturou ', 
CAST(SUM(INF.QUANTIDADE * INF.preco) AS char (20))
 , ' no ano ', CAST(YEAR(NF.DATA_VENDA) AS char (20))) AS SENTENCA FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC ON NF.CPF = TC.CPF
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY TC.NOME, YEAR(DATA_VENDA);
