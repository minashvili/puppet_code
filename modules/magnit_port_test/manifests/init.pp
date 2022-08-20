
class magnit_port_test {

    file { '/etc/facter/':
        ensure => 'directory',
        mode  => '0755',
        }
    
    file {'/etc/facter/port_cheack_tcp':
        ensure  => file,
        source  => 'puppet:///modules/magnit_port_test/port_cheack_tcp',
        mode  => '0755',
    }
    
}

