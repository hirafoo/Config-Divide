#!/usr/bin/perl
use lib 't/lib';
use Config::Divide;
use Config::Divide::Test;

plan tests => 1 * blocks;

filters {
    i => [qw/eval load/],
    e => [qw/eval testdata/],
};

run_is_deeply;

__END__
=== yaml - main only with arrayref
--- i : [ qw{./t/config/yaml/main} ]
--- e : { data_type => 'complicated_main_only' }

=== json - main only with arrayref
--- i : [ qw{./t/config/json/main} ]
--- e : { data_type => 'complicated_main_only' }

=== pl - main only with arrayref
--- i : [ qw{./t/config/pl/main} ]
--- e : { data_type => 'complicated_main_only' }

=== conf - main only with arrayref
--- i : [ qw{./t/config/conf/main} ]
--- e : { data_type => 'complicated_main_only' }

=== ini - main only with arrayref
--- i : [ qw{./t/config/ini/main} ]
--- e : { data_type => 'simple_main_only' }

=== xml - main only with arrayref
--- i : [ qw{./t/config/xml/main} ]
--- e : { data_type => 'simple_main_only' }

