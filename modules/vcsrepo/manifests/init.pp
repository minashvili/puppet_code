
class vcsrepo (
  $csv_path_repo                           = vcsrepo::params::p_csv_path_repo,
  $local_path                              = vcsrepo::params::p_local_path_repo,
  $branch_vcs                              = vcsrepo::params::p_branch_csv,
) inherits vcsrepo::params {

  Class['vcsrepo::manage::git'] -> Vcsrepo[$local_path]

vcsrepo { $local_path:
  ensure   => 'present',
  provider => 'git',
  source   => $csv_path_repo,
  branch   => $branch_vcs,
  depth    => 1,
}


}





