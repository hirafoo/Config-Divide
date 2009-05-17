#!/usr/bin/perl
use lib 't/lib';
use Config::Divide;
use Config::Divide::Test;

plan tests => 1;

throws_ok { Config::Divide->load_config() } qr/invalid args/;
