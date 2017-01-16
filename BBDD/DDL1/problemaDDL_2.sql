
/*
create table coche (
	identificador int unsigned auto_increment primary key,
	NombreModelo varchar(20) charset utf32 default null unique,
	FechaFabricacion date default '19990901',
	NumeroBastidor char(17) default null)
	comment 'Tabla con un autoincremental';
*/

insert into coche values 
	(0,'mercedesSX100', '1989/09/19', 'CY77888XXX890'),
	(7,'seatBarcelona','2000-09-08',default),
	(default, 'renaultParis','20190807',null);
