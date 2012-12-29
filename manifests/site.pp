file {'aliases':
  path    => '/home/eric/.aliases',
  ensure  => present,
  owner   => 'eric',
  group   => 'eric',
  mode    => 0644,
  source  => '/home/eric/code/puppet/files/home/eric/.aliases'
}
file {'varnish':
  path    => '/etc/varnish/default.vcl',
  ensure  => present,
  owner   => 'root',
  group   => 'root',
  mode    => 0644,
  source  => '/home/eric/code/puppet/files/etc/varnish/default.vcl'
}

package { 'git': ensure => present }
