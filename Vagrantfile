# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "windows_2008_r2_virtualbox"

  config.vm.network "forwarded_port", guest: 25999, host: 8080

  config.vm.network "private_network", ip: "192.168.33.10"

  # config.vm.network "public_network"

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
  end

  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "modules"
    puppet.manifests_path = "tests"
    puppet.manifest_file  = "windows.pp"
  end

end
