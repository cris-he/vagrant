VAULT_VERSION=${VERSION}

wget --quiet https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip
unzip vault_${VAULT_VERSION}_linux_amd64.zip
sudo chown root:root vault
sudo mv vault /usr/local/bin/

/usr/local/bin/vault -autocomplete-install
complete -C /usr/local/bin/vault vault