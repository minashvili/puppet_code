#В Этом файле вы можете определить атрибуты (параметры),
# которые будут доступны для вашего ресурса, и их описание.

Puppet::Type.newtype(:openxpki) do
  desc 'Manage OpenXPKI configuration.'

  ensurable
  # isnamevar: Это указание, что параметр :path также используется в качестве имени ресурса.
  newparam(:name, namevar: true) do
    desc 'The name of the OpenXPKI configuration.'
  end

  newparam(:path) do
    desc 'The path to the OpenXPKI configuration file.'
  end

  newparam(:exists) do
    desc 'Check if the OpenXPKI configuration exists.'
    newvalues(true, false)
    defaultto :true
  end

  newvalue(:present) do
    provider.create
  end

  newvalue(:absent) do
    provider.destroy
  end


end


