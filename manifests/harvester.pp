class logio::harvester(
   $logio_server = "localhost"
) {
 
 require logio

 file {'/etc/init.d/logio-harvester':
    source  => 'puppet:///modules/logio/logio-harvester-init',
    owner   => 'root',
    group   => 'root',
    mode    => 0755,
    require => File['/usr/bin/logio-harvester'],
  }

  file {'/usr/bin/logio-harvester':
    source => 'puppet:///modules/logio/logio-harvester-wrapper',
    mode   => 0755,
    owner  => 'root',
    group  => 'root',
  }

  file {'/root/.log.io/harvester.conf':
    content => template("logio/harvester.conf.erb"),
    owner   => 'root',
    group   => 'root',
    require => Exec['logio_installation'],
    notify  => Service['logio-harvester'],
  }

  service {'logio-harvester':
    ensure  => running,
    enable  => true,
    require => [ Exec['logio_installation'], File['/var/run/logio'], File['/var/log/logio'], File['/etc/init.d/logio-harvester'] ],
  }

}


