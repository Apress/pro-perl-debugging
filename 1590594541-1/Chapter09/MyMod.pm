package MyMod;

sub handler {
    my $r = shift;

    print $r->content_type('text/plain');
    print $r->send_http_header;
    print "<h3>A couple of environment variables:</h3><hr><ul>\n";

    foreach my $e (qw(SERVER_SOFTWARE MOD_PERL GATEWAY_INTERFACE)) {
        $DB::single=2;
        print "\t<li>$e: $ENV{$e}\n";
    }

    print "</ul><hr>\n";
}

1; # <- satisfy module rules

__END__

=head1 NAME

MyMod.pm - A mod_perl module

=head1 SYNOPSIS

    PerlRequire /home/perltut/code/MyMod.pm
    PerlHandler MyMod

=head1 DESCRIPTION

An apache module to print out several mod_perl or http related environment
variables

=cut


