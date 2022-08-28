class magnit_pip_install {
  include python

  class { 'python':
    #version    => 'system',
    pip        => 'present',
    #dev        => 'present',
    #gunicorn   => 'present',
  }


   # 1  yum install python3 with pip3
   # 2  pip3 install --upgrade pip
   # 3  pip3 install ansible

}




  # include pip
  #
  # pip::install { 'ansible':
  # package        => 'ansible', # defaults to $title
  # #version        => '1.6',    # if undef installs latest version
  # #python_version => '3.3',    # defaults to 2.7
  # ensure         => present,  # defaults to present
  # #index_url      => ''
  #
  # }


