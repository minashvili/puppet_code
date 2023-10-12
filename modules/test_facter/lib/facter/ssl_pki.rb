Facter.add('ssl_pki') do
  setcode do
    require 'openssl'
    require 'pathname'

    # Путь к папке с сертификатами
    certs_path = '/etc/pki'

    # Массив для хранения информации о сертификатах
    ssl_pki = {}

    # Получаем список файлов в папке
    Dir.glob("#{certs_path}/*").each do |file_path|
      # Игнорируем файлы, не являющиеся сертификатами (например, .crl)
      next unless File.file?(file_path)

      # Извлекаем информацию о сертификате
      cert = OpenSSL::X509::Certificate.new(File.read(file_path))

      # Получаем общее имя (common name)
      common_name = cert.subject.to_a.find { |name, _, _| name == 'CN' }&.[](1)

      # Получаем список альтернативных имен (subject alternative names)
      alt_names = cert.extensions.find { |ext| ext.oid == 'subjectAltName' }&.value

      # Получаем дату выдачи и окончания сертификата
      not_before = cert.not_before
      not_after = cert.not_after

      # Добавляем информацию о сертификате в ssl_pki
      ssl_pki[common_name] = {'all_alt_names' => alt_names, 'ssl_date' => [not_before, not_after]}
    end

    ssl_pki
  end
end



