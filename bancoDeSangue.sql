CREATE TABLE tipo_sanguineo (
  cod_do_sangue serial,
  tipo_sanguineo VARCHAR(3) NOT NULL,
  CONSTRAINT pk_cod_do_sangue PRIMARY KEY (cod_do_sangue)
);


CREATE TABLE Doador (
  cod_doador serial,
  CPF VARCHAR(30) NOT NULL,
  nome VARCHAR(30) NOT NULL,
  data_nascimento DATE NOT NULL,
  peso DECIMAL(5,2) NOT NULL,
  cod_do_sangue INT NOT NULL,
  CONSTRAINT pk_cod_doador PRIMARY KEY (cod_doador),
  CONSTRAINT uk_cpf UNIQUE (CPF),  
  CONSTRAINT fk_cod_do_sangue FOREIGN KEY (cod_do_sangue) REFERENCES tipo_sanguineo
);


CREATE TABLE Enfermeiro (
  cod_enfermeiro serial,
  coren VARCHAR(15) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  data_nascimento DATE NOT NULL,
  data_inicio DATE NOT NULL,
  salario DECIMAL(10,2) NOT NULL,
  CONSTRAINT pk_codenfermeiro PRIMARY KEY (cod_enfermeiro),
  CONSTRAINT uk_coren UNIQUE (coren)
);

CREATE TABLE Paciente (
  cod_paciente serial,
  nome VARCHAR(30) NOT NULL,
  data_de_nascimento DATE NOT NULL,
  cod_do_sangue INT NOT NULL,
  CONSTRAINT pk_cod_paciente PRIMARY KEY (cod_paciente),
  CONSTRAINT fk_cod_do_sangue FOREIGN KEY (cod_do_sangue) REFERENCES tipo_sanguineo
);


CREATE TABLE Bolsa_de_sangue (
  cod_bolsa serial,
  hora_da_coleta TIME NULL,
  data_da_coleta DATE NULL,
  apta boolean DEFAULT FALSE NOT NULL,
  cod_enfermeiro INT NOT NULL,
  cod_doador INT NOT NULL,
  cod_paciente INT NULL,  
  CONSTRAINT pk_cod_bolsa_e_hora_da_coleta_e_data_da_coleta PRIMARY KEY (cod_bolsa, hora_da_coleta, data_da_coleta),  
  CONSTRAINT fk_cod_enfermeiro FOREIGN KEY (cod_enfermeiro) REFERENCES Enfermeiro,   
  CONSTRAINT fk_cod_paciente FOREIGN KEY (cod_paciente) REFERENCES Paciente,
  CONSTRAINT fk_cod_doador FOREIGN KEY (cod_doador) REFERENCES Doador
);

CREATE TABLE Biomedico (
  cod_biomedico serial,
  crbm VARCHAR(30) NOT NULL,
  nome VARCHAR(30) NOT NULL,
  data_nascimento DATE NOT NULL,
  data_inicio DATE NOT NULL,
  salario DECIMAL(10,2) NOT NULL,
  CONSTRAINT pk_cod_biomedico PRIMARY KEY (cod_biomedico),
  CONSTRAINT uk_crbm UNIQUE (crbm)
);


CREATE TABLE Analisada (
  cod_bolsa INT,
  hora_da_coleta TIME,
  data_da_coleta DATE,
  cod_biomedico INT,
 apta BOOLEAN NULL,
  CONSTRAINT pk_cod_bolsa_e_hora_da_coleta_e_data_da_coleta_e_cod_biomedico  PRIMARY KEY (cod_bolsa, hora_da_coleta, data_da_coleta, cod_biomedico),
  CONSTRAINT fk_cod_bolsa_e_hora_da_coleta_e_data_da_coleta FOREIGN KEY (cod_bolsa, hora_da_coleta, data_da_coleta) REFERENCES Bolsa_de_sangue
ON DELETE CASCADE,
  CONSTRAINT fk_cod_biomedico FOREIGN KEY (cod_biomedico) REFERENCES Biomedico
);


OBS: PODE SER NECESSÁRIO EXECUTAR ESSE COMANDO PARA AS INSERÇÕES DAS DATAS NO FORMATO BRASILEIRO.

SET datestyle TO SQL, DMY;


-------------- INSERT TIPO SANGUINEO ------------------------

