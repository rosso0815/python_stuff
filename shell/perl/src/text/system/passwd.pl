#!/usr/bin/perl -w

while (($name, $passwort, $uid) = getpwent){
	print "$name, $passwort, $uid";}

print "Ende"
