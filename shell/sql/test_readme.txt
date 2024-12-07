########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Tue Aug  5 16:52:08 DFT 2003
## Aufruf   : 
## Funktion : 
## Keyword  : 
## Version  : 
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Tue Aug  5 16:52:08 DFT 2003      1.0             Init
########## ######### ######### ######### ######### ######### ######### #########

sqlplus scott/tiger

drop table buchungen;

create table buchungen
	(
	id number(3,0),
	text varchar2(20) not null
	);

insert into buchungen values (1, 'pfister');
insert into buchungen values (2, 'pfister');
insert into buchungen values (3, 'pfister');
insert into buchungen values (1, 'pfister');
insert into buchungen values (1, 'Mueller');
insert into buchungen values (2, 'Mueller');
insert into buchungen values (5, 'GRIMM');
commit;

select text, count(*) from buchungen group by text;

select count(text), count(distinct text) from buchungen;

select text from buchungen 
	where id in 
		(
		select max(id) from buchungen
		);
select count(*), id from buchungen group by id having avg(id) > 1;
