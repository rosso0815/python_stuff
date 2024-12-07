#! /usr/bin/env perl

use strict;
use warnings;
use 5.010;
use Data::Dumper;
use File::Find;

use Log::Log4perl qw(:easy);

Log::Log4perl->easy_init($INFO);

use Image::ExifTool;

my $COUNT = 0;
my $DEBUG = 0;

my $logger = Log::Log4perl->get_logger('house.bedrm.desk.topdrwr');

$logger->info("start");


# check and set arguments
foreach my $arg (@ARGV) {
    if ( $arg =~ /-x/ ) {
        $DEBUG = 1;
    }
}

say "start" if $DEBUG;

# lets work through the filetree
find( \&wanted, "." );

say "done , $COUNT files changed\n" if $DEBUG;

$logger->info("end");
exit 0;

#------------------------------------------------------------------------------
# sub wanted
# $1 = ?
# iterate and move jpg files
sub wanted {
    my $dir  = $File::Find::dir;
    my $file = $_;
    say "\n@@@ wanted dir:$File::Find::dir file:$file" if $DEBUG;

    if ( $file =~ /.*\.jpg/i ) {
        say "found jpg" if $DEBUG;

        my $exifTool = new Image::ExifTool;
        my $info     = $exifTool->ImageInfo($file);
        my $newName  = "";

        # Print all key/value pairs
        if ($DEBUG) {
            foreach ( keys %$info ) {
                print "$_ => $$info{$_}\n";
            }
        }

        # 2003:04:20 11:44:56+02:00

        if ( defined( $info->{'CreateDate'} ) ) {
            my ( $year, $month, $date, $hour, $min, $sec ) =
              ( $info->{'CreateDate'} =~
                  /(\d+):(\d+):(\d+) (\d+):(\d+):(\d+).*/i );
            $newName =
              $newName . $year . $month . $date . "_" . $hour . $min . $sec;
            say "newName=$newName" if $DEBUG;
        }

        elsif ( defined( $info->{'FileModifyDate'} ) ) {
            my ( $year, $month, $date, $hour, $min, $sec ) =
              ( $info->{'FileModifyDate'} =~
                  /(\d+):(\d+):(\d+) (\d+):(\d+):(\d+).*/i );
            $newName =
              $newName . $year . $month . $date . "_" . $hour . $min . $sec;
            say "newName=$newName" if $DEBUG;
        }

        else {
            say "no createDate defined for $file" if $DEBUG;
            say "ERROR", Dumper($info) if $DEBUG;
            exit 1;
        }

        if ( defined( $info->{'Model'} ) ) {

            # TODO check if model contains /
            if ( $info->{'Model'} =~ /^(.*?)\// ) {
                printf "[WARNING] model contains $1 / , will fix it\n";
                $newName = $newName . "_" . $1;
            }
            else {
                $newName = $newName . "_" . $info->{'Model'};
            }

            say "newName=$newName" if $DEBUG;
        }

        $COUNT++;

        say "move $file to $newName.jpg" if $DEBUG;

        my $number = 1;

        sub saveFile {
            my ( $oldName, $newName, $number ) = @_;
            say "rename file ${oldName} to ${newName}_${number}.jpg";
            if ( !-e "$newName.jpg" ) {
                if ( !rename "$oldName", "$newName.jpg" ) {
                    printf "[ ERROR ] cannot rename $oldName\n";
                    exit 1;
                }
            }
            elsif ( !-e $newName . "_" . $number . ".jpg" ) {
                if ( !rename $oldName, $newName . "_" . $number . ".jpg" ) {
                    printf "[ ERROR ] cannot rename $oldName\n";
                    exit 1;
                }
            }
            else {
                $number++;
                saveFile( $oldName, $newName, $number );
            }
            return;
        }

        # lets count number if file exists ...
        saveFile( $file, $newName, $number );

    }
}

# -----------------------------------------------------------------------------
# EOF
# -----------------------------------------------------------------------------
