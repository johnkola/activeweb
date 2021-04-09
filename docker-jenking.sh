
sudo docker volume create jenkins_data

sudo docker container run -d -p 8080:8080 -v /jenkins_data:/var/jenkins_home  --name jenkins-local jenkins/jenkins:lts