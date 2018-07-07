class ntpd::configurentp
(
$ipaddress = $ntpd::ipaddress
)
{
file { '/etc/ntp.conf' :
content => template('ntpd/ntp.conf.erb'),
}
}
