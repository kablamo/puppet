class exim {
    $files="${settings::confdir}/modules/exim/files"

#    file { '/etc/varnish':
#        ensure => 'directory',
#        owner  => 'root',
#        group  => 'root',
#        mode   => '0755',
#    }
#    file { '/etc/varnish/default.vcl':
#        ensure => 'file',
#        owner  => 'root',
#        group  => 'root',
#        mode   => '0644',
#        source => "${files}/etc/varnish/default.vcl",
#    }

    package { exim4: ensure => $ensure }
    package { mailutils: ensure => $ensure }
    service { exim4_service: 
        name     => 'exim4',
        enable   => true,
        ensure   => true, 
        require  => Package["exim4"],
    }
}
