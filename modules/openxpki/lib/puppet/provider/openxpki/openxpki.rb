# frozen_string_literal: true

require 'puppet/resource_api/simple_provider'
require_relative 'generate_csr' #Загружаем скрипт создание csr и key
require_relative 'rpc_request_certificate' #Отправляем csr в openxpki

# Implementation for the openxpki type using the Resource API.
# Этот провайдер как и любой другой будет закеширован агентом
# на тех узлах на которые будет назначен

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
    #Переменная should представляет набор желаемых состояний ресурса, которые мы хотитм создать или обновить.
    #Переменная context представляет собой объект, предоставляемый Puppet Resource API, который используется для взаимодействия с окружением провайдера.
    path = should[:path]
    crt_common_name = should[:crt_common_name]
    crt_manual_alt_names = should[:crt_manual_alt_names]
    # Проверяем, что путь указан
    if path.nil?
      context.err('Path is not specified.')
      return
    end
    if File.exist?(path)
      #context.notice("File '#{path}' already exists, skipping creation.")
    else

      begin
        File.new(path, "w")
        context.notice("Created file '#{path}'")

      rescue StandardError => e
        context.err("Error creating file '#{path}': #{e.message}")
      end

    end

    # Проверять есть ли файл /etc/pki/crt_common_name.csr если нет выполнить генерацию
    unless File.exist?("/etc/pki/#{crt_common_name}.csr")
    #Вызываем функцию из модуля generate_csr
      generate_csr(
        crt_common_name,
        'ACME Corp.',
        'US',
        'California',
        'San Francisco',
        crt_manual_alt_names,      #[ 'acme3.com', 'www.acme3.com', 'api.acme3.com', 'cdn.acme3.com' ]
      )
    end

    # Cледующий шаг всегда отправка запроса в API openxpki если сертифкиат сохранять его в файл crt и переменовываем csr файл csr_дата
    send_post_request(crt_common_name)

  end

  def update(context, name, should)
    context.notice("Updating '#{name}' with #{should.inspect}")
  end

  def delete(context, name)
    context.notice("Deleting '#{name}'")
  end



end


# В этом коде should используется для определения параметров ресурса,
# который создается или обновляется, а context используется для ведения журнала
# и для взаимодействия с Puppet Resource API. Например, методы context.notice
# и context.err используются для записи сообщений в журнал, чтобы информировать
# пользователя о действиях провайдера и об ошибках, если они возникнут.









