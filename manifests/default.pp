exec { "apt-get update":
  path => "/usr/bin",
  }
  package { "nginx":
    ensure  => present,
  require => Exec["apt-get update"],
      }
      package { "rails":
        ensure => present,
          provider => gem,
          }
  service { "ngnix":
    ensure  => "running",
    require => Package["ngnix"],
          }
  file { "/var/www/sample-webapp":
    ensure  => "link",
    target  => "/vagrant/sample-webapp",
    require => Package["ngnix"],
    notify  => Service["ngnix"],
  }
