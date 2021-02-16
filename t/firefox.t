#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

eval { require DBI };
if ($@)
{
    plan skip_all => "DBI required for this test";
}
else
{
    plan tests => 1;
    
    is(scalar(`"$^X" -Ilib script/bookmarks t/data/places.sqlite`), "firefox example https://metacpan.org/ #tag1 #tag2\n", "bookmarks - firefox");
}
