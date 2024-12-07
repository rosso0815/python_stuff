#! /usr/bin/env perl

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : A.Pfister
## Datum    : 20.02.2003
## Aufruf   : command-line
## Funktion : dursuchen div. directories und ausgabe der hader infos
## Keyword  :
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications:
## Date          Version         Description
##
########## ######### ######### ######### ######### ######### ######### #########
use strict;
use warnings;

use Cwd;
use File::Find;
use Image::ExifTool;

#-------------------------------------------------------------------------------
# wir durchen nach pl dateien
sub wanted {
    if (/^.*pl$/i) {
        print "\nPATH= ", $File::Find::name;
        print "\nDIR = ", $File::Find::dir;
        print "\nNAME= ", $_;
        my (
            $dev,  $ino,   $mode,  $nlink, $uid,     $gid, $rdev,
            $size, $atime, $mtime, $ctime, $blksize, $blocks
        ) = stat($_);
        print "\nmtime + ", $mtime;
        my ( $sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst ) =
          localtime($mtime);
        print " => ", $year, ".", $mon, ".", $mday;
        my $ftime = localtime($mtime);
        print " => ", $ftime;

    }
    elsif (/^.*jpg$/i) {
        print "\nPATH= ", $File::Find::name;
        print "\nDIR = ", $File::Find::dir;
        print "\nNAME= ", $_;

        # Get Exif information from image file
        my $exifTool = new Image::ExifTool;
        my $sourceImageFileName = $File::Find::name;
        my $info = $exifTool->ImageInfo($sourceImageFileName);

        # Print all key/value pairs
        foreach (keys %$info) {
	        print "$_ => $$info{$_}\n";
        }
    }
    else {
        print "\nPATH= ", $File::Find::name;
        print "\nDIR = ", $File::Find::dir;
        print "\nNAME= ", $_;
    }
}

#------------------------------------------------------------------------------
# analysieren den header
# lesen der 10.zeilen
sub lese_header {
    my $datei = $_;
    my $i     = 1;
    my $inhalt;

    open( INPUT, "<$datei" );
    while ( $i < 10 ) {
        $inhalt = $inhalt . <INPUT>;

        #print "\nI=$i inhalt=$inhalt";
        $i = $i + 1;
    }
    close INPUT;

    # print "\nDEBUG $datei, $inhalt";
    # und nach etwas suchen
    foreach
      my $suchstring ( 'erzeuger', 'datum', 'aufruf', 'function', 'keyword' )
    {
        $_ = $inhalt;
        if (m/(^.*$suchstring.*):(.*$)/im) {
            print "\n$suchstring = ", $2;
        }
    }
}

#------------------------------------------------------------------------------
# MAIN
#
find( \&wanted, cwd );

#------------------------------------------------------------------------------
print "\n";
