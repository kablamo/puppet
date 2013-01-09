class perlbrew (
    $user,
    $group,
    $perlbrew_root,
    $perlbrew_bin  = "${perlbrew_root}/bin/perlbrew",
    $cpanm_url     = "http://github.com/miyagawa/cpanminus/raw/master/cpanm",
) {
    exec { $perlbrew_bin:
        command => "/usr/bin/curl -kL http://install.perlbrew.pl | /bin/bash",
        user    => $user,
        group   => $group,
        creates => $perlbrew_bin,
        require => [ Package["build-essential"], Package["curl"] ],
    }

    exec { "perlbrew_init":
        command => "/bin/bash -c 'PERLBREW_ROOT=${perlbrew_root} ${perlbrew_bin} init'",
        user    => $user,
        group   => $group,
        creates => "${perlbrew_root}/perls",
        require => Exec[$perlbrew_bin],
    }

    define install_perl ($version) {
        exec { "install_perl_${version}":
            command => "/bin/bash -c 'PERLBREW_ROOT=${perlbrew_root} ${perlbrew_bin} install ${version} --as ${version} -Accflags=-fPIC -Dcccdlflags=-fPIC'",
            timeout => 3600,
            user    => $user,
            group   => $group,
            creates => "${perlbrew_root}/perls/${version}",
        }
    }
  
    define install_cpanm ($version) {
        exec { "install_cpanm_${version}":
            # TODO do something about this comment
            # puppet seems to change the current user weirdly when using the
            # user/group options. That causes cpanm to use /root/.cpanm for it's
            # temporary storage, which happens to not be writable for the perlbrew
            # user. Use /bin/su to work this around.
            command => "/bin/bash -c 'PERLBREW_ROOT='${perlbrew_root} ${perlbrew_bin} install-cpanm",
            user    => $user,
            group   => $group,
            creates => "${perlbrew_root}/perls/${version}/bin/cpanm",
            require => Perlbrew::Install_perl[$version],
        }
    }
}
