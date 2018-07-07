class java::versioncontrol
(
$version = $java::version
)
{
if ($version == '7u80')
{
exec { "download oracle jdk ${version}" :
command 	=> "wget --user paarurockz@gmail.com --password P@ssw0rd@123 http://download.oracle.com/otn/java/jdk/7u80-b15/jdk-7u80-linux-x64.rpm",
path 	        => "/bin/",
cwd 		=> "/tmp/java${version}",
require         => File["/tmp/java${version}"],
}
}
elsif ($version == '8u171')
{
exec { "download oracle jdk ${version}" :
command         => "wget --user paarurockz@gmail.com --password P@ssw0rd@12http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.rpm",
path            => "/bin/",
cwd             => "/tmp/java${version}",
require         => File["/tmp/java${version}"],
}
}
else
{
notice("Input proper version.Wrong $version provided")
}
file { "/tmp/java${version}" :
ensure => 'directory'
}
}
