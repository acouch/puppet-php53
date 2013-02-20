class php53::mongo inherits php53 {

  package { 'mongo':
    name => [
      'mongo',
    ],
      ensure => installed
  }

  exec { 'pecl-install-mongo':
    command => "/usr/bin/pecl install mongo",
    unless => "/usr/bin/pear remote-list -c mongo",
    require => Package["mongo"],
  }

}
