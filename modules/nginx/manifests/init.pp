class nginx {
    $files="${settings::confdir}/modules/nginx/files"

    file { '/etc/nginx':
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
    }
    file { '/etc/nginx/nginx.conf':
        ensure => 'file',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => "${files}/etc/nginx/nginx.conf",
    }
    file { '/etc/nginx/sites-enabled/networthify.com':
        ensure => 'file',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => "${files}/etc/nginx/sites-enabled/networthify.com",
    }
    file { '/etc/nginx/sites-enabled/iijo.org':
        ensure => 'file',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => "${files}/etc/nginx/sites-enabled/iijo.org",
    }

    package { nginx:  }
    service { nginx_service: 
        name     => 'nginx',
        enable   => true,
        ensure   => true, 
        require  => Package["nginx"],
    }
}
