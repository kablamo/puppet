node eric, 'kablamo.xen.prgmr.com' {
    include kablamo
    include varnish
    include exim
    include dovecot
}
node default {
    include kablamo
}
