

set serveroutput on;

 
create or replace trigger log_A0HTML
    after insert or update or delete on A0HTML
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'A0HTML',v_action,v_remark);
end logger;
/
 
create or replace trigger log_A0JAVA
    after insert or update or delete on A0JAVA
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'A0JAVA',v_action,v_remark);
end logger;
/
 
create or replace trigger log_A0JAVAAP
    after insert or update or delete on A0JAVAAP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'A0JAVAAP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_A0TMPL
    after insert or update or delete on A0TMPL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'A0TMPL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_A0USES
    after insert or update or delete on A0USES
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'A0USES',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ACADDWG
    after insert or update or delete on ACADDWG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ACADDWG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ACCESSON
    after insert or update or delete on ACCESSON
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ACCESSON',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ACLOGCT
    after insert or update or delete on ACLOGCT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ACLOGCT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ADFLDITM
    after insert or update or delete on ADFLDITM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ADFLDITM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ADHCDATA
    after insert or update or delete on ADHCDATA
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ADHCDATA',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ADHCDATR
    after insert or update or delete on ADHCDATR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ADHCDATR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ADHOCDEP
    after insert or update or delete on ADHOCDEP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ADHOCDEP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ADMDCPRT
    after insert or update or delete on ADMDCPRT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ADMDCPRT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ADMSTOR
    after insert or update or delete on ADMSTOR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ADMSTOR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ADMVAL
    after insert or update or delete on ADMVAL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ADMVAL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ADTDEPND
    after insert or update or delete on ADTDEPND
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ADTDEPND',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ADVEVQ
    after insert or update or delete on ADVEVQ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ADVEVQ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ADVISOR
    after insert or update or delete on ADVISOR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ADVISOR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_AECFGCT
    after insert or update or delete on AECFGCT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'AECFGCT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_AGGREDIR
    after insert or update or delete on AGGREDIR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'AGGREDIR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_AGGREODR
    after insert or update or delete on AGGREODR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'AGGREODR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ALTPART
    after insert or update or delete on ALTPART
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ALTPART',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ALTREPR
    after insert or update or delete on ALTREPR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ALTREPR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ANSYSOUT
    after insert or update or delete on ANSYSOUT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ANSYSOUT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_APPDEPND
    after insert or update or delete on APPDEPND
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'APPDEPND',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ASGPROC
    after insert or update or delete on ASGPROC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ASGPROC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ASGSIG
    after insert or update or delete on ASGSIG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ASGSIG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ASSEMBLY
    after insert or update or delete on ASSEMBLY
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ASSEMBLY',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ASSIGNEE
    after insert or update or delete on ASSIGNEE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ASSIGNEE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ASSMEFF
    after insert or update or delete on ASSMEFF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ASSMEFF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ASSMMSTR
    after insert or update or delete on ASSMMSTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ASSMMSTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ASSMSTRC
    after insert or update or delete on ASSMSTRC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ASSMSTRC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ATTACH
    after insert or update or delete on ATTACH
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ATTACH',v_action,v_remark);
end logger;
/
 
create or replace trigger log_AVRSIG
    after insert or update or delete on AVRSIG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'AVRSIG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3BUSDOC
    after insert or update or delete on B3BUSDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3BUSDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3CHGNUM
    after insert or update or delete on B3CHGNUM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3CHGNUM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3CWQIN
    after insert or update or delete on B3CWQIN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3CWQIN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3CWQSP
    after insert or update or delete on B3CWQSP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3CWQSP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3DR
    after insert or update or delete on B3DR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3DR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3DRPRT
    after insert or update or delete on B3DRPRT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3DRPRT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3EMAIL
    after insert or update or delete on B3EMAIL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3EMAIL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3ENGDOC
    after insert or update or delete on B3ENGDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3ENGDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3IDLIB
    after insert or update or delete on B3IDLIB
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3IDLIB',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3IDPRJ
    after insert or update or delete on B3IDPRJ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3IDPRJ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3INSTRC
    after insert or update or delete on B3INSTRC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3INSTRC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3PLANT
    after insert or update or delete on B3PLANT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3PLANT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3PMSTR
    after insert or update or delete on B3PMSTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3PMSTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3PRCEML
    after insert or update or delete on B3PRCEML
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3PRCEML',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3PRGRM
    after insert or update or delete on B3PRGRM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3PRGRM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3PT2XFR
    after insert or update or delete on B3PT2XFR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3PT2XFR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3PTSUPR
    after insert or update or delete on B3PTSUPR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3PTSUPR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3QLDOC
    after insert or update or delete on B3QLDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3QLDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3SPRGRM
    after insert or update or delete on B3SPRGRM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3SPRGRM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3SUPPLR
    after insert or update or delete on B3SUPPLR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3SUPPLR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3TRANSF
    after insert or update or delete on B3TRANSF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3TRANSF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3USAGE
    after insert or update or delete on B3USAGE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3USAGE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3USDIN
    after insert or update or delete on B3USDIN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3USDIN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_B3VALSET
    after insert or update or delete on B3VALSET
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'B3VALSET',v_action,v_remark);
end logger;
/
 
create or replace trigger log_BIACLOG
    after insert or update or delete on BIACLOG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'BIACLOG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_BIDEFCT
    after insert or update or delete on BIDEFCT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'BIDEFCT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_BIGNCSTR
    after insert or update or delete on BIGNCSTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'BIGNCSTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_BIGNQTR
    after insert or update or delete on BIGNQTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'BIGNQTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_BIGNRFQR
    after insert or update or delete on BIGNRFQR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'BIGNRFQR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_BITMPLT
    after insert or update or delete on BITMPLT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'BITMPLT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_BITSEQ
    after insert or update or delete on BITSEQ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'BITSEQ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_BITTOVIS
    after insert or update or delete on BITTOVIS
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'BITTOVIS',v_action,v_remark);
end logger;
/
 
