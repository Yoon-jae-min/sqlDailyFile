set serveroutput on
declare
	vempno emp.empno%type;
	vename emp.ename%type;
begin
	dbms_output.put_line('��� / �̸�');
	dbms_output.put_line('------------------');
	
	select empno, ename into vempno, vename
	from emp
	where ename = 'SCOTT';

	dbms_output.put_line(vempno || ' / ' || vename);
end;
/