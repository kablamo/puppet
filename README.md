Puppet for kablamo
==================

[Puppet](http://docs.puppetlabs.com) does configuration management.  This
project is allows me to more easily install and configure all my stuff whenever
I get a new Ubuntu box that I need to setup.

How to use it
-------------

    sudo apt-get install puppet git libpath-class-perl
    git clone https://github.com/kablamo/puppet.git ~/.puppet
    sudo puppet apply --confdir=/home/eric/.puppet ~/.puppet/manifests/site.pp -v


What it does
------------

 - Installs some Ubuntu packages.
 - Installs my dotfiles (https://github.com/kablamo/dotfiles).
 - Installs Perlbrew
 - Install cpanm


TODO
----

 - Task::BeLike::KABLAMO

If the new Ubuntu box is a server then it configures some extra stuff.  This is
the main reason for going through all this trouble.  I want to be able to
easily handle catastrophic failures or switching hosting providers.
