set serveroutput on
--
declare
v_emp emp%ROWTYPE;
--
begin
--select * into v_emp from emp where empno = 7782;
select * into v_emp from emp;

dbms_output.put_line( 'SAL = ' || v_emp.sal);
--
exception
when others then
	dbms_output.put_line( 'ERROR OTHERS');
end;
/
exit;
