create user user01
identified by tiger;

grant create session to user01;

select * from scott.emp;

select * from user_tab_privs_recd;

create user user02
identified by tiger;

create user user03
identified by tiger;

grant create session to user02;
grant create session to user03;

create user user04
identified by tiger;

grant connect, resource to user04;

select * from dict
where table_name like '%ROLE%';

create role mrole;

grant create session, create table, create view to mrole;

create user user05
identified by tiger;

grant mrole to user05;

create role mrole02;

grant mrole02 to user05;

revoke mrole02 from user05;
drop role mrole;

select * from user_role_privs;

--Synonym(동의어)

create table systbl(ename varchar2(20));

insert into systbl values('홍길동');
insert into systbl values('이순신');

grant select on systbl to scott;

grant create SYNONYM to scott;

create role test_role;

grant connect, resource, create synonym to test_role;

grant select on scott.dept to test_role;
grant select on scott.emp to test_role;

create user userb1
identified by b1234;

create user userb2
identified by b1234;

grant test_role to userb2;

create public synonym emp for scott.emp;

drop public synonym emp;
