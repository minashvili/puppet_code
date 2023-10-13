
Puppet::Functions.create_function(:'openxpki::date_changer') do
  dispatch :change_date do
    param 'String', :date_str
  end

  def change_date(date_str)
    # Преобразуем строку в объект времени
    date_obj = Time.parse(date_str)
    # Можно выполнить дополнительные операции с date_obj
    return date_obj
  end
end

