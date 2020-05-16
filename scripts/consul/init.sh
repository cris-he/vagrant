#Prepare for systemd
sudo useradd --system --home /etc/consul.d --shell /bin/false consul
sudo mkdir --parents /opt/consul
sudo chown --recursive consul:consul /opt/consul

sudo touch /etc/systemd/system/consul.service

#Create general config
sudo mkdir --parents /etc/consul.d
sudo touch /etc/consul.d/consul.hcl
sudo chown --recursive consul:consul /etc/consul.d
sudo chmod 777 /etc/consul.d/consul.hcl

cat > /etc/consul.d/consul.hcl << 'EOF'
datacenter = "dc1"
data_dir = "/opt/consul"
advertise_addr = "10.0.2.15"
retry_join = ["10.0.2.15"]
EOF

echo 'encrypt = "'$(/usr/local/bin/consul keygen)'"' >> /etc/consul.d/consul.hcl

#Create server config
sudo touch /etc/consul.d/server.hcl
sudo chown --recursive consul:consul /etc/consul.d
sudo chmod 777 /etc/consul.d/server.hcl

cat > /etc/consul.d/server.hcl << 'EOF'
server = true
bootstrap_expect = 1
ui = true
client_addr = "0.0.0.0"
EOF

sudo systemctl enable consul
sudo systemctl start consul
sudo systemctl status consul