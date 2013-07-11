# Daemontools Module

This module facilitates installing and setting up services managed by Daemontools.

## Parameters

## Usage

## Testing

Install daemontools

`sudo puppet apply --modulepath=puppet-daemontools/modules -e "include daemontools::setup"`

Install test app

`sudo puppet apply --modulepath=puppet-daemontools/modules -e "include myapp::setup"`

Debug processes

`ps -edf | grep -E "svscan|supervise|multilog|myapp" | grep -v grep`

Start over

`ps -edf | grep -E "svscan|supervise|multilog|myapp" | grep -v grep | awk '{print $2}' | xargs sudo kill -9`
`rm -rf /etc/service/*`
`apt-get remove daemontools`
