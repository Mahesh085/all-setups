#! /bin/bash
#Launch an instance with 9000 and t2.medium
set -x
#Script is here
wget -O /opt/sonarqube.zip https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.6.50800.zip
unzip /opt/sonarqube.zip -d /opt/
yum install java-17-amazon-corretto -y
useradd sonar
chown sonar:sonar /opt/sonarqube-8.9.6.50800 -R
chmod 777 /opt/sonarqube-8.9.6.50800 -R
#Deleting the .ZIP file as it is extracted
rm -rf /opt/sonarqube.zip
#Starting the SonarQube via Sonar User
su - sonar -c "/opt/sonarqube-8.9.6.50800/bin/linux-x86-64/sonar.sh start"
