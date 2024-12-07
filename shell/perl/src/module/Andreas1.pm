package Andreas;

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw( andreas);


BEGIN {
	print "\nBEGIN modul Andreas.pm";
}

sub andreas{
	print "\nmodule Andreas:test test\n";
}

1;