# Verbindung zum MYSQL-Server Tabelle adresse located in test aufbauen
# und HTML Output für alle Elemente erzeugen

use DBI;

my $mydb = DBI->connect("DBI:XBase:d:/data/perl/xbase/")
                                or die $DBI::errstr;

if (not $mydb){
	print "\n Server konnte nicht ermittelt werden";
	exit(1);}

my $query = "SELECT name, vorname, strasse, wohnort FROM adressen";
my $ausgabe = $mydb->prepare($query);
$ausgabe->execute;

#print DBI::dump_results($ausgabe);

my ($name, $vorname, $strasse, $wohnort);
$ausgabe->bind_col( 1, \$name, undef);
$ausgabe->bind_col( 2, \$vorname, undef);
$ausgabe->bind_col( 3, \$strasse, undef);
$ausgabe->bind_col( 4, \$wohnort, undef);

print "Liste aller Eintrage in DB adressen","\n";

while ($ausgabe->fetch){
	print "$name, $vorname, $strasse, $wohnort","\n";
	}

print "Ende der Liste","\n";

$mydb->disconnect;