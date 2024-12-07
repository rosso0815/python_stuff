#!/opt/service/bin/perl -w


my $input = 'eingabe = \'halllo\' ';

print $input;

$name = <STDIN>;

chop($name);

printf("Hallo, %s !\n",$name);

exit;

open KEYBOARD, "STDIN";
while ( $zeile = <KEYBOARD>)
	{
	print "\nIhre Eingabe", $zeile, "\n";
	}


