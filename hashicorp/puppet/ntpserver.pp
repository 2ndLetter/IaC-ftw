node default {
  class { 'ntp':
        servers => ['time.google.com'],
  }
}