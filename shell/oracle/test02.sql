set serveroutput on
set timing on

create or replace procedure func01
is
begin
	dbms_output.put_line('heute testen wir pl/sql');
end;
/
exit;
