#
# Performs a full restart system when a restart is required `server-state=restart-required`.
#   This define is a wrapper for `wildfly_restart` that defaults to your local Wildfly installation.
#   It is commonly used as a subscriber of a resource that requires restart.
#
# @param retries Sets the number of retries to check if service is available.
# @param wait Sets the amount of time in seconds that this resource will wait for the service to be available before a attempt.
define wildfly::restart(
  Integer $retries = 3,
  Integer $wait = 20) {

  wildfly_restart { $title:
    username => $wildfly::mgmt_user['username'],
    password => $wildfly::mgmt_user['password'],
    host     => $wildfly::properties['jboss.bind.address.management'],
    port     => $wildfly::properties['jboss.management.http.port'],
    retries  => $retries,
    wait     => $wait,
    require  => Service['wildfly'],
  }

}
