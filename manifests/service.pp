define daemontools::service($ensure="running", $logpath = '', $command) {

  if $logpath != '' {
    $real_logpath = $logpath
  } else {
    $real_logpath = "/etc/service/${name}/log"
  }

  #
  # Folder structure
  #

  file {"/etc/service/${name}":
    ensure => directory,
    notify => Service[$name],
  }

  file {"/etc/service/${name}/supervise":
    ensure  => directory,
    require => File["/etc/service/${name}"],
    notify  => Service[$name],
  }

  file {"/etc/service/${name}/log":
    ensure  => directory,
    require => File["/etc/service/${name}"],
    notify  => Service[$name],
  }

  #
  # Run files
  #

  file {"/etc/service/${name}/log/run":
    ensure  => present,
    mode    => 0755,
    content => template("daemontools/log.erb"),
    require => File["/etc/service/${name}/log"],
    notify  => Service[$name],
  }

  file {"/etc/service/${name}/run":
    ensure  => present,
    mode    => 0755,
    content => template("daemontools/service.erb"),
    require => File["/etc/service/${name}"],
    notify  => [Exec["waitforit"],Service[$name]],
  }

  #
  # Hack
  #
  exec {'waitforit':
    command     => '/bin/sleep 10',
    refreshonly => true,
  }

  #
  # Service
  #

  service { $name:
    ensure   => $ensure,
    provider => daemontools,
    require  => [
      Exec["waitforit"],
      File["/etc/service/${name}/run"],
      File["/etc/service/${name}/supervise"],
    ],
  }

}
