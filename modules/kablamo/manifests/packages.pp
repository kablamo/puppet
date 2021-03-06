class kablamo::packages ($ensure = 'latest') {
    package { atop:               ensure => $ensure }
    package { ack-grep:           ensure => $ensure } # for root
    package { build-essential:    ensure => $ensure }
    package { curl:               ensure => $ensure }
    package { ctags:              ensure => $ensure }
    package { duplicity:          ensure => $ensure }
    package { git:                ensure => $ensure }
    package { gnupg:              ensure => $ensure }
    package { gnupg-agent:        ensure => $ensure }
    package { gnupg-doc:          ensure => $ensure }
    package { htop:               ensure => $ensure }
    package { keychain:           ensure => $ensure }
    package { libexpat1-dev:      ensure => $ensure } # XML::Parser
    package { libreadline-dev:    ensure => $ensure } # Term::ReadLine::Gnu
    package { libssl-dev:         ensure => $ensure }
    package { libxml2-dev:        ensure => $ensure } # XML::Parser
    package { lynx:               ensure => $ensure }
    package { locate:             ensure => $ensure }
    package { mtr:                ensure => $ensure }
    package { nano:               ensure => absent  }
    package { ntp:                ensure => $ensure }
    package { python-boto:        ensure => $ensure } # duplicity
    package { python-paramiko:    ensure => $ensure } # duplicity
    package { sqlite3-doc:        ensure => $ensure }
    package { sqlite3:            ensure => $ensure }
    package { sshfs:              ensure => $ensure }
    package { telnet:             ensure => $ensure }
    package { tcpdump:            ensure => $ensure }
    package { tmux:               ensure => $ensure }
    package { vim-nox:            ensure => $ensure }
    package { wget:               ensure => $ensure }
    package { xsel:               ensure => $ensure }
    package { xvkbd:              ensure => $ensure }
    package { zlib1g-dev:         ensure => $ensure } # gzip lib
 

    exec { "initialize-locate-db":
        command     => "updatedb",
        path        => "/usr/bin/",
        subscribe   => Package["locate"],
        refreshonly => true,
    }
}
