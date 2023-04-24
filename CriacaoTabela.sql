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