-- Joins conectam tabelas diferentes
-- Retornam NULL quando não há correspondencia
-- INNER, LEFT, RIGHT, FULL JOIN, mas também há o CROSS JOIN, o qual retorna o produto cartesiano das tabelas

SELECT * FROM tabela_de_vendedores;
-- Campo em comum: MATRICULA
SELECT * FROM notas_fiscais;

SELECT * FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA;

SELECT A.MATRICULA, A.NOME, COUNT(*) AS NOTAS_FICAIS FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA, A.NOME;

-- Antigamente
SELECT A.MATRICULA, A.NOME, COUNT(*)
FROM tabela_de_vendedores A, notas_fiscais B
WHERE A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA, A.NOME;

-- Atividade________________________________________________________________
SELECT * FROM notas_fiscais;
SELECT * FROM itens_notas_fiscais;

SELECT YEAR(B.DATA_VENDA) AS ANO, 
	SUM(A.QUANTIDADE * A.PRECO) as FATURAMENTO_ANUAL 
FROM itens_notas_fiscais A
INNER JOIN notas_fiscais B
	WHERE A.NUMERO = B.NUMERO
GROUP BY ANO
ORDER BY ANO;

-- Left Join e  Right Join________________________________________________________________
SELECT CPF, COUNT(*) FROM notas_fiscais
GROUP BY CPF;
		--  A Quantidade de clientes está diferente
SELECT CPF, COUNT(*) FROM tabela_de_clientes
GROUP BY CPF;

SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A 
INNER JOIN notas_fiscais B 
	ON A.CPF = B.CPF;
    
SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A 
LEFT JOIN notas_fiscais B
	ON A.CPF = B.CPF;		-- PODEMOS VER QUE FÁBIO NÃO TEM NOTA FISCAL EMITIDA

SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A 
LEFT JOIN notas_fiscais B
	ON A.CPF = B.CPF	
WHERE B.CPF IS NULL;		-- Left Join: Todos que tem na tabela da esquerda (clientes)

SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A 
RIGHT JOIN notas_fiscais B
	ON A.CPF = B.CPF;		-- Right Joint: Todos que tem na tabela a direta (notas fiscais)
    
-- Exemplos de Full Join e Cross Join________________________________________________________________
SELECT * FROM tabela_de_vendedores;
SELECT * FROM tabela_de_clientes;

SELECT * FROM tabela_de_vendedores INNER JOIN tabela_de_clientes
	ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
    
SELECT tabela_de_vendedores.BAIRRO, 
tabela_de_vendedores.NOME AS NOME_VENDEDOR, DE_FERIAS,
tabela_de_clientes.BAIRRO, 
tabela_de_clientes.NOME AS NOME_CLIENTE
FROM tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- Cross Join
SELECT tabela_de_vendedores.BAIRRO, 
tabela_de_vendedores.NOME AS NOME_VENDEDOR, DE_FERIAS,
tabela_de_clientes.BAIRRO, 
tabela_de_clientes.NOME AS NOME_CLIENTE
FROM tabela_de_vendedores, tabela_de_clientes;

-- Union : Aplica distinct | UNION ALL: Não aplica distinct________________________________________________________________ 
-- Concatenação na linha
SELECT DISTINCT BAIRRO FROM tabela_de_clientes;
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION ALL
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO, NOME FROM tabela_de_clientes
UNION 
SELECT DISTINCT BAIRRO, NOME FROM tabela_de_vendedores; -- Não agrupam pois só concatena os iguais

SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' AS TIPO, CPF AS IDENTIFICAÇÃO FROM tabela_de_clientes
UNION 
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' AS TIPO, MATRICULA FROM tabela_de_vendedores;

SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
UNION
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
-- União de left join e right join nos dá um full join

-- Subconsultas____________________________________________________________________
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT * FROM tabela_de_clientes 
WHERE BAIRRO IN('Tijuca', 'Jardins', 'Copacabana', 'Santo Amaro');

-- Melhor:
SELECT * FROM tabela_de_clientes 
WHERE BAIRRO IN( SELECT DISTINCT BAIRRO FROM tabela_de_vendedores );

SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM
	(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos
	GROUP BY EMBALAGEM) X
WHERE X.PRECO_MAXIMO >= 10;

SELECT CPF, COUNT(*) FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF
HAVING COUNT(*) > 2000;

SELECT X.CPF, X.CONTAGEM FROM
	(SELECT CPF, COUNT(*) AS CONTAGEM FROM notas_fiscais 
    WHERE YEAR(DATA_VENDA) = 2016
    GROUP BY CPF) X
WHERE X.CONTAGEM > 2000;

-- Visão ________________________________________________________________________________________________
-- Espécie de subconsulta, só que mais organizado
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM;

CREATE VIEW `VW_MAIORES_EMBALAGENS` AS
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM;

SELECT * FROM VW_MAIORES_EMBALAGENS;

SELECT * FROM vw_maiores_embalagens
WHERE MAIOR_PRECO > 10;

SELECT A.NOME_DO_PRODUTO, A.PRECO_DE_LISTA, B.MAIOR_PRECO, 
	(A.PRECO_DE_LISTA / B.MAIOR_PRECO - 1) * 100 AS PERCENTUAL_DESCONTO
FROM tabela_de_produtos A INNER JOIN VW_MAIORES_EMBALAGENS B
ON A.EMBALAGEM = B.EMBALAGEM;