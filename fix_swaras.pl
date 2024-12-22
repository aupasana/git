#!/usr/bin/perl
use strict;
use warnings;
use utf8;  # Enable UTF-8 support

# Check if a filename is provided as a command-line argument
if (@ARGV != 1) {
    die "Usage: $0 <filename>\n";
}

# Get the filename from the command line argument
my $filename = $ARGV[0];

# Read the entire content of the file into memory
open my $in, '<:encoding(UTF-8)', $filename or die "Cannot open input file '$filename': $!";
my @lines = <$in>;
close $in;

##sub swap_code_points {
#    my($text, $code_point1, $code_point2) = @_;
#
#    $text =~ s/\x{$code_point1}\x{$code_point2}/\x{$code_point2}\x{$code_point1}/g;
#    return $text;
#}

# Perform the substitution on each line
foreach my $line (@lines) {

    # ---    
    # --- sanskritdocument.org formatting
    # ---    

    $line =~ s/ ।/।/g;
    $line =~ s/ ॥/॥/g;
    $line =~ s/। /।/g;
    $line =~ s/॥ /॥/g;

    # ---    
    # --- Fix Ajit's old typesetting workarounds
    # ---    

    # # non-standard visarga
    # $line =~ s/\x{E003}/\x{0903}/g;

    # # non-standard anudatta
    # $line =~ s/\x{F1A2}/\x{0952}/g;

    # # non-standard dirgha svarita to to svaritas
    # $line =~ s/\x{F176}/\x{0951}\x{0951}/g;
    # $line =~ s/\x{F202}/\x{0951}\x{0951}/g;

    # # non-standard dirgha svarita to to svaritas
    # $line =~ s/\x{F204}/\x{A8F4}/g;

    # # standard dirgha svarita to to svaritas
    # $line =~ s/\x{1CDA}/\x{0951}\x{0951}/g;

    # # anudatta + visarga => visarga + anudatta
    # $line =~ s/\x{0952}\x{0903}/\x{0903}\x{0952}/g;

    # # svarita + visarga => visarga + swarita
    # $line =~ s/\x{0951}\x{0903}/\x{0903}\x{0951}/g;

    # # anudatta + .gm => anudatta + .gm + anudatta
    # $line =~ s/\x{0952}\x{A8F3}/\x{0952}\x{A8F3}\x{0952}/g;

    # # .gm with svarita (private) => .gm + svarita
    # $line =~ s/\x{E004}/\x{A8F3}\x{0951}/g;

    # # svarita + .gm => .gm + svarita
    # $line =~ s/\x{0951}\x{A8F3}/\x{A8F3}\x{0951}/g;

    # # de-dupe anudattas
    # $line =~ s/\x{0952}\x{0952}/\x{0952}/g;
}

# Write the modified content back to the same file
open my $out, '>:encoding(UTF-8)', $filename or die "Cannot open output file '$filename': $!";
print $out @lines;
close $out;

print "File '$filename' has been updated.\n";
