class ntp {
  $required = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'ntp', 'ntpdate' ],
  }

  package { $required: ensure => latest }

}

define ntp::service ( $ensure = running,
                      $enable = true ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'ntpd',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}

define ntp::config ( $servers ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'ntpd',
  }

  $config = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/ntp.conf',
  }

  file { $config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0664',
    content => template('ntp/ntp.erb'),
    notify  => Service[$service],
  }

}
