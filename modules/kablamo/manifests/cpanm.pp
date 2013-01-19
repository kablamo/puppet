define cpanm (
    $ensure  = 'present',
    $creates = $ensure ? {
        'present' => regsubst("${kablamo::perl_locallib}/lib/perl5/${title}.pm", "::", "/", 'G'), 
        default   => '/asdfaevdsdfdfevevdf923',
    }
) {
    require kablamo::perl

    exec { "cpanm $title":
        command   => "${kablamo::perlbrew_root}/bin/cpanm --local-lib-contained=${kablamo::perl_locallib} $title",
        user      => $kablamo::user,
        group     => $kablamo::user,
        logoutput => true,
        creates   => $creates,
    }
}
