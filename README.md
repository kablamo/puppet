Puppet for kablamo
==================

[Puppet](http://docs.puppetlabs.com) does configuration management.  I use it
to manage all the computers I use.  This project is allows me to install and
configure all my stuffs whenever I get a new Ubuntu box to play with.

How to use it
-------------

These are the commands I run when I get on a new Ubuntu box:

    sudo apt-get install puppet git libpath-class-perl
    git clone https://github.com/kablamo/puppet.git ~/code/puppet
    puppet apply ~/code/puppet/manifests/site.pp --verbose


What it does
------------

 - Installs some Ubuntu packages.
 - Installs my dotfiles (https://github.com/kablamo/dotfiles).
 - Installs Perl stuff:
  - locallib
  - cpanm
  - Task::BeLike::KABLAMO


TODO
----

If the new Ubuntu box is a server then it configures some extra stuff.  This is
the main reason for going through all this trouble.  I want to be able to
easily handle catastrophic failures or switching hosting providers.
