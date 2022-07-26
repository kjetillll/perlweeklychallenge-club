#!/usr/bin/perl
# prints 2022-01-30 2022-02-27 2022-03-27 2022-04-24 2022-05-29 2022-06-26
#        2022-07-31 2022-08-28 2022-09-25 2022-10-30 2022-11-27 2022-12-25
# which is the last sunday in every month of a given year on the command line
# eval in sub is_sunday weeds out invalid dates such as 2023-02-29 and works
# by getting the number of days since Jan 1st 1970 (divides seconds by 24*60*60
# to get days minus 3 since that day was Thursday and mod 7 to check for sunday
# https://theweeklychallenge.org/blog/perl-weekly-challenge-175/

use Time::Local;
my $y = shift || 1900+(localtime)[5];
for my $m (1..12){
  for(reverse 1..31){
    is_sunday($y,$m,$_) and printf("%04d-%02d-%02d\n", $y, $m, $_) and last
  }
}

sub is_sunday{ my($y,$m,$d)=@_; (eval{ timegm(0,0,0,$d,$m-1,$y) } / 86400 - 3) % 7 == 0 }