create or replace trigger log_BKMCOL
    after insert or update or delete on BKMCOL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'BKMCOL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_BKMITM
    after insert or update or delete on BKMITM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'BKMITM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_BKMKCOL
    after insert or update or delete on BKMKCOL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'BKMKCOL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_BMP
    after insert or update or delete on BMP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'BMP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_BTPAECR
    after insert or update or delete on BTPAECR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'BTPAECR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_C2CUST
    after insert or update or delete on C2CUST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'C2CUST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_C2DOCTP
    after insert or update or delete on C2DOCTP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'C2DOCTP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_C2MCSVP
    after insert or update or delete on C2MCSVP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'C2MCSVP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_C2PTCUSR
    after insert or update or delete on C2PTCUSR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'C2PTCUSR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CAADTDOC
    after insert or update or delete on CAADTDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CAADTDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CAADTFIL
    after insert or update or delete on CAADTFIL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CAADTFIL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CAAPDATA
    after insert or update or delete on CAAPDATA
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CAAPDATA',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CACHEEVQ
    after insert or update or delete on CACHEEVQ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CACHEEVQ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CACOLITM
    after insert or update or delete on CACOLITM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CACOLITM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CADESDOC
    after insert or update or delete on CADESDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CADESDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CADESFIL
    after insert or update or delete on CADESFIL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CADESFIL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CADESFMR
    after insert or update or delete on CADESFMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CADESFMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CADTOCAD
    after insert or update or delete on CADTOCAD
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CADTOCAD',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CADWGDOC
    after insert or update or delete on CADWGDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CADWGDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CADWGFIL
    after insert or update or delete on CADWGFIL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CADWGFIL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CAFEMDOC
    after insert or update or delete on CAFEMDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CAFEMDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CAFEMFIL
    after insert or update or delete on CAFEMFIL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CAFEMFIL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CALCOMP
    after insert or update or delete on CALCOMP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CALCOMP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CALENDAR
    after insert or update or delete on CALENDAR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CALENDAR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CANCDOC
    after insert or update or delete on CANCDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CANCDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CANCFIL
    after insert or update or delete on CANCFIL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CANCFIL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CAOCCXR
    after insert or update or delete on CAOCCXR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CAOCCXR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CASTATTR
    after insert or update or delete on CASTATTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CASTATTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CASTOCCR
    after insert or update or delete on CASTOCCR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CASTOCCR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CASTRUCR
    after insert or update or delete on CASTRUCR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CASTRUCR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CATEGRY
    after insert or update or delete on CATEGRY
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CATEGRY',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CAVEWDOC
    after insert or update or delete on CAVEWDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CAVEWDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CAXMLATT
    after insert or update or delete on CAXMLATT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CAXMLATT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CFGITEM
    after insert or update or delete on CFGITEM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CFGITEM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CGM
    after insert or update or delete on CGM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CGM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CGMCHAR
    after insert or update or delete on CGMCHAR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CGMCHAR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CGMCLEAR
    after insert or update or delete on CGMCLEAR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CGMCLEAR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CHANGE
    after insert or update or delete on CHANGE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CHANGE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CHEKINR
    after insert or update or delete on CHEKINR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CHEKINR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CHEKOUTR
    after insert or update or delete on CHEKOUTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CHEKOUTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CHGINFO
    after insert or update or delete on CHGINFO
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CHGINFO',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CKITEAMR
    after insert or update or delete on CKITEAMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CKITEAMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CKOTEAMR
    after insert or update or delete on CKOTEAMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CKOTEAMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CLSSBSCR
    after insert or update or delete on CLSSBSCR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CLSSBSCR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMAFFDOC
    after insert or update or delete on CMAFFDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMAFFDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMAFFMR
    after insert or update or delete on CMAFFMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMAFFMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMAFFPRT
    after insert or update or delete on CMAFFPRT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMAFFPRT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMCHNTIT
    after insert or update or delete on CMCHNTIT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMCHNTIT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMCHNTMR
    after insert or update or delete on CMCHNTMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMCHNTMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMCHRQIT
    after insert or update or delete on CMCHRQIT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMCHRQIT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMCHRQMR
    after insert or update or delete on CMCHRQMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMCHRQMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMCMTINC
    after insert or update or delete on CMCMTINC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMCMTINC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMDTINIT
    after insert or update or delete on CMDTINIT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMDTINIT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMDTINMR
    after insert or update or delete on CMDTINMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMDTINMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMIMPPRB
    after insert or update or delete on CMIMPPRB
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMIMPPRB',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMIMPRQ
    after insert or update or delete on CMIMPRQ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMIMPRQ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMIMPSTG
    after insert or update or delete on CMIMPSTG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMIMPSTG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMINCREV
    after insert or update or delete on CMINCREV
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMINCREV',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMPLREV
    after insert or update or delete on CMPLREV
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMPLREV',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMPLSTRC
    after insert or update or delete on CMPLSTRC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMPLSTRC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMPNMSTR
    after insert or update or delete on CMPNMSTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMPNMSTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMPONENT
    after insert or update or delete on CMPONENT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMPONENT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMPRPINC
    after insert or update or delete on CMPRPINC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMPRPINC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMPRRPIT
    after insert or update or delete on CMPRRPIT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMPRRPIT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMPRRPMR
    after insert or update or delete on CMPRRPMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMPRRPMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMPRTMR
    after insert or update or delete on CMPRTMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMPRTMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMPSDOC
    after insert or update or delete on CMPSDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMPSDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMPSMSTR
    after insert or update or delete on CMPSMSTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMPSMSTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMPSSTRC
    after insert or update or delete on CMPSSTRC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMPSSTRC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMRFRNCE
    after insert or update or delete on CMRFRNCE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMRFRNCE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMRSLTS
    after insert or update or delete on CMRSLTS
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMRSLTS',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMSTGYIT
    after insert or update or delete on CMSTGYIT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMSTGYIT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMSTGYMR
    after insert or update or delete on CMSTGYMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMSTGYMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMSUPPRT
    after insert or update or delete on CMSUPPRT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMSUPPRT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMTASKIT
    after insert or update or delete on CMTASKIT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMTASKIT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMTASKMR
    after insert or update or delete on CMTASKMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMTASKMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMUNINIT
    after insert or update or delete on CMUNINIT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMUNINIT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CMUNINMR
    after insert or update or delete on CMUNINMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CMUNINMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CNDPROC
    after insert or update or delete on CNDPROC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CNDPROC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_COLITM
    after insert or update or delete on COLITM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'COLITM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_COLLECTN
    after insert or update or delete on COLLECTN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'COLLECTN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_COMMPART
    after insert or update or delete on COMMPART
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'COMMPART',v_action,v_remark);
end logger;
/
 
