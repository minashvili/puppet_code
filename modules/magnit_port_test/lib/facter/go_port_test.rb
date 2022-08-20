Facter.add(:zabbix_true_server) do
  setcode do
#     interfaces_hash = {}
    zabbix_true_server = {}
    zabbix_proxy_list = ['178.248.238.722', 'puppet.com', '178.248.238.723']

    zabbix_proxy_list.each do | x_port |
        fact_bule = Facter::Core::Execution.execute("/home/gia/port_cheack_tcp #{x_port} 443")
        zabbix_true_server[x_port] = fact_bule
    end

    zabbix_true_server
  end
end


#
#
#
# Facter.add(:interfaces_hash) do
#   setcode do
#     interfaces_hash = {}
#
#     Facter.value(:interfaces_array).each do |interface|
#       ipaddress = Facter.value("ipaddress_#{interface}")
#       if ipaddress
#         interfaces_hash[interface] = ipaddress
#       end
#     end
#
#     interfaces_hash
#   end
# end




