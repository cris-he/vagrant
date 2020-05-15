#Prepare for systemd
sudo useradd --system --home /etc/consul.d --shell /bin/false consul
sudo mkdir --parents /opt/consul
sudo chown --recursive consul:consul /opt/consul

sudo touch /etc/systemd/system/consul.service

#Create general config
sudo mkdir --parents /etc/consul.d
sudo touch /etc/consul.d/consul.hcl
sudo chown --recursive consul:consul /etc/consul.d
sudo chmod 640 /etc/consul.d/consul.hcl

echo 'datacenter = "dc1"' >> /etc/consul.d/consul.hcl
echo 'data_dir = "/opt/consul"' >> /etc/consul.d/consul.hcl
echo 'advertise_addr = "10.0.2.15"' >> /etc/consul.d/consul.hcl
echo 'retry_join = ["10.0.2.15"]' >> /etc/consul.d/consul.hcl
echo 'encrypt = "'$(/usr/local/bin/consul keygen)'"' >> /etc/consul.d/consul.hcl

#Create server config
sudo touch /etc/consul.d/server.hcl
sudo chown --recursive consul:consul /etc/consul.d
sudo chmod 640 /etc/consul.d/server.hcl

sudo chmod 777 /etc/consul.d/*

echo 'server = "true"' >> /etc/consul.d/server.hcl
echo 'bootstrap_expect = 1' >> /etc/consul.d/server.hcl
echo 'ui = "true"' >> /etc/consul.d/server.hcl
echo 'client_addr = "0.0.0.0"' >> /etc/consul.d/server.hcl