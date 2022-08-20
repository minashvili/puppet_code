

define porttest::tcp (

  $target,
  $timeout,

) {

  include porttest::install
  $prefix = $porttest::install::prefix
  $store  = $porttest::install::store
  
  $hosts = $target
  $hosts.each |String $target| {
    exec { "Test ${target} tcp ${port}":
      require => File["${prefix}/portTest.py"],
      path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin/' ],
      command => "portTest.py ${target} ${timeout} && touch ${store}/${target}",
      creates => "${store}/${target}",
      returns => [0, 1], #minashvili_gt
      loglevel => "debug", #minashvili_gt
    }
  }
}
