class kablamo::perl ($version) {
    require kablamo::packages

    # packages needed to build stuff
    package { 
        'libssl-dev':           ensure => present; # for https
        'zlib1g-dev':           ensure => present; # for gzip
        'libxml2-dev':          ensure => present; # for XML::Parser
        'libexpat1-dev':        ensure => present; # for XML::Parser
        'libcurl4-openssl-dev': ensure => present; # AnyEvent::Curl::Multi
    }->
 
    # install the perl
    perlbrew::build { $version: }->

    # install cpanm
    perlbrew::install_cpanm { $version: } } }   
}
