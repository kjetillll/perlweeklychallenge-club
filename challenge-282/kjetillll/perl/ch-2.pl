# Four alternative functions for task 2: Changing Keys
# at https://theweeklychallenge.org/blog/perl-weekly-challenge-282/

use strict; use warnings; use Test::More;

sub f1 {
    my $str = shift;
    my $count = 0;
    for my $i ( 0 .. length($str)-2 ){
	$count++ if lc(substr($str,$i,1))
	         ne lc(substr($str,$i+1,1))
    }
    return $count;
}

sub f2 {
    my @chars = split//, shift;
    my $count=0;
    my $previous_char;
    for my $char (@chars){
	$count++ if defined $previous_char
	         and lc($char) ne lc($previous_char);
	$previous_char = $char;
    }
    return $count
}

sub f3 {
    my($str, $count) = (@_,0);
    $str =~ s/(.)(.)/$2/ ? f3($str,$count + (uc$1 ne uc$2)) : $count
}

sub f4 {
    $#{[ pop =~ s/(.)\1*/$&\n/gir =~ /.+/g ]}
}

for my $test (  ['pPeERrLl' => 3],
		['rRr'      => 0],
		['GoO'      => 1],
		['Hra'      => 2]  )
{
    my($str,$expected)=@$test;
    is &$_($str) => $expected, "str: $str   got: ".&$_($str) for \&f1, \&f2, \&f3, \&f4;
}
done_testing;

__END__
$ perl ch-2.pl
ok 1 - str: pPeERrLl   got: 3
ok 2 - str: pPeERrLl   got: 3
ok 3 - str: pPeERrLl   got: 3
ok 4 - str: pPeERrLl   got: 3
ok 5 - str: rRr   got: 0
ok 6 - str: rRr   got: 0
ok 7 - str: rRr   got: 0
ok 8 - str: rRr   got: 0
ok 9 - str: GoO   got: 1
ok 10 - str: GoO   got: 1
ok 11 - str: GoO   got: 1
ok 12 - str: GoO   got: 1
ok 13 - str: Hra   got: 2
ok 14 - str: Hra   got: 2
ok 15 - str: Hra   got: 2
ok 16 - str: Hra   got: 2
1..16
