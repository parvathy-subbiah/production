class httpd::serviceenable
{
service { "httpd" :
ensure => running 
}
}
