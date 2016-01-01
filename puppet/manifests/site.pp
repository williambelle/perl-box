node default {
  Exec {
    path => ['/bin', '/usr/bin/', '/sbin/', '/usr/sbin/', '/usr/local/bin/']
  }

  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }

  $packages = [ 'build-essential', 'curl', 'libperl-critic-perl' ]
  package { $packages:
    ensure => latest
  }

  include perlbrew
}
