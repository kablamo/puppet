class perlbrew {
  include perlbrew::params
  include perlbrew::install

  define build ($version = $name) {
    exec { "perlbrew_build_${name}":
        command => "/bin/bash -c 'PERLBREW_ROOT=${perlbrew::params::perlbrew_root} ${perlbrew::params::perlbrew_bin} install ${version} --as ${name} -Accflags=-fPIC -Dcccdlflags=-fPIC'",
        timeout => 3600,
        user    => 'eric',
        group   => 'eric',
        creates => "${perlbrew::params::perlbrew_root}/perls/${name}",
        require => [Class["perlbrew::params"], Class["perlbrew::install"]],
    }
  }

  define install_cpanm ($version = $name) {
    exec { "install_cpanm_${name}":
        # puppet seems to change the current user weirdly when using the
        # user/group options. That causes cpanm to use /root/.cpanm for it's
        # temporary storage, which happens to not be writable for the perlbrew
        # user. Use /bin/su to work this around.
        command => "/bin/bash -c 'PERLBREW_ROOT='${perlbrew::params::perlbrew_root} ${perlbrew::params::perlbrew_bin} install-cpanm",
        user    => 'eric',
        group   => 'eric',
        creates => "${perlbrew::params::perlbrew_root}/perls/${name}/bin/cpanm",
        require => Perlbrew::Build[$name],
    }
  }
}
