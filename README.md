## Atividade em Equipe PROJETO JOIN
# 1 - O que é e para que serve o JOIN? Quando devemos utilizar?
Quando usamos JOINS dentro do SQL podemos retornar duas ou mais tabelas que possuem relacionamentos entre si, são recomendados quando queremos encontrar valores de uma tabelas em outra tabela através de uma condição. Para relacionarmos essas duas tabelas podemos simplesmente associar as tabelas, através de uma Primary Key e uma Foreign Key que é compativel ou também podemos usar operadores lógicos como (>= ; <=; =; <; >). Dentro do SQL temos alguma opções de JOINS sendo elas.

* INNER JOIN
* LEFT [OUTER] JOIN
* RIGHT [OUTER] JOIN
* FULL [OUTER] JOIN
* CROSS JOIN

Podemos ver na imagem abaixo como funciona cada uma delas:
<img src = "https://cdn.discordapp.com/attachments/1024050282386169908/1024050941705596928/unknown.png">
    
Obs: imagem está faltando apenas o FULL [OUTER] JOIN, mas como o próprio nome ja diz é um JOIN completo semelhante ao CROSS JOIN
    
# 2 - Sintaxe e quais são os passos para ENTENDER e DOMINAR o JOIN?

Podemos utilizar os JOINS de duas formas, uma mais performatica e outra, dependendo do tamanho do database, menos performática. A mais performatica portanto mais comum de se encontrar é o JOIN que é encontrado dento da clausula `FROM` que possui a seguinte sintaxe.

```
SELECT
 column_1, column_2, column_3
FROM
 tb1
JOIN tb2 on tb2.id_tb2 = tb1.id_tb1
```

A forma menos performatica que podemos usar o JOIN é dentro de uma clausula `WHERE` que ficaria da seguinte forma

```
SELECT
 column_1, column_2, column_3
FROM tb1, tb2
WHERE tb1.id_tb1 = tb2.id_tb2
```
