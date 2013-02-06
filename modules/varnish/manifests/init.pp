class varnish {
    $files="${settings::confdir}/modules/varnish/files"

    file { '/etc/varnish':
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
    }
    file { '/etc/varnish/default.vcl':
        ensure => 'file',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => "${files}/etc/varnish/default.vcl",
    }
    file { '/etc/default/varnish':
        ensure => 'file',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => "${files}/etc/default/varnish",
    }

    package { varnish: ensure => $ensure }
    service { varnish_service: 
        name     => 'varnish',
        enable   => true,
        ensure   => true, 
        require  => Package["varnish"],
    }
}
