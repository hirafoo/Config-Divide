use strict;
use inc::Module::Install;

name 'Config-Divide';
all_from 'lib/Config/Divide.pm';

repository 'http://github.com/hirafoo/Config-Divide/tree/master';

use_test_base;
auto_include_deps;

license 'perl';

requires $_ 
    for qw/
        Config::Any
        Config::General
        Config::Tiny
        File::Spec
        XML::Simple
        YAML
    /;

test_requires $_
    for qw/
        Test::Exception
        Test::Synopsis
        YAML::Syck
    /;

auto_install;

WriteAll;