create or replace trigger log_COMPOSIT
    after insert or update or delete on COMPOSIT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'COMPOSIT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CONDTBL
    after insert or update or delete on CONDTBL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CONDTBL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_COPIED
    after insert or update or delete on COPIED
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'COPIED',v_action,v_remark);
end logger;
/
 
create or replace trigger log_COSMOS
    after insert or update or delete on COSMOS
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'COSMOS',v_action,v_remark);
end logger;
/
 
create or replace trigger log_COST
    after insert or update or delete on COST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'COST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_CSTMSTR
    after insert or update or delete on CSTMSTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'CSTMSTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DBRMSTR
    after insert or update or delete on DBRMSTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DBRMSTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DESDOC
    after insert or update or delete on DESDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DESDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DETOOL
    after insert or update or delete on DETOOL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DETOOL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DIR
    after insert or update or delete on DIR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DIR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DIRSELRU
    after insert or update or delete on DIRSELRU
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DIRSELRU',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DISTBTOR
    after insert or update or delete on DISTBTOR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DISTBTOR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DITSEQ
    after insert or update or delete on DITSEQ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DITSEQ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DLSTPROC
    after insert or update or delete on DLSTPROC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DLSTPROC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DOCEVQ
    after insert or update or delete on DOCEVQ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DOCEVQ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DOCMST
    after insert or update or delete on DOCMST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DOCMST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DOCUMENT
    after insert or update or delete on DOCUMENT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DOCUMENT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DOMTOFED
    after insert or update or delete on DOMTOFED
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DOMTOFED',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DOMUSER
    after insert or update or delete on DOMUSER
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DOMUSER',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DTMDLSTC
    after insert or update or delete on DTMDLSTC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DTMDLSTC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DTTOOL
    after insert or update or delete on DTTOOL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DTTOOL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DWGTOCAD
    after insert or update or delete on DWGTOCAD
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DWGTOCAD',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DXF
    after insert or update or delete on DXF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DXF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_DYNPRTCP
    after insert or update or delete on DYNPRTCP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'DYNPRTCP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_EAI3DMRK
    after insert or update or delete on EAI3DMRK
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'EAI3DMRK',v_action,v_remark);
end logger;
/
 
create or replace trigger log_EAIMTION
    after insert or update or delete on EAIMTION
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'EAIMTION',v_action,v_remark);
end logger;
/
 
create or replace trigger log_EAISESSN
    after insert or update or delete on EAISESSN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'EAISESSN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_EDITTEXT
    after insert or update or delete on EDITTEXT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'EDITTEXT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ENTTSKIT
    after insert or update or delete on ENTTSKIT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ENTTSKIT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ENTTSKMR
    after insert or update or delete on ENTTSKMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ENTTSKMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_EVENT
    after insert or update or delete on EVENT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'EVENT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_EVENTGRP
    after insert or update or delete on EVENTGRP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'EVENTGRP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_EVENTLOG
    after insert or update or delete on EVENTLOG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'EVENTLOG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_EVENTQ
    after insert or update or delete on EVENTQ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'EVENTQ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_EVQTOOBJ
    after insert or update or delete on EVQTOOBJ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'EVQTOOBJ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_EVTTOEVG
    after insert or update or delete on EVTTOEVG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'EVTTOEVG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_EXCELCHT
    after insert or update or delete on EXCELCHT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'EXCELCHT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_EXCELSHT
    after insert or update or delete on EXCELSHT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'EXCELSHT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_EXPFILE
    after insert or update or delete on EXPFILE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'EXPFILE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_FEDSYS
    after insert or update or delete on FEDSYS
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'FEDSYS',v_action,v_remark);
end logger;
/
 
create or replace trigger log_FEMTOCAD
    after insert or update or delete on FEMTOCAD
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'FEMTOCAD',v_action,v_remark);
end logger;
/
 
create or replace trigger log_FILESYS
    after insert or update or delete on FILESYS
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'FILESYS',v_action,v_remark);
end logger;
/
 
