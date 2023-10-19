
require 'net/http'
require 'uri'
require 'base64'
require 'pp'
require 'json'


def send_post_request(path_to_csr)
  url = 'https://192.168.0.20:8443/rpc/enroll/'
  params = {
    'method' => 'RequestCertificate',
    'comment' => 'request from Foreman Platform',
    'pkcs10' => File.read("/etc/pki/#{path_to_csr}.csr", ),
  }

  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE   #Убрать после интеграции

  # Создаем объект запроса POST
  request = Net::HTTP::Post.new(uri.path)
  request.set_form_data(params)

  # Отправляем POST-запрос и получаем ответ
  #!!! и нужнен отлов ошибок
  response = http.request(request)


  #Условие если сертификат есть в ответе то сохранять его в файл crt и переменовываем csr файл csr_дата
  if JSON.parse(response.body)["result"]["data"]["certificate"]

    #Сохраняем сертификат
    open "/etc/pki/#{path_to_csr}.crt", 'w' do |io| # заменить на переменную из puppet resource
      io.write JSON.parse(response.body)["result"]["data"]["certificate"]
    end

    #Переменование файла csr
    date = Time.now.strftime('%Y%m%d%H%M%S')
    File.rename("/etc/pki/#{path_to_csr}.csr", "/etc/pki/#{path_to_csr}.csr_#{date}")

    return JSON.parse(response.body)

  else
    return JSON.parse(response.body)
  end

end

