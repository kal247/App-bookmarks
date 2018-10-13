#!/usr/bin/perl
#
# safari-bookmarks.pl
#
# Export Safari bookmarks (and reading list) as plain text.
# Default format : title url [description]
# Reads from ~/Library/Safari/Bookmarks.plist or first arg (if supplied), writes to stdout.
# For mac only.
#
# 2018.09.21 v0.11 jul : arg and -a
# 2018.09.01 v0.10 jul : created

use strict;
use warnings;
use utf8;
use Getopt::Std;
use File::Basename;

our $VERSION 	= '0.11';
my $program		= basename($0);
my $usage   	= <<EOF;

Usage: $program [-hVd] [file]

    -h, --help      help
    -V, --version   version
    -d              debug
    -a              all : title url description
EOF

# options

my %options = ();
getopts("hVda", \%options) or die $usage;

my $help        = $options{h} || 0;
my $version     = $options{V} || 0;
my $debug       = $options{d} || 0;
my $all         = $options{a} || 0;

die $usage if $help;
die $VERSION . "\n" if $version;

# variables
my $plist = $ARGV[0] // "~/Library/Safari/Bookmarks.plist";


########
# MAIN #
########

# read plist as text
my $text = `plutil -p $plist`;
die "plutil failed" if not $text;

# split on ddd => {}
my @pieces = split /\d+ => \{(.*?)\}\s+\d+ => \{/s, $text;

# find bookmarks among pieces
my @bookmarks = grep /URLString/, @pieces;

# print
foreach my $bm (@bookmarks)
{	
	print "$1 " if $bm =~ /"title" => "(.+)"/;
	print "$1 " if $bm =~ /"URLString" => "(.+)"/;
	print "$1"  if $bm =~ /"PreviewText" => "(.+)"/ and $all;
	print "\n";
}

my $n = @bookmarks;
warn "$n bookmarks found\n" if $debug;

exit 1;
