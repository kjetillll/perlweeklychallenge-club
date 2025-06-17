sub f { @_ ? ( ( $_[1] ) x $_[0], f( @_[ 2 .. $#_ ] ) ) : () }  #alternative 1
sub f { "@_" =~ s/(\d+)( \d+)/$2 x $1/ger =~ /\d+/g }           #alternative 2

print join( ', ', f(1, 3, 2, 4) ) eq '3, 4, 4'          ? "ok\n" : "err\n";
print join( ', ', f(1, 1, 2, 2) ) eq '1, 2, 2'          ? "ok\n" : "err\n";
print join( ', ', f(3, 1, 3, 2) ) eq '1, 1, 1, 2, 2, 2' ? "ok\n" : "err\n";
