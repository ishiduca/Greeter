requires 'perl', '5.008001';

requires 'DateTime', '1.06';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Test::MockDateTime', '0.02';
};

