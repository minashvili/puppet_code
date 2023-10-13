
class openxpki (
  $local_path                              = '/opt/my_custom_filename.rb',
  $date_from_puppet_server                 = $openxpki::params::date_server,
  $date_from_puppet_agent                  = $openxpki::params::date_agent,
  $date_result_ssl                         = $openxpki::params::date_result
) inherits openxpki::params {

  notify { 'debbug':
    message  => "На сервере время ${$date_from_puppet_server}
                 тип данных ${$date_from_puppet_agent}
                 Разница в днях ${$date_result}"
  }

  if $date_result_ssl == 27 {
    notify { 'resource title2':
      message  => "Работает! ${$date_result_ssl}"
    }
  } else {
    notify { 'resource title3':
      message => "Не Работает! ${$date_result_ssl}"
    }
  }
}

  # openxpki { 'test':
  #   ensure => present,
  #   path   => $local_path, # Указание пользовательского имени файла
  # }






