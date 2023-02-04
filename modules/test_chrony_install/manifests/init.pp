
class test_chrony_install {

  class { 'chrony':
    servers => ['8.8.8.8'],
  }

}
