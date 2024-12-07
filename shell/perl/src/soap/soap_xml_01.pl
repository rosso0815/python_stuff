

use strict;
use warnings;

# preparation
 use XML::Compile::WSDL11;      # use WSDL version 1.1
 use XML::Compile::SOAP11;      # use SOAP version 1.1
 use XML::Compile::Transport::SOAPHTTP;

 # you want some trace?
# use Log::Report mode => 'DEBUG';   # or 'VERBOSE'

 # collect one or more wsdls and xsds in one object
 my $wsdl = XML::Compile::WSDL11->new('helloworld.wsdl'); 

 # during initiation, for each used call
 my $call = $wsdl->compileClient();
