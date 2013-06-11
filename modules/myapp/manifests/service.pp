class myapp::service inherits myapp {

  include daemontools::setup

  daemontools::service {'myapp':
    ensure  => stopped,
    command => '/usr/bin/myapp',
  }

}
