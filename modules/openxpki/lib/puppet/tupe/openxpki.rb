#В Этом файле вы можете определить атрибуты (параметры),
# которые будут доступны для вашего ресурса, и их описание.

Puppet::Type.newtype(:openxpki) do
  desc 'Manage OpenXPKI configuration.'

  ensurable

  newparam(:name, namevar: true) do
    desc 'The name of the OpenXPKI configuration.'
  end

  newparam(:path) do
    desc 'The path to the OpenXPKI configuration file.'
  end

end


