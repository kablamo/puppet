class perlbrew::install {
    require perlbrew::params

    exec { $perlbrew::params::perlbrew_bin:
        command => "/usr/bin/curl -kL http://install.perlbrew.pl | /bin/bash",
        user    => 'eric',
        group   => 'eric',
        creates => $perlbrew::params::perlbrew_bin,
        require => [ Package["build-essential"], Package["curl"] ],
    }

    exec { "perlbrew_init":
        command => "/bin/bash -c 'PERLBREW_ROOT=${perlbrew::params::perlbrew_root} ${perlbrew::params::perlbrew_bin} init'",
        user    => 'eric',
        group   => 'eric',
        creates => "${perlbrew::params::perlbrew_root}/perls",
        require => Exec[$perlbrew::params::perlbrew_bin],
    }
}
