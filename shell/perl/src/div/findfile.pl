use File::Find;

find(\&wanted, 'd://data//perl//test');
sub wanted { 
print "\n Datei=", $_ ;}