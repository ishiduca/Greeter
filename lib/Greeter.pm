package Greeter;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

use DateTime;

sub new {
    my $class = shift;

    bless +{
        time_zone => 'Asia/Tokyo',
        greets => ['Good Morning', 'Good Afternoon', 'Good Evening'],
    } => $class;
};

sub greet {
    my $self = shift;
    my $now  = DateTime->now( time_zone => $self->{time_zone} );

    $self->{greets}[ $self->_get_greets_index($now) ];
}

sub _get_greets_index {
    my $self = shift;
    my $now  = shift;
    my $time = $now->hour * 60 + $now->minute;

    $time >= (18 * 60) ? 2 :
    $time >= (12 * 60) ? 1 :
    $time >= ( 5 * 60) ? 0 : 2;
};

1;
__END__

=encoding utf-8

=head1 NAME

Greeter - It's new $module

=head1 SYNOPSIS

    use Greeter;

    my $greeter = Greeter->new;
    say $greeter->greet # when 06:01:23 => Good Morning

=head1 DESCRIPTION

Greeter is ...

=head1 LICENSE

Copyright (C) ishiduca.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

ishiduca E<lt>ishiduca@gmail.comE<gt>

=cut

