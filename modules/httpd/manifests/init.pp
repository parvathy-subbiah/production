# == Class: httpd
#
# Full description of class httpd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'httpd':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class httpd 
(
$apache_portno             = $httpd::params::apache_portno,
$apache_serverip           = $httpd::params::apache_serverip,
$website_location          = $httpd::params::website_location,
$configuration_location    = $httpd::params::configuration_location
)inherits httpd::params
{
include httpd::install
include httpd::configuration
include httpd::serviceenable
Class [ 'httpd::install' ] ->
	Class [ 'httpd::configuration' ] ->
		Class [ 'httpd::serviceenable' ]
	
}
