# frozen_string_literal: true

require 'puppet/resource_api/simple_provider'

# Implementation for the openxpki type using the Resource API.
class Puppet::Provider::Openxpki::Openxpki < Puppet::ResourceApi::SimpleProvider
  def get(context)
    context.debug('Returning pre-canned example data')
    [
      {
        name: 'openxpki',
        ensure: 'present',
      },
    ]
  end

  def create(context, name, should)
    # context.notice("Creating '#{name}' with #{should.inspect}")
    path = should[:path]
    # Проверяем, что путь указан
    if path.nil?
      context.err('Path is not specified.')
      return
    end

    begin
      # Создаем папку и все необходимые директории в пути
      FileUtils.mkdir_p(path)
      File.new(path, "w")

      context.notice("Created directory '#{path}'")
    rescue StandardError => e
      context.err("Error creating directory '#{path}': #{e.message}")
    end

  end

  def update(context, name, should)
    context.notice("Updating '#{name}' with #{should.inspect}")
  end

  def delete(context, name)
    context.notice("Deleting '#{name}'")
  end



end



