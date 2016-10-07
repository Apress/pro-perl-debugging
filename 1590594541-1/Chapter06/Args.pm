package Args;
use strict;

print __FILE__." loaded\n";

sub new {
    my $class = shift;
    print __FILE__." running new()\n";
    my $self = {
        _args => require 'getargs',
    };
    die("Failed to find 'getargs' $@") unless ref($self->{_args}) eq 'ARRAY';
    bless($self, $class);
}

sub format {
    my $self  = shift;
    my $index = shift;
    print __FILE__." running format()\n";
    my $str;
    if ($index eq 'all') {
        $str = join("<-\n  ->", @{$self->{_args}});
    } elsif ($index =~ /^\d+$/) {
        $str = $self->{_args}[$index];
    } else {
        print "Error: unrecognised index($index)\n";
    }
    return "\n  ->$str<-\n";
}

1;

BEGIN { 
    print __FILE__." begun\n"; 
}

__END__

=head1 NAME

Args.pm - capture the commandline args. 

=head1 SYNOPSIS

    print Args->new->format('all');

=head1 DESCRIPTION

A module to get the commandline arguments

=cut

