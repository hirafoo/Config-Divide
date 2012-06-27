use strict;
use inc::Module::Install;
name 'Config-Divide';
all_from 'lib/Config/Divide.pm';
repository 'https://github.com/hirafoo/Config-Divide.git';

license 'perl';

requires $_
    for qw/
        Config::Any
        Config::General
        File::Spec
    /;

test_requires $_
    for qw/
        Test::Exception
        Test::Synopsis
    /;
test_requires 'Test::More' => 0.98;

auto_install;

WriteAll;
