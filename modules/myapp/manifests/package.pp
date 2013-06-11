class myapp::package inherits myapp {

  file {'/usr/bin/myapp':
    ensure => present,
    mode   => 0755,
    owner  => root,
    group  => root,
    source => 'puppet:///modules/myapp/myapp',
    notify => Class['myapp::service'],
  }

}
