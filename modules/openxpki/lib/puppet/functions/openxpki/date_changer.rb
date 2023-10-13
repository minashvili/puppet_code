
#
# function custom::string_to_time($date_str) {
#   $date_obj = Timestamp.new($date_str)
#   return $date_obj
# }

Puppet::Functions.create_function(:'openxpki::date_changer') do
  dispatch :up do
    param 'String', :some_string
  end

  def up(some_string)
    some_string.upcase
  end
end



