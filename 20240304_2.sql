--Transcation management
select * From dept01;
delete from dept01;
rollback;

delete from dept01 where deptno = 20;
commit;

select * from dept02;
delete from dept02 where deptno = 40;

create table dept03
as
select * from dept;

rollback;

delete from dept03 where deptno = 20;
select * from dept03;

truncate table deptppp;
rollback;

select * from dept01;

delete from dept01 where deptno = 40;
commit;
delete from dept01 where deptno = 30;
savepoint c1;
delete from dept01 where deptno = 20;
savepoint c2;
delete from dept01 where deptno = 10;

select * from dept01;
rollback to c1;
rollback;

--제약조건
desc user_constraints
select * From user_constraints;
select * From user_cons_columns;

select * from emp01;
insert into emp01 values(null, null, 'SALEMAN', 8000,
    '1999/01/01', 1000, null, 30);
insert into emp01 values(7844, null, 'SALEMAN', 8000,
    '1999/01/01', 1000, null, 30);
    
desc emp01

create table emp02(
    empno number(4) not null,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2));
    
insert into emp02 values(null, null, 'SALESMAN', 10);

create table emp03(
    empno number(4) unique,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2));
    
insert into emp03 values(7499, 'ALLEN', 'SALESMAN', 30);
insert into emp03 values(null, 'JONES', 'MANAGER', 20);
insert into emp03 values(null, 'JONES', 'SALESMAN', 20);

create table emp04(
    empno number(4) constraint emp04_empno_uk unique,
    ename varchar2(10) constraint emp04_ename_nn not null,
    job varchar2(9),
    deptno number(2));
    
desc emp04
select * From user_constraints where table_name = 'EMP04';

--test

create table emp_test(
    empno NUMBER(4) not null,
    ename VARCHAR2(10),
    job varchar2(9),
    sal NUMBER(7, 2),
    deptno NUMBER(2) not null);
    
select * from emp;

delete 
from emp 
where empno = 8000;