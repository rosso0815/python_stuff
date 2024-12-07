---
drop user grails cascade;
---
CREATE USER grails 
IDENTIFIED by grails
DEFAULT TABLESPACE users;
--
grant resource to grails;
grant create session to grails;
