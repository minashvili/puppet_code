
class docker::composeupper (
  Optional[String]               $docker_upper_path      = '/opt/openxpki/docker-compose.yml'
){
  docker_compose { 'test':
    compose_files => [$docker_upper_path],
    ensure        => present,
  }
}





