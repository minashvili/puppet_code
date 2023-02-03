# bond_scan.rb

awk = "/usr/bin/awk"

if File.exist?(awk)
    Facter.add('bond_scan') do
        setcode do
          Facter::Core::Execution.execute('\'awk\' \'/^(Bonding Mode:|MII Status:)/ {print $0 ","}\'  /proc/net/bonding/*')
        end
    end

end

