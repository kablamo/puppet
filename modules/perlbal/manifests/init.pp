class perlbal {
    require kablamo::perl
    cpanm { 'Perlbal':                            ensure => $ensure }
    cpanm { 'Perlbal::XS::HTTPHeaders':           ensure => $ensure }
    cpanm { 'IO::AIO':                            ensure => $ensure }
}
