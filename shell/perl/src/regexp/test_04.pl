# wir testen regulare ausdr�cke

$_="Hallo:Andreeeeeas:Pfister";
print $_,"\n";
s/e{1,}/x/g;
print $_;

@felder = split /:/, $_;
$felder = @felder;

print "\n\nWir splitten Anzahl = ", $felder;
foreach $var ( @felder){
	print "\n", $var;}
