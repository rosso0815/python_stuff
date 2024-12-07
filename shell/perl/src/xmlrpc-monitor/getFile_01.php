<?php
#---------------------------------------------------------------------------
# Erzeuger : kraanp9
# Datum    : Thu Jun 24 08:30:52 DFT 2004
# Aufruf   : 
# Funktion : 
# Keyword  : 
#---------------------------------------------------------------------------
# $Log$
#---------------------------------------------------------------------------

include("xmlrpc.inc");


echo "start xmlrpc";

$f=new xmlrpcmsg( 'validator1.getFile', 
	array(new xmlrpcval('/etc/passwd', 'string')));
	
//!! Server angeben
$c=new xmlrpc_client("dummy", "samui", 8080);

$c->setDebug(0);
$r=$c->send($f);

$v=$r->value();

if ($r->faultCode())
	{
	echo "\nERROR fault_code";
	exit(1);
	}

echo "\nv->kindOf  = " . $v->kindOf();

// v->{data} und v->{host} ausgeben ( hash)
$l=$v->structmem("data");
echo "\ndata = ".$l->scalarval();

$l=$v->structmem("host");
echo "\nhost = ".$l->scalarval();

echo "\nENDE\n";
?>
