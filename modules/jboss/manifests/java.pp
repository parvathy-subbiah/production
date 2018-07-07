class jboss::java
(
$java_home = $jboss::java_home,
)
{
file { '${$java_home}/jdk1.7.0_80' :
ensure => 'directory',
}
}
