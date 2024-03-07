--Å×½ºÆ®
create user test01
identified by "1234";

drop user test01;

revoke connect, resource from test01;

select * from scott.emp;