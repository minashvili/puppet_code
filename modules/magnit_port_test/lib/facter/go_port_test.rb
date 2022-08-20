Facter.add(:interfaces_hash) do
  setcode do
    interfaces_hash = {}

    Facter.value(:interfaces_array).each do |interface|
      ipaddress = Facter.value("ipaddress_#{interface}")
      if ipaddress
        interfaces_hash[interface] = ipaddress
      end
    end

    interfaces_hash
  end
end






# Facter.add(:interfaces_array) do
#   setcode do
#    interfaces = Facter::Core::Execution.execute("/home/gia/port_cheack_tcp magnit.ru 443")
#    # the 'interfaces' fact returns a single comma-delimited string, such as "lo0,eth0,eth1"
#    # this splits the value into an array of interface names
#    #interfaces.split(',')
#   end
# end
#
# #test puppet
#






