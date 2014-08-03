node default {
	exec { 'apt-get update':
		command => '/usr/bin/apt-get update'
	}

	package { 'build-essential':
		ensure => latest
	}
}
