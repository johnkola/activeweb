

sudo docker container stop $(sudo docker container ls -aq)
sudo docker system prune --volumes
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

sudo apt-get purge docker-ce docker-ce-cli containerd.io

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo docker run hello-world

