#Скрипт на Ruby пуляет скрипт на Golang чтобы получить список доступных хостов для DSL Puppet модуля установка Zabbix
Facter.add(:zabbix_true_server) do
  setcode do
    #zabbix_true_server = {}
    zabbix_true_server = []
    zabbix_proxy_list = ['178.248.238.722', 'puppet.com', '178.248.238.723']

    zabbix_proxy_list.each do | x_port |
        fact_bule = Facter::Core::Execution.execute("/home/gia/port_cheack_tcp #{x_port} 443")
        if fact_bule == 'true'
          #zabbix_true_server[fact_bule] = x_port
          zabbix_true_server.append(x_port)
        end
    end

    zabbix_true_server
  end
end


#Читать
#https://puppet.com/docs/puppet/6/fact_overview.html#writing_facts_aggregate_resolutions-build-flat-fact
#https://puppet.com/docs/puppet/6/custom_facts.html#aggregate_resolutions





