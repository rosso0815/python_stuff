#!/usr/bin/perl -w

# Erzeuger : pfistera
# Datum    : Son Mai 18 18:24:55 CEST 2003
# Aufruf   : 
# Funktion : 
# Version  : 001
# Keyword  : perl exception


#----------------------------------------------------------------------------------------------------

sub make_error
{
my $i1=shift;
print "\nmake error $i1";
if ( $i1 != 0) {
	print "\n i = $i1";
	die "\n#exit make_error";
	}
}

#----------------------------------------------------------------------------------------------------

print "\nSTART von exception handling inside perl";

eval	{
	make_error 1;
	make_error 1; };
if ($@)	{
	print "\nError erreicht";
	}
	
print "\nENDE\n";
#---------------------------------------------------------------------------------------------------
