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
#  class{ 'nodejs': 
#    release => 'ubuntu-12-04_linux-headers-3.5.0-36-generic-v0.10.17'
#  }
#   
#
class nodejs ($build = 'ubuntu-12-04_linux-headers-3.5.0-36-generic-v0.10.17') {

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

  package {'python-software-properties':
    ensure => installed
  }



  file { '/var/tmp/build/node':
    ensure => present,
    require => Package['apache2-utils', 'libssl-dev', 'curl', 'g++', 'python-software-properties'],
    mode   => 0711,
    source => ["puppet:///modules/nodejs/${build}"]
  }


  exec { 'make install':
    cwd     => '/var/tmp/build/node',
    path => '/usr/local/bin:/usr/bin:/usr/sbin:/bin',
    subscribe => File['/var/tmp/build/node'],
    refreshonly => true,
    timeout => 0
  }

}
