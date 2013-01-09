class kablamo::perl {
    require kablamo::packages
    require perlbrew

    $version = 'perl-5.16.2'

    # packages needed to build modules
    package { 
        'libssl-dev':           ensure => present; # for https
        'zlib1g-dev':           ensure => present; # for gzip
        'libxml2-dev':          ensure => present; # for XML::Parser
        'libexpat1-dev':        ensure => present; # for XML::Parser
    }

    # install the perl
    perlbrew::build { $version: version => $version }->

    # install cpanm
    perlbrew::install_cpanm { $version: version => $version }
}
