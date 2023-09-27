
class vcsrepo (
  $local_path                              = $vcsrepo::params::p_local_path,
  $csv_path_repo                           = $vcsrepo::params::p_csv_path_repo,
  $branch_csv                              = $vcsrepo::params::p_branch_csv,
  $revision_hash                           = $vcsrepo::params::p_revision,
) inherits vcsrepo::params {

  if $revision_hash == undef or $revision_hash == '' {
    vcsrepo { $local_path:
      ensure   => 'present',
      provider => 'git',
      source   => $csv_path_repo,
      branch   => $branch_csv,
    }
  } else {
    vcsrepo { $local_path:
      ensure   => 'present',
      provider => 'git',
      source   => $csv_path_repo,
      branch   => $branch_csv,
      revision => $revision_hash,
    }
  }

}





