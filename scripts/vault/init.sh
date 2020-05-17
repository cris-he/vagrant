#Prepare for systemd
sudo useradd --system --home /etc/vault.d --shell /bin/false vault

#Create general config
sudo mkdir --parents /etc/vault.d
sudo touch /etc/vault.d/vault.hcl
sudo chown --recursive vault:vault /etc/vault.d
sudo chmod 777 /etc/vault.d/vault.hcl

cat > /etc/vault.d/vault.hcl << EOF
ui = true

listener "tcp" {
  address          = "0.0.0.0:8200"
  cluster_address  = "0.0.0.0:8201"
  tls_disable = true
}

storage "consul" {
  address = "127.0.0.1:8500"
  path    = "vault/"
}

api_addr =  "http://10.0.2.15:8200"
cluster_addr = "http://10.0.2.15:8201"
disable_mlock = true
EOF

sudo systemctl enable vault
sudo systemctl start vault
sudo systemctl status vault