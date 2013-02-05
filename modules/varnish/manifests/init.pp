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
    package { varnish:            ensure => $ensure }
    #   require   => [ Package["varnish"] ],
    # todo: start service
}
