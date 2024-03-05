desc emp

drop table emp05;

create table emp05(
    empno NUMBER(4) constraint EMP05_EMPNO_PK primary key,
    ename varchar2(10) constraint EMP05_ENAME_NN NOT NULL,
    job varchar2(9),
    deptno NUMBER(2));
    
select * From emp05;    
insert into emp05
values( 7499, 'ALLEN', 'SALESMAN', 30);
insert into emp05
values(NULL, 'JONES', 'MANAGER', 20);

select * from emp;
insert into emp
values(8200, 'SUJAN', 'CLERK', 7839, '92/03/03', 3000, 500, 50);

delete from dept
where deptno = 10;
    
select table_name, constraint_type, constraint_name, r_constraint_name
from user_constraints
where table_name in('DEPT', 'EMP');

CREATE TABLE EMP06( 
EMPNO NUMBER(4) 
CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY ,
ENAME VARCHAR2(10) 
CONSTRAINT EMP06_ENAME_NN NOT NULL, 
JOB VARCHAR2(9),
DEPTNO NUMBER(2)
CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT(DEPTNO)); 

INSERT INTO EMP06
VALUES(7566, 'JONES', 'MANAGER', 50);

CREATE TABLE EMP07( 
EMPNO NUMBER(4) 
CONSTRAINT EMP07_EMPNO_PK PRIMARY KEY ,
ENAME VARCHAR2(10) 
CONSTRAINT EMP07_ENAME_NN NOT NULL, 
SAL NUMBER(7, 2)
CONSTRAINT EMP07_SAL_CK CHECK(SAL BETWEEN 500 AND 5000),
GENDER VARCHAR2(1) 
CONSTRAINT EMP07_GENDER_CK CHECK (GENDER IN('M', 'F')));

insert into emp07
values(9000, '홍길동', 500, 'M');

insert into emp07
values(9100, '이순신', 5000, 'G');

drop table dept01;
create table dept01(
    deptno number(2) primary key,
    dname varchar2(14),
    loc varchar2(13) default 'SEOUL');
    
insert into dept01 (deptno, dname)
values(10, 'ACCOUNTING');

select * from emp01;

drop table emp02;

CREATE TABLE EMP01( 
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10) NOT NULL, 
JOB VARCHAR2(9) UNIQUE,
DEPTNO NUMBER(4) REFERENCES DEPT(DEPTNO)
); 

CREATE TABLE EMP02( 
EMPNO NUMBER(4),
ENAME VARCHAR2(10) NOT NULL, 
JOB VARCHAR2(9),
DEPTNO NUMBER(4),
PRIMARY KEY(EMPNO),
UNIQUE(JOB),
FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO)
);

CREATE TABLE EMP03( 
EMPNO NUMBER(4) CONSTRAINT EMP03_ENAME_NN NOT NULL,
ENAME VARCHAR2(10), 
JOB VARCHAR2(9),
DEPTNO NUMBER(4),
CONSTRAINT EMP03_EMPNO_PK PRIMARY KEY(EMPNO),
CONSTRAINT EMP03_JOB_UK UNIQUE(JOB),
CONSTRAINT EMP03_DEPTNO_FK FOREIGN KEY(DEPTNO) 
REFERENCES DEPT(DEPTNO)
); 

drop table emp01;

create table emp01(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    deptno number(4));
    
alter table emp01
add constraint EMP01_EMPNO_PK primary key(empno);

alter table emp01
add constraint EMP01_DEPTNO_FK 
foreign key(deptno) references dept(deptno);

alter table emp01
modify ename constraint EMP01_ENAME_NN not null;

alter table emp05
drop constraint emp05_empno_pk;

alter table emp05
drop constraint emp05_ename_nn;

select * from dept01;
select * from emp01;

drop table dept01;
drop table emp01;

create table dept01(
    deptno number(2) constraint dept01_deptno_pk primary key,
    dname varchar2(14),
    loc varchar2(13));
    
create table emp01(
    empno number(4) constraint emp01_empno_pk primary key,
    ename varchar2(10) constraint emp01_ename_nn not null,
    job varchar2(9),
    deptno number(4) constraint emp01_deptno_fk references dept01(deptno));

insert into dept01
select * from dept;

insert into emp01
values(7499, 'ALLEN', 'SALESMAN', 10);
insert into emp01 
values(7369, 'SMITH', 'CLERK', 20);

delete from dept01 where deptno = 10;

alter table emp01
disable constraint emp01_deptno_fk;

select constraint_name, constraint_type, table_name, r_constraint_name, status
from user_constraints                                                                                                                                          
where table_name = 'EMP01';

select * From dept01;

alter table emp01
enable constraint emp01_deptno_fk;

insert into dept01
values(10, 'ACCOUNTING', 'NEW YORK');

alter table dept01
disable primary key cascade;

select constraint_name, constraint_type, table_name, r_constraint_name, status
from user_constraints                                                                                                                                          
where table_name in ('EMP01','DEPT01');

alter table dept01
drop primary key cascade;

--실습문제1
create table emp_sample
as
select * From emp
where 1=0;

alter table emp_sample
add constraint my_emp_pk primary key(empno);

select constraint_name, constraint_type, table_name, r_constraint_name, status
from user_constraints                                                                                                                                          
where table_name = 'EMP_SAMPLE';

desc dept

--실습문제2
create table dept_sample(
    deptno number(2),
    dname varchar(14),
    loc varchar2(13),
    constraint my_dept_pk primary key(deptno));

--실습문제3
alter table emp_sample
add constraint my_emp_dept_fk 
foreign key(deptno) references dept_sample(deptno);

desc emp_sample

--실습문제4
alter table emp_sample
add constraint my_emp_comm_ck check (comm > 0);  