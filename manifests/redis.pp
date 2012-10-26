# Using this because a proper PEAR wrapper failed for a pear repo with a folder on the URL.
# Tried: https://github.com/treehouseagency/puppet-pear but threw an error 'Cannot open "https://drewish.github.com/channel.xml"'
# This is a simpler method than troubleshooting that.
class php53::redis inherits php53 {

  exec { 'pear-add-phpredis-channel':
    command => "/usr/bin/pear channel-discover drewish.github.com/phpredis",
    unless => "/usr/bin/pear remote-list -c drewishPhpRedis",
  }

  exec { 'pecl-add-phpredis':
    command => "/usr/bin/pecl install drewishPhpRedis/PhpRedis",
    unless => "/usr/bin/pear remote-list -c drewishPhpRedis",
    require => Exec["pear-add-phpredis-channel"],
  }

  file { "/etc/php5/conf.d/redis.ini":
    require => Package['php53'],
    source => "puppet:///modules/php53/redis.ini",
    owner => root,
    group => root,
  }
}
