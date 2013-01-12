class kablamo {
    $user = 'eric'
    $home = "/home/${user}"

    class { packages: ensure => 'present' }
    class { dotfiles: }
    class { perl: user => $user, perlbrew_root => "${home}/perl5/perlbrew"}
#    class { 'cpanmodules':     }

    #file { aliases:
    #  path    => '/home/eric/.aliases',
    #  ensure  => present,
    #  owner   => 'eric',
    #  group   => 'eric',
    #  mode    => 0644,
    #  source  => 'puppet:///files/home/eric/.aliases'
    #}
    #file { varnish:
    #  path    => '/etc/varnish/default.vcl',
    #  ensure  => present,
    #  owner   => 'root',
    #  group   => 'root',
    #  mode    => 0644,
    #  source  => 'puppet:///files/etc/varnish/default.vcl'
    #}

    #exec { npm:
    #    command => '/usr/bin/curl http://npmjs.org/install.sh | sh',
    #    creates => '/some/directory/somewhere'
    #}
}
