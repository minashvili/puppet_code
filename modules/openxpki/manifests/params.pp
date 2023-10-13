
class openxpki::params {
  $date_server              = Timestamp.new()
  $date_agent               = Timestamp.new($facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1])
  $date_result              = Integer(($date_agent - $date_server).strftime('%D'))
  $force_param              = undef
  # Первожу тип данных "Длительность даты"(не путать с дата)
  # в тип данных "строка" а потом в тип данных "Число" да это так делается!!!

  #Использование собственной функции
  #$date_from_puppet_agent = openxpki::date_changer($facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1])

}

