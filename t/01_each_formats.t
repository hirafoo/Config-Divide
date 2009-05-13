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
config_paths:
  - ./t/config/yaml/main
  - ./t/config/yaml/sub
--- e
data_type: complicated

=== json
--- i
config_paths:
  -  ./t/config/json/main
  -  ./t/config/json/sub
--- e
data_type: complicated

=== pl
--- i
config_paths:
  - ./t/config/pl/main
  - ./t/config/pl/sub
--- e
data_type: complicated

=== conf
--- i
config_paths:
  - ./t/config/conf/main
  - ./t/config/conf/sub
--- e
data_type: complicated

=== ini
--- i
config_paths:
  - ./t/config/ini/main
  - ./t/config/ini/sub
--- e
data_type: simple

=== xml
--- i
config_paths:
  - ./t/config/xml/main
  - ./t/config/xml/sub
--- e
data_type: simple

