#!/opt/freeware/bin/perl -w

# Aufruf   :
# Funktion : 
# Keyword  :
# Version  :
# History  :

my $configfile="usertool.conf";

open(INPUT,"<$configfile") or die "Kann Datei $configfile nicht oeffnen";

while ( $line=<INPUT>)
	{
	print $line;
	if ( $line =~ /^\w/)
		{
		# print "ERKANNT", $line;
		( $text, $script, $typ, $var0, $var1, $var2, $var3, $var4) = split(/:/, $line);
		print "** text =", $text, " typ =", $typ, "\n";
		}
	}
close(INPUT);


