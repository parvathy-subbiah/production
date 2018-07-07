class ntpd::installntp
{
package { 'ntp' :
ensure => installed
}
}
