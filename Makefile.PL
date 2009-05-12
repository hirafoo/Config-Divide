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
        Any::Moose
        Config::Any
        File::Spec
        self
        YAML::Syck
    /;

auto_install;

WriteAll;
