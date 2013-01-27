Puppet for kablamo
==================

[Puppet](http://docs.puppetlabs.com) does configuration management.  This
project is allows me to more easily install and configure all my stuff whenever
I get a new Ubuntu box that I need to setup.

What it does
------------

 - Installs some Ubuntu packages.
 - Installs my dotfiles (https://github.com/kablamo/dotfiles).
 - Installs Perlbrew
 - Installs cpanm
 - Installs CPAN modules

How to use it
-------------

    sudo apt-get install puppet git
    git clone https://github.com/kablamo/puppet.git ~/.puppet
    sudo puppet apply --confdir=/home/eric/.puppet ~/.puppet/manifests/site.pp -v

(Or I can just type 'p' because I have that last line as an alias in my .bashrc.)

TODO
----

If the new Ubuntu box is a server then configure some extra stuff.  This is the
main reason for going through all this trouble.  I want to more easily handle
catastrophic failures or switching hosting providers.

Also:

    mkdir ~/.ssh
    chmod g-rwx,o-rwx ~/.ssh
    cat >> ~/.ssh/authorized_keys2

What it does not do
-------------------

This is mostly a list of tasks for myself.  I should make this into a bootstrap
script.

    adduser eric
    passwd
    adduser eric sudo
    # if wget fails, but ping works, disable ipv6 in /etc/network/interfaces 
    

