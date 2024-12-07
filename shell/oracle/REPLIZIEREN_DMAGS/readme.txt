########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : A.Pfister
## Datum    : 02.04.03
## Aufruf   : 
## Funktion : oracle-daten zb dma12 von catiasv01 nach caxws14 replizieren
## Keyword  : oracle replizieren 
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date          Version         Description
## 21.01.2003    1.0             Init
########## ######### ######### ######### ######### ######### ######### #########

catiasv01
	daten exportieren
	instanzname dmags2.2 = SPENEU00 und DMA22NEU

	Achtung PATH und ORACLE_HOME richtig setzen ( DMA1.2 => 8.1.6, DMA2.2 => 8.1.7 )
	Datenbank und CAD-Dateien sollten synchron exportiert werden ( Versionen usw)
	exp system/manager full=y file=dma12.dmp
	rsync -avz --progress --delete /DMAVPM/NEU/ caxws14:/DMAVPM/NEU

caxws14
	gen_tablespace.sql erzeugt liste mit tablespaces
	remove MAXSIZE
	
	/oracle/product/8.1.6/assistants/dbca
	hier sind die scripts zum db erzeugen

	/oracle/product/8.1.6/dbs/init...ora 
	Initdatei fuer oracle
	remote_login_passwordfile = none ?

	/oracle/admin/....

- loesche alte db
	runterfahren
	zb rm -rf /oracle/oradata/DMA12/
	rm '/oracle/product/8.1.6/dbs/orapwDMA12' ( passwort file)
	orapwd file=<path>\PWD<sid>.ora password=oracle

/oracle/product/8.1.6/dbs/
remote_login_passwordfile = none
tablespaces
	mkdir /oracle/oradata/DMA12/VPM
	mkdir /oracle/oradata/DMA12/TSMW

imp system/manager full=y file=catiasv01_dma12.dmp	


#
ALTER DATABASE DATAFILE '/oracle/ INDEX/DMA12/DMAGS1I' AUTOEXTEND ON MAXSIZE UNLIMITED;


