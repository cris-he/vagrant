# VM Configs
vm_name = "vault"

# Networking
private_ip = ENV['PRIVATE_IP'] || "192.168.33.10"

# Base box selection
base_box = ENV['BASE_BOX'] || "centos/6"

# Consul variables
consul_host_port = ENV['CONSUL_HOST_PORT'] || 8500
consul_version = ENV['CONSUL_VERSION'] || "1.7.3"
consul_config_path = ENV['CONSUL_VERSION'] || "/etc/consul.d"

# Vault variables
vault_host_port = ENV['VAULT_HOST_PORT'] || 8200
vault_version = ENV['VAULT_VERSION'] || "1.4.1"
vault_config_path = ENV['VAULT_VERSION'] || "/etc/vault.d/vault.hcl"

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: private_ip

  config.vm.network "forwarded_port", guest: 8200, host: 8200
  config.vm.network "forwarded_port", guest: 8500, host: 8500

  config.vm.provider "virtualbox" do |vb|
    vb.name = "vault"
    # Customize the amount of memory on the VM:
    # vb.memory = "1024"
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo cp /vagrant/systemd/* /etc/systemd/system
  SHELL

  # Install Basics
  config.vm.provision "shell", path: "./scripts/basics.sh",
  env: {}

  # Install Consul
  config.vm.provision "shell", path: "./scripts/consul/install.sh",
  env: {
    "VERSION" => consul_version,
  }

  # Start Consul
  config.vm.provision "shell", path: "./scripts/consul/service.sh"

  # Install Vault
  config.vm.provision "shell", path: "./scripts/vault/install.sh",
  env: {
    "VERSION" => vault_version,
  }

  # Start Vault
  config.vm.provision "shell", path: "./scripts/vault/service.sh"

  # Init Vault
  config.vm.provision "shell", path: "./scripts/vault/init.sh",
  env: {
    "VAULT_ADDR" => 'http://192.168.33.10:8200',
    "CONSUL_ADDR" => '192.168.33.10:8500',
  }

  # Unseal Vault
  config.vm.provision "shell", path: "./scripts/vault/unseal.sh",
  env: {
    "VAULT_ADDR" => 'http://192.168.33.10:8200',
    "CONSUL_ADDR" => '192.168.33.10:8500',
  }
end