create or replace trigger log_FILTOMKP
    after insert or update or delete on FILTOMKP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'FILTOMKP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_FORNREL
    after insert or update or delete on FORNREL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'FORNREL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_FTIDXEVQ
    after insert or update or delete on FTIDXEVQ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'FTIDXEVQ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_FTRIDXCT
    after insert or update or delete on FTRIDXCT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'FTRIDXCT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_FXDCOST
    after insert or update or delete on FXDCOST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'FXDCOST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_GENAGG
    after insert or update or delete on GENAGG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'GENAGG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_GIF
    after insert or update or delete on GIF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'GIF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_GNCSTQTR
    after insert or update or delete on GNCSTQTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'GNCSTQTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_GNCSTREV
    after insert or update or delete on GNCSTREV
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'GNCSTREV',v_action,v_remark);
end logger;
/
 
create or replace trigger log_GNCSTSTC
    after insert or update or delete on GNCSTSTC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'GNCSTSTC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_GNQTSUPR
    after insert or update or delete on GNQTSUPR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'GNQTSUPR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_GNRFQQTR
    after insert or update or delete on GNRFQQTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'GNRFQQTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_GNRFQSUR
    after insert or update or delete on GNRFQSUR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'GNRFQSUR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_GOOWNUSR
    after insert or update or delete on GOOWNUSR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'GOOWNUSR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_HASPKG
    after insert or update or delete on HASPKG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'HASPKG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_HOME
    after insert or update or delete on HOME
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'HOME',v_action,v_remark);
end logger;
/
 
create or replace trigger log_HOST
    after insert or update or delete on HOST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'HOST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_HOSTGRP
    after insert or update or delete on HOSTGRP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'HOSTGRP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_HPGL
    after insert or update or delete on HPGL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'HPGL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_HPPCL
    after insert or update or delete on HPPCL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'HPPCL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_HSTTOHGR
    after insert or update or delete on HSTTOHGR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'HSTTOHGR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_HTMLFILE
    after insert or update or delete on HTMLFILE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'HTMLFILE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_IDGENREL
    after insert or update or delete on IDGENREL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'IDGENREL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_IDGENTOR
    after insert or update or delete on IDGENTOR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'IDGENTOR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_IDIFILE
    after insert or update or delete on IDIFILE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'IDIFILE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_IDPRVDER
    after insert or update or delete on IDPRVDER
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'IDPRVDER',v_action,v_remark);
end logger;
/
 
create or replace trigger log_IDZFILE
    after insert or update or delete on IDZFILE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'IDZFILE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_IGES
    after insert or update or delete on IGES
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'IGES',v_action,v_remark);
end logger;
/
 
create or replace trigger log_IMGTRANS
    after insert or update or delete on IMGTRANS
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'IMGTRANS',v_action,v_remark);
end logger;
/
 
create or replace trigger log_INDEPBIN
    after insert or update or delete on INDEPBIN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'INDEPBIN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_INVENTOR
    after insert or update or delete on INVENTOR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'INVENTOR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ITEMREV
    after insert or update or delete on ITEMREV
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ITEMREV',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ITEMTPL
    after insert or update or delete on ITEMTPL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ITEMTPL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ITMTOVIS
    after insert or update or delete on ITMTOVIS
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ITMTOVIS',v_action,v_remark);
end logger;
/
 
create or replace trigger log_JPEG
    after insert or update or delete on JPEG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'JPEG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_JT
    after insert or update or delete on JT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'JT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_KEYTBL
    after insert or update or delete on KEYTBL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'KEYTBL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_LANGPREF
    after insert or update or delete on LANGPREF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'LANGPREF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_LCSTEP
    after insert or update or delete on LCSTEP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'LCSTEP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_LDAPAUTH
    after insert or update or delete on LDAPAUTH
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'LDAPAUTH',v_action,v_remark);
end logger;
/
 
create or replace trigger log_LIFECYC
    after insert or update or delete on LIFECYC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'LIFECYC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_LOCST
    after insert or update or delete on LOCST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'LOCST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MAILLOG
    after insert or update or delete on MAILLOG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MAILLOG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MANUFACT
    after insert or update or delete on MANUFACT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MANUFACT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MARKUP
    after insert or update or delete on MARKUP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MARKUP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MARKUPCT
    after insert or update or delete on MARKUPCT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MARKUPCT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MFGPART
    after insert or update or delete on MFGPART
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MFGPART',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MFGPRTMR
    after insert or update or delete on MFGPRTMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MFGPRTMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MFPLDOC
    after insert or update or delete on MFPLDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MFPLDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MFRMSTR
    after insert or update or delete on MFRMSTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MFRMSTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MILR
    after insert or update or delete on MILR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MILR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MNTFROM
    after insert or update or delete on MNTFROM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MNTFROM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MSGACCRU
    after insert or update or delete on MSGACCRU
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MSGACCRU',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MSGGRP
    after insert or update or delete on MSGGRP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MSGGRP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MSGPROC
    after insert or update or delete on MSGPROC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MSGPROC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MTIAUTH
    after insert or update or delete on MTIAUTH
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MTIAUTH',v_action,v_remark);
end logger;
/
 
create or replace trigger log_MVTOOL
    after insert or update or delete on MVTOOL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'MVTOOL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_NAMEDBL
    after insert or update or delete on NAMEDBL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'NAMEDBL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_NASOUT
    after insert or update or delete on NASOUT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'NASOUT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_NAVQRYR
    after insert or update or delete on NAVQRYR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'NAVQRYR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_NAVTPLR
    after insert or update or delete on NAVTPLR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'NAVTPLR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_NBLTOIM
    after insert or update or delete on NBLTOIM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'NBLTOIM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_NBLTOWI
    after insert or update or delete on NBLTOWI
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'NBLTOWI',v_action,v_remark);
end logger;
/
 
