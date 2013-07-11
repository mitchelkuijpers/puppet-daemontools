# Daemontools Module

This module facilitates installing and setting up services managed by Daemontools.

## Parameters

 * ensure: running
 * command: Command line to run service.

## Usage

    daemontools::service {'myapp':
      ensure  => running,
      command => '/usr/bin/myapp',
    }
