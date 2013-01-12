class kablamo {

    # define some variables
    $user          = 'eric'
    $home          = "/home/${user}"
    $perlbrew_root = "${home}/perl5/perlbrew"
    $perl_version  = '5.16.2'
    $perl_locallib = "${perlbrew_root}/perls/perl-${perl_version}"

    # do stuff
    class { packages: ensure => 'present' }
    class { dotfiles: }
    class { perl: 
        user          => $user, 
        perlbrew_root => $perlbrew_root,
        version       => $perl_version,
    }
    class { cpanmodules: }


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
