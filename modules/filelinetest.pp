file_line { "/tmp/testing.sh" :
ensure => 'present',
match  => '^eightyone',
line  => "",
path  => "/tmp/testing.sh",
match_for_absence => 'true'
}
