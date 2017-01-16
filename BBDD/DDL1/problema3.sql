/*
create table visita_web (
	IdentificadorGrupoUsuarios int unsigned default 999999,
	IdentificadorUsuario int unsigned default 999999,
	FechaDeLaVisita	timestamp default current_timestamp,
	DuracionVisita time default '00:00:00' comment 'pruebo este valor por defecto',
	Intereses set ('Seguridad','SO','Apps','Ofimática','Web','MVs','Otros') not null default 'Otros',
	primary key (IdentificadorGrupoUsuarios, IdentificadorUsuario)
	) comment 'Último ejercicio DDL1';

insert into visita_web values
	(1,1,default,'90000','Seguridad');
*/
-- insert into visita_web values
--	(1,2, '19980808','9:00:00',default)
insert into visita_web values ( 1,3,default, default, ('SO,seguridad'));

