package Andreas;

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw( andreas $conf_host);


BEGIN {
	$conf_host="TEST01";
	print "\nBEGIN modul Andreas.pm";
	
}

sub andreas{
	print "\nmodule Andreas:test test\n";
}

1;
