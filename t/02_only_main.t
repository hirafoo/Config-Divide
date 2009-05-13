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
=== yaml - only main
--- i
config_paths:
  - ./t/config/yaml/main
--- e
data_type: complicated_main_only

=== json - only main
--- i
config_paths:
  - ./t/config/json/main
--- e
data_type: complicated_main_only

=== pl - only main
--- i
config_paths:
  - ./t/config/pl/main
--- e
data_type: complicated_main_only

=== conf - only main
--- i
config_paths:
  - ./t/config/conf/main
--- e
data_type: complicated_main_only

=== ini - only main
--- i
config_paths:
  - ./t/config/ini/main
--- e
data_type: simple_main_only

=== xml - only main
--- i
config_paths:
  - ./t/config/xml/main
--- e
data_type: simple_main_only

