
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

    # class { 'zabbix::agent':
    #
    #     $x1 = $facts['os']['family']
    #     server => '192.168.1.1',
    #     manage_repo => false,
    #     #zabbix_package_state => '5.0.26-1.el8.x86_64', Указать версию пакета, также может и делать давнгрейт или апргрейд версии на страую или новую главное чтобы были репы
    #
    # }



}

#Как сейчас проверить полученный факт, и записать его в класс для заббикс агента ?
#как попытаться импортировать этот классы в другой ? надо ли это ?

