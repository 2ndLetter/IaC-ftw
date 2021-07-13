service { 'ntpd':
  ensure => running,
  enable   => true,
}