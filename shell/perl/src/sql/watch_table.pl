#!/opt/perl58/bin/perl


#!/opt/freeware/bin/perl

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : A.Pfister
## Datum    : 12.02.2003
## Aufruf   : Kommandozeile mit Part
## Funktion : Anzeige der Referenzen in DMAGS Tabelle EXT (PSN)
## Keyword  : PSN DMAGS EXT 
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date          Version         Description
## 12.02.2003    001             Init
########## ######### ######### ######### ######### ######### ######### #########

use DBI;
use Env;
use Data::Dumper;

# ueberpruefen der eingabe-parameter
my $query='';
if (! $ARGV[0])
	{
	print "\nEingabe-ERROR !! Bitte Partnumber angeben";
	exit 1;
	}
my $input=$ARGV[0];

# connecten mit der datenbank
my $db= DBI->connect( "DBI:Oracle:DMA12_CATIASV01", "DMAGS1", "DMAGS1");

if (not $db)
	{
    print "\n Server konnte nicht ermittelt werden";                                            
    exit(1);
	}   
# suche in db nach coid des eingabe-parts 
$query="select \"\$COID\" from part_list where s_part_number like '$input'";
my $sql_array= $db->selectall_arrayref( $query);
my $anzahl = @$sql_array;
if ($anzahl != 1)
	{
	print "\nERROR !! Sie referenzieren mehr als ein Part";
	exit 1;
	}
	
#print Dumper( $sql_array);
print "\nCOID ?", @$sql_array->[0]->[0], "\n";

$input=@$sql_array->[0]->[0];
# suche nach allen tabellennamen in tabelle ext
$query = "select COLUMN_NAME from all_tab_columns where TABLE_NAME = '\$EXT\'"; 

my $sql_array= $db->selectall_arrayref( $query);

# print Dumper( $sql_array);
foreach $wert( @$sql_array)
	{
	# @$wert->[0] => columnames der tabelle ext
	#$query="select \"\$COMPID\" from \"\$EXT\" where \"@$wert->[0]\" like '$input'";
	$query="select \"\$COID\", \"\$COMPID\", \"\$\COID_REF\", \"\$COMPID_REF\",
		\"\$COMPID_FATHER\", \"\$COMPNAME_FATHER\", \"\$TYPE\"
		from \"\$EXT\" where \"@$wert->[0]\" like '$input'";

	my $sql_array2= $db->selectall_arrayref( $query);
	
	#print Dumper( $sql_array2);
	foreach $wert2(@$sql_array2)
		{
		print "\nnew datarow";
		print "\nCOID            = ", @$wert2->[0], " COLUMNAME =", @$wert->[0];
		print "\nCOMPID          = ", @$wert2->[1], " COLUMNAME =", @$wert->[0];
		print "\nCOID_REF        = ", @$wert2->[2], " COLUMNAME =", @$wert->[0];
		print "\nCOMPID_REF      = ", @$wert2->[3], " COLUMNAME =", @$wert->[0];
		print "\nCOMPID_FATHER   = ", @$wert2->[4], " COLUMNAME =", @$wert->[0];
		print "\nCOMPNAME_FATHER = ", @$wert2->[5], " COLUMNAME =", @$wert->[0];
		print "\nTYPE            = ", @$wert2->[6], " COLUMNAME =", @$wert->[0];
		print "\nfinish datarow\n";
		}
	}
# und tschuess mit SQL
$db->disconnect;
