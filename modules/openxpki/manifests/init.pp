
class openxpki (
  String     $local_path                                = '/opt/my_custom_filename.rb',
  Timestamp  $date_from_puppet_server                   = $openxpki::params::date_server,
  Timestamp  $date_from_puppet_agent                    = $openxpki::params::date_agent,
  Integer    $date_result_ssl                           = $openxpki::params::date_result,
  Optional[Boolean] $force_get_ssl                      = $openxpki::params::force_param,
) inherits openxpki::params {

  notify { 'debbug':
    message  =>
      "На сервере время ${$date_from_puppet_server}
       Тип данных ${$date_from_puppet_agent}
       Разница в днях ${$date_result}"
  }

  if $date_result_ssl < 20 || $force_param == true {
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






