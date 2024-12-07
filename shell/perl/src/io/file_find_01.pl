#!/usr/bin/env perl

#   author   :
#   created  : 28.12.2015
#c  comment  : search tags etc in files
#
#   version  :

use warnings;
use strict;

use Cwd;
use File::Find;

# global structure for parsing
my $c;

find( \&Wanted, cwd );

exit 0;

#------------------------------------------------------------------------------
sub ConfigPerl {

}

sub ConfigGroovy {

}
#-------------------------------------------------------------------------------
sub Wanted {
    # print "\nPATH= ", $File::Find::name;
    # print "\nDIR = ", $File::Find::dir;

    if ( /^.*pl$/i ) {
        ConfigPerl();
        AnalyzeFile( $File::Find::name );
    } elsif ( /.*\.groovy/) {
        ConfigGroovy();
        AnalyzeFile( $File::Find::name );
    }
}

#------------------------------------------------------------------------------
sub AnalyzeFile {
    my $file = $_;
    open( INPUT, "<$file" )
        or die "cannot read file";
    while ( <INPUT> ) {
        my $line=$_;
        chomp $line;
        if ( $line =~ /^\s*#c\s+/ ) {
            print "$file $line\n";
        }
    }
    close INPUT;
}

#------------------------------------------------------------------------------
