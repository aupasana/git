#!/usr/bin/perl
use strict;
use warnings;
use utf8;  # Enable UTF-8 support

# Open the input and output files in UTF-8 mode
open my $in,  '<:encoding(UTF-8)',  'tmp/rudra-krama.md'  or die "Cannot open input file: $!";
open my $out, '>:encoding(UTF-8)',  'test_modified.md' or die "Cannot open output file: $!";

# Process each line in the input file
while (<$in>) {
    # Perform the substitution: replace \x{1CDA} with two \x{0951}
    s/\x{1CDA}/\x{0951}\x{0951}/g;
    s/\x{F176}/\x{0951}\x{0951}/g;
    # Write the modified line to the output file
    print $out $_;
}

# Close the file handles
close $in;
close $out;