create or replace trigger log_NCTOCAD
    after insert or update or delete on NCTOCAD
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'NCTOCAD',v_action,v_remark);
end logger;
/
 
create or replace trigger log_NOEDTEXT
    after insert or update or delete on NOEDTEXT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'NOEDTEXT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_NOTE
    after insert or update or delete on NOTE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'NOTE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_NOTIFCFG
    after insert or update or delete on NOTIFCFG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'NOTIFCFG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_NOTIFRU
    after insert or update or delete on NOTIFRU
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'NOTIFRU',v_action,v_remark);
end logger;
/
 
create or replace trigger log_NTFCFREL
    after insert or update or delete on NTFCFREL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'NTFCFREL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_NTFEVQ
    after insert or update or delete on NTFEVQ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'NTFEVQ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_OBJSBSCR
    after insert or update or delete on OBJSBSCR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'OBJSBSCR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_OBJTOSSC
    after insert or update or delete on OBJTOSSC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'OBJTOSSC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_OBRSIG
    after insert or update or delete on OBRSIG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'OBRSIG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_OBSERVER
    after insert or update or delete on OBSERVER
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'OBSERVER',v_action,v_remark);
end logger;
/
 
create or replace trigger log_OCCCLRST
    after insert or update or delete on OCCCLRST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'OCCCLRST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_OCCDATA
    after insert or update or delete on OCCDATA
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'OCCDATA',v_action,v_remark);
end logger;
/
 
create or replace trigger log_OCCNMST
    after insert or update or delete on OCCNMST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'OCCNMST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_OCCNVST
    after insert or update or delete on OCCNVST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'OCCNVST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_OCFACTST
    after insert or update or delete on OCFACTST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'OCFACTST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ODOCTOOL
    after insert or update or delete on ODOCTOOL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ODOCTOOL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_OLEFILE
    after insert or update or delete on OLEFILE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'OLEFILE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ORGANZTN
    after insert or update or delete on ORGANZTN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ORGANZTN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ORIGSRCR
    after insert or update or delete on ORIGSRCR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ORIGSRCR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ORPHFILE
    after insert or update or delete on ORPHFILE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ORPHFILE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_OSDEPBIN
    after insert or update or delete on OSDEPBIN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'OSDEPBIN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_OWNDSTOR
    after insert or update or delete on OWNDSTOR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'OWNDSTOR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PACKAGE
    after insert or update or delete on PACKAGE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PACKAGE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PAPER
    after insert or update or delete on PAPER
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PAPER',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PARBRCH
    after insert or update or delete on PARBRCH
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PARBRCH',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PARPROC
    after insert or update or delete on PARPROC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PARPROC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PARTDOC
    after insert or update or delete on PARTDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PARTDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PARTDOCM
    after insert or update or delete on PARTDOCM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PARTDOCM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PARTSDOC
    after insert or update or delete on PARTSDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PARTSDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PARTSUPP
    after insert or update or delete on PARTSUPP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PARTSUPP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PATNEUT
    after insert or update or delete on PATNEUT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PATNEUT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PATOUT
    after insert or update or delete on PATOUT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PATOUT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PDFFILE
    after insert or update or delete on PDFFILE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PDFFILE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PEOCC
    after insert or update or delete on PEOCC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PEOCC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PEOCCDT
    after insert or update or delete on PEOCCDT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PEOCCDT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PEOCCIND
    after insert or update or delete on PEOCCIND
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PEOCCIND',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PEOCCXR
    after insert or update or delete on PEOCCXR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PEOCCXR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PEOCFACT
    after insert or update or delete on PEOCFACT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PEOCFACT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PESTOCR
    after insert or update or delete on PESTOCR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PESTOCR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PKGCNT
    after insert or update or delete on PKGCNT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PKGCNT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PLMXML
    after insert or update or delete on PLMXML
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PLMXML',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PMTOSDOC
    after insert or update or delete on PMTOSDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PMTOSDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PNG
    after insert or update or delete on PNG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PNG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_POSTSCR
    after insert or update or delete on POSTSCR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'POSTSCR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PPTDOC
    after insert or update or delete on PPTDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PPTDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PRCHSR
    after insert or update or delete on PRCHSR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PRCHSR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PRHSTR
    after insert or update or delete on PRHSTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PRHSTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PRINTFAX
    after insert or update or delete on PRINTFAX
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PRINTFAX',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PROCHIST
    after insert or update or delete on PROCHIST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PROCHIST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PROJECT
    after insert or update or delete on PROJECT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PROJECT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PRONEU
    after insert or update or delete on PRONEU
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PRONEU',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PROXYOBJ
    after insert or update or delete on PROXYOBJ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PROXYOBJ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PRTDELGR
    after insert or update or delete on PRTDELGR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PRTDELGR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PRTDSTMR
    after insert or update or delete on PRTDSTMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PRTDSTMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PRTMFRMR
    after insert or update or delete on PRTMFRMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PRTMFRMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_PRTSUPMR
    after insert or update or delete on PRTSUPMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'PRTSUPMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_QRYRES
    after insert or update or delete on QRYRES
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'QRYRES',v_action,v_remark);
end logger;
/
 
