--sub query ---------------------------------------------------------
select * from dept;
select * from emp;

--1
select ename, deptno
from emp
where deptno = (select deptno from emp where ename = 'SCOTT');

--2
select * 
from emp
where job = (select job from emp where ename = 'SCOTT');

--3
select ename, sal
from emp
where sal >= (select sal from emp where ename = 'SCOTT');

--4
select ename, deptno
from emp
where deptno = (select deptno from dept where loc = 'DALLAS');

--5
select ename, sal
from emp
where deptno = (select deptno from dept where dname = 'SALES');

--6
select ename, sal
from emp
where mgr = (select empno from emp where ename = 'KING');

select ename, sal
from emp
where sal > (select avg(sal) from emp);

select ename, sal, deptno
from emp
where deptno in (select distinct deptno from emp where sal >= 3000);

--7
select empno, ename, sal, deptno
from emp
where sal in (select max(sal) from emp 
                group by deptno);
                
--8
select deptno, dname, loc
from dept
where deptno in (select distinct deptno from emp where job = 'MANAGER');

select ename, sal
from emp
where sal > all(select sal from emp where deptno = 30);

--9
select ename, sal, job
from emp
where job <> 'ANALYST' 
      and sal > all(select sal from emp where job = 'SALESMAN');
      
select ename, sal
from emp
where sal > any(select sal from emp where deptno = 30);

--10
select ename, sal, job
from emp
where job <> 'SALESMAN'
      and sal > any(select sal from emp where job = 'SALESMAN');
      
--1
select ename, job
from emp
where job = (select job from emp where empno = 7788);

--2
select ename, job
from emp
where sal > (select sal from emp where empno = 7499);

--3
select ename, job, sal
from emp
where sal = (select min(sal) from emp);

--4
select job, avg(sal)
from emp
group by job
having avg(sal) <= all(select avg(sal) from emp group by job);
  
--5
select ename, sal, deptno
from emp
where sal = any(select min(sal) from emp group by deptno); 

--6
select empno, ename, job
from emp
where job <> 'SALESMAN'
      and sal < any(select sal from emp where job = 'ANALYST');
   
--7
select ename
from emp
where empno not in(select distinct mgr from emp where mgr is not null);
      
--8
select ename
from emp
where empno in (select distinct mgr from emp);

--9
select ename, hiredate
from emp
where ename <> 'BLAKE'
      and deptno = (select deptno from emp where ename = 'BLAKE');
      
--10
select empno, ename
from emp
where sal > (select avg(sal) from emp)
order by sal asc;

--11
select empno, ename
from emp
where deptno in(select deptno from emp where ename like '%K%')
      and ename not like '%K%';

--12
select ename, deptno, job
from emp
where deptno = (select deptno from dept where loc = 'DALLAS');

--13
select ename, sal
from emp
where mgr = (select empno from emp where ename = 'KING');

--14
select deptno, ename, job
from emp
where deptno = (select deptno from dept where dname = 'RESEARCH');

--15
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)
      and deptno in (select deptno from emp where ename like '%M%');
      
--16
select job, avg(sal)
from emp
group by job
having avg(sal) = (select min(avg(sal)) from emp group by job);

--17
select ename
from emp
where empno in (select mgr from emp)
      and job <> 'MANAGER';
      
--DDL--------------------------------------------------------------
select * from emp;
select * from dept;

select rowid, empno, ename
from emp;

insert into emp
values(8000, 'MICHALE', 'ARTIST', 7839, to_date('90/01/01', 'yy/mm/dd'),
    4000, 600, 40);
    
select rowid, deptno, dname
from dept;

create table sam02(
    year01 interval year(3) to month);

insert into sam02
values(interval '36' month(3));

select * from sam02;

select year01, sysdate, sysdate+1+year01
from sam02;
    
create table sam03(
    day01 interval day(3) to second);
    
insert into sam03
values(interval '10' day);

select * from sam03;

select day01, sysdate, sysdate + day01
from sam03;

create table emp01(
    empno number(4),
    ename varchar2(20),
    sal number(7, 2));
      
create table dept01(
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13));

desc dept01

create table emp02
as
select * from emp;

desc emp02

create table emp03
as 
select empno, ename from emp;

select * from emp03;

create table emp04
as
select empno, ename from emp
where 1=0;

desc emp04

create table emp05
as 
select * from emp
where deptno = 10;

select * from emp05;

create table dept20
as
select empno, ename, sal * 12 as ANNASL
from emp
where deptno = 20;

select * from dept20;

alter table dept20 rename column ANNASL to ANNSAL;

drop table dept02;



create table dept02
as 
select * from dept
where 1=0;

alter table emp01 
add(job varchar2(9));

desc emp01

desc dept02

alter table dept02
add(dngr number(4));

alter table emp01
modify(job varchar2(30));

alter table dept02
modify dngr varchar2(15);

select * from dept02;

insert into dept02
values (10, 'RESEARCH', 'PARIS', 'KIM');

alter table dept02
modify dngr number(4);

delete from dept02;

desc dept02

alter table dept02
drop column dngr;

desc emp01

alter table emp01
drop column job;

desc emp02

select * from emp02;

alter table emp02
set unused (job);

alter table emp02
drop unused columns;

drop table emp01;

truncate table emp02;

rename emp02 to test;

select * from test;

desc user_tables
show user

select table_name from user_tables
order by table_name desc;

desc all_tables
select owner, table_name from all_tables
order by owner desc;

select table_name, owner
from dba_tables;

--1
create table dept00(
    dno number(2),
    dname varchar2(14),
    loc varchar2(13));
desc dept00

--2
create table emp00(
    eno number(4),
    ename varchar2(10),
    dno number(2));
desc emp00

--3
desc emp00
alter table emp00
modify ename varchar2(25);

--4
select * from emp;

create table emp002
as
select empno as emp_id, ename as name, sal, deptno as dept_id
from emp;

select * from emp002;

--5
select * from emp00;
drop table emp00;

--6
rename emp002 to emp00;

--7
select * from dept00;
alter table dept00
drop column dname;

--8
select * from dept00;
alter table dept00
drop column dno;

--9
select * from emp00;
alter table emp00
set unused (sal);

--10
alter table emp00
drop unused columns;