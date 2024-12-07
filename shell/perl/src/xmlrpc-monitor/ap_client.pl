#!/usr/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Fri Apr 23 11:09:40 DFT 2004
## Aufruf   : 
## Funktion : 
## Keyword  : 
## Version  : 
##
######## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Fri Apr 23 11:09:40 DFT 2004      1.0             Init
######## ######### ######### ######### ######### ######### ######### #########
# -- SOAP::Lite -- soaplite.com -- Copyright (C) 2001 Paul Kulchenko --

use XMLRPC::Lite;
use Data::Dumper;
goto putFile;

#-------------------------------------------------
$var = XMLRPC::Lite
  -> proxy('http://samui:8080')
  -> call('validator1.getFile',"/etc/passwd" )
  -> result;
  
print "\nvariable =##$var##\n";

#-------------------------------------------------
# file in variable einlesen
putFile:
my $inhalt="";
my $filename='/etc/passwd';

open( INPUT, "$filename");
	$inhalt = join($inhalt,<INPUT>);
close INPUT;

$v->{data} = SOAP::Data->type(base64 => $inhalt);
$v->{owner} = "Pfister Andreas";
#int Dumper( $v);

$var = XMLRPC::Lite
  -> proxy('http://samui:8080')
  -> call('validator1.putFile', $v)
  -> result;

print "\nputFile var=$var\n";
#-------------------------------------------------
