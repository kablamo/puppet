define cpanm (
    $ensure  = 'present',
    $creates = $ensure ? {
        'present' => [ regsubst("${kablamo::perl_locallib}/lib/perl5/${title}.pm", "::", "/", 'G'), 
                       regsubst("${kablamo::perl_locallib}/lib/perl5/i686-linux/${title}.pm", "::", "/", 'G'), 
                       regsubst("${kablamo::perl_locallib}/lib/5.16.2/${title}.pm", "::", "/", 'G'), 
                       regsubst("${kablamo::perl_locallib}/lib/5.16.2/i686-linux/${title}.pm", "::", "/", 'G'), 
                     ],
        default   => '/asdfaevdsdfdfevevdf923',
    }
) {
    require kablamo::perl

    exec { "cpanm $title":
        command   => "${kablamo::perl_locallib}/bin/perl ${kablamo::perlbrew_root}/bin/cpanm --local-lib-contained=${kablamo::perl_locallib} $title",
        user      => $kablamo::user,
        group     => $kablamo::user,
        timeout   => 0,
        logoutput => true,
        creates   => $creates,
    }
}
