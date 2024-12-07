#!/usr/bin/perl -w

# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual
# Funktion : 
# Version  : 001

use File::Find;

#------------------------------------------------------------------------------
# Main Loop
# 
#find(\&wanted , 'C:\Dokumente und Einstellungen\pfistera\Eigene Dateien\PERL');
find(\&wanted , '.');
print "\nENDE\n";

#------------------------------------------------------------------------------
sub wanted 
{
# $File::Find::dir  = /some/path/
# $_                = foo.ext
# $File::Find::name = /some/path/foo.ext
# print "\nFILE=", $File::Find::name;
if ( /(.pl)$/ )
	{
	# print "\nfound perl file", $_;
	bearbeite_datei( $File::Find::name);
	}
}
#------------------------------------------------------------------------------
sub bearbeite_datei
{
$datei=shift(@_); 
print "\nbearbeite_datei ", $datei;
my (@filetext);
open ( INPUT, "<$datei") or die "\nkann datei nicht oeffnen";
$zeilennummer=0;
while ($zeile=<INPUT>)
	{
	push @filetext, $zeile;
	$zeilennummer++;
	if ($zeilennummer == 10) 
		{
		last;
		}
	}
# print @filetext;

# ? was passiert wenn nichts vorhanden!!
suche_text('erzeuger', \@filetext);
suche_text('datum', \@filetext);
suche_text('aufruf', \@filetext);
suche_text('funktion', \@filetext);
print "\nVERSION ", suche_text('version', \@filetext);

close INPUT;
}

#------------------------------------------------------------------------------
sub suche_text
{
$suchtext=shift(@_);
$filetext=shift(@_);

#print "\nSUCHE=> ", $suchtext;
foreach (@$filetext)
	{
	# print "\nZEILE", $_;
	if (/^#\s*($suchtext)/i)
		{
		# print "\nsuchtext gefunden";
		# ($version = $_) =~ s/^#.*\s:(\W)/$1/i;
		($suchtext, $result) = split /:/, $_;
		#print "\nSUCHTEXT=", $suchtext, " GEFUNDEN=", $result;
		return $result;
		}
	}
}
