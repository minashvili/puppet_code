
class openxpki (
  $local_path                              = '/opt/my_custom_filename.rb'
){

  if $facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1] == '2023-11-11T13:12:38Z' {

    notify { 'resource title':
      message  => "Работает ${['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1]}"
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




