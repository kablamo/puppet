class kablamo::varnish {
    warning "installing varnish: ${settings::confdir}"
    require kablamo::packages

    $files="${settings::confdir}/modules/kablamo/files"

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
    #   require   => [ Package["varnish"] ],
}
