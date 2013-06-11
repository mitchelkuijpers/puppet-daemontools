class myapp::setup inherits myapp {

  include myapp::package
  include myapp::config
  include myapp::service

}
