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
class nodejs (
  $build = 'ubuntu-12-04_linux-headers-3.5.0-36-generic-v0.10.17',
  $user  = 'vagrant'
){

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

  exec {"echo 'export PATH=\$HOME/local/bin:\$PATH' >> /home/${user}/.bashrc":
    path        => '/usr/local/bin:/usr/bin:/usr/sbin:/bin',
    subscribe   => File["/home/${user}/local"],
    refreshonly => true
  }

  file { ['/var/tmp/build',"/home/${user}/local"]:
    ensure => 'directory',
    owner  => "${user}",
    mode   => 0755
  }

  file { '/var/tmp/build/node':
    ensure  => 'present',
    require => Package['apache2-utils', 'libssl-dev', 'curl', 'g++', 'python-software-properties'],
    mode    => 0711,
    owner   => "${user}",
    recurse => true,
    source  => ["puppet:///modules/nodejs/${build}"]
  }

  exec { 'make install':
    cwd         => '/var/tmp/build/node',
    user        => "${user}",
    path        => '/usr/local/bin:/usr/bin:/usr/sbin:/bin',
    require     => File['/var/tmp/build/node',"/home/${user}/local"],
    subscribe   => File['/var/tmp/build/node',"/home/${user}/local"],
    refreshonly => true,
    timeout     => 0
  }

}
