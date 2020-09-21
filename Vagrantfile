# VM Configs
vm_name = "k8s"
vm_ram = "4096"
vm_cpu = "2"
vm_ip = ENV['PRIVATE_IP'] || "192.168.33.10"
vm_os = ENV['BASE_BOX'] || "centos/7"

Vagrant.configure("2") do |config|

  config.vm.box = vm_os

  config.vm.network "private_network", ip: vm_ip

  config.vm.provider "virtualbox" do |vb|
    vb.name = vm_name
    vb.cpus = vm_cpu
    vb.memory = vm_ram
  end

  # Install Basics
  config.vm.provision "shell", path: "./scripts/basics.sh",
  env: {}

  # Install Docker
  config.vm.provision "shell", path: "./scripts/docker.sh",
  env: {}


end
