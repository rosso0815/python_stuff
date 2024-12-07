col owner form a15
col db_link form a20
col userpass form a25
col host form a15

set pages 20

spool dblink.lst

select u.name owner
,l.name db_link
,l.host
,l.userid||'/'||l.password userpass
from sys.link$ l, sys.user$ u
where l.owner# = u.user#;

spool off
