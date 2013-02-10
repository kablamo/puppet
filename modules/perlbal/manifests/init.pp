class perlbal {
    require kablamo::perl
    cpanm { 'Perlbal':                            ensure => $ensure }
    cpanm { 'Perlbal::XS::HTTPHeaders':           ensure => $ensure }
    cpanm { 'Perlbal::Plugin::SessionAffinity':   ensure => $ensure }
    cpanm { 'IO::AIO':                            ensure => $ensure }
}
