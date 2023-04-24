------------CRIAÇÃO DE VIEWS------------------

/*View que exibe informações dos pacientes que começam
com a letra M
OBS: a view só permite inserções cujo a letra do paciente comece com 
M*/

create or replace view Vpaciente 
(Codigo, Nome, dataNascimento, codigo_sangue)
AS SELECT cod_paciente, nome, data_de_nascimento, cod_do_sangue
FROM paciente 
WHERE nome like 'M%'
WITH CHECK OPTION;

insert into Vpaciente values(7, 'Mayara','20/11/2000', 3)

select * from Vpaciente

/*View que exibe a quantidade de bolsas que um biomédico analisou
OBS: 4 JOINS, aproveite a robustez prof :)*/

CREATE OR REPLACE view Vbolsasbiomedico(Biomedico, quantidade_bolsas_analisadas)
AS
SELECT  B.nome, count(*)
FROM Biomedico B 
inner join analisada a
on B.cod_biomedico = a.cod_biomedico 
inner join bolsa_de_sangue BS
on a.cod_bolsa = BS.cod_bolsa 
inner join doador d 
on BS.cod_doador = d.cod_doador 
inner join tipo_sanguineo t
on d.cod_do_sangue = t.cod_do_sangue
GROUP BY B.cod_biomedico, a.cod_biomedico;

select * from Vbolsasbiomedico

/*View que exibe o nome e coren dos enfermeiros que coletaram
tipo sanguíneo O+*/

CREATE OR REPLACE VIEW VenfermeiroColetaOpositivo (Enfermeiro, Coren)
AS SELECT DISTINCT e.nome, e.coren
FROM enfermeiro e inner join bolsa_de_sangue b 
on e.cod_enfermeiro = b.cod_enfermeiro inner join doador d 
on b.cod_doador = d.cod_doador inner join tipo_sanguineo t 
on d.cod_do_sangue = t.cod_do_sangue 
WHERE t.tipo_sanguineo = 'O+';

select * from VenfermeiroColetaOpositivo
