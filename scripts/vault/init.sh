# Setup bashrc
# echo "source /vagrant/configs/vault/.bashrc" >> /home/vagrant/.bashrc
echo "export VAULT_ADDR=http://127.0.0.1:8200" >> /home/vagrant/.bashrc

/usr/local/bin/vault operator init | tee /tmp/vault.init > /dev/null

COUNTER=1
cat /tmp/vault.init | grep '^Unseal' | awk '{print $4}' | for key in $(cat -); do
curl -fX PUT "$CONSUL_ADDR/v1/kv/vault/secrets/unseal-key-$COUNTER" -d $key
COUNTER=$((COUNTER + 1))
done

export ROOT_TOKEN=$(cat /tmp/vault.init | grep '^Initial' | awk '{print $4}')
echo "export VAULT_TOKEN=${ROOT_TOKEN}" >> /home/vagrant/.bashrc
curl -fX PUT "$CONSUL_ADDR/v1/kv/vault/secrets/root-token" -d $ROOT_TOKEN