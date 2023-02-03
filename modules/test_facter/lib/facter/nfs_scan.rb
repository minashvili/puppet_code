# nfs_scan.rb

awk = "/usr/bin/awk"

if File.exist?(awk)
    Facter.add('nfs_scan') do
        setcode do
          Facter::Core::Execution.execute('\'awk\' \'$1 ~ /^([0-9]|\/\/)/ {print $1 ","}\' /proc/mounts')
        end
    end

end

