#!/usr/bin/perl -w

use DBIx::XHTML_Table;
# database credentials - fill in the blanks
my ($data_source,$usr,$pass) = ("DBI:mysql:Dokumenta","root","password");

my $table = DBIx::XHTML_Table->new($data_source,$usr,$pass);

$table->exec_query(" select name,vorname,strasse from user");

print $table->output();

