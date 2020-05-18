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