# Class: nodejs
#
# Just a wrapper to be able to install npm and node
#
# Parameters:
#
# Actions:
#   - Install node
#   - Install npm
#
# Requires:
#
# Sample Usage:
#  class{ 'nodejs': }
#   
#
class nodejs () {

  package {'g++':
    ensure => installed
  }

  package {'curl':
    ensure => installed
  }

  package {'libssl-dev':
    ensure => installed
  }

  package {'apache2-utils':
    ensure => installed
  }

  package {'git-core':
    ensure => installed,
    require => [Package['apache2-utils'],Package['libssl-dev'],Package['curl'],Package['g++']]
  } ->

  file { '/usr/local/bin/install_node.sh':
    ensure => present,
    mode   => 0711,
    source => ['puppet:///modules/nodejs/install_node.sh']
  } ->


  exec { 'install_node.sh':
    cwd     => "/var/tmp",
    path => '/usr/local/bin:/usr/bin:/usr/sbin:/bin',
    timeout => 0
  }

}
