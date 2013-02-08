class dovecot {
    $files="${settings::confdir}/modules/dovecot/files"

    #file { '/etc/dovecot':
    #    ensure => 'directory',
    #    owner  => 'root',
    #    group  => 'root',
    #    mode   => '0755',
    #}
    #file { '/etc/dovecot/dovecot.conf':
    #    ensure => 'file',
    #    owner  => 'root',
    #    group  => 'root',
    #    mode   => '0644',
    #    source => "${files}/etc/dovecot/dovecot.conf",
    #}

    package { dovecot-pop3d: ensure => 'present' }
    service { dovecot_service: 
        name     => 'dovecot',
        enable   => true,
        ensure   => true, 
        require  => Package["dovecot-pop3d"],
    }
}
