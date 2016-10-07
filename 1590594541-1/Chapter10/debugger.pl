package DB;

use 5.008000;
use Term::ReadKey;
use strict;

my $i;

sub DB::DB {
	no strict qw(refs);
	my ($p,$f,$l) = caller;
	my $line = @{"::_<$f"}[$l] || shift;
	print "$f [$l]: $line\n";
    ReadMode(0); 
    while (1) {
	    $i++;
        print "dbgr <$i> : ";
        chomp(my $input = ReadLine(0));
        if ($input eq 'h') { print "h(help) l(print line) n(go to next line) q(quit)" };
        if ($input eq 'l') { print "$f [$1]: $line" };
        if ($input eq 'n') { last };
        if ($input eq 'q') { print "exiting\n"; exit };
        my @res = eval "package $p; $input;\n";
        print "\n";
    }
}

1;

=head1 Name

debugger - an extremely rudimentary alternative

=head1 Usage

=over 4

=item PERL5DB="BEGIN {require 'debugger.pl'}" perl -d program args

...

=head1 AUTHOR

Richard Foley, E<lt>debugger.example@rfi.net<gt>

=cut

