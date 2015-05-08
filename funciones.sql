/*
-- Ejercicio 1
create function nombre() returns varchar(10) return 'pablo';

-- Ejercicio 2
create function nombre2(variable varchar(10)) returns varchar(10) return variable;

-- Ejercicio 3

create function nombre3(variable varchar(10)) returns char(1) return substring(variable,2,1);

-- Ejercicio 4
drop function nombre4;

delimiter //

create function nombre4(ApellidoTrabajador varchar(10)) returns varchar(10)
BEGIN
	DECLARE NumeroJefe smallint default 0;
	DECLARE ApellidoJefe varchar(10);

	set NumeroJefe = (select JEFE from EMP where EMP.APELLIDO = ApellidoTrabajador);
	IF NumeroJefe is NULL
		THEN RETURN 'No jefe';
	END IF;
	set ApellidoJefe = (select APELLIDO from EMP where EMP_NO=NumeroJefe);

	RETURN ApellidoJefe;
END//

delimiter //

create function Ejercicio5(fecha datetime) returns varchar(20)
BEGIN
	set lc_time_names='es_ES';
	return date_format(fecha,'%W,%e %H:%i:%s');
END//


create function Ejercicio6(fecha1 date, fecha2 date) returns int
	return timestampdiff (year, fecha1, fecha2);


create function Ejercicio7(comanda smallint unsigned) returns decimal(9,2)
	return (select sum(IMPORTE) from DETALLE where COM_NUM=comanda);


create function Ejercicio8(CodigoCliente int unsigned) returns varchar(50)
	return (select concat(DIRECCIÓN,' ',CIUDAD,ESTADO,CODI_POSTAL) FROM CLIENTE
	WHERE CLIENTE_COD=CodigoCliente);

delimiter //

create function Ejercicio9(letra1 char(1),letra2 char(1)) returns char(1)
BEGIN
	if letra1>letra2 then return letra1;
		elseif letra2>letra1 then return letra2;
		else return 0;
	end if;
END//

delimiter //

create procedure Cursor1()
BEGIN
	declare var char(16);
	declare cur1 cursor for select distinct(User) from mysql.user;

	open cur1;

	etiqueta:loop
		fetch cur1 into var;
		select var;
	end loop;

	close cur1;
END//


delimiter //

create procedure Cursor2()
BEGIN
	declare var char(16);
	declare contador tinyint;
	declare cur1 cursor for select distinct(User) from mysql.user;
	
	set contador=(select count(distinct User) from mysql.user);

	open cur1;

	eti:loop
		fetch cur1 into var;
		select var;
		set contador=contador - 1;
		if contador=0 then leave eti; end if;
	end loop;
END//


delimiter //


create procedure Cursor3()
BEGIN
	declare var char(16);
	declare hos char(60);
	declare contador tinyint;
	declare cur1 cursor for select distinct User,Host from mysql.user;
	
	set contador=(select count(distinct User) from mysql.user);

	open cur1;

	eti:loop
		fetch cur1 into var,hos;
		select var,hos;
		set contador=contador - 1;
		if contador=0 then leave eti; end if;
	end loop;
END//
delimiter ;


-- Procedimiento creado por Mario Naranjo para el ejercicio5 --	


create procedure cur5()
begin
        declare var1 varchar(45);
        declare var2 varchar(20);
        declare c1,c2 int;
        declare cliente1 cursor for select distinct NOMBRE from empresa.CLIENTE;
        declare cliente2 cursor for select distinct Nom from videoclub.CLIENT;
        set c1 = (select count(distinct NOMBRE) from empresa.CLIENTE);
        
        
        open cliente1;
        
        etiqueta1: LOOP
                if c1 = 0
                then
                        leave etiqueta1;
                end if;
                fetch cliente1 into var1;
                        open cliente2;
                        set c2 = (select count(distinct Nom) from videoclub.CLIENT);
                        etiqueta2: LOOP
                                if c2 = 0
                                then
                                        leave etiqueta2;
                                end if;
                                fetch cliente2 into var2;
                                        if var1=var2
                                        then
                                                select var1;
                                        end if;
                                        set c2 = c2 - 1;
                        end LOOP;
                        close cliente2;
                        set c1 = c1 - 1;
        end LOOP;
        close cliente1;
        
end//
*/

delimiter ;
