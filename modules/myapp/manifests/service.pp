class myapp::service inherits myapp {

  include daemontools::setup

  daemontools::service {'myapp':
    ensure  => running,
    command => '/usr/bin/myapp',
    require => Class['myapp::package'],
  }

}
