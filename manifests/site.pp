node eric, 'kablamo.xen.prgmr.com' {
    include kablamo
    include varnish
    include exim
}
node default {
    include kablamo
}
