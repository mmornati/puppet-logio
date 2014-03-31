class logio::server {

 require logio

 file {'/etc/init.d/logio-server':
    source => 'puppet:///modules/logio/logio-server-init',
    owner  => 'root',
    group  => 'root',
    mode   => 0755,
  }

  file {'/usr/bin/logio-server':
    source => 'puppet:///modules/logio/logio-server-wrapper',
    mode   => 0755,
    owner  => 'root',
    group  => 'root',
  }

  service {'logio-server':
    ensure  => running,
    enable  => true,
    require => [ Exec['logio_installation'], File['/var/log/logio'], File['/var/run/logio'], File['/etc/init.d/logio-server']  ],
  }

}
