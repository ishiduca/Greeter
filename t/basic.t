use strict;
use warnings;
use utf8;

BEGIN {
    binmode STDOUT, ":utf8";
    binmode STDERR, ":utf8";
}

use Greeter;
use Test::More;
use Test::MockDateTime;

subtest 'Greeter->new でインスタンスが作れるか' => sub {
    my $greeter = Greeter->new;
    ok $greeter, 'my $greeter = Greeter->new';
};

subtest '$greeter->greet で時刻にあわせて適切な挨拶を返すか' => sub {
    my $greeter = Greeter->new;
    my $ymd = '2014-01-01';

    my $t045959 = "$ymd 04:59:59";
    on $t045959 => sub {
        is $greeter->greet, 'Good Evening', "$t045959 => Good Evening";
    };

    my $t050000 = "$ymd 05:00:00";
    on $t050000 => sub {
        is $greeter->greet, 'Good Morning', "$t050000 => Good Morning";
    };

    my $t115959 = "$ymd 11:59:59";
    on $t115959 => sub {
        is $greeter->greet, 'Good Morning', "$t115959 => Good Morning";
    };

    my $t120000 = "$ymd 12:00:00";
    on $t120000 => sub {
        is $greeter->greet, 'Good Afternoon', "$t120000 => Good Afternoon";
    };

    my $t175959 = "$ymd 17:59:59";
    on $t175959 => sub {
        is $greeter->greet, 'Good Afternoon', "$t175959 => Good Afternoon";
    };

    my $t180000 = "$ymd 18:00:00";
    on $t180000 => sub {
        is $greeter->greet, 'Good Evening', "$t180000 => Good Evening";
    };

    my $t235959 = "$ymd 23:59:59";
    on $t235959 => sub {
        is $greeter->greet, 'Good Evening', "$t235959 => Good Evening";
    };

    my $t000000 = "$ymd 00:00:00";
    on $t000000 => sub {
        is $greeter->greet, 'Good Evening', "$t000000 => Good Evening";
    };
};

done_testing;
