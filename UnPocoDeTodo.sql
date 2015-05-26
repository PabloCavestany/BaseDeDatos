/*

delimiter //
create procedure Ejer1()
 BEGIN
        DECLARE done INT DEFAULT FALSE;
        declare a char(16);
        declare cur CURSOR FOR select distinct(User) from mysql.user;
        DECLARE CONTINUE HANDLER FOR NOT FOUND,SQLWARNING SET done = TRUE;
 
        OPEN cur;
        etiqueta: LOOP
                FETCH cur into a;
                IF done THEN
                        LEAVE etiqueta;
                END IF;
                select a;
                
        END LOOP;
 
        CLOSE cur;
 
 END //


drop procedure Ejer2;

delimiter //

create procedure Ejer2(i2 tinyint unsigned)
        eti: BEGIN
                declare i1, prueba tinyint unsigned;
                declare suma decimal(10,9);
 		declare exit handler for sqlwarning Begin select 'valor no válido'; end;
                declare exit handler for sqlstate '42S02' begin select 'not found'; end; 
		if i2=0 then select 'valor incorrecto'; select 1 from t; end if;
                set i1 = 1;
                set suma = 0;
		select 'comprobación';
                
                
                read_loop: LOOP
                        if i1 > i2
                        then
                                leave read_loop;
                        end if;
			select 'hola';
                        set suma = suma + (1/i1);
                        set i1 = i1 + 1;
                        
                END LOOP;
                
		select suma;				
                
        END //
        
 delimiter ;


delimiter //

CREATE FUNCTION Ejer3(num tinyint unsigned) returns tinyint 
begin	
	declare i tinyint unsigned default 2;
	if num=2 or num=1 then return 1;end if;

	read_loop: LOOP
		if mod(num,i)=0
		then
			return 0;
		else 
			set i=i+1;
		end if;	
		if i>num/2 then return 1;end if;
		end LOOP;
end //


delimiter //

create function Ejer4(x int unsigned) returns int unsigned
begin
        declare numero,primo int unsigned default 1;
        declare suma,contador int unsigned default 0;
        
        etiqueta: loop
                if Ejer3(numero)
                then
                        set contador=contador+1;
                        set suma=suma+numero;
                end if;
                if contador=x
                then
                        leave etiqueta;
                end if;
                set numero=numero+1;
        end loop;
        Return suma;
end//
*/

delimiter //

create procedure Ejer5(n int unsigned) 
begin
	declare cont int unsigned default 1;
	
	drop table if exists primos;
        create table empresa.primos(id int unsigned auto_increment primary key, numero int unsigned);
        
        etiqueta: LOOP
                if Ejer3(cont) 
                then
                        insert into primos (numero) value (cont);
                end if;
                if n = cont
                then
                        leave etiqueta;
          	end if;      
		set cont=cont+1;
        END LOOP;
 
        
        select count(*) into @np from empresa.primos;

end //

DELIMITER ;
