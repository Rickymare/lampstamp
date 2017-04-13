# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = [
  {
    hostname: "web",
    ip:       "192.168.56.10",
    script:   "web/web.sh"
  },
  {
    hostname: "data",
    ip:       "192.168.56.20",
    script:   "data/data.sh"
  }
]

Vagrant.configure(2) do |config|
  if Vagrant.has_plugin?("vagrant-hostmanager")
    config.hostmanager.enabled     = true
    config.hostmanager.manage_host = true
  end

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = "ubuntu/xenial64"
      nodeconfig.vm.hostname = node[:hostname]
      nodeconfig.vm.network :private_network, ip: node[:ip]
      
      nodeconfig.vm.provision :shell, path: node[:script]

      nodeconfig.vm.synced_folder "#{node[:hostname]}/", "/#{node[:hostname]}"

      nodeconfig.vm.provider :virtualbox do |v|
        v.name = node[:hostname]
        v.memory = 512
      end
    end
  end
end
