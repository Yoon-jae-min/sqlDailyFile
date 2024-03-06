--Index
select index_name, table_name, column_name 
from user_ind_columns
where table_name in ('EMP', 'DEPT');

drop table emp01;

create table emp01 
as 
select * from emp;

select table_name, index_name, column_name
from user_ind_columns
where table_name in('EMP', 'EMP01');

select * from emp01;
insert into emp01 select * from emp01;

insert into emp01(empno, ename)
values(1111, 'SYJ');

set timing on
set timing off

select distinct empno, ename
from emp01
where ename = 'SYJ';

create index idx_emp01_ename
on emp01(ename);

grant select on emp to user01;

select * from user_tab_privs_recd;

revoke select on emp from user01;

grant select on scott.emp to user02
with grant option;

grant select on scott.emp to user03;

grant select on emp to mrole02;

select * From system.systbl;

create synonym prisystbl for system.systbl;

select * From prisystbl;

select * from emp where ename = 'SCOTT';