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
*/

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


