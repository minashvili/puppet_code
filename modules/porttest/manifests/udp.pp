define porttest::udp (

  $target,
  $port,

) {

  include porttest::install
  $prefix = $porttest::install::prefix
  $store  = $porttest::install::store

  exec { "Test ${target} udp ${port}":
    require => File["${prefix}/portTest.py"],
    path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin/' ],
    command => "portTest.py ${target} ${port} 2 udp && touch ${store}/${target}-${port}.verified-udp",
    creates => "${store}/${target}-${port}.verified-udp",
  }
}
