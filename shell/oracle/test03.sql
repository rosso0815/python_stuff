set serveroutput on size 1000000;
set timing on;

declare
cursor c_gross is 
	select g from gross;

	v_g c_gross%ROWTYPE;

begin
open c_gross;
loop
	fetch c_gross into v_g;
	if v_g.g = 1000 then
		dbms_output.put_line('HALLO='|| v_g.g );
		exit;
	end if;
end loop;
close c_gross;
end;
/
exit;
