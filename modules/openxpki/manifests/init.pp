
class openxpki (
  $local_path                              = '/opt/my_custom_filename.rb'
){

  $date_from_puppet_server = Timestamp.new()
  $date_from_puppet_agent = str2time($facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1], '%Y-%m-%dT%H:%M:%SZ')


  notify { 'resource title1':
    message  => "У этой строки тип ${$date_from_puppet_server} ${type($date_from_puppet_server)}"
  }

  notify { 'resource title2':
    message  => "У этой строки тип ${$date_from_puppet_agent} ${type($date_from_puppet_agent)}"
  }

  # if $facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1] == '2023-11-10T11:10:52Z' {
  #
  #   notify { 'resource title2':
  #     message  => "Работает ${$facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1]}"
  #   }
  #
  # }

  # openxpki { 'test':
  #   ensure => present,
  #   path   => $local_path, # Указание пользовательского имени файла
  # }

}




