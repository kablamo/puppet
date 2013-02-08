class exim {
    $files="${settings::confdir}/modules/exim/files"

    file { '/etc/exim4':
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
    }
    file { '/etc/exim4/update-exim4.conf.conf':
        ensure => 'file',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => "${files}/etc/exim4/update-exim4.conf.conf",
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
