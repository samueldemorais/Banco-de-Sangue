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