create or replace trigger log_QUOTE
    after insert or update or delete on QUOTE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'QUOTE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0ASSMAS
    after insert or update or delete on R0ASSMAS
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0ASSMAS',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0ASSMCP
    after insert or update or delete on R0ASSMCP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0ASSMCP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0ASSMRM
    after insert or update or delete on R0ASSMRM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0ASSMRM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0ASSMSF
    after insert or update or delete on R0ASSMSF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0ASSMSF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0ATDFPF
    after insert or update or delete on R0ATDFPF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0ATDFPF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0ATPCKL
    after insert or update or delete on R0ATPCKL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0ATPCKL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0BRAND
    after insert or update or delete on R0BRAND
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0BRAND',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0BUSENT
    after insert or update or delete on R0BUSENT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0BUSENT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0CDMSPC
    after insert or update or delete on R0CDMSPC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0CDMSPC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0CRAFPT
    after insert or update or delete on R0CRAFPT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0CRAFPT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0CSHDCR
    after insert or update or delete on R0CSHDCR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0CSHDCR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0CSTDOC
    after insert or update or delete on R0CSTDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0CSTDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0DEST
    after insert or update or delete on R0DEST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0DEST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0DFPFAS
    after insert or update or delete on R0DFPFAS
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0DFPFAS',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0DSTCNT
    after insert or update or delete on R0DSTCNT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0DSTCNT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0ENGENT
    after insert or update or delete on R0ENGENT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0ENGENT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0EXCDPC
    after insert or update or delete on R0EXCDPC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0EXCDPC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0GRPAMP
    after insert or update or delete on R0GRPAMP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0GRPAMP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0HSDEST
    after insert or update or delete on R0HSDEST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0HSDEST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0IMPWOR
    after insert or update or delete on R0IMPWOR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0IMPWOR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0LCPCKL
    after insert or update or delete on R0LCPCKL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0LCPCKL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0LDKPRF
    after insert or update or delete on R0LDKPRF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0LDKPRF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0LGNACR
    after insert or update or delete on R0LGNACR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0LGNACR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0LGNARC
    after insert or update or delete on R0LGNARC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0LGNARC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0LGNCNT
    after insert or update or delete on R0LGNCNT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0LGNCNT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0LNMPIT
    after insert or update or delete on R0LNMPIT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0LNMPIT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0LODLOG
    after insert or update or delete on R0LODLOG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0LODLOG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0MLPREF
    after insert or update or delete on R0MLPREF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0MLPREF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0MPPDOC
    after insert or update or delete on R0MPPDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0MPPDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0NATOPC
    after insert or update or delete on R0NATOPC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0NATOPC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0PATDOC
    after insert or update or delete on R0PATDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0PATDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0PLHDCR
    after insert or update or delete on R0PLHDCR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0PLHDCR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0PRDCR
    after insert or update or delete on R0PRDCR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0PRDCR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0PRDSR
    after insert or update or delete on R0PRDSR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0PRDSR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0PURDOC
    after insert or update or delete on R0PURDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0PURDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0RLPCKL
    after insert or update or delete on R0RLPCKL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0RLPCKL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0SLSDOC
    after insert or update or delete on R0SLSDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0SLSDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0STDDOC
    after insert or update or delete on R0STDDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0STDDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0SUHDCR
    after insert or update or delete on R0SUHDCR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0SUHDCR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0TSAFPT
    after insert or update or delete on R0TSAFPT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0TSAFPT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0TSIMPR
    after insert or update or delete on R0TSIMPR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0TSIMPR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0TSTDOC
    after insert or update or delete on R0TSTDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0TSTDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0USRLGN
    after insert or update or delete on R0USRLGN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0USRLGN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0VERSN
    after insert or update or delete on R0VERSN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0VERSN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0WDPRF
    after insert or update or delete on R0WDPRF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0WDPRF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0WOIDCR
    after insert or update or delete on R0WOIDCR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0WOIDCR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R0WRKODR
    after insert or update or delete on R0WRKODR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R0WRKODR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R1RELCTL
    after insert or update or delete on R1RELCTL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R1RELCTL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_R1STATPC
    after insert or update or delete on R1STATPC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'R1STATPC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_RCPSIG
    after insert or update or delete on RCPSIG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'RCPSIG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_RECIPENT
    after insert or update or delete on RECIPENT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'RECIPENT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_REFCOPYR
    after insert or update or delete on REFCOPYR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'REFCOPYR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_REFERENC
    after insert or update or delete on REFERENC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'REFERENC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_RELTONBL
    after insert or update or delete on RELTONBL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'RELTONBL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_RELTPL
    after insert or update or delete on RELTPL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'RELTPL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_RENDER
    after insert or update or delete on RENDER
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'RENDER',v_action,v_remark);
end logger;
/
 
create or replace trigger log_REPLIPOL
    after insert or update or delete on REPLIPOL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'REPLIPOL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_REPORT
    after insert or update or delete on REPORT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'REPORT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_REPRSNTS
    after insert or update or delete on REPRSNTS
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'REPRSNTS',v_action,v_remark);
end logger;
/
 
create or replace trigger log_REVEFF
    after insert or update or delete on REVEFF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'REVEFF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_REVIEWER
    after insert or update or delete on REVIEWER
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'REVIEWER',v_action,v_remark);
end logger;
/
 
create or replace trigger log_REVISER
    after insert or update or delete on REVISER
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'REVISER',v_action,v_remark);
end logger;
/
 
create or replace trigger log_REVPROC
    after insert or update or delete on REVPROC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'REVPROC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_REVSIG
    after insert or update or delete on REVSIG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'REVSIG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_REVTOREV
    after insert or update or delete on REVTOREV
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'REVTOREV',v_action,v_remark);
end logger;
/
 
