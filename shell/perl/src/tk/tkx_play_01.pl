#!/usr/bin/perl


# $VIMRUNTIME/rgb.txt
use Tkx;

my $mw = Tkx::widget->new(".");

$mw->new_button(
        -text => "Hello, world",
        -command => sub { $mw->g_destroy; },
)->g_pack;

Tkx::MainLoop();
