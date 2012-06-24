package Config::Divide::Test;
use Test::Base -Base;
use Test::Exception;
use Data::Dumper;
use YAML::XS ();

our @EXPORT = qw/
    load
    p
    testdata
    throws_ok
/;

sub load () {
    Config::Divide->load_config( @_ );
}

sub p () { warn Dumper shift }

sub testdata () {
    my $type = shift->{data_type};
    YAML::XS::LoadFile( "./t/config/expected/$type.yaml" );
}

1;
