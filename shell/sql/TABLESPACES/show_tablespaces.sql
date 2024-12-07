/*
########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : A.Pfister
## Datum    : 21.02.2003
## Aufruf   : sqlplus
## Funktion : anzeigen der tablespaces in einer oracle-instance
## Keyword  : 
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date          Version         Description
## 21.01.2003    1.0             Init
########## ######### ######### ######### ######### ######### ######### #########
*/

set pagesize 0
set linesize 100

column TABLESPACE_NAME format a20
column FILE_NAME format a60
spool tablespaces.txt
select TABLESPACE_NAME, FILE_NAME from dba_data_files;
spool off
