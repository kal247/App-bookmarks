#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

plan tests => 1;

# warning : extra spaces in here-doc (beginning and end of lines)

is(scalar(`"$^X" -Ilib script/bookmarks t/data/test.gmi`), <<'EOF'
 gemini://example.org/ 
An example link gemini://example.org/ 
Another example link at the same host gemini://example.org/foo 
A gopher link gopher://example.org:70/1 
EOF
, "bookmarks - gemini");
