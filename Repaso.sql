/*
'Examen Recuperación curso 2013_14'' 
@@
__Ejercicio 1__ (2 ptos)
Diseña un disparador que verifique que cuando se inserta un nuevo trabajador en la tabla empresa.EMP, éste tiene un sueldo menor al de su jefe. En el caso de no cumplirse esta condición, el disparador impide la inserción provocando un error.



delimiter //

create trigger Ejercicio1 after insert on EMP for each row
begin
	declare sueldo, num int(10) unsigned default 0;

	set num= (select SALARIO from EMP where EMP_NO=new.JEFE);

        if new.SALARIO > num
	        then
		select 1 into @xxx from trigge;
			-- La forma de provocar el error es consultar una tabla que no existe
			-- Si capturásemos el error con un handler (declare exit handler for
			-- sqlstate '42S02' begin end;) la inserción sí que se produciría.
        end if;
end //

delimiter ;



__Ejercicio 2__ (2 ptos)
Considerando que el disparador del ejercicio anterior está correctamente almacenado en el servidor y completamente operativo, indica qué permisos (indica los justos y necesarios) necesita el usuario pepe@192.168.12.125 para realizar una inserción en la tabla empresa.EMP. Considera que el disparador del ejercicio anterior fue creado por 'root' o administrador del sistema y que no se indicó ninguna cabecera DEFINER ni SECURITY SQL diferente a las que se establecen por defecto. Justifica tu respuesta.

-- Solo se necesita dar permisos de inserción ya que el disparador se ejecutará con los permisos del root-- ya que SQL SECURITY es por defecto DEFINER
	grant insert on empresa.EMP to pepe@192.168.12.125;
 
__Ejercicio 3__(1 pto)
Busca en el manual cómo se consigue que la instrucción GRANT no cree usuarios. Es decir, que para crear un usuario nuevo se deba utilizar explicitamente CREATE USER.

-- hay que modificar la variable global sql_mode. Manual: 
	set @@global.sql_mode = 'no_auto_create_user';


__Ejercicio 4__  (2 ptos)
Diseña algún mecanismo que permita contabilizar el número de modificaciones que se realizan en la tabla empresa.EMP: con cada nueva actualización un contador fiable se incrementa. Además, debe quedarse registrado cuándo se realiza la modificación (fecha y hora) y quién la realiza.


	create table est(Contador int unsigned auto_increment primary key,Fecha varchar(20),User varchar(30));
	create trigger ej42 after update on EMP for each row
	    insert into est values(default,now(),current_user());


__Ejercicio 5__  (1 pto)
Escribe una función que reescriba un nombre devolviendo primero su apellido, una coma y, a continuación, el nombre. Así, si a dicha función le pasamos el valor "pedro Ruiz" nos devolverá "Ruiz, pedro". O si le pasamos "macarena rosales" nos devuelve "rosales, macarena".


create function ej5(cadena varchar(40)) returns varchar(40)
        return concat(substring_index(cadena,' ',-1),", ",substring_index(cadena,' ',1));


__Ejercicio 6__  (2 ptos)
Escribe un procedimiento que compruebe si un nombre (parámetro de entrada), con el formato devuelto por la función del ejercicio anterior, se encuentra en la tabla empresa.CLIENT. Si la respuesta es positiva, el procedimiento emitirá un mensaje del estilo "cliente válido", en caso contrario, mostrará "No fiar".


delimiter //

create procedure ej6(var varchar(45))
begin

    declare var1 varchar(45);
    declare var2 varchar(45);
    DECLARE done INT DEFAULT FALSE;
    declare c cursor for select NOMBRE from CLIENTE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND begin SET done = TRUE;
	select 'NO Fiar'; end;
    
    set var1 = (select ej5(var));

    open c;
        eti: LOOP
            IF done THEN
                LEAVE eti;
                END IF;
            fetch c into var2;
            if (var1 = var2)
                then
                    select "Cliente válido";
                leave eti;
            end if;
        end LOOP;
    close c;

end //

delimiter ;

*/

create procedure ex6(v1 varchar(40))
        select ifnull((select "cliente válido" from CLIENTE where NOMBRE=(select ej5(v1))),(select "No fiar")) as ex6;
        
