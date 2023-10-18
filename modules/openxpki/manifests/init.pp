
class openxpki (
  String     $local_path                                = '/opt/my_custom_filename.rb',
  Timestamp  $date_from_puppet_server                   = $openxpki::params::date_server,
  Optional[Boolean] $force_get_ssl                      = $openxpki::params::force_param,
  Optional[String] $manual_commone_name                 = $openxpki::params::commone_name,
  Optional[String] $manual_alt_names                    = $openxpki::params::alt_names,
  #  Timestamp  $date_from_puppet_agent                    = $openxpki::params::date_agent,
  #  Integer    $date_result_ssl                           = $openxpki::params::date_result,
) inherits openxpki::params {

  if $facts['ssl_pki'][$manual_commone_name] {
    $date_agent               = Timestamp.new($facts['ssl_pki'][$manual_commone_name]['ssl_date'][1])
    $date_result_ssl          = Integer(($date_agent - $date_server).strftime('%D'))

    if $force_get_ssl == true or $date_result_ssl < 20 {
      notify { 'resource title2':
        message  => "Работает! ${$date_result_ssl} Запускаем бекап файлов и запускаем Перевыписки выписки сертификатов"
      }
      openxpki { 'test':
        ensure           => present,
        path             => $local_path,
        crt_common_name  => $manual_commone_name,
      }
    }
  } else {
    notify { 'resource title4':
      message => "Commone name ${$manual_commone_name } не найден в фактах ввыписываем сертификат без опасения"
    }
      openxpki { 'test2':
        ensure           => present,
        path             => $local_path,
        crt_common_name  => $manual_commone_name,
      }
  }



}

  # openxpki { 'test':
  #   ensure => present,
  #   path   => $local_path, # Указание пользовательского имени файла
  # }


#



