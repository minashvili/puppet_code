
class openxpki::params {
  $date_server              = Timestamp.new()
  $date_agent               = Timestamp.new($facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1])
  # Перевожу тип данных "Длительность даты"(не путать с дата) в тип данных "строка" а потом в тип данных "Число" да это так делается!!!
  $date_result              = Integer(($date_agent - $date_server).strftime('%D'))
  $force_param              = false

  #Использование собственной функции
  #$date_from_puppet_agent = openxpki::date_changer($facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1])

}

