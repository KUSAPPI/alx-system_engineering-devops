# Define a Puppet class for installing Flask
class flask_install {
  package { 'python3-pip':
    ensure => installed,
  }

  # Use pip3 to install Flask version 2.1.0
  exec { 'install_flask':
    command => '/usr/bin/pip3 install Flask==2.1.0',
    path    => ['/usr/bin'],
    creates => '/usr/local/lib/python3.8.10/dist-packages/flask',
    require => Package['python3-pip'],
  }
}

# Apply the class to install Flask
include flask_install
