
define pip::installation (
  $python_version = $title,
) {

  $get_pip_url = 'https://raw.githubusercontent.com/pypa/pip/1.5.6/contrib/get-pip.py'

  Exec {
    path    => ['/usr/bin', '/usr/local/bin', '/bin/'],
    require => Package['curl'],
  }

  exec { "install-pip${python_version}":
    command => "curl -L ${get_pip_url} | python${python_version}",
    unless  => "which pip${python_version}",
    onlyif  => "which python${python_version}",
  }

}
