class kablamo::perl ($perlbrew_root, $user, $version) {

    class { 'perlbrew': user => $user, perlbrew_root => $perlbrew_root }
    perlbrew::install_perl  { $version: version => $kablamo::perl_version }->
    perlbrew::install_cpanm { $version: version => $kablamo::perl_version }
}
