define daemontools::service($ensure="running", $command) {

  file {"/etc/service/${name}":
    ensure => directory,
  }

  file {"/etc/service/${name}/supervise":
    ensure  => directory,
    require => File["/etc/service/${name}"],
  }

  file {"/etc/service/${name}/run":
    ensure  => present,
    mode    => 0755,
    require => File["/etc/service/${name}"],
    content => template("daemontools/service.erb"),
  }

  service { $name:
    ensure   => $ensure,
    provider => daemontools,
    require  => File["/etc/service/${name}/run"],
  }

}
