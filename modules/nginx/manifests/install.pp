class nginx::install
(
$package_name = $nginx::package_name,
$service_name = $nginx::service_name,
$config_loc   = $nginx::config_loc,
$port         = $nginx::port,
$listen_port  = $nginx::listen_port,
)
{
package { "$package_name" :
ensure => 'installed',
} ->

file { "$config_loc" :
ensure => 'present',
content => template('nginx/nginx.conf.erb')
} ->

service { "$service_name" :
ensure => 'running',
subscribe => File["$config_loc"]
}
}
