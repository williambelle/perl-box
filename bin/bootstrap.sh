#!/usr/bin/env bash

# Update OS
sudo apt-get -q -y update

# Install utils package
sudo apt-get -y install build-essential curl zlib1g-dev libssl-dev

# Install Perl specific package
sudo apt-get -y install libperl-critic-perl
