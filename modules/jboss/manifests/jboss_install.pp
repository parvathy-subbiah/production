class jboss::jboss_install
(
$jboss_user = $jboss::jboss_user,
$jboss_group = $jboss::jboss_group,
$jboss_home - $jboss::jboss_home,
)
{
user { "$jboss_user" :
ensure => present,
groups => "$jboss_group",
require => Group["$jboss_group"],
}
group { "$jboss_group" :
ensure => present,
members => "$jboss_user",
before => 'User["$jboss_user"],
}
file { "${jboss_home}/jboss-as" :
ensure => 'present',
require => Exec["renaming the unzipped jboss"],
}
exec { "${jboss_home}/jboss-as-7.1.1.Final.zip" :
command => unzip -q ${jboss_home}/jboss-as-7.1.1.Final.zip,
cwd => "$jboss_home",
path => "/bin/",
}
exec { "renaming the unzipped jboss":
command => mv jboss-as-7.1.1.Final jboss-as,
cwd => "$jboss_home",
path => "/bin/",
require => Exec["${jboss_home}/jboss-as-7.1.1.Final.zip"],
}
exec { "changing the permissions":
command => "chown -Rf $jboss_group.$jboss_user ${jboss_home}/jboss-as",
cwd => "$jboss_home",
path => "/bin/",
require => File["${jboss_home}/jboss-as-7.1.1.Final.zip"],
}

}
