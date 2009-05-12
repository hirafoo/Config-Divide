package Config::Divide::Test;
use Test::Base -Base;
use Data::Dumper;
use YAML::Syck;

our @EXPORT = qw/
    load
    p
    testdata
/;

sub load () {
    my $data = shift;
    my $obj = Config::Divide->new(
        config_path_main => $data->{config_path_main},
        config_path_sub  => $data->{config_path_sub},
    );
    $obj->load_config;
}

sub p () { warn Dumper shift }

sub testdata () {
    my $type = shift->{data_type};
    YAML::Syck::LoadFile "./t/config/expected/$type.yaml";
}

1;
