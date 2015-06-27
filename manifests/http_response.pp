# == Class: datadog_checks::http_response
#
#
# === Parameters
#
# this class takes no parameters
#
# === Variables
#
# this class has no Variables
#
# === Examples
#
#  class { 'datadog_checks::http_response': }
#
# === Authors
#
# Sven Winkelmann <sven.winkelmann@blue1.at>
#
# === Copyright
#
# Copyright 2015 Sven Winkelmann, unless otherwise noted.
#
class datadog_checks::http_response {

  concat { '/etc/dd-agent/conf.d/http_response.yaml':
    ensure  => present,
    require => [Class['datadog_agent']],
  }
  concat::fragment { 'header':
    target  => '/etc/dd-agent/conf.d/http_response.yaml',
    content => 'init_config:

instances:
',
    order   => '01',
    require => Package[$datadog_agent::params::package_name],
    notify  => Service[$datadog_agent::params::service_name],
  }
  file { '/etc/dd-agent/checks.d/http_response.py':
    ensure  => present,
    source  => "puppet:///modules/${module_name}/http_response.py",
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => [Class['datadog_agent']],
  }
}
