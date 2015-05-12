define docker_compose::application (
  $content,
  $ensure = 'present',
) {

  $sanitised_title = regsubst($title, '[^0-9A-Za-z.\-]', '-', 'G')

  file { "/etc/docker-compose/${name}.yml":
    ensure  => $ensure,
    content => $content,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service["docker-${sanitised_title}"],
  }

  file { "/etc/init.d/docker-${sanitised_title}":
    ensure  => present,
    content => template('docker_compose/service.erb'),
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
  }

  service { "docker-${sanitised_title}":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => File["/etc/init.d/docker-${sanitised_title}"],
  }

}
