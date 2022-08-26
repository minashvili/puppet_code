# puppet-pip


## Installing latest pip version:

```puppet
include pip
```

## Installing a package using pip:

```puppet

pip::install { 'Django':
  package        => 'Django', # defaults to $title
  version        => '1.6',    # if undef installs latest version
  python_version => '3.3',    # defaults to 2.7
  ensure         => present,  # defaults to present
}

```
