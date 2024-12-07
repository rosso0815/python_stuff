#!/usr/local/bin/perl

print "Content-type: text/html", "\n\n";
print "<HTML>","\n";
print "<BODY>","\n";

print "Antwort auf Formular 1","<BR>","\n";

print "Server Name = $ENV{'SERVER_NAME'}", "<BR>","\n";
print "Software    = $ENV{'SERVER_SOFTWARE'}", "<BR>","\n";
print "Protokoll   = $ENV{'SERVER_PROTOCOL'}", "<BR>","\n";
print "Port        = $ENV{'SERVER_PORT'}", "<BR>","\n";
print "Methode     = $ENV{'REQUEST_METHOD'}", "<BR>","\n";
print "Path Info   = $ENV{'PATH_INFO'}", "<BR>","\n";
print "Query String= $ENV{'QUERY_STRING'}", "<BR>","\n";
print "R User      = $ENV{'REMOTE_USER'}", "<BR>","\n";
print "E-Mail      = $ENV{'HTTP_FORM'}", "<BR>","\n";

print "</BODY>","\n";
print "</HTML>","\n";
exit(0);