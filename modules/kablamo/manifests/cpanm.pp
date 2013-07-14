# TODO put this into the perlbrew package?
define cpanm (
    $ensure  = 'present',
    $creates = $ensure ? {
        'present' => [ regsubst("${kablamo::perl_lib}/lib/site_perl/${kablamo::perl_version}/${title}.pm", "::", "/", 'G'), 
                       regsubst("${kablamo::perl_lib}/lib/site_perl/${kablamo::perl_version}/i686-linux/${title}.pm", "::", "/", 'G'), 
                       regsubst("${kablamo::perl_lib}/lib/site_perl/${kablamo::perl_version}/x86_64-linux/${title}.pm", "::", "/", 'G'), 
                       regsubst("${kablamo::perl_lib}/lib/${kablamo::perl_version}/${title}.pm", "::", "/", 'G'), 
                       regsubst("${kablamo::perl_lib}/lib/${kablamo::perl_version}/i686-linux/${title}.pm", "::", "/", 'G'), 
                       regsubst("${kablamo::perl_lib}/lib/${kablamo::perl_version}/x86_64-linux/${title}.pm", "::", "/", 'G'), 
                     ],
        default   => '/asdfaevdsdfdfevevdf923',
    }
) {
    require kablamo::perl

    exec { "cpanm $title":
        command   => "${kablamo::perl_lib}/bin/perl ${kablamo::perlbrew_root}/bin/cpanm $title",
        user      => $kablamo::user,
        group     => $kablamo::user,
        timeout   => 0,
        logoutput => true,
        creates   => $creates,
#        require   => Perlbrew::Install_cpanm[$kablamo::perl_version]
    }
}
