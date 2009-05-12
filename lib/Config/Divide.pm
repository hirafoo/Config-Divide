package Config::Divide;
use Any::Moose;
use Config::Any;
use File::Spec;
use self;

use 5.008_001;
our $VERSION = '0.01';

has 'config' => (
    is  => 'rw',
    isa => 'HashRef',
);

has 'config_path_main' => (
    is  => 'rw',
    isa => 'Str',
    required => 1,
);

has 'config_path_sub' => (
    is  => 'rw',
);

sub get_config_files {
    my ($config_path) = @args;
    return if !$config_path;

    $config_path = File::Spec->rel2abs($config_path);
    my @config_files;

    opendir my $dh, $config_path or die "$config_path : $!";
    for my $file (grep !/^\.\.?/, readdir($dh)) {
        $file = "$config_path/$file";
        next if !(-s $file);
        push @config_files, $file;
    }
    closedir $dh;

    @config_files;
}

sub load_config {
    my @config_files_main = $self->get_config_files( $self->config_path_main );
    my @config_files_sub  = $self->get_config_files( $self->config_path_sub );

    my $config_files = [ @config_files_main, @config_files_sub ];

    my $config = Config::Any->load_files(
        {   
            files   => $config_files,
            use_ext => 1,
        }
    );

    my %_config = map { %$_ } @$config;

    my %merged;
    for my $key (@config_files_main, @config_files_sub) {
        next if !$_config{$key};
        %merged = (%merged, %{$_config{$key}});
    }

    $self->config( \%merged );
}

1;

__END__

=encoding utf-8

=for stopwords

=head1 NAME

Config::Divide - config loader like Catalyst::Plugin::ConfigLoader.

=head1 SYNOPSIS

  use Config::Divide;

  my $obj = Config::Divide->new(
      config_path_main => 'path/to/main_config_files',
      config_path_sub  => 'path/to/sub_config_files',
  );

  my $config = $obj->load_config;

=head1 DESCRIPTION

Config::Divide is config loader like Catalyst::Plugin::ConfigLoader.

you can set path(s) that main (and sub) config files.
if you set sub config files's path, and there is same item in main config and sub config, then main item will be overwritten by sub config data.

=head1 AUTHOR

hirafoo E<lt>hirafoo@cpan.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Catalyst::Plugin::ConfigLoader>

=cut
