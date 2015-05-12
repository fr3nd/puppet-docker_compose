class docker_compose (
  $version = 'latest',
) {

  file { '/etc/docker-compose':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  python::virtualenv { '/opt/docker-compose':
    ensure  => present,
    version => 'system',
    owner   => 'root',
    group   => 'root',
  }

  python::pip { 'docker-compose':
    ensure     => $version,
    virtualenv => '/opt/docker-compose',
  }

  file { '/usr/local/bin/docker-compose':
    ensure  => link,
    target  => '/opt/docker-compose/bin/docker-compose',
    require => Python::Pip['docker-compose'],
  }

}
