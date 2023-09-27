
class vcsrepo (
  $local_path                              = $p_local_path,
  $csv_path_repo                           = $p_csv_path_repo,
  $branch_csv                              = $p_branch_csv,
) inherits vcsrepo::params {

vcsrepo { $local_path:
  ensure   => 'present',
  provider => 'git',
  source   => $csv_path_repo,
  branch   => $branch_vcs,
  depth    => 1,
}


}





