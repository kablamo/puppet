class kablamo::packages {
    package { atop:            ensure => latest }
    package { build-essential: ensure => latest }
    package { curl:            ensure => latest }
    package { git:             ensure => latest }
    package { htop:            ensure => latest }
    package { libexpat1-dev:   ensure => latest } # XML::Parser
    package { libssl-dev:      ensure => latest }
    package { libxml2-dev:     ensure => latest } # XML::Parser
    package { locate:          ensure => latest }
    package { mtr:             ensure => latest }
    package { nano:            ensure => absent }
    package { ntp:             ensure => latest }
    package { sqlite3-doc:     ensure => latest }
    package { sqlite3:         ensure => latest }
    package { sshfs:           ensure => latest }
    package { tmux:            ensure => latest }
    package { varnish:         ensure => latest }
    package { vim-nox:         ensure => latest }
    package { wget:            ensure => latest }
    package { zlib1g-dev:      ensure => latest } # gzip lib

    exec { "initialize-locate-db":
        command     => "updatedb",
        path        => "/usr/bin/",
        subscribe   => Package["locate"],
        refreshonly => true,
    }
}
