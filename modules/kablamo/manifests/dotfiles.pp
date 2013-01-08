class kablamo::dotfiles {
    require kablamo::packages

    exec { clone-dotfiles:
        command => '/usr/bin/git clone https://github.com/kablamo/dotfiles.git /home/eric/code/dotfiles',
        user    => 'eric',
        group   => 'eric',
        creates => '/home/eric/code/dotfiles'
    }

    exec { setup-dotfiles:
        command => '/home/eric/code/dotfiles/bin/dotfiles',
        user    => 'eric',
        group   => 'eric',
        creates => '/home/eric/.tmux.conf',
    }
}
