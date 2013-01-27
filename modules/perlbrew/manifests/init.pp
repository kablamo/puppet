class perlbrew (
    $user,
    $group = $user,
    $perlbrew_root,
    $perlbrew_bin  = "${perlbrew_root}/bin/perlbrew",
) {
    exec { install_perlbrew:
        command   => "/usr/bin/curl -kL http://install.perlbrew.pl | /bin/bash",
        user      => $user,
        group     => $group,
        logoutput => true,
        creates   => $perlbrew_bin,
        require   => [ Package["build-essential"], Package["curl"] ],
    }

    exec { perlbrew_init:
        command   => "/bin/bash -c 'PERLBREW_ROOT=${perlbrew_root} ${perlbrew_bin} init'",
        user      => $user,
        group     => $group,
        logoutput => true,
        creates   => "${perlbrew_root}/perls",
        require   => Exec['install_perlbrew'],
    }

    define install_perl ($version) {
        exec { "install_perl_${version}":
            command   => "/bin/bash -c 'PERLBREW_ROOT=${perlbrew::perlbrew_root} ${perlbrew::perlbrew_bin} install ${version} --as perl-${version} -Accflags=-fPIC -Dcccdlflags=-fPIC'",
            user      => $perlbrew::user,
            group     => $perlbrew::group,
            logoutput => true,
            creates   => "${perlbrew::perlbrew_root}/perls/perl-${version}",
            require   => Exec['perlbrew_init'],
        }
    }

    define switch ($version) {
        exec { "perlbrew_switch_${version}":
            command   => "/bin/bash -c 'PERLBREW_ROOT=${perlbrew::perlbrew_root} source ${perlbrew::perlbrew_root}/etc/bashrc && ${perlbrew::perlbrew_bin} switch perl-${version}'",
            user      => $perlbrew::user,
            group     => $perlbrew::group,
            logoutput => true,
            require   => Perlbrew::Install_perl[$version],
        }
    }
  
    define install_cpanm ($version) {
        exec { "install_cpanm_${version}":
            # TODO do something about this comment
            # puppet seems to change the current user weirdly when using the
            # user/group options. That causes cpanm to use /root/.cpanm for it's
            # temporary storage, which happens to not be writable for the perlbrew
            # user. Use /bin/su to work this around.
            command   => "/bin/bash -c 'PERLBREW_ROOT=${perlbrew::perlbrew_root} source ${perlbrew::perlbrew_root}/etc/bashrc && ${perlbrew::perlbrew_bin} install-cpanm'",
            user      => $perlbrew::user,
            group     => $perlbrew::group,
            logoutput => true,
            creates   => "${perlbrew::perlbrew_root}/bin/cpanm",
            require   => [
                          Perlbrew::Install_perl[$version],
                          Perlbrew::Switch[$version],
                         ],
        }
    }
}
