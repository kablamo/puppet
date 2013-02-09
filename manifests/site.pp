node eric, 'kablamo.xen.prgmr.com' {
    include kablamo
    include varnish
    include exim
    include dovecot
    include perlbal
}
node default {
    include kablamo
}
