package Andreas;

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw( andreas $conf_host);

BEGIN {
	$conf_host="TEST01";
	print "BEGIN modul Andreas.pm\n";
	
}

sub andreas{
	print "\tmodule Andreas:test test\n";
	print "\tmodule Andreas:test test\n";
}

1;
#----------------------------------------------------------
