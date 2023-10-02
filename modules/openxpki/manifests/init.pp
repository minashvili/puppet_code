
class openxpki (
  $local_path                              = '/opt/my_custom_filename.rb'
){

  openxpki { 'test':
    ensure => present,
    path   => $local_path, # Указание пользовательского имени файла
  }

}



