node 'kablamo.xen.prgmr.com' {
    include kablamo
    include exim
    include dovecot
    include nginx
}
node default {
    include kablamo
}
