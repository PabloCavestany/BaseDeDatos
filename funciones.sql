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
*/
delimiter //

create function Ejercicio9(letra1 char(1),letra2 char(1)) returns char(1)
BEGIN
	if letra1>letra2 then return letra1;
		elseif letra2>letra1 then return letra2;
		else return 0;
	end if;
END//

delimiter ;
