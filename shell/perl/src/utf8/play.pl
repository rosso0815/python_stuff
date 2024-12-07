use 5.010;
use utf8;   # wichtig;
use strict;
use warnings;
use autodie;

open my $OUT, '>:encoding(UTF-8)', 'test.txt';

print $OUT <<EOF;
Hier ist ein Text mit allen Umlauten: öäüß
und groß: ÖÄÜ
Das Euro-Zeichen: €
EOF

close $OUT;
