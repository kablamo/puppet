class kablamo::perl ($version) {
    require kablamo::packages
    require perlbrew

    # packages needed to build modules
    package { 
        'libssl-dev':           ensure => present; # for https
        'zlib1g-dev':           ensure => present; # for gzip
        'libxml2-dev':          ensure => present; # for XML::Parser
        'libexpat1-dev':        ensure => present; # for XML::Parser
        'libcurl4-openssl-dev': ensure => present; # AnyEvent::Curl::Multi
    }

    # install the perl
    perlbrew::build { $version: version => $version }->

    # install cpanm
    perlbrew::install_cpanm { $version: version => $version }
}
