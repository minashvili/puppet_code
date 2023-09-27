
class vcsrepo (
  $local_path                              = '/home/george',
  $csv_path_repo                           = 'git://github.com/openxpki/openxpki-docker.git',
  $branch_vcs                              = 'master',
) {

vcsrepo { $local_path:
  ensure   => 'present',
  provider => 'git',
  source   => $csv_path_repo,
  branch   => $branch_vcs,
  depth    => 1,
}


}





