ntp
===

A basic module that overrides the /etc/ntp.conf with a list of servers. Modify
this module to default to internal timesource(s), etc.

Samples
-------
```
include ntp
```
```
ntp::config { 'default':
  servers => [ '0.rhel.pool.ntp.org', '1.rhel.pool.ntp.org', '2.rhel.pool.ntp.org' ] 
}
```
```
ntp::service { 'default': ensure => running, enable => true }
```
