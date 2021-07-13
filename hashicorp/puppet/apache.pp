class { 'apache':
  default_vhost => true,
}

apache::vhost { 'vhost.example.com':
  port    => '80',
  docroot => '/var/app/html',
}