#!/usr/bin/perl -w
#          
# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual
# Funktion : Anzeige von Oracle-Test Scott Tiger aus table emp
# Version  : 001

$datei="test.txt";
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
print @filetext;
close INPUT;

sub suche_text
{
$suchtext=shift(@_);
print "\nSUCHE=> ", $suchtext;
foreach (@filetext)
	{
	# print "\nZEILE", $_;
	if (/^#\s*($suchtext)/i)
		{
		print "\nsuchtext gefunden";
		# ($version = $_) =~ s/^#.*\s:(\W)/$1/i;
		($suchtext, $result) = split /:/, $_;
		print "\nSUCHTEXT=", $suchtext, " GEFUNDEN=", $result;
		}
	}
}

suche_text('version');
suche_text('datum');
$last=<STDIN>;
