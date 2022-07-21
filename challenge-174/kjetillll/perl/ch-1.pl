#!/usr/bin/perl
use List::Util 'sum'; use v5.10; use strict; use warnings;

my $want = 19;
my $n = 0;

while( $want > 0 ) {

    my @d = split //, $n;       #array d gets digits

    say $n and $want-- if $n == sum( map $d[$_-1]**$_, 1..@d);

    $n++;

}


__END__

Outputs 0 1 2 3 4 5 6 7 8 9 89 135 175 518 598 1306 1676 2427 2646798
in about 4-6 seconds which is the first 19 disarium numbers also found at:
https://oeis.org/A032799
The next and last known such number is 12157692622039623539
which would take too long to find. At least with this program.
