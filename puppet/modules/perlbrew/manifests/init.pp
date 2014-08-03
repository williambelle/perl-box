class perlbrew {
	exec { 'install perlbrew':
		require     => Package['curl'],
		environment => 'PERLBREW_ROOT=/home/vagrant/perl5/perlbrew',
		command     => 'sudo curl -kL http://install.perlbrew.pl | bash',
		user        => 'vagrant',
		cwd         => '/home/vagrant',
		timeout     => 100,
		before      => Exec['add perlbrew to $PATH'],
	}

	exec { 'add perlbrew to $PATH':
		unless    => 'grep -c "/perl5/perlbrew/etc/bashrc" /home/vagrant/.bashrc',
		command   => 'echo "source ~/perl5/perlbrew/etc/bashrc" >> /home/vagrant/.bashrc',
		user      => 'vagrant',
		logoutput => on_failure,
		before    => Exec['init perlbrew'],
	}

	exec { 'init perlbrew':
		environment => 'PERLBREW_ROOT=/home/vagrant/perl5/perlbrew',
		command     => '/home/vagrant/perl5/perlbrew/bin/perlbrew init',
		user        => 'vagrant',
		before      => Exec['install all perl'],
	}

	exec { 'install all perl':
		environment => 'PERLBREW_ROOT=/home/vagrant/perl5/perlbrew',
		command     => '/home/vagrant/perl5/perlbrew/bin/perlbrew install-multiple --notest 5.6.2 5.8.9 5.10.1 5.12.5 5.14.4 5.16.3 5.18.2 5.20.0',
		timeout     => 10000,
		user        => 'vagrant',
		cwd         => '/home/vagrant',
		logoutput   => true,
		before      => Exec['set default perl'],
	}

	exec { 'set default perl':
		environment => 'PERLBREW_ROOT=/home/vagrant/perl5/perlbrew',
		command     => '/home/vagrant/perl5/perlbrew/bin/perlbrew switch perl-5.20.0',
		user        => 'vagrant',
		cwd         => '/home/vagrant',
		before      => Exec['install cpanm'],
	}

	exec { 'install cpanm':
		environment => 'PERLBREW_ROOT=/home/vagrant/perl5/perlbrew',
		command     => '/home/vagrant/perl5/perlbrew/bin/perlbrew install-cpanm',
		user        => 'vagrant',
		cwd         => '/home/vagrant',
	}
}
