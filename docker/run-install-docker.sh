

# dpkg -l | grep -i docker
# sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli
# sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce  
# sudo rm -rf /var/lib/docker /etc/docker
# sudo rm /etc/apparmor.d/docker
# sudo groupdel docker
# sudo rm -rf /var/run/docker.sock


sudo docker container stop $(sudo docker container ls -aq)
sudo docker system prune --volumes
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

sudo apt-get purge docker-ce docker-ce-cli containerd.io

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo docker run hello-world



# docker container run -d -p 8080:8080 -v /var/jenkins_home:/var/jenkins_home --name jenkins-local  jenkins/jenkins:lts