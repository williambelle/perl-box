# Install Perlbrew
class perlbrew {

  # Perl version to install
  $perlO = '5.8.9 5.10.1 5.12.5 5.14.4 5.16.3 5.18.4 '
  $perlN = '5.20.3 5.22.4 5.24.3 5.26.1'

  # Perlbrew root
  $perlbrewRoot = 'PERLBREW_ROOT=/home/vagrant/perl5/perlbrew'

  # Perlbrew path
  $perlbrew = '/home/vagrant/perl5/perlbrew/bin/perlbrew'

  # Add perlbrew to $PATH
  $source = 'echo "source ~/perl5/perlbrew/etc/bashrc" >> /home/vagrant/.bashrc'

  exec { 'install perlbrew':
    require     => Package['curl'],
    environment => $perlbrewRoot,
    command     => 'sudo curl -kL http://install.perlbrew.pl | bash',
    user        => 'vagrant',
    cwd         => '/home/vagrant',
    timeout     => 100,
    before      => Exec['add perlbrew to $PATH'],
  }

  exec { 'add perlbrew to $PATH':
    unless    => 'grep -c "/perl5/perlbrew/etc/bashrc" /home/vagrant/.bashrc',
    command   => $source,
    user      => 'vagrant',
    logoutput => on_failure,
    before    => Exec['init perlbrew'],
  }

  exec { 'init perlbrew':
    environment => $perlbrewRoot,
    command     => "${perlbrew} init",
    user        => 'vagrant',
    before      => Exec['install all perl'],
  }

  exec { 'install all perl':
    environment => $perlbrewRoot,
    command     => "${perlbrew} install-multiple --notest ${perlO}${perlN}",
    timeout     => 10000,
    user        => 'vagrant',
    cwd         => '/home/vagrant',
    logoutput   => true,
    before      => Exec['set default perl'],
  }

  exec { 'set default perl':
    environment => $perlbrewRoot,
    command     => "${perlbrew} switch perl-5.26.1",
    user        => 'vagrant',
    before      => Exec['install cpanm'],
  }

  exec { 'install cpanm':
    environment => $perlbrewRoot,
    command     => "${perlbrew} install-cpanm",
    user        => 'vagrant',
    cwd         => '/home/vagrant',
  }
}
