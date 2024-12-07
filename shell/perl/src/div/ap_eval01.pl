#!/usr/bin/perl -w

$a="Hallo Andreas\n";

$b='$a="PETER"; printf "A eval= $a\n"';
# $b="$a=\"PETER\n\"; printf \"A eval= $a\n\"";
# $b='printf "(eval) = $a"';

printf "A = $a";

eval $b; 

printf "A = $a";

printf"\nENDE\n"
