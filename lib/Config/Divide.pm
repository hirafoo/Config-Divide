package Config::Divide;
use strict;
use warnings;

use Config::Any;
use File::Spec;
use Data::Dumper;
sub p {warn Dumper shift}

use 5.008_001;
our $VERSION = '0.01';

sub get_config_files {
    my ($class, $config_path) = @_;
    return if !$config_path;

    $config_path = File::Spec->rel2abs($config_path);
    my @config_files;

    opendir my $dh, $config_path or die "$config_path : $!";
    for my $file (grep !/^\.\.?/, readdir($dh)) {
        $file = "$config_path/$file";
        next if -z $file;
        push @config_files, $file;
    }
    closedir $dh;

    @config_files;
}

sub load_config {
    my ($class, %opt) = @_;

    my @config_files;
    push @config_files, $class->get_config_files($_)
        for @{$opt{config_paths}};

    my %config_any_options = (
        use_ext => 1,
    );

    %config_any_options = (%config_any_options, %{$opt{config_any_options}})
        if $opt{config_any_options};

    my $config = Config::Any->load_files(
        {   
            files => \@config_files,
            %config_any_options,
        }
    );

    my %_config = map { %$_ } @$config;

    my %merged;
    for my $key (@config_files) {
        next if !$_config{$key};
        %merged = (%merged, %{$_config{$key}});
    }

    \%merged;
}

1;

__END__

=encoding utf-8

=for stopwords

=head1 NAME

Config::Divide - config loader like Catalyst::Plugin::ConfigLoader.

=head1 SYNOPSIS

  use Config::Divide;

  my @config_paths = qw{ /path/to/main/config/files /path/to/sub/config/files };
  my %config_any_options = (
      # you can set option of Config::Any->load_files
      # for example...
      # filter => \&filter,
  );
  
  my $config = Config::Divide->load_config(
      config_paths       => \@config_paths,
      config_any_options => \%config_any_options,
  );

=head1 DESCRIPTION

Config::Divide is config loader like Catalyst::Plugin::ConfigLoader.

you can set path(s) that main (and sub) config files. if you set sub config files's path, and there is same item in main config and sub config, then main item will be overwritten by sub config data.

=head1 METHODS

=head2 load_config(\@config_paths, [\%config_any_options])

=over 2

=item @config_path

this is path to config files. you can set one or two path. 1st path is main, and 2nd path is sub. if main and sub contain same item, main config will be overwritten by sub config data.

=item %config_any_options

this is option of Config::Any->load_files. in Config::Divide, use option {use_ext => 1} only.
if you set value to %config_any_option, default value will be overwritten.

=head1 AUTHOR

hirafoo E<lt>hirafoo@cpan.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Catalyst::Plugin::ConfigLoader>

=cut
