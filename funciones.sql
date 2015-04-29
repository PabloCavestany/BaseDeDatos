/*
-- Ejercicio 1
create function nombre() returns varchar(10) return 'pablo';

-- Ejercicio 2
create function nombre2(variable varchar(10)) returns varchar(10) return variable;

-- Ejercicio 3

create function nombre3(variable varchar(10)) returns char(1) return substring(variable,2,1);
*/
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

delimiter ;
