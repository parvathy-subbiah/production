class httpd::configuration
(
$apache_portno             = $httpd::apache_portno,
$apache_serverip           = $httpd::apache_serverip,
$website_location          = $httpd::website_location,
$configuration_location    = $httpd::configuration_location
)
{
file { "${configuration_location}/httpd.conf" :
ensure => present,
content => template('httpd/httpd.conf.erb'),
}
file { "$website_location/index.html" :
ensure => present,
source => "puppet:///modules/httpd/index.html"
}
}
