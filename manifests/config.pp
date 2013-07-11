class daemontools::config inherits daemontools {

  file {'/etc/service':
    ensure  => directory,
    mode    => 0755,
    owner   => root,
    group   => root,
  }

}
