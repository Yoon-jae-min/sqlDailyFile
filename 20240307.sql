create table accounts (
  ano     varchar(20) primary key,
  owner   varchar(20) not null,
  balance number      not null
);

insert into accounts (ano, owner, balance) 
values ('111-111-1111', '�Ͽ���', 1000000);

insert into accounts (ano, owner, balance) 
values ('222-222-2222', '�Ѱܿ�', 0);

commit;

--�׽�Ʈ

create procedure sp_salary
is
v_sal emp.sal%type;
begin
select sal into v_sal
from emp
where ename = 'SCOTT';
dbms_output.put_line('SCOTT�� �޿��� ' || v_sal);
end;
/

select max(sal) "�ִ� �޿�", min(sal) "�ּ� �޿�"
from emp;

select job "JOB", max(sal) "MaxSAL", min(sal) "MinSAL"
    , sum(sal) "SUM", round(avg(sal)) "AVG"
from emp
group by job;

revoke select on emp from user01;

desc students

alter table students
modify studentid varchar2(10 char);
