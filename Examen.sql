/*

mysql> grant create routine on empresa.* to ramon identified by '1234';
Query OK, 0 rows affected (0.00 sec)

mysql> grant super on *.* to ramon;
Query OK, 0 rows affected (0.00 sec)

mysql> grant execute on empresa.* to maria identified by '1234';
Query OK, 0 rows affected (0.00 sec)

mysql> grant select on empresa.COMANDA to pepe identified by '1234';
Query OK, 0 rows affected (0.00 sec)

mysql> grant execute on empresa.* to pepe;
Query OK, 0 rows affected (0.00 sec)

-- instrucciones DML ---

mysql> insert into mysql.user(Host,User,Password,Super_priv) values ('localhost','Ramon',Password('1234'),'Y'),('192.168.10.%','maria',password('1234'),'N'),('%','pepe',password('1234'),'N');

mysql> insert into mysql.db(Host,Db,User,Create_routine_priv,Execute_priv) values ('localhost','empresa','Ramon','Y','N'),('192.168.10.%','empresa','maria','N','Y'), ('%','empresa','pepe','N','Y');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into mysql.tables_priv values ('%','empresa','pepe','COMANDA',current_user(),default,'SELECT',default);

mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)

*/
delimiter //

 create trigger Ej3  after insert on MALALT for each row
 BEGIN
	declare var tinyint default 0;
	
	set var = (select HOSPITAL_COD FROM DOCTOR LEFT JOIN INGRESSOS USING(HOSPITAL_COD) GROUP BY HOSPITAL_COD ORDER BY IFNULL(COUNT(DISTINCT INSCRIPCIO)/COUNT(DISTINCT DOCTOR_NO),0) limit 1);
	insert into INGRESSOS values (NEW.INSCRIPCIO, var,1,1);

END //

delimiter ;
