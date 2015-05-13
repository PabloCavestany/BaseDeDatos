/*
create table empresa.ESTADISTICA (contador smallint unsigned autoincrement primary key,
	usuario varchar(20), hora timestamp);

create trigger Ejer6 after update on empresa.COMANDA for each row
	insert into  empresa.ESTADISTICA values (0,current_user,default);


create trigger Ejer7
after insert on empresa.COMANDA
for each row
BEGIN
        declare contar decimal(8,2) unsigned;

        set @contar=(select sum(TOTAL) from empresa.COMANDA);
END //


create trigger Ejer8 after delete on empresa.COMANDA 
	for each row
		set @contar = @contar-old.TOTAL;
*/

  create TRIGGER Ejer9 before update
        on empresa.COMANDA for each row
	set new.COM_TIPO=old.COM_TIPO;

