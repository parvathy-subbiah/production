class java::installjava
(
$version = $java::version
)
{
exec { "installing oracle jdk ${version}" :
command => "rpm -ivh /tmp/java${version}/jdk-${version}-linux-x64.rpm",
path    => "/bin/"
}
}
