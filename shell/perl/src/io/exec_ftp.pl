#!/opt/freeware/bin/perl -w

#
# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : von Web-CGI
# Funktion : Anzeige der aktuellen FlexLM-Lizenzen auf buserv01
# Keyword  :
# Version  :
# History  :
#    

@args=("rsh","caxws06","/usr/opt/freeware/bin/sudo", "/test_service/usertool/bin/show_config.sh");
open APIO, "@args |";
while ($line=<APIO>)                                                        
        {
	print $line;
        # push @output,$line;
        }                                                                       
close(APIO);     
