/* 
Link videoaula JOIN → https://www.youtube.com/watch?v=wm3e7rICW2I&list=PLg5-aZqPjMmC69aUbYfCHiXIPbb5MwMmw&index=10
caso queira treinar na prática link script ddl e dml: https://github.com/heliokamakawa/curso_bd/blob/master/00-estudo%20de%20caso-loja_bebida-script.sql
*** JOIN - LISTA 02 ***
Sintaxe de uma consulta com JOIN:
SELECT 
    {nome_coluna1}
    ,{nome_coluna2}
    , [... outras colunas]
FROM {nome_tabela1}, {nome_tabela2}
WHERE pk = fk;
objetivo de hoje:
→ não errar na sintaxe/semântica no >>FROM<< → quais tabelas podem e devem ser colocadas
→ não errar na sintaxe/semântica no >>WHERE<< → condição de JUNÇÃO (PK e sua REFERÊNCIA)
→ entender o JOIN (que só há registros relacionados)
→ conseguir realizar JOIN de mais de 2 tabelas (perceber que é tudo igual)
Aquecimento

1.	Liste os nomes de todas as cidades ATIVAS do estado PARANÁ.*/
SELECT 
nome.cidade 
FROM cidade, estado
WHERE estado.id = cidade.estado_id
AND cidade.ativo = 's';

# 2.	Liste o nome e o telefone dos fornecedores que estão ativos e moram em PARANAVAÍ.
SELECT
	nome.fornecedor
	,telefone.fornecedor
FROM cidade, fornecedor
WHERE cidade.id = fornecedor.cidade_id
AND cidade.nome = "PARANAVAI";

# 3.	Escreva o comando que liste os nomes dos clientes que moram nas seguintes cidades: MARINGÁ, PARANAVAÍ e CIARNORTE. 
SELECT
	nome.cliente
FROM cidade, cliente
WHERE cidade.id = cliente.cidade_id
AND	cidade.nome = "MARINGÁ" OR cidade.nome = "PARANVAÍ" or cidade.nome = "CIANORTE";

#4.	Liste o nome e o telefone dos funcionarios ATIVOS que moram na região SUL.
SELECT	
	nome.funcionario
    ,telefone.funcionario
FROM estado, cidade, funcionario
WHERE estado.id = cidade.estado_id
AND cidade.id = funcionario.cidade_id
AND estado.sigla = "PR" OR estado.sigla = "SC" OR Restado.sigla = "RS";
/*Nível 2
# 5. Informe o nome dos produtos e a respectiva unidade de medida da venda com o código 3.*/
SELECT 
	nome.produto 
    ,nome.unidade_medida
FROM unidade_medida, produto, venda, item_venda
WHERE uniade_medida.id = produto.unidade_medida_id
AND produto.id = item_venda.produto_id
AND venda.id = item_venda.venda_id
AND venda.id = '3';

# 6. Liste os nomes dos funcionários que já venderam o produto 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L'.
SELECT 
nome.funcionario
FROM funcionario, venda, item_venda, produto
WHERE funcionario.id = venda.funcionario_id
AND venda.id = item_venda.venda_id
AND produto.id = item_venda.produto_id
AND produto.nome = 'REFRIGERANTE COCA-COLA GARRAFA PET 3 L';

# 7. Liste os nomes dos fornecedores dos estados PARANÁ, MATO GROSSO e RIO GRANDE DO NORTE.
SELECT 
fonecedor.nome
FROM fornecedor, cidade, estado
WHERE cidade.id = fornecedor.cidade_id
AND estado.id = cidade.estado_id
AND estado. nome = 'PARANÁ' OR estado. nome = 'MATO GROSSO' OR estado. nome = 'RIO GRANDE DO NORTE';

# 8. Liste os nomes dos produtos vendidos no dia XXX (pode escolher um dia existente).
SELECT
nome.produto
FROM produto, item_venda, venda
WHERE produto.id = item_venda.produto_id
AND venda.id = item_venda.venda_id
AND venda.datacadastro = '2022-10-23';

/*9. Feliz com um bom atendimento, um determinado cliente entra em contato com o gerente para enviar uma lembrança ao funcionário.
O problema é que, além de não informar a sua identidade, ele não lembra do nome do funcionário. Sabe apenas que,na conversa, moraram 
na mesma cidade e possuem o mesmo nome. Neste contexto, faça as consultas necesárias para identificar o funcionário. */
/*10. Um cliente entra em contato com o gerente solicitando um possível erro de troco. O cliente não lembra o nome do funcionário, 
mas possui as seguintes informações:
 (1) nome completo do cliente: Sophia Lima
 (2) CPF do cliente: 321.109.923-95
 (3) cidade onde cliente nasceu: BAURU/SÃO PAULO
 (4) a cliente alega estar faltando 30 reais*
Neste contexto, faça as consultas necessárias para descobrir o possível nome do funcionário. Justifique!*/
/*11. De acordo com o projeto do SEU COLEGA, elabore uma consulta RELEVANTE que ajude de alguma forma a empresa. 
A consulta deve envolver mais de 4 tabelas.*/