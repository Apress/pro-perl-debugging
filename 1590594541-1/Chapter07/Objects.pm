package Object;

use strict;
use vars qw($AUTOLOAD);

sub new {
	my $class = shift;
	bless {
		_name	 => ref($class) || $class,
		_desc	 => 'A thing',
		_unknown => 'unknown attribute',
	}, $class;
}

sub AUTOLOAD {
	my $self = shift;
	return if $AUTOLOAD =~ /DESTROY/;
	my $attr = $AUTOLOAD;
	$attr =~ s/^.+?([a-zA-Z]+)$/$1/;
	return ($self->{"_$attr"} || $self->{_unknown}.": $attr");
}

1;

package Book;

use strict;
use base qw(Object);
$Book::VERSION = "1.02";
my $publisher = 'Apress';

sub new {
	my $class = shift;
	my $name  = shift;
	my $self  = Object->new;
	$self->{_name}     = $name;
	$self->{_desc}     = 'A book';
	$self->{_contents} = \@_;
	$self->{_unknown}  = 'unknown book attribute';
	bless $self;
}

sub linecount {
	my $self = shift;
	return scalar @{$self->{_contents}};
}

1;

package Fiction;

use strict;
use base qw(Book);
use vars qw($AUTOLOAD);

sub new {
	my $class = shift;
	my $self = Book->new(@_);
	$self->{_desc} = 'A story book';
	bless $self;
}

sub linecount {
	return $$;
}

sub AUTOLOAD {
	my $self = shift;
	return if $AUTOLOAD =~ /DESTROY/;
	my $sub = $AUTOLOAD;
	$sub =~ s/.*:://;
	if ($sub =~ /^[aeiou]/) {
		return "Making this up as we go along($sub)";
	} else {
		$sub = "SUPER::$sub";
		return $self->$sub();
	}
}

1;

package NonFiction;

use strict;
use base qw(Book);

sub new {
	my $class = shift;
	my $self = Book->new(@_);
	$self->{_desc} = 'A true tale';
	$self->{_bibliography} = 'substantial';
	bless $self;
}

1;

__END__

=head1 NAME

Objects.pm - several objects 

=head1 DESCRIPTION

Simple Object packages providing various C<Book>-like objects for manipulation.

=cut

