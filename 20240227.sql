select substr(hiredate, 1,2) "�Ի� �⵵", substr(hiredate, 4, 2) "�Ի� ��" from emp;

select * from emp
where substr(hiredate, 4, 2) = '04';

select * from emp
where mod(empno, 2) = 0;

select hiredate, to_char(hiredate, 'yy-mon-dd dy') "�Ի���" from emp;

select trunc(sysdate - to_date('2024-01-01', 'yyyy-mm-dd')) from dual;

select empno, mgr, nvl(mgr, 0) from emp;

select ename, job, sal, decode(job, 'ANALYST', sal + 100,
                               'SALESMAN', sal + 180,
                               'MANAGER', sal + 150,
                               'CLERK', sal + 100) "�λ�޿�"
                               from emp;