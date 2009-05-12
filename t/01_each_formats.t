#!/usr/bin/perl
use lib 't/lib';
use Config::Divide;
use Config::Divide::Test;

plan tests => 1 * blocks;

filters {
    i => [qw/yaml load/],
    e => [qw/yaml testdata/],
};

run_is_deeply;

__END__
=== yaml
--- i
config_path_main: ./t/config/yaml/main
config_path_sub:  ./t/config/yaml/sub
--- e
data_type: complicated

=== json
--- i
config_path_main: ./t/config/json/main
config_path_sub:  ./t/config/json/sub
--- e
data_type: complicated

=== pl
--- i
config_path_main: ./t/config/pl/main
config_path_sub:  ./t/config/pl/sub
--- e
data_type: complicated

=== conf
--- i
config_path_main: ./t/config/conf/main
config_path_sub:  ./t/config/conf/sub
--- e
data_type: complicated

=== ini
--- i
config_path_main: ./t/config/ini/main
config_path_sub:  ./t/config/ini/sub
--- e
data_type: simple

=== xml
--- i
config_path_main: ./t/config/xml/main
config_path_sub:  ./t/config/xml/sub
--- e
data_type: simple

