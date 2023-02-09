-- Conhecendo o banco de dadostabela_de_clientes
USE sucos_vendas;
SELECT * FROM itens_notas_fiscais;

-- Revisando Consultas
USE sucos_vendas;
SELECT CPF, NOME, DATA_DE_NASCIMENTO, IDADE, ESTADO, CEP FROM tabela_de_clientes;

SELECT CPF AS IDENTIFICADOR, NOME AS CLIENTE FROM tabela_de_clientes;

SELECT * FROM tabela_de_produtos WHERE EMBALAGEM = 'PET';

SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA > 12.01 AND PRECO_DE_LISTA < 12.02;
SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA BETWEEN 12.01 AND 12.02;

-- Consultas condicionais
USE sucos_vendas;
SELECT * FROM tabela_de_produtos WHERE (SABOR = 'Manga' AND TAMANHO = '470 ml');

SELECT * FROM tabela_de_produtos WHERE (SABOR = 'Manga' AND NOT TAMANHO = '470 ml');

SELECT * FROM tabela_de_produtos WHERE SABOR IN ('Laranja', 'Manga'); -- Equivalente ao OR 

SELECT * FROM tabela_de_clientes WHERE (
	CIDADE IN ('Rio de Janeiro', 'São Paulo') AND (IDADE >= 19)
	);
    
-- Atividade
SELECT * FROM itens_notas_fiscais WHERE(
		(QUANTIDADE > 60) AND (PRECO <= 3)
);

-- Condição like: ex LIKE '%objeto': Seleciona todos os que terminam com objeto
SELECT * FROM tabela_de_produtos WHERE(
	SABOR LIKE '%maça%'
);

-- Atividade
SELECT * FROM tabela_de_clientes WHERE(
NOME LIKE '%Mattos')