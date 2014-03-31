#Class used to install logio monitor (server and client)
class logio {

  package {['nodejs', 'npm']:
    ensure => installed,
  }

  exec {'logio_installation':
    command     => '/usr/bin/npm install -g log.io',
    creates     => '/usr/lib/node_modules/log.io/index.js',
    environment => 'HOME=/root',
    require     => [ Package['nodejs'], Package['npm'] ],
  }

  file {'/var/log/logio':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
  }

  file {'/var/run/logio':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
  }

}
