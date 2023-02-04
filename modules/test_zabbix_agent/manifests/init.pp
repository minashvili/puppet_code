# Манифест для установки репозитория заббикс /etc/puppetlabs/code/environments/production/modules/zabbix/manifests/repo.pp
class test_zabbix_agent {
  #require test_zabbix_agent::get_go_file
  #$x1 = $facts['zabbix_true_server'] # Получить первый в списке zabbix сервер к которому есть доступ

  file { '/etc/facter/port_cheack_tcp':
    ensure => file,
    source => 'puppet:///modules/test_zabbix_agent/port_cheack_tcp',
    mode   => '0755',

  }

  if has_key($facts, "zabbix_true_server") {
    class { 'zabbix::agent':
      #server => $x1[0],
      server       => $facts['zabbix_true_server'][0],
      serveractive => "${facts['zabbix_true_server'][0]}:10051",
      manage_repo  => false,
      #zabbix_package_state => '5.0.26-1.el8.x86_64', Указать версию пакета, также может и делать давнгрейт или апргрейд
      #версии на страую или новую главное чтобы были репы
    }
  }
}
#$ grep -e "^Server=" -e "^ServerActive=" /etc/zabbix/zabbix_agentd.conf
