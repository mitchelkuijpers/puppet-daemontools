Install daemontools

`sudo puppet apply --modulepath=puppet-daemontools/modules -e "include daemontools::setup"`

Install test app

`sudo puppet apply --modulepath=puppet-daemontools/modules -e "include myapp::setup"`
