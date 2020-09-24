sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install -y docker-ce docker-ce-cli containerd.io

systemctl enable docker

sudo systemctl start docker

docker run -d -p 5000:5000 --restart=always -name registry registry:2