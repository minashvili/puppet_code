# == Class: porttest::install
#
# Installation and setup for porttest tool
#
# === Parameters
#
# [*prefix*]
#   Prefix to install the TCP and UDP python script. Default is /usr/local/bin
#
# [*owner*]
#   File owner, default is root.
#
# [*group*]
#   File group, default is root.
#
# [*mode*]
#   File mode, default is 0775, must be executable.
#
# [*store*]
#   Directory to save test verification files so that a host+port is only
#   every tested once. Default is /var/local.
#
# === Authors
#
# Bryan Andrews <bryanandrews@gmail.com>
#
# === Copyright
#
# Copyright 2015 Bryan Andrews <bryanandrews@gmail.com>, unless otherwise noted.
#

class porttest::install (

  $prefix = '/usr/local/bin',
  $store  = '/var/local',
  $owner  = 'root',
  $group  = 'root',
  $mode   = '0755',

) {

  file { "${prefix}/portTest.py":
    owner  => $owner,
    group  => $group,
    mode   => $mode,
    source => 'puppet:///modules/porttest/portTest.py',
  }

  file { $store:
    ensure  => directory,
  }

}
