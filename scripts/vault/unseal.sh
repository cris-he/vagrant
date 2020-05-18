cget() { curl -sf "http://$CONSUL_ADDR/v1/kv/vault/secrets/$1?raw"; }

echo "Unsealing Vault"
/usr/local/bin/vault operator unseal $(cget unseal-key-1) &> /dev/null
/usr/local/bin/vault operator unseal $(cget unseal-key-2) &> /dev/null
/usr/local/bin/vault operator unseal $(cget unseal-key-3) &> /dev/null