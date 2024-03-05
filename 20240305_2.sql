--View
desc emp_copy
drop table dept_copy;
drop table emp_copy;

create table dept_copy
as
select * from dept;

create table emp_copy
as
select * From emp;

create view emp_view30
as
select empno, ename, deptno
from emp_copy
where deptno = 30;

select * from emp_view30;
desc emp_view30

create view emp_view20
as
select empno, ename, deptno, mgr
from emp_copy
where deptno = 20;

select * from emp_view20;

select view_name, text
from user_views;

insert into emp_view30
values(1111, 'AAAA', 30);

select * from emp_view30;
select * From emp_copy;

insert into emp_view30
values (8000, 'ANGEL', 30);

create or replace view emp_view(사원번호, 사원명, 급여, 부서번호)
as
select empno, ename, sal, deptno
from emp_copy;

select * From emp_view
where 부서번호 = 30;

create view view_sal
as
select deptno, sum(sal) SalSum, avg(sal) SalAvg
from emp_copy
group by deptno;

select * from view_sal;

create view emp_view_dept
as
select e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
order by empno desc;

select * From emp_view_dept;

create view sal_view
as
select d.dname, max(e.sal) MAX_SAL, min(e.sal) MIN_SAL
from emp e, dept d
where e.deptno = d.deptno
group by d.dname;

select * from sal_view;

select * from user_views;
drop view view_sal;

select * from emp_view30;

create or replace view emp_view30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30;

select * from emp_view20;

create or replace view emp_view20
as
select empno EMP_NO, ename EMP_NAME, deptno DEPT_NO, mgr MANAGER
from emp_copy
where deptno = 20;

select * from user_views;

create or replace force view notable_view
as
select empno, ename, deptno
from employees
where deptno = 30;

create or replace noforce view existtable_view
as
select empno, ename, deptno
from employees
where deptno = 30;

update emp_view30 set deptno = 20
where sal >= 1200;

select * from emp_view30;

drop table emp_copy;
create table emp_copy
as
select * From emp;

create or replace view view_chk30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30 with check option;

select * From view_chk30;

update view_chk30 set deptno = 20
where sal >= 1200;

update view_chk30 set comm = 1000;

create or replace view view_read30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30 with read only;

select * From view_read30;
update view_read30 set comm = 2000;

select rowid, rownum, empno from emp;
select rownum, empno, ename, hiredate from emp;

select rownum, empno, ename, hiredate
from emp
order by hiredate;

create or replace view view_hire
as
select empno, ename, hiredate
from emp
order by hiredate;

select * from view_hire
where rownum between 1 and 5;


create or replace view sal_top3_view
as
select rownum RANKING, empno, ename, sal 
from (select * from emp order by sal desc)
where rownum <= 3;

select * From sal_top3_view;

--실습문제1
create or replace view v_em_dno
as
select empno, ename, deptno
from emp
where deptno = 20;
select * from v_em_dno;

--실습문제2
create or replace view v_em_dno
as
select empno, ename, deptno, sal
from emp
where deptno = 20;
select * From v_em_dno;

--실습문제3
drop view v_em_dno;
select * From user_views;
