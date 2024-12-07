#! /usr/bin/env perl

#use strict;
use warnings;


use SOAP::Lite +trace ;
#=> qw(transport trace);


my $nmsp = 'http://codenotfound.com/types/helloworld' ;

my $method = SOAP::Data
    ->name("x:") 
    ->attr({'xmlns:ns1' => $nmsp.'/person'}); 

my @params = (SOAP::Data->name('firstName'=>'Pfister'),SOAP::Data->name('lastName'=>'Pfister')); 

my $srvc = SOAP::Lite
    -> ns ( $nmsp )
    -> uri('http://codenotfound.com/services/helloworld')
    -> proxy('http://localhost:9090/codenotfound/ws/helloworld')
    ->on_action (sub { return 'http://codenotfound.com/services/helloworld/sayHello' } );


#-> sayHello("Andreas","Pfister")
print $srvc->call( $method=>@params )->result;



#<?xml version="1.0" encoding="UTF-8"?><soap:Envelope soap:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" 
#    xmlns:namesp1="http://codenotfound.com/types/helloworld" 
#    xmlns:namesp2="http://codenotfound.com/services/helloworld" 
#    xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" 
#    xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" 
#    xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
#    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
#<soap:Body>
#    <ns1:sayHello xmlns:ns1="http://codenotfound.com/types/helloworld/person">
#        <firstName xsi:type="xsd:string">Pfister</firstName>
#        <lastName xsi:type="xsd:string">Pfister</lastName>
#    </ns1:sayHello>
#</soap:Body>
#</soap:Envelope>


#my $uri = 'http://service.acme.com';
#my $proxy = 'http://localhost:8080/services/FTPEventService';
#my $event = '127.0.0.1|proftpd|[26/Mar/2008:10:56:07 -0400]|STOR FOO.pdf|226|/ftp/FOO.pdf';
#my $methodName = 'logFTPEvent';
#my $paramName = 'ftpEventString';

#$nmsp = $uri;
#$srvc = SOAP::Lite-> uri($nmsp) 
#->proxy($proxy) 
#->on_action (sub { return '' } ); 
#my $method = SOAP::Data
#->name("ns1:" . $methodName) 
#->attr({'xmlns:ns1' => $nmsp}); 
#my @params = (SOAP::Data->name($paramName=>$event)); 
#print $srvc->call($method=>@params)->result; 

#print SOAP::Lite
#    ->ns('http://xyz.com/', 'xyz')
#    -> service('http://localhost:9090/codenotfound/ws/helloworld?wsdl')
#    -> echo("1");
#

#print "start\n";

#my $c = HelloWorldImplService->new();

#print $c->echo('1');



#my $soap_wdsl = 'http://localhost:9090/codenotfound/ws/helloworld?wsdl';
#my $client = SOAP::Lite->new;
#$client->proxy( $soap_wdsl );
#$client->service( $soap_wdsl );
##$client->ns('http://codenotfound.com/services/helloworld','codenotfound.com');
#my $response = $client->echo( "Hallo Andreas" );

#print " response = $response done\n";
#
