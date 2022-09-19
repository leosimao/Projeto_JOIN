## Atividade em Equipe JOIN
# 1 - O que é e para que serve o JOIN? Quando devemos utilizar?
JOIN é uma forma de combinar duas tabelas através de alguma chave ou valor comum entre elas, como por exemplo uma cahve estrangeira.
Com isso, o JOIN se faz necessário quando precisamos vincular dados presentes em diferentes tabelas para obtê-los em um único resultado apresentado, como no exemplo disponibilizado
em aula de trazer de uma tabela "estado" a sigla do mesmo com o nome de uma tabela "cidade" com os estados correspondentes.

# 2 - Sintaxe e quais são os passos para ENTENDER e DOMINAR o JOIN?

Existe duas formar de realizar o JOIN, a primeira é a forma mais recomendada e consequentemente mais utilizada. Segue a sintaxe

`SELECT column_1, column_2 FROM table_main INNER JOIN second_table ON join_conditional`

Podemos ainda acrescentar uma condição `WHERE` para que seja realizada uma condição 
A segunda forma de realizar a relação entre duas tabelas, não recomendada 
