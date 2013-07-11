# Daemontools Module

This module facilitates installing and setting up services managed by Daemontools.

## Parameters

 * ensure: running, stopped. default: running
 * command: Command line to run service.
 * logpath: Directory to store log files in.

## Usage

    daemontools::service {'myapp':
      ensure  => running,
      command => '/usr/bin/myapp',
    }
