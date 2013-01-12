define cpanm {
    require kablamo::perl
    exec { "cpanm $title":
        command   => "/home/eric/perl5/perlbrew/bin/cpanm --local-lib=${kablamo::perl_locallib} $title",
        user      => $kablamo::user,
        group     => $kablamo::user,
        logoutput => true,
#       creates => "${perlbrew::perlbrew_root}/perls/perl-${version}"
    }
}
