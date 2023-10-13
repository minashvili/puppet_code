
class openxpki (
  $local_path                              = '/opt/my_custom_filename.rb'
){

  $today_date_str = Timestamp.new()

  notify { 'resource title':
    message  => "У этой строки тип ${$today_date_str} ${type($today_date_str)}"
  }

  #$date_from_puppet_server = str2time($target_date_str, '%Y-%m-%dT%H:%M:%SZ')

  if $facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1] == '2023-11-10T11:10:52Z' {

    notify { 'resource title2':
      message  => "Работает ${$facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1]}"
    }

  }

  # openxpki { 'test':
  #   ensure => present,
  #   path   => $local_path, # Указание пользовательского имени файла
  # }

}




