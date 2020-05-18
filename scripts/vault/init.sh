# Setup bashrc
# echo "source /vagrant/configs/vault/.bashrc" >> /home/vagrant/.bashrc
echo "export VAULT_ADDR=http://127.0.0.1:8200" >> /home/vagrant/.bashrc

echo "CONSULE_ADDR" ${CONSUL_ADDR}

/usr/local/bin/vault operator init | tee /tmp/vault.init > /dev/null

# Store master keys in consul for operator to retrieve and remove
COUNTER=1
cat /tmp/vault.init | grep '^Unseal' | awk '{print $4}' | for key in $(cat -); do
curl -fX PUT 192.168.33.10:8500/v1/kv/vault/secrets/unseal-key-$COUNTER -d $key
COUNTER=$((COUNTER + 1))
done

export ROOT_TOKEN=$(cat /tmp/vault.init | grep '^Initial' | awk '{print $4}')
echo "export VAULT_TOKEN=${ROOT_TOKEN}" >> /home/vagrant/.bashrc
curl -fX PUT 192.168.33.10:8500/v1/kv/vault/secrets/root-token -d $ROOT_TOKEN