class kablamo::perl {

    class { 'perlbrew': 
        user          => 'eric', 
        group         => 'eric',
        perlbrew_root => "/home/eric/perl5/perlbrew",
    }

    $version = 'perl-5.16.2'
    perlbrew::install_perl  { $version: version => $version }->
    perlbrew::install_cpanm { $version: version => $version }

    # cpanm Task::BeLike::KABLAMO
}
