#!/usr/bin/perl -d

use CGI qw(:standard); 

my $o_cgi = CGI->new();

print 
    header, 
    start_html('Perl Debugger Tutorial - CGI example'), 
    "<h3>Params:</h3><hr><ul>\n"
;

foreach my $p ($o_cgi->param) {
    print "\t<li>$p: ".join(', ', $o_cgi->param($p))."\n";
}

print "</ul><hr>\n", end_html;

exit;

__END__

=head1 NAME

example.cgi - short cgi program

=head1 SYNOPSIS

    %> perl -d ./example.cgi this=that this=theother a=param

=head1 DESCRIPTION

Print out the parameters given.

=cut

