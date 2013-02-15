Puppet for kablamo
==================

[Puppet](http://docs.puppetlabs.com) does configuration management.  This
project is allows me to more easily install and configure all my stuff whenever
I get a new Ubuntu box that I need to setup.

What it does
------------

 - Installs some Ubuntu packages.
 - Make sure $USER is in the sudo group and the shell is /bin/bash
 - Put my public key in .ssh/authorized_keys
 - Installs my dotfiles (https://github.com/kablamo/dotfiles).
 - Installs Perlbrew
 - Installs cpanm
 - Installs CPAN modules
 - Installs and configures nginx
 - Installs and configures dovecot

How to use it
-------------

    sudo apt-get install puppet git
    git clone https://github.com/kablamo/puppet.git ~/.puppet
    sudo puppet apply --confdir=/home/eric/.puppet ~/.puppet/manifests/site.pp -v

After running the above commands once, I can just type `p` to rerun `puppet apply` because I
have an alias setup for it in my .bashrc.

What it does not do
-------------------

Basically this doesn't do password type tasks because this is a public repo.
So this is a list of password type tasks for myself to remember to do manually:

    adduser eric
    passwd
    adduser eric sudo

    # if wget fails, but ping works, request an ipv6 ip address or disable ipv6
    #    in /etc/network/interfaces and restart the interfaces with 
    #    'ifdown eth0 && ifup eth0'

    # generate new ssh keys with 'ssh-keygen -t dsa'
    # add new public key to github:    https://github.com/settings/ssh
    # add new public key to bitbucket: https://bitbucket.org/account/user/kablamo/ssh-keys/

    # copy/create ssl keys. for dovecot and nginx.

    # for networthify backups:
    # create ~/.gnupg/config: gpg --list-keys 
    #              copy keys: scp ~/.gnupg/*ring.gpg newhost:~/.gnupg/

