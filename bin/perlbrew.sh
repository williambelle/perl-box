#!/usr/bin/env bash

PERLBREW_BIN='/home/vagrant/perl5/perlbrew/bin/perlbrew'

PERL_OLD='5.8.9 5.10.1 5.12.5 5.14.4 5.16.3 5.18.4 '
PERL_NEW='5.20.3 5.22.4 5.24.4 5.26.3 5.28.2 5.30.0'

# Install Perlbrew
sudo curl -kL https://install.perlbrew.pl | bash

# Add Perlbrew to PATH
echo "source ~/perl5/perlbrew/etc/bashrc" >> /home/vagrant/.bashrc

# Install all Perl version
$PERLBREW_BIN install-multiple --notest $PERL_OLD $PERL_NEW

# Install cpanm
$PERLBREW_BIN install-cpanm

# Install Perl dev dependencies
$PERLBREW_BIN exec cpanm Test::CheckManifest Test::Pod::Coverage
$PERLBREW_BIN exec cpanm Test::Pod Test::Perl::Critic

# Switch to latest Perl version
$PERLBREW_BIN switch perl-5.30.0
