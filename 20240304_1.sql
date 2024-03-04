--insert, update, delete--
drop table dept01;

create table dept01
as 
select * from dept
where 1=0;

desc dept01;

insert into dept01 values(20, 'RESEARCH', 'DALLAS');

select * from dept01;

desc sam01

desc emp

create table sam01
as
select empno, ename, job, sal from emp
where 1=0;

insert into sam01 values(1000, 'APPLE', 'POLICE', 10000);
insert into sam01 values(1010, 'BANANA', 'NURSE', 15000);
insert into sam01 values(1020, 'ORANGE', 'DOCTOR', 25000);

select * from sam01;

insert into dept01 (deptno, dname) values(30, 'SALES');
insert into dept01 values(40, 'SALES', null);

insert into dept01 values(50, '', 'CHICAGO');
insert into dept01 values(60, ' ', 'PARIS');

desc sam01

insert into sam01 values(1030, 'VERY', '', 25000);
insert into sam01 values(1040, 'CAT', '', 2000);

drop table dept02;
create table dept02
as
select * from dept where 1=0;

select * from dept02;

insert into dept02 select * from dept;

select * from sam01;

insert into sam01 
(select empno, ename, job, sal from emp where deptno = 10);

create table emp_hir
as
select empno, ename, hiredate from emp
where 1=0;

create table emp_mgr
as
select empno, ename, mgr from emp
where 1=0;

insert all
into emp_hir values(empno, ename, hiredate)
into emp_mgr values(empno, ename, mgr)
select empno, ename, hiredate, mgr from emp
where deptno = 20;

select * From emp_hir;
select * from emp_mgr;

create table emp_hir02
as
select empno, ename, hiredate from emp
where 1=0;

create table emp_sal
as
select empno, ename, sal from emp
where 1=0;

insert all
when hiredate > '1982/01/01' then
    into emp_hir02 values(empno, ename, hiredate)
when sal > 2000 then
    into emp_sal values(empno, ename, sal)
select empno, ename, hiredate, sal from emp;

select * from emp_hir02;
select * from emp_sal;

create table sales(
    sales_id number(4),
    week_id number(4),
    mon_sales number(8, 2),
    tue_sales number(8, 2),
    wed_sales number(8, 2),
    thu_sales number(8, 2),
    fri_sales number(8, 2));
    
create table sales_data(
    sales_id number(4),
    week_id number(4),
    daily_id number(4),
    sales number(8, 2));
    
insert into sales values(1001, 1, 200, 100, 300, 400, 500);
insert into sales values(1002, 2, 100, 300, 200, 500, 350);

insert all
    into sales_data values(sales_id, week_id, 1, mon_sales)
    into sales_data values(sales_id, week_id, 2, tue_sales)
    into sales_data values(sales_id, week_id, 3, wed_sales)
    into sales_data values(sales_id, week_id, 4, thu_sales)
    into sales_data values(sales_id, week_id, 5, fri_sales)
    select sales_id, week_id, mon_sales, tue_sales, wed_sales,
        thu_sales, fri_sales from sales;

select  * from sales_data;

create table emp01
as
select * from emp;

select * From emp01;

update emp01 set deptno = 30;

update emp01 set sal = sal * 1.1;

update emp01 set hiredate = sysdate;

drop table emp01;

update emp01 set deptno = 30 where deptno = 10;

update emp01 set sal = sal * 1.1 where sal >= 3000;

update emp01 set hiredate = sysdate where substr(hiredate, 1,2) = '87';

select * From sam01;

update sam01 set sal = sal - 5000 where sal >= 10000;

update emp01 set deptno = 20, job = 'MANAGER' where ename = 'SCOTT';

update emp01 set hiredate = sysdate, sal = 50, comm = 4000 where ename = 'SCOTT';

select * from dept01;

update dept01 set loc = (select loc from dept01 where deptno=10) where deptno=40;

--5
drop table sam02;

create table sam02
as
select ename, sal, hiredate, deptno from emp;

desc sam02

select * From sam02;

--6
update sam02 set sal = sal + 1000 
where deptno = (select deptno from dept where loc = 'DALLAS');
select * from sam02;

select * from dept01;

--1
update dept01 
set (dname, loc) = (select dname, loc from dept01 where deptno = 40)
where deptno = 20;

select * from sam02;

--7
update sam02
set (sal, hiredate) = (select sal, hiredate from sam02 where ename = 'KING');

select * from dept01;

delete from dept01;

insert into dept01 select * from dept;

delete from dept01
where deptno = 30;

--8
select * from sam01;

delete from sam01
where job is null;

select * From emp01;

delete from emp01
where deptno = (select deptno from dept where dname = 'SALES');

--9 
select * from sam02;
delete from sam02
where deptno = (select deptno from dept where dname = 'RESEARCH');