INSERT into tipo_sanguineo  VALUES (default, 'A+');
INSERT into tipo_sanguineo  VALUES (default, 'B+');
INSERT into tipo_sanguineo  VALUES (default, 'AB+');
INSERT into tipo_sanguineo  VALUES (default, 'O+');
INSERT into tipo_sanguineo  VALUES (default, 'A-');
INSERT into tipo_sanguineo  VALUES (default, 'B-');
INSERT into tipo_sanguineo  VALUES (default, 'AB-');
INSERT into tipo_sanguineo  VALUES (default, 'O-');

-------------- INSERT DOADOR ------------------------

INSERT into Doador VALUES (default, '000.000.000-00', 'Gabriel', '01/01/2000', 66, 6);
INSERT into Doador VALUES (default, '100.000.000-00', 'Louise', '21/03/1994',  60, 1);
INSERT into Doador VALUES (default, '200.000.000-00', 'Samuel', '05/10/2001', 65, 4);
INSERT into Doador VALUES (default, '300.000.000-00', 'Damires', '05/10/1990',  60, 3);
INSERT into Doador VALUES (default, '400.000.000-00', 'Fernando', '05/12/1999',  70, 3);
INSERT into Doador VALUES (default, '500.000.000-00', 'Pedro', '15/11/1989',  50, 4);
INSERT into Doador VALUES (default, '600.000.000-00', 'Bruna', '02/02/1996',  72, 1);
INSERT into Doador VALUES (default, '700.000.000-00', 'Debora', '09/04/2000',  80, 1);
INSERT into Doador VALUES (default, '800.000.000-00', 'Marcos', '21/12/2002',  90, 3);
INSERT into Doador VALUES (default, '900.000.000-00', 'Vamberto', '04/01/2003',  65, 4);
INSERT into Doador VALUES (default, '110.000.000-00', 'Camily', '14/03/1996',  73, 3);



---------------- INSERT ENFERMEIRO -----------------

INSERT into Enfermeiro VALUES (default,'100-00', 'Daniel', '01/10/2000', '05/07/2019', 2000.00);
INSERT into Enfermeiro VALUES (default,'200-00', 'Luis', '01/10/1995', '05/07/2017', 2000.00);
INSERT into Enfermeiro VALUES (default,'400-00', 'Mara', '04/10/2000', '05/07/2018', 1500.00);
INSERT into Enfermeiro VALUES (default,'500-00', 'Joyce', '04/10/2000', '12/06/2020', 2500.00);


--------------- INSERT BIOMEDICO -------------------

insert into biomedico values(default, '111xxx', 'Renato Cariane', '20/11/1998','22/02/2019', 5000.00);
insert into biomedico values(default, '222yyy', 'Paulo Muzy', '22/02/1995','22/02/2015', 7000.00);
insert into biomedico values(default, '333zzz', 'Leo Stronda', '20/11/1998','22/02/2019', 6500.00);

---------------------- INSERT PACIENTE-------------------------

INSERT into paciente  VALUES (DEFAULT, 'João', '01/11/1999', 2);
INSERT into paciente  VALUES (DEFAULT, 'Maria', '04/06/1998', 1);
INSERT into paciente  VALUES (DEFAULT, 'Iago', '11/04/1997', 4);
INSERT into paciente  VALUES (DEFAULT, 'Petronio', '31/10/2002', 4);

---------------------- INSERT BOLSA DE SANGUE-------------------------

INSERT into bolsa_de_sangue VALUES (DEFAULT, '13:00:00', '14/03/2022',default, 2, 3);
INSERT into bolsa_de_sangue VALUES (DEFAULT, '14:00:00', '20/04/2021', default, 1, 4);
INSERT into bolsa_de_sangue VALUES (DEFAULT, '14:30:00', '20/05/2020', default, 3, 5);
INSERT into bolsa_de_sangue VALUES (DEFAULT, '09:00:00', '08/06/2022', default, 4, 6);
INSERT into bolsa_de_sangue VALUES (DEFAULT, '15:00:00', '20/03/2021', default, 1, 7);
INSERT into bolsa_de_sangue VALUES (DEFAULT, '11:00:00', '15/07/2022', default, 2, 8);
INSERT into bolsa_de_sangue VALUES (DEFAULT, '16:00:00', '14/08/2021', default, 3, 9);
INSERT into bolsa_de_sangue VALUES (DEFAULT, '17:00:00', '12/10/2020', default, 4, 10);
INSERT into bolsa_de_sangue VALUES (DEFAULT, '08:00:00', '11/10/2022', default, 2, 11);
INSERT into bolsa_de_sangue VALUES (DEFAULT, '13:00:00', '10/03/2021', default, 1, 11);

