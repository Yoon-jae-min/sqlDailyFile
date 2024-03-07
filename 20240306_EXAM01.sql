declare
vempno number(4);
vename varchar2(10);
begin
vempno := 778;
vename := 'SCOTT';
dbms_output.put_line('사번 / 이름');
dbms_output.put_line('----------------------');
dbms_output.put_line(vempno || ' / ' || vename);
end;
/