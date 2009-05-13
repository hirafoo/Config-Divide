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

    Config::Divide->load_config(
        %$data
    );
}

sub p () { warn Dumper shift }

sub testdata () {
    my $type = shift->{data_type};
    YAML::Syck::LoadFile "./t/config/expected/$type.yaml";
}

1;
