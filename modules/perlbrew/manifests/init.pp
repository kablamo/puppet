class perlbrew (user, group) {
  include perlbrew::params
  include perlbrew::install

  define build ($version) {
    exec { "perlbrew_build_${version}":
        command => "/bin/bash -c 'PERLBREW_ROOT=${perlbrew::params::perlbrew_root} ${perlbrew::params::perlbrew_bin} install ${version} --as ${version} -Accflags=-fPIC -Dcccdlflags=-fPIC'",
        timeout => 3600,
        user    => $user,
        group   => $group,
        creates => "${perlbrew::params::perlbrew_root}/perls/${version}",
        require => [Class["perlbrew::params"], Class["perlbrew::install"]],
    }
  }

  define install_cpanm ($version) {
    exec { "install_cpanm_${version}":
        # puppet seems to change the current user weirdly when using the
        # user/group options. That causes cpanm to use /root/.cpanm for it's
        # temporary storage, which happens to not be writable for the perlbrew
        # user. Use /bin/su to work this around.
        command => "/bin/bash -c 'PERLBREW_ROOT='${perlbrew::params::perlbrew_root} ${perlbrew::params::perlbrew_bin} install-cpanm",
        user    => $user,
        group   => $group,
        creates => "${perlbrew::params::perlbrew_root}/perls/${version}/bin/cpanm",
        require => Perlbrew::Build[$version],
    }
  }
}
