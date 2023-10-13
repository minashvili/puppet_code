
class openxpki (
  $local_path                              = '/opt/my_custom_filename.rb'
){

  notify { 'resource title':
    message  => "Работает ${$facts['ssl_pki']}"
  }

  # openxpki { 'test':
  #   ensure => present,
  #   path   => $local_path, # Указание пользовательского имени файла
  # }

}




