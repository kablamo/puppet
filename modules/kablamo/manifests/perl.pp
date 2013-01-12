class kablamo::perl ($perlbrew_root, $user) {

    class { 'perlbrew': user => $user, perlbrew_root => $perlbrew_root }

    $version = '5.16.2'
    perlbrew::install_perl  { $version: version => $version }->
    perlbrew::install_cpanm { $version: version => $version }

    exec { "Task::BeLike::KABLAMO":
        command => "/home/eric/perl5/perlbrew/bin/cpanm Task::BeLike::KABLAMO",
        timeout => 3600,
        user    => $user,
        group   => $group,
#        creates => "${perlbrew::perlbrew_root}/perls/perl-${version}"
    }
}
