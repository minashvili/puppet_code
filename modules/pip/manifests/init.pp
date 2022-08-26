
class pip {

  if versioncmp($::puppetversion,'3.6.1') >= 0 {
    Package {
      allow_virtual => true,
    }
  }

  ensure_packages(['curl'])

  ensure_resource('pip::installation', ['2.6', '2.7', '3.3', '3.4'])
}
