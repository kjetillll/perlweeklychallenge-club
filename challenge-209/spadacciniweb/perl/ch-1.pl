#!/usr/bin/env perl

# Task 1: Special Bit Characters
# Submitted by: Mohammad S Anwar
# 
# You are given an array of binary bits that ends with 0.
# 
# Valid sequences in the bit string are:
# 
# [0] -decodes-to-> "a"
# [1, 0] -> "b"
# [1, 1] -> "c"
# Write a script to print 1 if the last character is an “a” otherwise print 0.
#
# Example 1
# Input: @bits = (1, 0, 0)
# Output: 1
# 
# The given array bits can be decoded as 2-bits character (10) followed by 1-bit character (0).
# 
# Example 2
# Input: @bits = (1, 1, 1, 0)
# Output: 0
# 
# Possible decode can be 2-bits character (11) followed by 2-bits character (10) i.e. the last character is not 1-bit character.

use strict;
use warnings;

my @input = @ARGV;
die "Input error\n"
    if scalar @input < 1
       or
       (scalar map { $_ =~ /[^01]/ ? 1 : () }
                @input) != 0;

while (scalar(@input) > 1) {
    my $char = shift @input;
    shift @input
        if $char;
}

die "Input error\n"
    if scalar @input and $input[0] == 1;

printf "%d\n", (scalar @input) ? 1 : 0;
