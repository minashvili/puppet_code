c
# service_name.rb

Facter.add('service_name') do
  setcode do
    Facter::Core::Execution.execute('/usr/bin/cat /root/.puppet_service_name')
  end
end


