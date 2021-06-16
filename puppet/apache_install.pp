class apache {
        package { 'httpd':
           ensure => 'present',
                }
        service {'httpd':
           ensure => 'running',
           require => Package["httpd"],
           }
}
include apache