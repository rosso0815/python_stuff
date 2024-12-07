use DBI;
use Env;

sub Name{
	print " \nFunction sub";
}

printf "Wir öffnen ein XBase Datei";
&Name;
#/***************************************/

@driver_names = DBI->available_drivers;
print "\n\nFolgende Treiber sind vorhanden @driver_names";
my $dbh = DBI->connect("DBI:XBase:/directory/subdir")
	or die $DBI::errstr;

my $sth = $dbh->prepare("select MSG from test where ID != 1")
	or die $dbh->errstr();
$sth->execute() or die $sth->errstr();
my @data;
while (@data = $sth->fetchrow_array())
	{ ## further processing 
	}

$dbh->do('update table set name = ? where id = 45', {}, 'krtek');