---------------------- INSERT ANALISADA-------------------------

INSERT into analisada VALUES(2, '14:00:00', '20/04/2021', 1);
INSERT into analisada VALUES(3, '14:30:00', '20/05/2020', 2);
INSERT into analisada VALUES(4, '09:00:00', '08/06/2022', 3);
INSERT into analisada VALUES(5, '15:00:00', '20/03/2021', 1); 
INSERT into analisada VALUES(6, '11:00:00', '15/07/2022', 2); 
INSERT into analisada VALUES(9, '08:00:00', '11/10/2022', 3); 
INSERT into analisada VALUES(10, '13:00:00', '10/03/2021', 1);

SET datestyle TO SQL, DMY;
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

--------------- INDICES---------------------

/* Criação do index da coluna data_da_coleta pois a coluna é usada
frequentemente na cláusulas WHERE e os campos são consultados em forma de
intervalo tipo data*/ 

CREATE INDEX idx_data_bolsa
ON bolsa_de_sangue (data_da_coleta);


/*índice criado para acelerar a recuperação de
dados para as instruções
SELECT em que a cláusula
where referencia as colunas do
índice, como por exemplo 
a solicitação de saber qual
enfermeiro atendeu um paciente específico 
e também pois as colunas são sempre usados pela
cláusula where*/

create INDEX idx_cod_doador_enfermeiro 
on bolsa_de_sangue (cod_doador, cod_enfermeiro);

/*indice criado pois a disposição dos codigos do sangue 
na tabela doador é desordenada, sendo assim, o indice facilitaria
a consulta de quais doadores apresentam certo tipo sanguíneo, além 
de ser uma coluna utilizada em join, group by e, possivelmente em where.*/

create INDEX idx_auxilia_cod_sangue
on doador(cod_do_sangue);

--------------- REESCREVENDO CONSULTAS---------------------

/* Reescrita da consulta: Exibir os tipos sanguíneos dos doadores cadastrados*/

select distinct t.tipo_sanguineo from tipo_sanguineo t
join doador d on d.cod_do_sangue = t.cod_do_sangue 
order by t.tipo_sanguineo;


/* Reescrita da consulta: Exibir os nomes dos pacientes que possuem o mesmo tipo sanguíneo de algum doador*/

select nome from paciente
 where cod_do_sangue in (select cod_do_sangue from doador);


---------- FUNÇÕES E PROCEDURES ARMAZENADAS ------------

/* Função que  retorna o total de bolsas aptas no banco de sangue utilizando COUNT */

CREATE or REPLACE FUNCTION QuantidaDeBolsasAptas () returns integer as 
$$
declare 
TotalDeBolsas integer;
begin
select count(*) 
from bolsa_de_sangue
where apta = true  
into TotalDeBolsas;
return TotalDeBolsas;
end
$$ language plpgsql;

select * from QuantidaDeBolsasAptas();



/*Função para a atualização do status da bolsa de sangue na tabela analisada
(apta ou não apta) após a avaliação do biomédico*/

CREATE OR REPLACE Function Atualiza_apta_analisada(codigo_bolsa in analisada.cod_bolsa%type,
												   Valor in analisada.Apta%type)
Returns void
AS $$
begin
UPDATE analisada
set Apta = Valor, cod_bolsa = codigo_bolsa
where cod_bolsa = codigo_bolsa;
END;
$$ LANGUAGE 'plpgsql';

select Atualiza_apta_analisada(5, True);

select * from bolsa_de_sangue





/*Procedure que atualiza o salário dos enfermeiros contratados
antes da data informada pelo administrador em 10% e lança uma notícia de qual enfermeiro foi atualizado o salário*/

CREATE OR REPLACE PROCEDURE Atualiza_salario_enfermeiro(data enfermeiro.data_inicio%type)
LANGUAGE plpgsql
AS $$
DECLARE 
new_salario enfermeiro.salario%type;
data_limite enfermeiro.data_inicio%type;
cursor_enfermeiro CURSOR (data enfermeiro.data_inicio%type) for 
select * from enfermeiro where data_inicio < data;
BEGIN
data_limite = data;
FOR Venfermeiro in cursor_enfermeiro(data_limite) loop
new_salario := Venfermeiro.salario + 0.1*Venfermeiro.salario;
UPDATE enfermeiro
set salario = new_salario
where cod_enfermeiro = Venfermeiro.cod_enfermeiro;
raise notice 'Salário Atualizado, %', Venfermeiro.nome;
END LOOP;
END $$;

