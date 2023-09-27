
class vcsrepo (
  $csv_path_repo                           = vcsrepo::params::csv_path_repo,
  $local_path_opt                          = vcsrepo::params::local_path_opt,
  $remote_branch_vcs                       = vcsrepo::params::branch_csv,
) inherits vcsrepo::params {

  Class['vcsrepo::manage::git'] -> Vcsrepo[$local_path_opt]

vcsrepo { $local_path_opt:
  ensure   => 'present',
  provider => 'git',
  source   => $csv_path_repo,
  branch   => $remote_branch_vcs,
  depth    => 1,
}


}



