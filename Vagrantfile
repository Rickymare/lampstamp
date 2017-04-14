Vagrant.configure(2) do |config|

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end


  config.vm.define "data" do |data|

    data.vm.box = "ubuntu/xenial64"
    data.vm.network :private_network, ip: "192.168.56.20" 
    data.vm.provision :shell, path: "data/data.sh"
    data.vm.synced_folder "data/", "/data"
 
    data.vm.provider :virtualbox do |v|
      v.name = "data"
    end

  end


  config.vm.define "web" do |web|

    web.vm.box = "ubuntu/xenial64"
    web.vm.network :private_network, ip: "192.168.56.10" 
    web.vm.provision :shell, path: "web/web.sh"
    web.vm.synced_folder "web/", "/web"

    web.vm.provider :virtualbox do |v|
      v.name = "web"
    end

  end

end
