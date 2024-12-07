#!/usr/bin/perl
#          
# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual
# Funktion : Anzeige von Oracle-Test Scott Tiger aus table emp
# Version  : 001


use Search::Circa::Indexer;

my $indexor = new Search::Circa::Indexer;
	die "Erreur à la connection MySQL:$DBI::errstr\n" if (!$indexor->connect);
 
$indexor->create_table_circa;
$indexor->drop_table_circa;
$indexor->addSite({url   => "http://samui/",
                    email => 'alian@alianwebserver.com',
                    title => "Alian Web Server"});
 
my ($nbIndexe,$nbAjoute,$nbWords,$nbWordsGood) = $indexor->parse_new_url(1);

print   "$nbIndexe pages indexées, $nbAjoute pages ajoutées $nbWordsGood mots indexé s$nbWords mots lus\n";
 
$indexor->update(30,1);

