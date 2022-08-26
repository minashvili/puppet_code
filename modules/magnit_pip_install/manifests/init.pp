class magnit_pip_install {
  include pip

  pip::install { 'ansible':
  package        => 'ansible', # defaults to $title
  #version        => '1.6',    # if undef installs latest version
  #python_version => '3.3',    # defaults to 2.7
  ensure         => present,  # defaults to present
  #index_url      => ''

  }


}