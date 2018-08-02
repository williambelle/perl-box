Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/bionic64'
  config.vm.hostname = 'perl-box'

  config.vm.synced_folder '../', '/perl'

  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--ioapic', 'on']
    vb.customize ['modifyvm', :id, '--cpus',   '2']
    vb.customize ['modifyvm', :id, '--memory', '2048']
  end

  config.vm.provision :shell, path: 'bin/bootstrap.sh'
  config.vm.provision :shell, path: 'bin/perlbrew.sh', privileged: false
end
