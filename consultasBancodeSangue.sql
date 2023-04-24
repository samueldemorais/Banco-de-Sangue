----------- CONSULTA USANDO BETWEEN -----------
/* exibir código da bolsa e data da coleta de 
bolsas de sangue que foram coletadas no ano 2022*/

SELECT cod_bolsa, data_da_coleta 
FROM bolsa_de_sangue
WHERE data_da_coleta BETWEEN '01/01/2022' AND '31/12/2022';

-------- CONSULTAS USANDO INNER JOIN -----------
/*exibir o nome do doador e o tipo sanguíneo dele*/

SELECT d.nome, t.tipo_sanguineo
FROM doador d inner join tipo_sanguineo t 
on d.cod_do_sangue = t.cod_do_sangue;

/*exibir nome do paciente e nome do enfermeiro que o atendeu*/

select d.nome as Doador, e.nome as Enfermeiro
FROM doador d join bolsa_de_sangue b 
ON d.cod_doador = b.cod_doador 
JOIN enfermeiro e on b.cod_enfermeiro = e.cod_enfermeiro;

/*exibir enfermeiros que coletaram tipo sanguíneo AB+*/

SELECT DISTINCT e.nome, t.tipo_sanguineo
FROM enfermeiro e inner join bolsa_de_sangue b 
on e.cod_enfermeiro = b.cod_enfermeiro inner join doador d 
on b.cod_doador = d.cod_doador inner join tipo_sanguineo t 
on d.cod_do_sangue = t.cod_do_sangue 
WHERE t.tipo_sanguineo = 'AB+';

/*Exibir os nomes dos pacientes que possuem o mesmo tipo sanguíneo de algum doador*/

select distinct p.nome
from paciente p
inner join doador d
on p.cod_do_sangue = d.cod_do_sangue;


-------- CONSULTAS USANDO RIGHT JOIN -----------

/*exibir todos os tipos sanguíneos e, se existir, 
os nomes dos doadores que apresentam o tipo*/

SELECT d.nome, t.tipo_sanguineo
FROM doador d RIGHT join tipo_sanguineo t 
on d.cod_do_sangue = t.cod_do_sangue;

-------- CONSULTAS USANDO GROUP BY---------------

/* Exibir a quantidade de doadores que tem um determinado
tipo sanguineo */

SELECT t.tipo_sanguineo, COUNT(*) 
from doador d 
inner join tipo_sanguineo t on t.cod_do_sangue = d.cod_do_sangue
group by tipo_sanguineo;

/* Exibir a quantidade de enfermeiros aque que recebem acima de 1800, agrupando-os pelo salário recebido */

SELECT SALARIO, COUNT(*)
FROM enfermeiro
GROUP BY salario
HAVING SALARIO > 1800.00;

---------CONSULTA UTILIZANDO UNION---------------
/*exibir os nomes dos biomédicos que ganham acima de 6000
e dos enfermeiros que ganham abaixo de 2000*/

SELECT nome from biomedico 
where salario > 6000.00
UNION 
SELECT nome from enfermeiro
where salario < 2000.00;

---------CONSULTA UTILIZANDO SUBQUERY---------------

/*exibir os enfermeiros que ganham mais que a média*/

select nome from enfermeiro
where salario > (select avg(salario) from enfermeiro);

/*exibir o biomédico ou os biomédicos que possuem menor salário
e o salário em questão*/

select nome, salario from biomedico 
where salario = (select min(salario) from biomedico);

/*Exibir os tipos sanguíneos dos doadores cadastrados*/

select tipo_sanguineo from tipo_sanguineo 
where cod_do_sangue 
in (select cod_do_sangue from doador)
order by tipo_sanguineo;

-------------- REESCREVENDO CONSULTAS---------------------

/* Reescrita da consulta: Exibir os tipos sanguíneos dos doadores cadastrados*/

select distinct t.tipo_sanguineo from tipo_sanguineo t
join doador d on d.cod_do_sangue = t.cod_do_sangue 
order by t.tipo_sanguineo;


/* Reescrita da consulta: Exibir os nomes dos pacientes que possuem o mesmo tipo sanguíneo de algum doador*/

select nome from paciente
 where cod_do_sangue in (select cod_do_sangue from doador);