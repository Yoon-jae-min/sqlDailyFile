create table accounts (
  ano     varchar(20) primary key,
  owner   varchar(20) not null,
  balance number      not null
);

insert into accounts (ano, owner, balance) 
values ('111-111-1111', '하여름', 1000000);

insert into accounts (ano, owner, balance) 
values ('222-222-2222', '한겨울', 0);

commit;

--테스트

create procedure sp_salary
is
v_sal emp.sal%type;
begin
select sal into v_sal
from emp
where ename = 'SCOTT';
dbms_output.put_line('SCOTT의 급여는 ' || v_sal);
end;
/

select max(sal) "최대 급여", min(sal) "최소 급여"
from emp;

select job "JOB", max(sal) "MaxSAL", min(sal) "MinSAL"
    , sum(sal) "SUM", round(avg(sal)) "AVG"
from emp
group by job;

revoke select on emp from user01;

desc students

alter table students
modify studentid varchar2(10 char);
