package NoArg;
use strict;

require Exporter;
use vars qw(@ISA @EXPORT_OK);
@ISA = qw(Exporter);
@EXPORT_OK = qw(noargs); 

print __FILE__." loaded\n";

sub noargs {
    print __FILE__." running noargs()\n";
    return (scalar(@_) == 0 ? 1 : 0);
}

1;

BEGIN { 
    print __FILE__." begun\n"; 
}

__END__

=head1 NAME

NoArg.pm - are there any args

=head1 SYNOPSIS

    print "yup\n" if NoArg::noargs(@ARGV);

=head1 DESCRIPTION

Decide if there are any arguments on the commandline

=cut

