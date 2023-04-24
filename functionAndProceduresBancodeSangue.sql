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
