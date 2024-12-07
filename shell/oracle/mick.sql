spool test.sql
select 'update PRD11.PART_LIST set P_PTYPE = ' || chr(39) || rtrim(P_PTYPE) || chr(39) 
        || ' , P_TITLE = ' || chr(39) || rtrim(P_TITLE) || chr(39) 
	|| ' where S_PIDENTNR  = ' || chr(39) || 'JUST999888' || chr(39) 
	  from PRD11.PART_LIST where "$COID" = '4141960436213DFF' ;

spool off 
