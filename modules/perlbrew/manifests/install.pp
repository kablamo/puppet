class perlbrew::install {
    require perlbrew::params

    package {
      "build-essential": ensure => present;
      "curl":            ensure => present;
    }

    exec { $perlbrew::params::perlbrew_bin:
        command => "/usr/bin/curl -kL http://install.perlbrew.pl | /bin/bash",
        creates => $perlbrew::params::perlbrew_bin,
        require => [ Package["build-essential"], Package["curl"] ],
    }

    exec { "perlbrew_init":
        command => "PERLBREW_ROOT=${perlbrew::params::perlbrew_root} ${perlbrew::params::perlbrew_bin} init'",
        creates => "${perlbrew::params::perlbrew_root}/perls",
        require => File[$perlbrew::params::perlbrew_bin],
    }
}
