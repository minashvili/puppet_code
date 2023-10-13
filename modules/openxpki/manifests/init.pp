
class openxpki (
  $local_path                              = '/opt/my_custom_filename.rb',
  $date_from_puppet_server                 = $openxpki::params::date_server,
  $date_from_puppet_agent                  = $openxpki::params::date_agent,
  $date_result_ssl                         = $openxpki::params::date_result
) inherits openxpki::params {

  notify { 'resource title1':
    message  => "На сервере время ${$date_from_puppet_server} тип данных ${type($date_from_puppet_server)}"
  }

  notify { 'resource title2':
    message  => "На агенте вермя  ${$date_from_puppet_agent} тип данных ${type($date_from_puppet_agent)}"
  }

  notify { 'resource title3':
    message  => "Разница в днях ${$date_result} тип данных ${type($date_result)}"
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




