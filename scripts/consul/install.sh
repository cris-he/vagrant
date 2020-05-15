CONSUL_VERSION=${VERSION}

wget --quiet https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip
unzip consul_${CONSUL_VERSION}_linux_amd64.zip
sudo chown root:root consul
sudo mv consul /usr/local/bin/

consul -autocomplete-install
complete -C /usr/local/bin/consul consul