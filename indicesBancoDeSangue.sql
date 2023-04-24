
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