create or replace trigger log_RFQITEM
    after insert or update or delete on RFQITEM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'RFQITEM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_RLSTPROC
    after insert or update or delete on RLSTPROC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'RLSTPROC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ROLEASSN
    after insert or update or delete on ROLEASSN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ROLEASSN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_RPOLASSN
    after insert or update or delete on RPOLASSN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'RPOLASSN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_RPTWRTR
    after insert or update or delete on RPTWRTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'RPTWRTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_RTF
    after insert or update or delete on RTF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'RTF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVAPCP
    after insert or update or delete on SAVAPCP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVAPCP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVCAPP
    after insert or update or delete on SAVCAPP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVCAPP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVCFGP
    after insert or update or delete on SAVCFGP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVCFGP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVCHAP
    after insert or update or delete on SAVCHAP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVCHAP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVCOLP
    after insert or update or delete on SAVCOLP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVCOLP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVDBP
    after insert or update or delete on SAVDBP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVDBP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVDELP
    after insert or update or delete on SAVDELP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVDELP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVEROP
    after insert or update or delete on SAVEROP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVEROP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVEXPP
    after insert or update or delete on SAVEXPP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVEXPP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVFAXP
    after insert or update or delete on SAVFAXP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVFAXP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVFEDP
    after insert or update or delete on SAVFEDP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVFEDP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVMKPP
    after insert or update or delete on SAVMKPP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVMKPP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVMVP
    after insert or update or delete on SAVMVP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVMVP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVPRTP
    after insert or update or delete on SAVPRTP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVPRTP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVQRY
    after insert or update or delete on SAVQRY
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVQRY',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVSRTP
    after insert or update or delete on SAVSRTP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVSRTP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVVWAPP
    after insert or update or delete on SAVVWAPP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVVWAPP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVVWP
    after insert or update or delete on SAVVWP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVVWP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SAVXSRCH
    after insert or update or delete on SAVXSRCH
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SAVXSRCH',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SBRSIG
    after insert or update or delete on SBRSIG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SBRSIG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SCHEDULE
    after insert or update or delete on SCHEDULE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SCHEDULE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SEIDXEVQ
    after insert or update or delete on SEIDXEVQ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SEIDXEVQ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SEINFO
    after insert or update or delete on SEINFO
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SEINFO',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SETFILE
    after insert or update or delete on SETFILE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SETFILE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SGDEFF
    after insert or update or delete on SGDEFF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SGDEFF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SHADOW
    after insert or update or delete on SHADOW
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SHADOW',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SHROWNER
    after insert or update or delete on SHROWNER
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SHROWNER',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SLAASCII
    after insert or update or delete on SLAASCII
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SLAASCII',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SLABIN
    after insert or update or delete on SLABIN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SLABIN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SPCDOC
    after insert or update or delete on SPCDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SPCDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SPRMSTR
    after insert or update or delete on SPRMSTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SPRMSTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SREP
    after insert or update or delete on SREP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SREP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SREPR
    after insert or update or delete on SREPR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SREPR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SSCRBCLS
    after insert or update or delete on SSCRBCLS
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SSCRBCLS',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SSCTOSSC
    after insert or update or delete on SSCTOSSC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SSCTOSSC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SSCTOSSR
    after insert or update or delete on SSCTOSSR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SSCTOSSR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_STAGEDIR
    after insert or update or delete on STAGEDIR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'STAGEDIR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_STDOCMNT
    after insert or update or delete on STDOCMNT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'STDOCMNT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_STDOCREL
    after insert or update or delete on STDOCREL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'STDOCREL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_STDOCSTR
    after insert or update or delete on STDOCSTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'STDOCSTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_STQADCMR
    after insert or update or delete on STQADCMR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'STQADCMR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_STQALDOC
    after insert or update or delete on STQALDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'STQALDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_STRCOPT
    after insert or update or delete on STRCOPT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'STRCOPT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_STUPITM
    after insert or update or delete on STUPITM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'STUPITM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_STUPREF
    after insert or update or delete on STUPREF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'STUPREF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SUBPART
    after insert or update or delete on SUBPART
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SUBPART',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SUPERTAB
    after insert or update or delete on SUPERTAB
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SUPERTAB',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SUPPLIER
    after insert or update or delete on SUPPLIER
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SUPPLIER',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SUPSVC
    after insert or update or delete on SUPSVC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SUPSVC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SVCTYPE
    after insert or update or delete on SVCTYPE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SVCTYPE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SVDSRCHC
    after insert or update or delete on SVDSRCHC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SVDSRCHC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SYSSTPCT
    after insert or update or delete on SYSSTPCT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SYSSTPCT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_SYVTBP
    after insert or update or delete on SYVTBP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'SYVTBP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TASKFLOW
    after insert or update or delete on TASKFLOW
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TASKFLOW',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TASKSTEP
    after insert or update or delete on TASKSTEP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TASKSTEP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TASKTOOL
    after insert or update or delete on TASKTOOL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TASKTOOL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TCHPDOC
    after insert or update or delete on TCHPDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TCHPDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TEAM
    after insert or update or delete on TEAM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TEAM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TEAMDFLT
    after insert or update or delete on TEAMDFLT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TEAMDFLT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TEAMFLDR
    after insert or update or delete on TEAMFLDR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TEAMFLDR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TEAMLOC
    after insert or update or delete on TEAMLOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TEAMLOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TEAMPROJ
    after insert or update or delete on TEAMPROJ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TEAMPROJ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TEAMROLE
    after insert or update or delete on TEAMROLE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TEAMROLE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TIFF
    after insert or update or delete on TIFF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TIFF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TILDTIFF
    after insert or update or delete on TILDTIFF
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TILDTIFF',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TMFLDITM
    after insert or update or delete on TMFLDITM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TMFLDITM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TMPRTDOC
    after insert or update or delete on TMPRTDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TMPRTDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TMRLASSN
    after insert or update or delete on TMRLASSN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TMRLASSN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TMTOTMNP
    after insert or update or delete on TMTOTMNP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TMTOTMNP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TPITOTPR
    after insert or update or delete on TPITOTPR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TPITOTPR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TPRTOTPI
    after insert or update or delete on TPRTOTPI
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TPRTOTPI',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TRANSDOC
    after insert or update or delete on TRANSDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TRANSDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TRANSLAT
    after insert or update or delete on TRANSLAT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TRANSLAT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TRANSLCT
    after insert or update or delete on TRANSLCT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TRANSLCT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TRKDESR
    after insert or update or delete on TRKDESR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TRKDESR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TRKMSTRR
    after insert or update or delete on TRKMSTRR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TRKMSTRR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TSLEVQ
    after insert or update or delete on TSLEVQ
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TSLEVQ',v_action,v_remark);
end logger;
/
 
