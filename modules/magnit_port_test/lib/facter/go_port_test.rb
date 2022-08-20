Facter.add(:interfaces_array) do
  setcode do
   interfaces = Facter.value(:interfaces)
   # the 'interfaces' fact returns a single comma-delimited string, such as "lo0,eth0,eth1"
   # this splits the value into an array of interface names
   interfaces.split(',')
  end
end

#test puppet