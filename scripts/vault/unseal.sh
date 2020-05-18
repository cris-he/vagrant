echo "CONSULE_ADDR" ${CONSUL_ADDR}

cget() { curl -sf "http://192.168.33.10:8500/v1/kv/vault/secrets/$1?raw"; }

echo "Unsealing Vault"
/usr/local/bin/vault operator unseal $(cget unseal-key-1)
/usr/local/bin/vault operator unseal $(cget unseal-key-2)
/usr/local/bin/vault operator unseal $(cget unseal-key-3)