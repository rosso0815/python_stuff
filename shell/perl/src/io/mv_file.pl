#!/opt/freeware/bin/perl -w

#
# Erzeuger : A.Pfister
# Datum    : 30.08.2002
# Aufruf   : von SHELL
# Funktion : renamen der dateien
# Keyword  : perl rename 
# Version  : 001
# History  :
#

use Shell qw(mv);

# @files = glob("$dir/*.[ch]");
# print @ARGV; print "ANZAHL ",  $#ARGV;

if ( $#ARGV != 1 )
	{
	print "\nERROR = Es mussen 2 Argumente verwendet werden\n";
	exit;
	}

while ($name = <*.$ARGV[0]>)
	{
	( $newname = $name ) =~ s/$ARGV[0]/$ARGV[1]/;
	print "\nAlter Dateiname = $name, neu = $newname";
	mv $name, $newname ;
	}
print "\n## ENDE $0##\n"
