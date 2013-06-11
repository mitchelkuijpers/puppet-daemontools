define daemontools::service($ensure="running") {

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
    content => "#!/bin/bash\nexec sleep 60",
  }

  service { $name:
    ensure   => $ensure,
    provider => daemontools,
    require  => File["/etc/service/${name}/run"],
  }

}
