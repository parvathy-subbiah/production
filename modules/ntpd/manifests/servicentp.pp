class ntpd::servicentp
{
service { 'ntpd' :
ensure => 'running',
subscribe => File['/etc/ntp.conf']
}
}
