
class { 'wildfly':
  version        => '10.1.0',
  distribution   => 'wildfly',
  install_source => 'https://downloads.jboss.org/keycloak/2.5.0.Final/keycloak-2.5.0.Final.tar.gz',
}
