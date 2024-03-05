--Sequence
desc user_sequences

select sequence_name, min_value, max_value, increment_by, cycle_flag
From user_sequences;

create sequence dept_deptno_seq
increment by 10
start with 10;

select dept_deptno_seq.nextval from dual;
select dept_deptno_seq.currval from dual;

create sequence emp_seq
start with 1
increment by 1
maxvalue 100000;

drop table emp01;

create table emp01(
    empno number(4) primary key,
    ename varchar(10),
    hiredate date);
    
insert into emp01
values(emp_seq.nextval, 'JULIA', sysdate);

select * from emp01;

create table dept_example(
    deptno number(4) primary key,
    dname varchar2(15),
    loc varchar2(15));
    
select * from user_sequences;

create sequence dept_seq
start with 10
increment by 10
maxvalue 100000;

insert into dept_example
values (dept_seq.nextval, '인사과', '서울');
insert into dept_example
values (dept_seq.nextval, '경리과', '서울');
insert into dept_example
values (dept_seq.nextval, '총무과', '대전');
insert into dept_example
values (dept_seq.nextval, '기술팀', '인천');

select * from dept_example;

select * from user_sequences;
drop sequence dept_seq;

--테스트

create table MEMBER_TBL(
    id varchar2(14) primary key,
    name varchar2(20) not null,
    password varchar2(20) not null,
    phone varchar2(13),
    email varchar2(30),
    grade char(1));
    
insert into member_tbl
values('3','ccaa', '1234', null, null, 1);
    
alter table member_tbl
add point number(10);

desc member_tbl

alter table member_tbl
modify grade char(10);

alter table member_tbl
drop column email;

drop table board_tbl;

create table board_tbl(
    bno number(4) primary key,
    title varchar2(50),
    content varchar2(1000),
    id varchar2(14) references member_tbl(id) not null,
    regdate date default sysdate
    );
    
insert into board_tbl
values(40, 't', null, 1, sysdate);
    
select * from user_constraints;
    
select table_name, constraint_name, constraint_type
from user_constraints
where table_name in ('BOARD_TBL', 'MEMBER_TBL');

select * From member_tbl;

create index member_idx_name on member_tbl(name); 

select * From user_indexes;

create or replace view view_member_board
as
select m.id, m.name, m.grade, b.bno, b.title, b.regdate
from member_tbl m
inner join board_tbl b
on m.id = b.id;

select * From user_views;

desc user_constraints    