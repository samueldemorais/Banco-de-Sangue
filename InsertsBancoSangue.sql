
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