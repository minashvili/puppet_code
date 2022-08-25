#Скрипт на Ruby пуляет скрипт на Golang чтобы получить список доступных хостов для DSL Puppet модуля установка Zabbix
golang_super_fact = "/etc/facter/port_cheack_tcp"

if File.exist?(golang_super_fact)
  Facter.add(:zabbix_true_server) do
    setcode do
      #zabbix_true_server = {}
      zabbix_true_server = []
      zabbix_proxy_list = ['forge.puppet.comn', 'puppet.com', '178.248.238.723']

      zabbix_proxy_list.each do | x_port |
          fact_bule = Facter::Core::Execution.execute("/etc/facter/port_cheack_tcp #{x_port} 443")
          if fact_bule == 'true'
            #zabbix_true_server[x_port] = fact_bule
            zabbix_true_server.append(x_port)
          end
      end

      zabbix_true_server
    end
  end
end
#44
##Читать
#https://puppet.com/docs/puppet/6/fact_overview.html#writing_facts_aggregate_resolutions-build-flat-fact
#https://puppet.com/docs/puppet/6/custom_facts.html#aggregate_resolutions



