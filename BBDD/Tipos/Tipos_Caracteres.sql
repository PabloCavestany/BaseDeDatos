/*
create table tipos_caracteres (
	campo1 char(10),
	campo2 varchar(10),
	campo3 enum ('azul','rojo','amarillo'),
	campo4 set ('negro','blanco'),
	campo5 text);


*/
-- insert into tipos_caracteres values ('hola','hola','azul','negro,blanco','cualquier cosa');	

-- Problema Charset --

drop table tipos_charset;

create table tipos_charset (
	campo1 varchar(10) charset latin1,
	campo2 varchar(10) charset greek);
