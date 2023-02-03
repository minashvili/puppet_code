require 'puppet'
require 'json'

os = Puppet.runtime[:facter].value(:operatingsystem).downcase

if os == 'windows'
  fact_package_list = "C:/package_versions_list.json"
  
else 
  fact_package_list = "/etc/facter/package_versions_list.json"

end


if File.exist?(fact_package_list)
  config_json = File.read(fact_package_list)
  begin
    config = JSON.parse(config_json)
    config.each_pair do |fact_name, pkg_list|
      if pkg_list.length == 0
        pkg_list[0] = fact_name
      end
      pkg_list.each do |pkg_name|
        pkg = Puppet::Type.type(:package).new(:name => pkg_name, :allow_virtual => true)
        version = pkg.retrieve[pkg.property(:ensure)].to_s
        if version != 'purged' and version != 'absent'
          Facter.add(fact_name) do
            setcode do
              version
            end
          end
          break
        end
      end
    end
  rescue JSON::ParserError => e
    raise Puppet::ParseError, fact_package_list + " parse error \n" +  e.message
  end
end
