class myapp::service inherits myapp {

  include daemontools::setup

  daemontools::service {'test':
    ensure => stopped,
  }

}
