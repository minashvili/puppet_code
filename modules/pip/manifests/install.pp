
define pip::install(
  $package = $title,
  $version = undef,
  $python_version = '2.7',
  $ensure = present,
  $index_url = undef,
) {

  Exec {
    path => ['/usr/local/bin', '/usr/bin', '/bin'],
  }

  case $ensure {
    present, installed: {
      $index_url_arg = $index_url ? {
        undef    => '',
        default => "--index-url=${index_url}",
      }

      if $version != undef {
        $package_with_version = "${package}==${version}"
        $grep_for = "^${package_with_version}$"
      } else {
        $package_with_version = $package
        $grep_for = "^${package}=="
      }

      exec { "install-${package}":
        command => "pip${python_version} install ${index_url_arg} ${package_with_version}",
        unless  => "pip${python_version} freeze | grep '${grep_for}'",
        require => Exec["install-pip${python_version}"],
      }
    }

    latest: {
      # TODO Read from https://pypi.python.org/pypi/<package_name>/json
      # Probably best if implemented in Ruby
    }

    absent, purged: {
      exec { "uninstall-${package}":
        command => "pip${python_version} uninstall ${package} -y",
        onlyif  => "pip${python_version} freeze | cut -d= -f1 | egrep '^${package}$'",
      }
    }
  }
}
