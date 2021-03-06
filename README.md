Perl Box
========

Synopsis
--------

Vagrant configuration for developing Perl modules.

The box include:

* Ubuntu 18.04 LTS 64-bit
* Perlbrew, cpanm
* Perl :
  * 5.8.9
  * 5.10.1
  * 5.12.5
  * 5.14.4
  * 5.16.3
  * 5.18.4
  * 5.20.3
  * 5.22.4
  * 5.24.4
  * 5.26.3
  * 5.28.2
  * 5.30.0
* Perl Critic

Build
-----

```bash
vagrant up
```

Usage
-----

This will SSH into the running Vagrant machine and give you access to the shell.

```bash
vagrant ssh
```

This will install all the dependencies for every Perl version.

```bash
cd /to/my/perl/module
perlbrew exec cpanm --installdeps .
```

And finally, to test your module against each version of Perl

```bash
perlbrew exec prove -Ilib/ -r
```

Useful links
------------

* [VirtualBox][1]
* [Vagrant][2]
* [Perlbrew][3]
* [cpanm][4]
* [Perl-Critic][5]

License
-------

The MIT License (MIT)

[1]: https://www.virtualbox.org/
[2]: http://www.vagrantup.com/
[3]: http://perlbrew.pl/
[4]: http://search.cpan.org/dist/App-cpanminus/bin/cpanm
[5]: http://search.cpan.org/~petdance/Perl-Critic/lib/Perl/Critic.pm
