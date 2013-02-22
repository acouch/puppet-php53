class php53::mongo inherits php53 {

  package { 'mongo':
    name => [
      'mongodb',
    ],
      ensure => installed
  }

  exec { 'pecl-install-mongo':
    command => "/usr/bin/pecl install mongo",
    unless => "/usr/bin/pecl info mongo",
    require => Package["mongo"],
  }

}
