class ntp {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'ntp', 'ntpdate' ],
  }

  package { $required: ensure => latest }

}
