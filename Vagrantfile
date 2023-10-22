Vagrant.configure("2") do |config|
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/focal64"
    master.vm.network "private_network", ip: "192.168.33.11"
    master.vm.hostname  = "master"
    master.vm.provision "shell", path: "master-setup.sh"
  end

  config.vm.define "slave" do |slave|
    slave.vm.box = "ubuntu/focal64"
    slave.vm.network "private_network", ip: "192.168.33.12"
    slave.vm.hostname = "slave"
  end
end
