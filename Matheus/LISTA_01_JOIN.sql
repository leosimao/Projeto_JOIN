/* Link videoaula JOIN → https://www.youtube.com/watch?v=wm3e7rICW2I&list=PLg5-aZqPjMmC69aUbYfCHiXIPbb5MwMmw&index=10
caso queira treinar na prática link script ddl e dml: https://github.com/heliokamakawa/curso_bd/blob/master/00-estudo%20de%20caso-loja_bebida-script.sql
*** JOIN - LISTA 01 ***
Sintaxe de uma consulta com JOIN:
SELECT 
    {nome_coluna1}
    ,{nome_coluna2}
    , [... outras colunas]
FROM {nome_tabela1}, {nome_tabela2}
WHERE pk = fk;
Sintaxe
1.	Escreva o comando que liste os nomes de todas as cidades e as respectivas siglas do estado. */
SELECT 
	c.nome 'Nome da Cidade'
    ,e.sigla 'Sigla do Estado'
FROM
cidade c, estado e
WHERE e.id = c.estado_id;

/* 2.	Escreva o comando que liste os nomes das cidades ativas e as respectivas siglas do estado. */ 
SELECT 
	c.nome 'Nome da Cidade'
    ,e.sigla 'Sigla do Estado'
FROM
cidade c, estado e
WHERE e.id = c.estado_id
AND c.ativo = 'S';

/*3.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. */

SELECT 
	cliente.nome
	,cidade.nome
FROM 
	cliente, cidade
WHERE cliente.cidade_id = cidade.id;

/*4.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na cidade de Paranavaí.*/

SELECT 
	cliente.nome
	,cidade.nome
FROM 
	cliente, cidade
WHERE cliente.cidade_id = cidade.id
AND cidade.nome = 'PARANAVAÍ';

/* 5.	Escreva o comando que liste os nomes das cidades e as respectivas siglas do estado. Liste somente as cidades ativas.*/
SELECT 
	c.nome 'Nome da Cidade'
    ,e.sigla 'Sigla do Estado'
FROM
cidade c, estado e
WHERE e.id = c.estado_id
AND c.ativo = 'S';

/*6.	Escreva o comando que liste os nomes dos funcionários e os nomes das respectivas cidades. */

SELECT 
	f.nome
    ,c.nome
FROM
cidade c, funcionario f
WHERE f.cidade_id = c.id;

/*7.	Escreva o comando que liste os nomes dos funcionários e a sigla do respectivo estado. */

SELECT 
	f.nome
    ,e.sigla
FROM
estado e, funcionario f, cidade c
WHERE f.cidade_id = c.id
AND c.estado_id = e.id;

/*8.	Escreva o comando que liste os nomes dos cliente e os nomes das respectivas cidades. Liste somente os clientes que moram na região sul.*/

SELECT 
	cliente.nome
    ,cidade.nome
FROM
cidade, cliente, estado
WHERE cliente.cidade_id = cidade.id
AND cidade.estado_id = estado.id
AND (estado.sigla = 'PR' OR estado.sigla = 'SC' OR estado.sigla ='RS');

/*9.	Escreva o comando que liste os nomes dos estados com cadastros ativos que possuem algum cliente cadastrado.*/

SELECT
	DISTINCT estado.nome 
FROM
estado, cidade, cliente
WHERE cidade.id = cliente.cidade_id
AND estado.id = cidade.estado_id
AND estado.ativo = 'S';

/*10.	Escreva o comando que liste todas as vendas e o nome do respectivo funcionário que a realizou.*/

SELECT
venda.data
,funcionario.nome
FROM
venda, funcionario
WHERE venda.funcionario_id = funcionario.id;

/*11.	Liste o nome dos produtos, o preço de venda e o nome da unidade de medida.*/
SELECT
produto.nome
,produto.preco_venda
,unidade_medida.nome
FROM
produto, unidade_medida
WHERE produto.unidade_medida_id = unidade_medida.id;

/*12.	Liste o nome dos produtos da marca "Coca-cola".*/

SELECT
produto.nome
FROM
produto, marca
WHERE marca.nome = 'COCA-COLA';


/*13. DESAFIO!!! Liste os nomes dos clientes do estado de São Paulo que já compraram o produto 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'.*/

SELECT
cliente.nome
FROM estado, cidade, cliente, venda, item_venda, produto
WHERE estado.id = cidade.estado_id
	AND cidade.id = cidade.estado_id
    AND cliente.id - venda.cliente_id
    AND venda.id = item_venda.venda_id
    AND produto.id = item_venda.venda_id
    AND produto.nome = 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'
    AND estado.sigla = 'SP';

/*Semântica*/
/*1.	Em que caso devemos utilizar o JOIN? Quais tabelas podem ser utilizando em um comando JOIN?
Deve-se utlizar o JOIN em casos que queremos relacionar tabelas, mostrando os resultados. O JOIN pode ser utilizado apenas em tabelas que tem dependência. 
*/
/*2.	No caso do JOIN, o que é condição de junção. Qual cuidado devemos ter. */
/*3.	Em relação a sintaxe, em um JOIN não é necessário utilizarmos condições (WHERE) - o comando irá executar normalmente. Porém, em questão de semântica, a cada junção é necessário ter ao menos 1 condição. Explique.*/
/*4.	O que é produto cartesiano? Como funciona? Qual a relação com o JOIN.*/
/*5.	Na elaboração de um consulta que envolve 1587 tabelas, serão necessários, quantas condições de junção?*/