create or replace trigger log_TSLTOOL
    after insert or update or delete on TSLTOOL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'TSLTOOL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_UATMPCOL
    after insert or update or delete on UATMPCOL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'UATMPCOL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_UMAGCONT
    after insert or update or delete on UMAGCONT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'UMAGCONT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_UMDRCONT
    after insert or update or delete on UMDRCONT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'UMDRCONT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_UNIQUEID
    after insert or update or delete on UNIQUEID
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'UNIQUEID',v_action,v_remark);
end logger;
/
 
create or replace trigger log_UROLE
    after insert or update or delete on UROLE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'UROLE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_USERSTMP
    after insert or update or delete on USERSTMP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'USERSTMP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_USR
    after insert or update or delete on USR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'USR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_USRGRP
    after insert or update or delete on USRGRP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'USRGRP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_USRSTAT
    after insert or update or delete on USRSTAT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'USRSTAT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_USRTODOM
    after insert or update or delete on USRTODOM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'USRTODOM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_USRTOFED
    after insert or update or delete on USRTOFED
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'USRTOFED',v_action,v_remark);
end logger;
/
 
create or replace trigger log_USRTOGRP
    after insert or update or delete on USRTOGRP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'USRTOGRP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_USRTOHST
    after insert or update or delete on USRTOHST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'USRTOHST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_USRTOTM
    after insert or update or delete on USRTOTM
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'USRTOTM',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VAULT
    after insert or update or delete on VAULT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VAULT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VAULTDIR
    after insert or update or delete on VAULTDIR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VAULTDIR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VDA
    after insert or update or delete on VDA
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VDA',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VERSATEC
    after insert or update or delete on VERSATEC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VERSATEC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VERSIONR
    after insert or update or delete on VERSIONR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VERSIONR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VERSN
    after insert or update or delete on VERSN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VERSN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VEW
    after insert or update or delete on VEW
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VEW',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VEWMRKUP
    after insert or update or delete on VEWMRKUP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VEWMRKUP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VEWTOCAD
    after insert or update or delete on VEWTOCAD
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VEWTOCAD',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VEWTOVEW
    after insert or update or delete on VEWTOVEW
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VEWTOVEW',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VIEWCT
    after insert or update or delete on VIEWCT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VIEWCT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VISATTR
    after insert or update or delete on VISATTR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VISATTR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VISIOFL
    after insert or update or delete on VISIOFL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VISIOFL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VISMRKUP
    after insert or update or delete on VISMRKUP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VISMRKUP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VISSESSN
    after insert or update or delete on VISSESSN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VISSESSN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VISSPRT
    after insert or update or delete on VISSPRT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VISSPRT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VISST
    after insert or update or delete on VISST
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VISST',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VITOOL
    after insert or update or delete on VITOOL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VITOOL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VLTPROC
    after insert or update or delete on VLTPROC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VLTPROC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VMETOOL
    after insert or update or delete on VMETOOL
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VMETOOL',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VNDSTDOC
    after insert or update or delete on VNDSTDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VNDSTDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VSPLMXML
    after insert or update or delete on VSPLMXML
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VSPLMXML',v_action,v_remark);
end logger;
/
 
create or replace trigger log_VWMKPCT
    after insert or update or delete on VWMKPCT
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'VWMKPCT',v_action,v_remark);
end logger;
/
 
create or replace trigger log_WBDBRCH
    after insert or update or delete on WBDBRCH
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'WBDBRCH',v_action,v_remark);
end logger;
/
 
create or replace trigger log_WBDPROC
    after insert or update or delete on WBDPROC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'WBDPROC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_WORDDOC
    after insert or update or delete on WORDDOC
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'WORDDOC',v_action,v_remark);
end logger;
/
 
create or replace trigger log_WORKSDIR
    after insert or update or delete on WORKSDIR
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'WORKSDIR',v_action,v_remark);
end logger;
/
 
create or replace trigger log_WRKSPACE
    after insert or update or delete on WRKSPACE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'WRKSPACE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_XBITMAP
    after insert or update or delete on XBITMAP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'XBITMAP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_XMLBIN
    after insert or update or delete on XMLBIN
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'XMLBIN',v_action,v_remark);
end logger;
/
 
create or replace trigger log_XMLFILE
    after insert or update or delete on XMLFILE
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'XMLFILE',v_action,v_remark);
end logger;
/
 
create or replace trigger log_XWINDUMP
    after insert or update or delete on XWINDUMP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'XWINDUMP',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ZBINDB
    after insert or update or delete on ZBINDB
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ZBINDB',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ZDBCONFIG
    after insert or update or delete on ZDBCONFIG
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ZDBCONFIG',v_action,v_remark);
end logger;
/
 
create or replace trigger log_ZIP
    after insert or update or delete on ZIP
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, 'ZIP',v_action,v_remark);
end logger;
/

exit;
