class perlbrew ($version = $name) {
  include perlbrew::params
  include perlbrew::install

  define build ($version) {
    exec { "perlbrew_build_${name}":
        command => "PERLBREW_ROOT=${perlbrew::params::perlbrew_root} ${perlbrew::params::perlbrew_bin} install ${version} --as ${name} -Accflags=-fPIC -Dcccdlflags=-fPIC'",
        timeout => 3600,
        creates => "${perlbrew::params::perlbrew_root}/perls/${name}",
        require => Class["perlbrew::environment"],
    }
  }

  define install_cpanm () {
    exec { "install_cpanm_${name}":
        # puppet seems to change the current user weirdly when using the
        # user/group options. That causes cpanm to use /root/.cpanm for it's
        # temporary storage, which happens to not be writable for the perlbrew
        # user. Use /bin/su to work this around.
        command => "${perlbrew::params::perlbrew_bin} install-cpanm",
        creates => "${perlbrew::params::perlbrew_root}/perls/${name}/bin/cpanm",
        require => Perlbrew::Build[$name],
    }
  }
}
