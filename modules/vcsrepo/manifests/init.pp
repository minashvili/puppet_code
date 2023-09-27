
class vcsrepo (
  $local_path                              = $p_local_path,
  $csv_path_repo                           = $p_csv_path_repo,
  $branch_vcs                              = $p_branch_vcs,
) inherits vcsrepo::params {

vcsrepo { $local_path:
  ensure   => 'present',
  provider => 'git',
  source   => $csv_path_repo,
  branch   => $branch_vcs,
  depth    => 1,
}


}





