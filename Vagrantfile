Vagrant.configure('2') do |config|
  config.vm.box      = 'puppetlabs/ubuntu-16.04-64-puppet'
  config.vm.hostname = 'perl-box'

  config.vm.synced_folder '../', '/perl'

  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--ioapic', 'on']
    vb.customize ['modifyvm', :id, '--cpus',   '2']
    vb.customize ['modifyvm', :id, '--memory', '2048']
  end

  # enable puppet provisionner
  config.vm.provision :puppet do |puppet|
    puppet.environment      = 'production'
    puppet.environment_path = '../../'
    puppet.manifest_file    = 'site.pp'
    puppet.manifests_path   = 'puppet/manifests'
    puppet.module_path      = 'puppet/modules'
    puppet.options          = ['--verbose']
  end
end
