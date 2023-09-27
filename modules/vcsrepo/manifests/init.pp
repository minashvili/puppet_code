
class vcsrepo (
  String              $local_path                              = $vcsrepo::params::p_local_path,
  String              $csv_path_repo                           = $vcsrepo::params::p_csv_path_repo,
  String              $branch_csv                              = $vcsrepo::params::p_branch_csv,
  Optional[String]    $revision_hash                           = $vcsrepo::params::p_revision,
) inherits vcsrepo::params {

  if $revision_hash == undef {
    vcsrepo { $local_path:
      ensure   => 'present',
      provider => 'git',
      source   => $csv_path_repo,
      branch   => $branch_csv,
      # depth    => 1,
    }
  } else {
    vcsrepo { $local_path:
      ensure   => 'present',
      provider => 'git',
      source   => $csv_path_repo,
      branch   => $branch_csv,
      revision => $revision_hash,
      # depth    => 1,
    }
  }
}





