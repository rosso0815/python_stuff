#!/usr/bin/perl -w 

# Erzeuger : A.Pfister
# Datum    : 16.12.2002
# Aufruf   : von Shell oder via RMB
# Funktion : Modify von Userenv.dcls mit Werten 1-5 
# Keyword  : USERENV LHB
# Version  : 001
# History  :

# Globale Variable
@LoDCLS=(
	["1","MAX_ACTIVE_INDEX",
	"CATIA.MODEL_KBYTES.MAX_ACTIVE_INDEX      =     5000 ;"],

	["1","MAX_ACTIVE_DATA",
	"CATIA.MODEL_KBYTES.MAX_ACTIVE_DATA       =     20000 ;"],

	["1","TOTAL_OVERLAY_INDEX",
	"CATIA.MODEL_KBYTES.TOTAL_OVERLAY_INDEX   =     5000 ;"],

	["1","GLOBAL_EXTENDED_DATA",
	"CATIA.MODEL_KBYTES.GLOBAL_EXTENDED_DATA  =     2000 ;"],

	["2","MAX_ACTIVE_INDEX",
	"CATIA.MODEL_KBYTES.MAX_ACTIVE_INDEX      =     7500 ;"],

	["2","MAX_ACTIVE_DATA",
	"CATIA.MODEL_KBYTES.MAX_ACTIVE_DATA       =     25000 ;"],

	["2","TOTAL_OVERLAY_INDEX",
	"CATIA.MODEL_KBYTES.TOTAL_OVERLAY_INDEX   =     10000 ;"],

	["2","GLOBAL_EXTENDED_DATA",
	"CATIA.MODEL_KBYTES.GLOBAL_EXTENDED_DATA  =     6000 ;"],

    ["3","MAX_ACTIVE_INDEX",
    "CATIA.MODEL_KBYTES.MAX_ACTIVE_INDEX      =     25000 ;"],

    ["3","MAX_ACTIVE_DATA",
    "CATIA.MODEL_KBYTES.MAX_ACTIVE_DATA       =     100000 ;"],

    ["3","TOTAL_OVERLAY_INDEX",
    "CATIA.MODEL_KBYTES.TOTAL_OVERLAY_INDEX   =     15000 ;"],
						    
    ["3","GLOBAL_EXTENDED_DATA",
    "CATIA.MODEL_KBYTES.GLOBAL_EXTENDED_DATA  =     20000 ;"],

    ["4","MAX_ACTIVE_INDEX",
    "CATIA.MODEL_KBYTES.MAX_ACTIVE_INDEX      =     50000 ;"],

    ["4","MAX_ACTIVE_DATA",
    "CATIA.MODEL_KBYTES.MAX_ACTIVE_DATA       =     250000 ;"],

    ["4","TOTAL_OVERLAY_INDEX",
    "CATIA.MODEL_KBYTES.TOTAL_OVERLAY_INDEX   =     50000 ;"],

    ["4","GLOBAL_EXTENDED_DATA",
    "CATIA.MODEL_KBYTES.GLOBAL_EXTENDED_DATA  =     40000 ;"],

    ["5","MAX_ACTIVE_INDEX",
    "CATIA.MODEL_KBYTES.MAX_ACTIVE_INDEX      =     35000 ;"],

    ["5","MAX_ACTIVE_DATA",
    "CATIA.MODEL_KBYTES.MAX_ACTIVE_DATA       =     165000 ;"],

    ["5","TOTAL_OVERLAY_INDEX",
    "CATIA.MODEL_KBYTES.TOTAL_OVERLAY_INDEX   =     90000 ;"],

    ["5","GLOBAL_EXTENDED_DATA",
    "CATIA.MODEL_KBYTES.GLOBAL_EXTENDED_DATA  =     60000 ;"],
	);

#------------------------------------------------------------------------------
sub set_dcls
{
my $wert = shift(@_);
for $array_ref ( @LoDCLS )
	{
	if ($wert eq @$array_ref[0])
		{
		# ersetzen von Wert in @input
		$input =~ s/^(.*@$array_ref[1].*$)/@$array_ref[2]/m;
		}
	}
}

#-----------------------------------------------------------------------------
# Einlesen von Groessenwert
if (($ARGV[0] > 0) && ($ARGV[0] < 6))
	{
	# Einlesen von Userenv.dcls in EINEN String
	open(INPUT, "$ENV{HOME}/CATIA/USRENV.dcls") or 
		die "Kann Datei Test.txt nicht oeffnen";
	
	$input = do { local $/; <INPUT>; };
	
	close(INPUT);  

	set_dcls $ARGV[0];
	# print $input;
	# Schreiben von neuem Userenv.dcls
	open(OUTPUT,">$ENV{HOME}/CATIA/USRENV.dcls") or   
	        die "Kann Datei Test.txt nicht oeffnen";

	print OUTPUT $input;
	
	close(OUTPUT);
	}
