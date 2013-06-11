## config.yml

A few config settings for testing daemontools

### Settings

* stdout_sync - Control how stdout gets buffered.

  true: write each line as they are received
  
  false: buffer output (not sure when it gets written. perhaps at 4KB or something)

* prefix - Prefix to the log messages

## myapp

A simple ruby application for testing.
