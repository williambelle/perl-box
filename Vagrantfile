Vagrant.configure("2") do |config|
	config.vm.box      = "ubuntu/trusty64"
	config.vm.hostname = "perl-box"

	# enable puppet provisionner
	config.vm.provision :puppet do |puppet|
		puppet.manifest_file  = "site.pp"
		puppet.manifests_path = "puppet/manifests"
		puppet.module_path    = "puppet/modules"
		puppet.options        = ['--verbose']
	end
end
