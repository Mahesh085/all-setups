#PORT NUMBER: 8081
sudo yum update -y
sudo cd /opt/
sudo yum install java-17-amazon-corretto-jmods -y
sudo wget -O /opt/nexus.tar.gz https://download.sonatype.com/nexus/3/nexus-unix-x86-64-3.79.0-09.tar.gz
 
sudo tar -xvf /opt/nexus.tar.gz -C /opt/
sudo mv /opt/nexus-3* /opt/nexus
sudo adduser nexus
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
#sudo echo "run_as_user="nexus"" > /opt/nexus/bin/nexus.rc
#sudo tee /etc/systemd/system/nexus.service > /dev/null << EOL
#[Unit]
#Description=nexus service
#After=network.target
 
#[Service]
#Type=forking
#LimitNOFILE=65536
#User=nexus
 
#Restart=on-abort
 
 
#[Install]
#WantedBy=multi-user.target
#EOL
su - nexus -c "/opt/nexus/bin/nexus start"

