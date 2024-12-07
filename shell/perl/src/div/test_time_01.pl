#!/usr/bin/perl -w

# Programmname : A.Pfister
# Ersteller    :
# Datum        :
# Revision     :
# Keywords     :
# Funktion     :
print "\n*** START $0 ***\n";

$heute = (So,Mo,Di,Mi,Do,Fr,Sa) [(localtime)[6]];
print "HEUTE = $heute\n";
print "Std local  = ", (localtime)[2],"\n";
print "Std gmt    = ", (gmtime)[2],"\n";

print "localtime=",localtime,"\n";


print "\n*** ENDE  $0 ***\n";
