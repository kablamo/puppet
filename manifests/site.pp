#file { aliases:
#  path    => '/home/eric/.aliases',
#  ensure  => present,
#  owner   => 'eric',
#  group   => 'eric',
#  mode    => 0644,
#  source  => 'puppet:///files/home/eric/.aliases'
#}
#file { varnish:
#  path    => '/etc/varnish/default.vcl',
#  ensure  => present,
#  owner   => 'root',
#  group   => 'root',
#  mode    => 0644,
#  source  => 'puppet:///files/etc/varnish/default.vcl'
#}

package { atop:        ensure => latest }
package { curl:        ensure => latest }
package { git:         ensure => latest }
package { htop:        ensure => latest }
package { locate:      ensure => latest }
package { sqlite3-doc: ensure => latest }
package { sqlite3:     ensure => latest }
package { sshfs:       ensure => latest }
package { tmux:        ensure => latest }
package { varnish:     ensure => latest }
package { vim-nox:     ensure => latest }

exec { clone-dotfiles:
    command => '/usr/bin/git clone https://github.com/kablamo/dotfiles.git /home/eric/code/dotfiles',
    creates => '/home/eric/code/dotfiles'
}

exec { setup-dotfiles:
    command => '/home/eric/code/dotfiles/bin/dotfiles',
    creates => '/home/eric/.tmux.conf',
}

#exec { npm:
#    command => '/usr/bin/curl http://npmjs.org/install.sh | sh',
#    creates => '/some/directory/somewhere'
#}
