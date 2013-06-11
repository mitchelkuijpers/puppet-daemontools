Install daemontools

`sudo puppet apply --modulepath=puppet-daemontools/modules -e "include daemontools::setup"`

Install test app

`sudo puppet apply --modulepath=puppet-daemontools/modules -e "include myapp::setup"`

Debug processes

`ps -edf | grep -E "svscan|supervise|multilog|myapp" | grep -v grep`
