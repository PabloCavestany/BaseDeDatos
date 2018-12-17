create database ejemplo charset latin1;
create table ejemplo.personas(
  cod_hospital	integer,
  dni 		integer primary key,
  apellidos	varchar(50),
  funcion	varchar(30),
  salario	integer,
  localidad	varchar(20));

insert into ejemplo.personas values(1,12345678,'García Hernández, Eladio','CONSERJE',1200,'LORCA');
insert into ejemplo.personas values(1,87654321,'Fuentes Bermejo, Carlos','DIRECTOR',2000,'MURCIA');
insert into ejemplo.personas values(2,55544433,'González Marín, Alicia','CONSERJE',1200,'MURCIA');
insert into ejemplo.personas values(1,66655544,'Castillo Montes, Pedro','MEDICO',1700,'MURCIA');
insert into ejemplo.personas values(2,22233322,'Tristán García, Ana','MEDICO',1900,'MURCIA');
insert into ejemplo.personas values(3,55544411,'Ruiz Hernández, Caridad','MEDICO',1900,'LORCA');
insert into ejemplo.personas values(3,99988333,'Serrano Díaz, Alejandro','DIRECTOR',2400,'CARTAGENA');
insert into ejemplo.personas values(4,33222111,'Mesa del Castillo, Juan','MEDICO',2200,'LORCA');
insert into ejemplo.personas values(2,22233333,'Martínez Molina, Andrés','MEDICO',1600,'CARTAGENA');
insert into ejemplo.personas values(4,55544412,'Jiménez Jiménez, Dolores','CONSERJE',1200,'MURCIA');
insert into ejemplo.personas values(4,22233311,'Martínez Molina, Gloria','MEDICO',1600,'MURCIA');

create table ejemplo.emple(emp_no 	INTEGER PRIMARY KEY,

	apellido VARCHAR(50) NOT NULL,
	
	oficio VARCHAR(30),
	
	dir INTEGER,
	
	fecha_alt DATE,
	
	salario INTEGER,
	
	comision INTEGER,	
	
	dept_no INTEGER);	


create table ejemplo.depart(

        dept_no INTEGER,

	dnombre VARCHAR(30),

	loc VARCHAR(30));



INSERT INTO ejemplo.emple VALUES (7369,'SÁNCHEZ','EMPLEADO',7902,'1990/12/17',
                        1040,NULL,20);
INSERT INTO ejemplo.emple VALUES (7499,'ARROYO','VENDEDOR',7698,'1990/02/20',
                        1500,390,30);
INSERT INTO ejemplo.emple VALUES (7521,'SALA','VENDEDOR',7698,'1991/02/22',
                        1625,650,30);
INSERT INTO ejemplo.emple VALUES (7566,'JIMÉNEZ','DIRECTOR',7839,'1991/04/02',
                        2900,NULL,20);
INSERT INTO ejemplo.emple VALUES (7654,'MARTÍN','VENDEDOR',7698,'1991/09/29',
                        1600,1020,30);
INSERT INTO ejemplo.emple VALUES (7698,'NEGRO','DIRECTOR',7839,'1991/05/01',
                        3005,NULL,30);
INSERT INTO ejemplo.emple VALUES (7782,'CEREZO','DIRECTOR',7839,'1991/06/09',
                       2885,NULL,10);
INSERT INTO ejemplo.emple VALUES (7788,'GIL','ANALISTA',7566,'1991/11/09',
                        3000,NULL,20);
INSERT INTO ejemplo.emple VALUES (7839,'REY','PRESIDENTE',NULL,'1991/11/17',
                        4100,NULL,10);
INSERT INTO ejemplo.emple VALUES (7844,'TOVAR','VENDEDOR',7698,'1991/09/08',
                        1350,0,30);
INSERT INTO ejemplo.emple VALUES (7876,'ALONSO','EMPLEADO',7788,'1991/09/23',
                        1430,NULL,20);
INSERT INTO ejemplo.emple VALUES (7900,'JIMENO','EMPLEADO',7698,'1991/12/03',
                        1335,NULL,30);
INSERT INTO ejemplo.emple VALUES (7902,'FERNÁNDEZ','ANALISTA',7566,'1991/12/03',
                        3000,NULL,20);
INSERT INTO ejemplo.emple VALUES (7934,'MUÑOZ','EMPLEADO',7782,'1992/01/23',
                        1690,NULL,10);

INSERT INTO ejemplo.depart VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO ejemplo.depart VALUES (20,'INVESTIGACIÓN','MADRID');
INSERT INTO ejemplo.depart VALUES (30,'VENTAS','BARCELONA');
INSERT INTO ejemplo.depart VALUES (40,'PRODUCCIÓN','BILBAO');

