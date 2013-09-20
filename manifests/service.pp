define ntp::service (
  $ensure = running,
  $enable = true
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'ntpd',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}
