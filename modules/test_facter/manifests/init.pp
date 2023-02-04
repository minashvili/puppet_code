class test_facter {

    if $::osfamily == 'windows' {
        file {'C:\package_versions_list.json':
            ensure  => file,
            source  => 'puppet:///modules/test_facter/package_versions_list.json',    
        }
    }

    else {

        file { '/etc/facter/':
            ensure => 'directory',
            mode  => '0755',
        }
    
        file {'/etc/facter/package_versions_list.json':
            ensure  => file,
            source  => 'puppet:///modules/test_facter/package_versions_list.json',
            mode  => '0755',
        }
    }

}
#