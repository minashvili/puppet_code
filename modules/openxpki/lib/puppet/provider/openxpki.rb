
# В этом файле вы можете написать методы управления ресурсами (например e.g., create, destroy, exists?, etc.)

Puppet::Type.type(:openxpki).provide(:openxpki) do
  desc 'Manage OpenXPKI configuration.'

  def create
    file_path = @resource[:path] || '/opt/test_ruby_resource.rb'
    File.open(file_path, 'w') do |file|
      # Здесь может быть ваше содержание файла
    end
  end

  def destroy
    file_path = @resource[:path] || '/opt/test_ruby_resource.rb'
    File.delete(file_path) if File.exist?(file_path)
  end

  def exists?
    file_path = @resource[:path] || '/opt/test_ruby_resource.rb'
    File.exist?(file_path)
  end
end




