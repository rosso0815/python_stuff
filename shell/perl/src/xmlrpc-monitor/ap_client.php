<?php

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Thu May 27 08:12:45 DFT 2004
## Aufruf   : 
## Funktion : 
## Keyword  : 
## Version  : 
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Thu May 27 08:12:45 DFT 2004      1.0             Init
########## ######### ######### ######### ######### ######### ######### #########
## $Log: ap_client.php,v $
## Revision 1.1.1.1  2004/05/29 07:30:44  pfistera
## Imported using TkCVS
##
########## ######### ######### ######### ######### ######### ######### #########

include("xmlrpc.inc");

echo "start xmlrpc";

// validator1.echoStructTest
//$f=new xmlrpcmsg( 'validator1.echoStructTest', array(new xmlrpcval( 14, "int")));

$f=new xmlrpcmsg( 'validator1.getFile', 
	array(new xmlrpcval('/etc/passwd', 'string')));
	
// Server angeben
$c=new xmlrpc_client("dummy", "samui", 8080);

$c->setDebug(0);
$r=$c->send($f);

$v=$r->value();

if ($r->faultCode())
	{
	echo "\nERROR fault_code";
	exit(1);
	}

//echo "\narray_len  = " . $v->arraysize();

//echo "\nvar_dump v = " . var_dump($v);

echo "\nv->kindOf  = " . $v->kindOf();
//echo "\nscalarvalue = #". $v->scalarval()."#";
$file_inhalt=$v->scalarval();
echo "\nFILE_INHALT=##".$file_inhalt."##";

/*
while ( list($key,$value) = $v->structeach())
	{
	echo "\n****************";
	echo "\nkey = " . $key;
	$l=$v->structmem( $key);
	
	echo "\nscalarvalue = ".$l->scalarval();
	echo "\n****************";
	//echo "\nvar_dump l = ";
	//	echo var_dump($l);
	}

*/

//echo "\nv-structmem = " . var_dump($v->structmem("host"));
//echo "\nvar_dump x0 = " . var_dump($x0);
echo "\nENDE\n";
?>
