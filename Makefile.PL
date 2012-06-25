use strict;
use inc::Module::Install;

name 'Config-Divide';
all_from 'lib/Config/Divide.pm';

repository 'https://github.com/hirafoo/Config-Divide.git';

use_test_base;
auto_include_deps;

license 'perl';

requires $_
    for qw/
        Config::Any
        File::Spec
    /;

test_requires $_
    for qw/
        Test::Exception
        Test::Synopsis
        YAML
        YAML::Syck
    /;

auto_install;

WriteAll;
