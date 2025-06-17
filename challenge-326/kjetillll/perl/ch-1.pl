sub julian_day {
    my($yyyy, $mm, $dd) = @_;
    use integer;
    my $a =  (14 - $mm) / 12;
    my($y, $m) = ($yyyy + 4800 - $a, $mm + 12*$a - 3);
    $dd + (153*$m + 2) / 5 + 365*$y + $y/4 - $y/100 + $y/400 - 32045
}

sub day_of_year {
    my @ymd = split /-/, shift;
    1 + julian_day(@ymd) - julian_day($ymd[0], 1, 1)
}

print day_of_year( $$_[0] ) == $$_[1] ? "ok\n" : "err\n" for map [split], split /\n/, <<"";
2025-02-02  33
2025-04-10 100
2025-09-07 250
2024-09-07 251
2024-03-01  61
2025-03-01  60
1900-03-01  60
2000-03-01  61
2025-01-01   1