call Atualiza_salario_enfermeiro('31/10/2018')

select *from enfermeiro

/* Função para inserir pacientes na tabela e que possui tratamento de exceção para caso não exista o código do sangue na tabela tipo_sanguineo*/

CREATE OR REPLACE Function Insere_paciente (nome IN paciente.nome%type, datanascimento IN paciente.data_de_nascimento%type, codsangue IN paciente.cod_do_sangue%type)
Returns void
AS $$
BEGIN
IF codsangue > 6 then 
raise exception 'tipo sanguíneo inexistente';
end if;
Insert into paciente values (default, nome, datanascimento, codsangue);
raise notice 'Paciente inserido com sucesso';
exception
when raise_exception then
Raise notice 'Por favor, insira um tipo sanguíneo válido';
END
$$ LANGUAGE 'plpgsql';

select * from Insere_paciente('BRUNA GABRIELY', '31/10/2002', 100);

SELECT * FROM PACIENTE



—---------------—--------------------TRIGGERS—-----------------------------------------

/*Função chamada após a execução da trigger que atualiza
o status apta ou não apta da bolsa de sangue na tabela bolsa_de_sangue*/

CREATE OR REPLACE Function atualiza_apta_bolsa_sangue()
returns trigger AS $$
BEGIN 
IF(new.Apta = True)THEN
UPDATE bolsa_de_sangue
set apta = new.Apta
where cod_bolsa = new.cod_bolsa;
RETURN NEW;
ELSE
delete from bolsa_de_sangue where cod_bolsa = new.cod_bolsa;
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;



/* trigger criada para toda vez que for atualizada 
o status apta da bolsa por um biomédico, chamar a função 
de atualização da bolsa de sangue*/

CREATE OR REPLACE TRIGGER aptatrigger 
AFTER UPDATE on analisada FOR EACH ROW
EXECUTE PROCEDURE atualiza_apta_bolsa_sangue();


/* Criação de tabela de registro que será utilizada como log na trigger*/

CREATE TABLE Log_bolsa_sangue
(Operação VARCHAR(10),Hora_Operação TIME, Data_operação DATE);

Select * from Log_bolsa_sangue;



/* Criação da função que armazena o registro na tabela Log_bolsa_sangue
e noticia qual operação foi feita*/

CREATE OR REPLACE FUNCTION LOG_NOTICIA_BOLSA() RETURNS
TRIGGER AS $$
BEGIN
insert into Log_bolsa_sangue VALUES(TG_OP, current_time, current_date);
IF (TG_OP = 'DELETE') THEN
raise notice 'Operação Delete sobre %', TG_TABLE_NAME;
RETURN OLD;
ELSIF (TG_OP = 'UPDATE') THEN
raise notice 'Operação Update sobre %', TG_TABLE_NAME;
RETURN NEW;
ELSIF (TG_OP = 'INSERT') THEN
raise notice 'Operação Insert sobre %', TG_TABLE_NAME;
RETURN NEW;
END IF;
RETURN NULL;
END;
$$ language plpgsql;

/* Trigger que após alterações, insert, update ou delete na tabela bolsa de sangue
realizada a chamada da função  LOG_NOTICIA_BOLSA*/

CREATE TRIGGER TestaDepto_audit
AFTER INSERT OR UPDATE OR DELETE ON bolsa_de_sangue
FOR EACH ROW EXECUTE PROCEDURE LOG_NOTICIA_BOLSA();


/*Função que verifica se o peso do doador é suficiente para doar, caso não seja, não será permitida a inserção, chamada após o insert pelo trigger*/

CREATE OR REPLACE FUNCTION Verifica_peso_Doador() 
RETURNS TRIGGER AS $$
Declare
Begin
    If new.peso < 50 then
       RAISE EXCEPTION '%', 'Peso insuficiente para doação de Sangue' USING ERRCODE = 45000;
    End if;
    return new; 
End;
$$ language plpgsql; 

/*Trigger que chama a função  Verifica_peso_Doador() após tentar inserir um doador*/

CREATE TRIGGER verificaPeso
BEFORE INSERT on doador
FOR EACH ROW EXECUTE PROCEDURE Verifica_peso_Doador();
