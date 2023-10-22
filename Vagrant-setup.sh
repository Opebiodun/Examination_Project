#!/bin/bash

# Create a directory for the Vagrant project
if [ ! -d Exam-Project ]; then
    mkdir Exam-Project
fi

# Navigate to the Vagrant project directory
cd Exam-Project

# Initialize Vagrant project with two Ubuntu boxes
vagrant init ubuntu/focal64

cat <<EOF > Vagrantfile
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
EOF

Vagrant up
