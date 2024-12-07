use DBI;

print DBI->available_drivers;

my $db = DBI->connect('DBI:mysql:test', undef, undef);

#my $query = "SELECT name, vorname FROM name";
#my $ausgabe = $db->prepare($query);
#$ausgabe->execute;
#print DBI::dump_results($ausgabe);
