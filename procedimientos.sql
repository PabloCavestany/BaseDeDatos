  drop procedure ProcedimientoEvaluable;

-- delimiter //

/*
create procedure nuevo_procedure(out var int)
	BEGIN
		select count(distinct(user)) into var from mysql.user;
	
	END //


create procedure Insertar_Cliente(var1 int, var2 varchar(10))
 SQL SECURITY INVOKER
BEGIN
	INSERT INTO CLIENTE(CLIENTE_COD,NOMBRE) VALUES(var1,var2);
END
//


create procedure Procedimiento2 (fecha date)
BEGIN
	declare var int;
	set var =  (select datediff(curdate(), fecha));
	select date_format(fecha,'%a %d/%m/%Y');
	select var;
end //


create procedure Procedimiento3 (var1 varchar(20), var2 varchar(20))
BEGIN
	create table if not exists Prueba1 (campo1 int unsigned auto_increment primary key, campo2 varchar(40));
	insert into Prueba1(campo2) select upper(concat(var1,var2));
	select  "la inserción se ha hecho correctamente",  count(*) 'Número de Inserciones'  from Prueba1;
END//
create procedure Procedimiento4 (out contador int)
	set contador = contador+1;
*/

create procedure ProcedimientoEvaluable (Apellido varchar(10), Oficio varchar(10), ApellidoJefe varchar(10),
				Salario int unsigned, Comision int unsigned)
	Insert into EMP Select EMP_NO+1,Apellido, Oficio, (Select EMP_NO from EMP where EMP.APELLIDO=ApellidoJefe),curdate(),Salario,Comision,(Select DEPT_NO from DEPT left join EMP using (DEPT_NO) group by DEPT_NO order by count(EMP_NO) limit 1) from EMP order by EMP_NO desc limit 1; 

delimiter ;
