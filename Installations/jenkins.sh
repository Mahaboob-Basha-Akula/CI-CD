#!/bin/bash
sudo curl -o /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-21-openjdk -y
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins
echo "jenkins started"
sudo systemctl enable jenkins
sudo systemctl daemon-reload


#increase the memort for the node-agent
sudo growpart /dev/nvme0n1 4
sudo lvextend -L +15G /dev/mapper/RootVG-homeVol   #home folder
sudo xfs_growfs /home
sudo lvextend -L +15G  /dev/mapper/RootVG-rootVol  # root folder
sudo xfs_growfs /

sudo lvextend -L +15G /dev/mapper/RootVG-varVol
