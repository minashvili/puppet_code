
class test_trusted_ca {
  include trusted_ca

trusted_ca::ca { 'test.ca-bundle':
      source => 'puppet:///modules/test_trusted_ca/mysite.ca-bundle',
}

}





