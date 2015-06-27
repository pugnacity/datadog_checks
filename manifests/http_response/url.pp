# == Class: datadog_checks::http_response
#
# === Parameters
#
# Document parameters here.
#
# [*url*]
# which URL should be checked
#
# [*timeout*]
# timeout for the connection
#
# [*statuscode*]
# status which is okay for this reponse
#
# === Examples
#
# datadog_checks::http_response::url { 'heise':
#  url         => 'http://www.heise.de',
#  timeout     => '5',
#  status_code => '200',
# }
#
# === Authors
#
# Sven Winkelmann <sven.winkelmann@blue1.at>
#
# === Copyright
#
# Copyright 2015 Sven Winkelmann, unless otherwise noted.
#
define datadog_checks::http_response::url (
  $url,
  $timeout    = '5',
  $status_code = '200'
) {

  concat::fragment { $name:
    target  => '/etc/dd-agent/conf.d/http_response.yaml',
    content => template('datadog_checks/http_response.erb'),
    order   => '10',
  }
}
