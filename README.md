#Puppet docker_compose module

##Overview

Proof of concept Puppet module to manage a docker-compose application

##Module Description

This Puppet module allows to manage a docker-compose application defined via
a YAML file

##Usage

After you've installed the docker_compose module:

```
include docker_compose
```

This will install docker-compose into a Python virtualenv and will configure it.
The latest version will be installed by default. If a specific version is
required, it can be passed as parameter:

```
class { 'docker_compose':
  version => '1.2.0',
}
```

To manage a docker-compose application:

```
docker_compose::application { 'foo_app':
  ensure  => 'present',
  content => file('files/foo_app.yaml'),
}
```

##Requirements

The following Puppet modules are required:
* stankevich/python >= 1.9.4

##Disclaimer

This module is created as a proof of concept and it's not intended to be used
in production environments.

##Author

Carles Amigó - http://fr3nd.net
