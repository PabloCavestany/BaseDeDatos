/*
ALUMNO (DNIAlumno, Edad, Nombre, Apellido, CódigoPostal, Telefono1, Telefono2, Sexo)
Decide qué tipos de datos se ajustan más a los campos de la tabla. Supón aquellos datos que necesites.
Añade un comentario a la tabla indicando la finalidad de la tabla (te lo inventas)
Indica un valor por defecto para cada campo.
Introduce unas cuantas filas y realiza alguna consulta.

create table ALUMNO (
	DNIAlumno char(9) default '44444444p',
	Edad tinyint unsigned default 0,
	Nombre varchar(20) default 'sinNombre',
	Apellido varchar(20) default 'sin Apellido',
	CódigoPostal char(5) default '00000',
	Telefono1 char(9) default '000000000',
	Telefono2 char(9) default '000000000',
	Sexo enum ('H','M') default NULL
	)
	comment 'Esta tabla no sirve para nada';


insert into ALUMNO values 
	('19191919K', 12, 'Pablo', 'Fernández','12345','9998767','09876789','H'),
	(default, default, default, default, default,default,default,default);
*/

insert into ALUMNO(DNIAlumno,Edad) values ('9876789J',5);
