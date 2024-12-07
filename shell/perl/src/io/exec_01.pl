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

# $runstring='print "Andreas\n";';
# $runstring='system rsh caxws06 "/usr/opt/freeware/bin/sudo /service/admin/usertool/bin/show_conf"';
# $runstring='system who';

#@args=("rsh", "caxws06", "who");
# @args=("rsh", "caxws06 /usr/opt/freeware/bin/sudo /service/admin/usertool/bin/show_conf");
@args=("rsh","caxws06","/usr/opt/freeware/bin/sudo", "/test_service/usertool/bin/show_config.sh");

#print "\nARGS =", @args;
system @args," > /home/login00/kraanp9/test.txt";
# eval system @args;
# system "rsh","caxws06","/usr/opt/freeware/bin/sudo /service/admin/usertool/bin/show_config";
print "\nRE=", $?, "\n";
