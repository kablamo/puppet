class kablamo::dotfiles {
    require kablamo::packages

    exec { clone-dotfiles:
        command => '/usr/bin/git clone https://github.com/kablamo/dotfiles.git /home/eric/code/dotfiles',
        creates => '/home/eric/code/dotfiles'
    }

    exec { setup-dotfiles:
        command => '/home/eric/code/dotfiles/bin/dotfiles',
        creates => '/home/eric/.tmux.conf',
    }
}
