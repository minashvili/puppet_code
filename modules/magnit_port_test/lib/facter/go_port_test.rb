Facter.add(:zabbix_true_server) do
  setcode do
#     interfaces_hash = {}
    zabbix_true_server = {}
    zabbix_proxy_list = ['178.248.238.722', 'puppet.com', '178.248.238.722']

    zabbix_proxy_list.each do | x_port |
      setcode do
        fact_bule = Facter::Core::Execution.execute("/home/gia/port_cheack_tcp #{x_port} 443") # только это становится значеним фактора
        zabbix_true_server[x_port] = fact_bule
      end
    end
#     Facter.value(:interfaces_array).each do |interface|
#       ipaddress = Facter.value("ipaddress_#{interface}")
#       if ipaddress
#         interfaces_hash[interface] = ipaddress
#       end
#     end
    zabbix_true_server
  end
end








