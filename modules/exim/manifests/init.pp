class exim {
    $files="${settings::confdir}/modules/exim/files"

    file { '/etc/exim4/update-exim4.conf.conf':
        ensure => 'file',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => "${files}/etc/exim4/update-exim4.conf.conf",
    }
    file { '/etc/exim4/router/350_exim4-config_domain_redirect':
        ensure => 'file',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => "${files}/etc/exim4/router/350_exim4-config_domain_redirect",
    }

    package { exim4: ensure => $ensure }
    package { mailutils: ensure => $ensure }
    service { exim4_service: 
        name     => 'exim4',
        enable   => true,
        ensure   => true, 
        require  => Package["exim4"],
    }
}