--1
delete from emp01;
select * from emp01;
insert into emp01 select * from emp;
delete from emp01 where empno = 8000;

--2
create table emp02
as
select * from emp where job = 'MANAGER';
select * From emp02;

--3
update emp02 set job = 'TEST';

--4
insert into emp02 values(8000, 'SYJ', 'TOP', 7566, '2009/01/12', 1200, 10, 20);

--5
merge into emp01
using emp02 on (emp01.empno = emp02.empno)
    when matched then
        update set
            emp01.ename = emp02.ename,
            EMP01.JOB = EMP02.JOB,
            EMP01.MGR = EMP02.MGR,
            EMP01.HIREDATE = EMP02.HIREDATE,
            EMP01.SAL = EMP02.SAL,
            EMP01.COMM =EMP02.COMM,
            EMP01.DEPTNO = EMP02.DEPTNO
    when not matched then
        insert values(EMP02.EMPNO, EMP02.ENAME, EMP02.JOB, EMP02.MGR, 
            EMP02.HIREDATE, EMP02.SAL, EMP02.COMM, EMP02.DEPTNO);

--실습문제1
create table emp_insert
as
select * from emp
where 1=0;
desc emp_insert
select * From emp_insert;

--실습문제2
insert into emp_insert
values(1111, 'YJM', 'CLERK', null,sysdate, 10000, 1000, 10);

--실습문제3
insert into emp_insert
values(1111, 'HONG', 'MANAGER', 
    null,to_date(sysdate - 1,'yyyy/mm/dd'), 10000, 1000, 10);

--실습문제4
create table emp_copy
as
select * from emp;
select * from emp_copy;

--실습문제5
update emp_copy set deptno = 10 where empno = 7788;
select * From emp_copy;

--실습문제6
update emp_copy 
set (job, sal) = (select job, sal from emp_copy where empno = 7499)
where empno = 7788;
select * from emp_copy;

--실습문제7
update emp_copy
set deptno = (select deptno from emp_copy where empno = 7369)
where job = (select job from emp_copy where empno = 7369);
select * from emp_copy;

--실습문제8
create table dept_copy
as
select * from dept;
select * From dept_copy;

--실습문제9
delete from dept_copy
where dname = 'RESEARCH';
select * From dept_copy;

--실습문제10
delete from dept_copy
where deptno = 10 or deptno = 40;
select * From dept_copy;

--실습문제11
create table hw_salgrade 
as
select * from salgrade;

select * From hw_dept;

insert into hw_dept values(50, 'ORACLE', 'BUSAN');
insert into hw_dept values(60, 'SQL', 'ILSAN');
insert into hw_dept values(70, 'SELECT', 'INCHEON');
insert into hw_dept values(80, 'DML', 'BUNDANG');

--실습문제12
select * from hw_emp;
delete from hw_emp where empno = 8000;

insert into hw_emp values(7201, 'TEST_USER1', 'MANAGER',
    7788, to_date('2016/01/02', 'yyyy/mm/dd'), 4500, null, 50);
insert into hw_emp values(7202, 'TEST_USER2', 'CLERK',
    7201, to_date('2016/02/21', 'yyyy/mm/dd'), 1800, null, 50);
insert into hw_emp values(7203, 'TEST_USER3', 'ANALYST',
    7201, to_date('2016/04/11', 'yyyy/mm/dd'), 3400, null, 60);
insert into hw_emp values(7204, 'TEST_USER4', 'SALESMAN',
    7201, to_date('2016/05/31', 'yyyy/mm/dd'), 2700, 300, 60);
insert into hw_emp values(7205, 'TEST_USER5', 'CLERK',
    7201, to_date('2016/07/20', 'yyyy/mm/dd'), 2600, null, 70);
insert into hw_emp values(7206, 'TEST_USER6', 'CLERK',
    7201, to_date('2016/09/08', 'yyyy/mm/dd'), 2600, null, 70);
insert into hw_emp values(7207, 'TEST_USER7', 'LECTURER',
    7201, to_date('2016/10/28', 'yyyy/mm/dd'), 2300, null, 80);
insert into hw_emp values(7208, 'TEST_USER8', 'STUDENT',
    7201, to_date('2018/03/09', 'yyyy/mm/dd'), 1200, null, 80);
select * from hw_emp;

--실습문제13
update hw_emp
set deptno = 70
where sal > (select avg(sal) from hw_emp where deptno = 50);
select * From hw_emp;

--실습문제14
update hw_emp
set sal = sal * 1.1, deptno = 80
where hiredate > (select min(hiredate) from hw_emp where deptno = 60); 
select  * from hw_emp;

--실습문제15    
delete from hw_emp
where sal between (select losal from hw_salgrade where grade = 5)
    and (select hisal from hw_salgrade where grade = 5);
    
select * From hw_emp;
