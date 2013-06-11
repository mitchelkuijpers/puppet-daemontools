class myapp::config inherits myapp {

  file {'/etc/myapp.yml':
    ensure  => present,
    source  => 'puppet:///modules/myapp/config.yml',
    notify  => Class['myapp::service'],
    require => Class['myapp::package'],
  }

}
