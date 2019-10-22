#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'App::bookmarks' ) || print "Bail out!\n";
}

diag( "Testing App::bookmarks $App::bookmarks::VERSION, Perl $], $^X" );
