select * from emp;
select * from dept;

select sum(sal) as sal�հ� from emp;

select sum(comm) as comm�հ� from emp;

select max(sal) as �ִ�, min(sal) as �ּ� from emp;

select ename, sal from emp
where sal = (select max(sal) from emp);

select max(hiredate) as �ֱ��Ի���, min(hiredate) as �����Ի��� 
from emp;

select count(comm) from emp;

select count(*) as ��ü, count(comm) as comm from emp;

select count(comm) from emp
where deptno = 10;

select count(distinct job) from emp;

select deptno "�μ���ȣ", round(avg(sal),1) "���", sum(sal)"�հ�", count(*)"�ο���",
min(sal)"�ּұ޿�", max(sal)"�ִ�޿�"
from emp
group by deptno;

select deptno "�μ���ȣ", count(*)"�����", count(comm)"Ŀ�̼� �޴� �����"
from emp
group by deptno;

select deptno "�μ���ȣ", round(avg(sal),1) "��ձ޿�" 
from emp
group by deptno
having avg(sal) >= 2000;

select deptno "�μ���ȣ", max(sal)"�ִ�޿�", min(sal)"�ּұ޿�"
from emp
group by deptno
having max(sal) > 2900;

--1
select max(sal)"Maximum", min(sal)"Minimum",
sum(sal)"Sum", round(avg(sal),0) "Average"
from emp;

--2
select job "job", max(sal) "Maximum", min(sal) "Minimum",
sum(sal) "Sum", round(avg(sal)) "Average"
from emp
group by job;

--3
select job "����", count(*) "�����"
from emp
group by job;

--4
select count(*) "count(MANAGER)"
from emp
where job = 'MANAGER';

--5
select max(sal) - min(sal) "DIFFERENCE"
from emp;

--6
select job, min(sal)
from emp
where mgr is not null
group by job
having min(sal) >= 2000
order by min(sal) desc;

--7
select deptno "DNO", count(*) "Number of People", 
round(avg(sal),2) "Salary"
from emp
group by deptno;

--8
select deptno, decode(deptno, 10, 'Accounting',
                              20, 'RESEARCH',
                              30, 'SALES',
                              40, 'OPERATIONS') "dname",
               decode(deptno, 10, 'NEW YORK',
                              20, 'DALLAS',
                              30, 'CHICAGO',
                              40, 'BOSTON') "Location",
               count(*) "Number of People", round(avg(sal)) "Salary"
from emp
group by deptno;

--9
select job, sum(decode(deptno, 10, sal)) "�μ�10",
            sum(decode(deptno, 20, sal)) "�μ�20",
            sum(decode(deptno, 30, sal)) "�μ�30",
            sum(sal) "�Ѿ�"
from emp
group by job;

--JOIN START --------------------------------------------------

select deptno
from emp
where ename='SCOTT';

select * from dept
where deptno=20;

select * from emp, dept;

select * from emp e, dept d
where e.deptno = d.deptno;

select d.deptno, d.dname, d.loc from emp e, dept d
where e.ename = 'SCOTT' and e.deptno = d.deptno;

select e.ename, d.dname, d.deptno
from emp e, dept d
where e.ename = 'SCOTT' and e.deptno = d.deptno;

--1
select e.ename, e.sal
from emp e, dept d
where e.deptno = d.deptno and d.loc = 'NEW YORK';

--2
select e.ename, e.hiredate
from emp e, dept d
where e.deptno = d.deptno and d.dname = 'ACCOUNTING';

--3
select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.job = 'MANAGER';

select * from salgrade;

select e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

--4
select e1.ename, e1.job
from emp e1, emp e2
where e1.mgr = e2.empno and e2.ename = 'KING';

--5
select e1.ename, e2.ename
from emp e1, emp e2
where e1.ename = 'SCOTT' and e1.deptno = e2.deptno;

select e1.ename || '�� �Ŵ����� ' || e2.ename || ' �Դϴ�.'
from emp e1, emp e2
where e1.mgr = e2.empno(+);

--6
select e.ename, d.deptno, d.dname
from emp e, dept d
where e.deptno(+) = d.deptno;

select * from emp
cross join dept;

select ename, dname
from emp 
inner join dept on emp.deptno = dept.deptno
where ename = 'SCOTT';

select e.ename, d.dname
from emp e inner join dept d
using (deptno);

select emp.ename, dept.dname
from emp natural join dept;

create table dept01
(deptno number(2),
dname varchar(14));

insert into dept01 values(10, 'ACCOUNTING');
insert into dept01 values(20, 'RESEARCH');

create table dept02
(deptno number(2),
dname varchar(14));

insert into dept02 values(10, 'ACCOUNTING');
insert into dept02 values(30, 'SALES');

select * from dept01;
select * from dept02;

select * from dept01 
left outer join dept02
using (deptno);

select * from dept01 
right outer join dept02
using (deptno);

select * from dept01 
full outer join dept02
using (deptno);

--1
select d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.ename = 'SCOTT';

--2
select e.ename, d.dname, d.loc
from emp e
inner join dept d
on e.deptno = d.deptno;

--3
select distinct e.job, d.loc 
from emp e
inner join dept d
using (deptno)
where deptno = 10;

--4
select e.ename, d.dname, d.loc
from emp e
natural join dept d
where e.comm is not null;

--5
select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.ename like '%A%';

--6
select e.ename, e.job, deptno, d.dname
from emp e
natural join dept d
where d.loc = 'NEW YORK';

--7
select e1.ename, e1.empno, e2.ename, e2.empno
from emp e1, emp e2
where e1.mgr = e2.empno;

--8
select *
from emp e1, emp e2
where e1.mgr = e2.empno(+)
order by e1.empno desc;

--9
select e1.ename "�̸�", e1.deptno "�μ���ȣ", e2.ename "����"
from emp e1, emp e2
where e1.deptno = e2.deptno and e1.ename <> e2.ename
order by e1.ename asc;

--10
select e1.ename, e1.hiredate
from emp e1, emp e2
where e1.hiredate > e2.hiredate and e2.ename = 'WARD';

--11
select e1.ename "�����", e1.hiredate "�Ի���", 
    e2.ename "�����ڸ�", e2.hiredate "�������Ի���"
from emp e1, emp e2
where e1.mgr = e2.empno and e1.hiredate < e2.hiredate;

select * from boards;

desc boards

create table users (
	userid          varchar2(50)	primary key, 
	username		varchar2(50)	not null,
	userpassword	varchar2(50)	not null,
	userage			number(3)	    not null,
	useremail		varchar2(50)	not null
);


