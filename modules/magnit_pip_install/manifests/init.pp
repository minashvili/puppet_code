class magnit_pip_install {

  $enhancers = [ 'python3' ]

  package { $enhancers:
    ensure => 'installed',
  }



}


#
# class rpm_repo_magnit {
#
#   [$x1, $x2] = [$facts['os']['name'], $facts['os']['release']['major']]
#
#   $os_version = { 'CentOS6' => ["puppet:///modules/rpm_repo_magnit/CentOS6/", ['CentOS-Upgrade.repo', 'CentOS-Vault.repo', 'epel.repo', 'zabbix.repo', 'rearCentOS6.repo']],
#                   'CentOS7' => ["puppet:///modules/rpm_repo_magnit/CentOS7/", ['CentOS-Base.repo', 'CentOS-CR.repo', 'CentOS-Debuginfo.repo', 'CentOS-fasttrack.repo', 'CentOS-Media.repo', 'CentOS-SCL.repo', 'CentOS-Sources.repo', 'CentOS-Vault.repo', 'CentOS-x86_64-kernel.repo', 'docker.repo', 'epel.repo', 'epel-testing.repo', 'zabbix.repo', 'rearCentOS7.repo']],
#                   'CentOS8' => ["puppet:///modules/rpm_repo_magnit/CentOS8/", ['CentOS-AppStream.repo', 'CentOS-Base.repo', 'CentOS-centosplus.repo', 'CentOS-CR.repo', 'CentOS-Devel.repo', 'CentOS-Extras.repo', 'CentOS-fasttrack.repo', 'CentOS-HA.repo', 'CentOS-PowerTools.repo', 'CentOS-Sources.repo', 'CentOS-Vault.repo', 'devel_kubic_libcontainers.repo', 'epel-modular.repo', 'epel-playground.repo', 'epel.repo', 'epel-testing-modular.repo', 'epel-testing.repo', 'zabbix.repo', 'rearCentOS8.repo', 'docker-ce.repo']],
#                   'RedHat6' => ["puppet:///modules/rpm_repo_magnit/CentOS6/", ['CentOS-Upgrade.repo', 'CentOS-Vault.repo', 'epel.repo', 'zabbix.repo', 'rearCentOS6.repo']],
#                   'RedHat7' => ["puppet:///modules/rpm_repo_magnit/CentOS7/", ['CentOS-Altarch.repo', 'CentOS-Base.repo', 'CentOS-CR.repo', 'CentOS-Debuginfo.repo', 'CentOS-fasttrack.repo', 'CentOS-Media.repo', 'CentOS-SCL.repo', 'CentOS-Sources.repo', 'CentOS-Vault.repo', 'CentOS-x86_64-kernel.repo', 'docker.repo', 'epel.repo', 'epel-testing.repo', 'zabbix.repo', 'rearCentOS7.repo']],
#                   'RedHat8' => ["puppet:///modules/rpm_repo_magnit/RedHat8/", ['CentOS-AppStream.repo', 'CentOS-Base.repo', 'CentOS-centosplus.repo', 'CentOS-CR.repo', 'epel.repo', 'zabbix.repo', 'rearCentOS8.repo']],
#                   'OracleLinux7' => ["puppet:///modules/rpm_repo_magnit/OEL7/", ['epel.repo', 'epel-testing.repo', 'public-yum-ol7.repo']], #добавить репу zabbix хоть ее и нет
#                   'OracleLinux8' => ["puppet:///modules/rpm_repo_magnit/OEL8/", ['epel.repo', 'mysql-ol8.repo', 'ol8-temp.repo', 'oracle-epel-ol8.repo', 'oracle-gluster-ol8.repo', 'oracle-instantclient-ol8.repo', 'oraclelinux-developer-ol8.repo', 'oracle-linux-manager-client-ol8.repo', 'oracle-linux-ol8.repo', 'oracle-ol8.repo', 'oracle-olcne-ol8.repo', 'oracle-spacewalk-client-ol8.repo', 'uek-ol8.repo']]
#
#                 }
#
#   if has_key($os_version, "${x1}${x2}") {
#         $source = $os_version["${x1}${x2}"][0]
#         $list_repo = $os_version["${x1}${x2}"][1]
#
#         $list_repo.each |String $one_repo_file| {
#            file { "/etc/yum.repos.d/${one_repo_file}":
#            source => "$source/${one_repo_file}"
#            }
#         }
#
#         file { "/etc/yum.conf":
#           source => "puppet:///modules/rpm_repo_magnit/yum.conf"
#         }
#   }
# }




