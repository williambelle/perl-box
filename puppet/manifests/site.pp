node default {
  Exec {
    path => ['/bin', '/usr/bin/', '/sbin/', '/usr/sbin/', '/usr/local/bin/']
  }

  exec { 'apt-get -q -y update':
    command => 'apt-get -q -y update'
  }

  $packages = [
    'build-essential',
    'curl',
    'libperl-critic-perl',
    'libssl-dev'
  ]

  package { $packages:
    ensure  => latest,
    require => Exec['apt-get -q -y update']
  }

  include perlbrew
}
