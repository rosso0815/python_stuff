set serveroutput on
set time on
set colsep #
--
declare
cursor c_emp is
	select * from emp where sal > &1;
--
begin
for r_emp in c_emp loop
	--dbms_output.put_line( 'SAL = ' || r_emp.sal);
	if r_emp.sal >= 3000 then
		dbms_output.put_line( 'SAL = ' || r_emp.sal || ' => salary to high');
	else
		dbms_output.put_line( 'SAL = ' || r_emp.sal);
		end if;
	null;
	end loop;
--
exception
when others then
	dbms_output.put_line( 'ERROR OTHERS');
end;
/
exit;