
class openxpki (
  $local_path                              = '/opt/my_custom_filename.rb'
){

  notify { 'resource title':
    message  => "У этой строки тип ${type($facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1])}"
  }

  if $facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1] == '2023-11-11T13:12:38Z' {

    notify { 'resource title':
      message  => "Работает ${$facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1]}"
    }

  } #else {
  #   notify { 'resource title2':
  #     message  => "Не работает ${['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1]}"
  #   }
  # }

  # openxpki { 'test':
  #   ensure => present,
  #   path   => $local_path, # Указание пользовательского имени файла
  # }

}




