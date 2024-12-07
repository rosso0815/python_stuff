#!/usr/bin/perl -w
          
# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual
# Funktion : Anzeige von Oracle-Test Scott Tiger aus table emp
# Version  : 001

use File::Searcher;
my $search = File::Searcher->new('*.pl');

$search->add_expression(name=>'street',
            search=>'1234 Easy St.',
            replace=>'456 Hard Way',
            options=>'i');
# $search->add_expression(name=>'department', search=>'(Dept\.|Department)(\s+)(\d+)', replace=>'$1$2$3', options=>'im');
# $search->add_expression(name=>'place', search=>'Portland, OR(.*?)97212', replace=>'Vicksburg, MI${1}49097', options=>'is');

$search->start;
# $search->interactive; SEE File::Searcher::Interactive
@files_matched = $search->files_matched;
print "Files Matched\n";
print "\t" . join("\n\t", @files_matched) . "\n";
print "Total Files:\t" . $search->file_cnt . "\n";
print "Directories:\t" . $search->dir_cnt . "\n";
# my @files_replaced = $search->expression('street')->files_replaced;
# my @files_replaced = $search->expression($expression)->files_replaced;
# my %matches = $search->expression('street')->matches;
# my %replacements = $search->expression('street')->replacements;
