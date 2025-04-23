#!/bib/bash
set -x
set -e
RED='\033[0;31m'
GREEN='\033[0;32m'
Normal='\033[0m'
trap 'echo -e "${RED}"Error at Line: $LINENO ${Normal}"' ERR
#STEP-1: INSTALLING GIT JAVA-1.8.0 MAVEN 
yum install git java-1.8.0-openjdk maven -y

echo -e "${GREEN}Installed GIT, Java 1.8.0 and Maven Successfully${Normal}"
#STEP-2: GETTING THE REPO (jenkins.io --> download -- > redhat)
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
echo -e "${GREEN} Successfully Downloaded the REPO Files from jenkins.io${Normal}"

#STEP-3: DOWNLOAD JAVA-17 AND JENKINS
yum install java-17-amazon-corretto -y
echo -e "${GREEN} Installed Java 17 for Jenkins${Normal}"
yum install jenkins -y

echo -e "${GREEN} Installed Jenkins Successfully${Normal}"

update-alternatives --config java
echo -e "${GREEN}Updating the Jenkins${Normal}"

#STEP-4: STARTING JENKINS (when we download service it will on stopped state)
systemctl start jenkins.service
systemctl status jenkins.service
echo -e "${GREEN} Successfully Started the Jenkins${Noraml}"
