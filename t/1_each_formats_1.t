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
=== yaml - call with arrayref
--- i : [ qw{./t/config/yaml/main ./t/config/yaml/sub}]
--- e : { data_type => 'complicated' }

=== json - call with arrayref
--- i : [ qw{./t/config/json/main ./t/config/json/sub}]
--- e : { data_type => 'complicated' }

=== pl - call with arrayref
--- i : [ qw{./t/config/pl/main ./t/config/pl/sub}]
--- e : { data_type => 'complicated' }

=== conf - call with arrayref
--- i : [ qw{./t/config/conf/main ./t/config/conf/sub}]
--- e : { data_type => 'complicated' }

=== ini - call with arrayref
--- i : [ qw{./t/config/ini/main ./t/config/ini/sub}]
--- e : { data_type => 'simple' }

=== xml - call with arrayref
--- i : [ qw{./t/config/xml/main ./t/config/xml/sub}]
--- e : { data_type => 'simple' }

