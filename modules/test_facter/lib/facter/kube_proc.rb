# kube_proc.rb

Facter.add('kube_proc') do
  setcode do
    Facter::Core::Execution.execute('/usr/bin/pgrep kube')
  end
end







