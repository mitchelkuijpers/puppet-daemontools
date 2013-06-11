class daemontools::package inherits daemontools {

  package {'daemontools':
    ensure => present,
  }

  package {'daemontools-run':
    ensure  => present,
    require => Package['daemontools'],
  }

}
